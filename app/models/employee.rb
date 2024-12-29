class Employee < ApplicationRecord
  include Searchable

  has_many :contracts
  has_many :notifications, as: :notifiable

  enum :marital_status, %i[single married widowed divorced]

  attr_accessor :income_tax_number_skip, :social_security_number_skip

  # validations
  validates :first_name, :father_name, :grandfather_name, :family_name, :ar_first_name, :ar_father_name, :ar_grandfather_name, :ar_family_name, :marital_status, presence: true
  validates :email, :phone_number, :e_phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
  validates :phone_number, uniqueness: { scope: :e_phone_number }
  validates :nid, presence: true, if: -> { :national }
  validates :nationality, :passport_number, presence: true, unless: -> { :national }
  validates :income_tax_number, presence: true, unless: -> { income_tax_number_skip == "1" }
  validates :social_security_number, presence: true, unless: -> { social_security_number_skip == "1" }

  # the searchable fields for Searchable concern
  SEARCH_PARAMS = %i[text_search active column direction action].freeze
  SEARCH_COLUMNS = {
    "employees" => [ "first_name", "family_name", "ar_first_name", "ar_family_name", "nid" ],
    "positions" => [ "title" ]
  }.freeze

  after_save :check_record

  def check_record
    if @income_tax_number_skip == "1"
      notifications.create(message: "Income Tax Number missing from employee #{short_name}")
    end
    if @social_security_number_skip == "1"
      notifications.create(message: "Social Security Number missing from employee #{short_name}")
    end
  end

  def full_name
    (first_name + " " + father_name + " " + grandfather_name + " " + family_name).titleize
  end

  def ar_full_name
    ar_first_name + " " + ar_father_name + " " + ar_grandfather_name + " " + ar_family_name
  end

  def short_name
    (first_name + " " + family_name).titleize
  end

  def ar_short_name
    ar_first_name + " " + ar_family_name
  end

  def position
    if contracts.length > 0
      contracts.last.position.title
    else
      "No Position"
    end
  end

  def last_contract
    contracts.order(end_date: :desc).limit(1).first unless contracts.empty?
  end

  def self.active(active)
    if active == "true"
      where("contracts.end_date >= now()")
    elsif active == "false"
      where("contracts.end_date <= now()")
    else
      where("")
    end
  end

  # change this to the search functionality
  def self.search(params)
    text_search = params["text_search"].blank? ? [ [], [] ] : Employee.text_search_query(params["text_search"])
    Employee.joins("LEFT JOIN (SELECT DISTINCT ON (cd.employee_id) cd.* FROM contracts cd ORDER BY cd.employee_id, cd.end_date DESC) contracts ON contracts.employee_id = employees.id")
    .joins("LEFT JOIN positions ON contracts.position_id = positions.id")
    .where(text_search[0], *text_search[1])
    .active(params["active"])
    .order("#{params['column']} #{params['direction']}")
  end
end
