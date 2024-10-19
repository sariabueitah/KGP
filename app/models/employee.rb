class Employee < ApplicationRecord
  has_many :contracts
  has_one :bank
  has_many :advances

  validates :first_name, :father_name, :grandfather_name, :family_name, :ar_first_name, :ar_father_name, :ar_grandfather_name, :ar_family_name, :email, :phone_number, :e_phone_number, presence: true

  validates :email, :phone_number, uniqueness: true

  validates :nid, presence: true, if: -> { national }

  validates :nationality, :passport_number, presence: true, unless: -> { national }


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
end
