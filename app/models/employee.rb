class Employee < ApplicationRecord
  include Searchable

  has_many :contracts
  has_one :bank
  has_many :advances

  enum :marital_status, %i[single married widowed divorced]

  # validations
  validates :first_name, :father_name, :grandfather_name, :family_name, :ar_first_name, :ar_father_name, :ar_grandfather_name, :ar_family_name, :email, :phone_number, :e_phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
  validates :nid, presence: true, if: -> { national }
  validates :nationality, :passport_number, presence: true, unless: -> { national }

  # the searchable fields for Searchable concern
  SEARCH_PARAMS = %i[text_search active column direction action].freeze
  SEARCH_COLUMNS = {
    "employees" => [ "first_name", "family_name", "ar_first_name", "ar_family_name", "nid" ],
    "positions" => [ "title" ]
  }.freeze

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
     self.contracts.last.position
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
    Employee.joins(contracts: [ :position ])
    .where("contracts.end_date = (SELECT MAX(contracts.end_date) from contracts where employees.id = contracts.employee_id)")
    .where(text_search[0], *text_search[1])
    .active(params["active"])
    .order("#{params['column']} #{params['direction']}")
  end
end
