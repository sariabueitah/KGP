class Contract < ApplicationRecord
  include Searchable
  belongs_to :employee
  belongs_to :position

  SEARCH_PARAMS = %i[employee_id year active column direction].freeze

  def active
    end_date >= Date.current
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

  def self.search_year(year)
    if year.present?
      where("extract(year from contracts.end_date) = ? OR extract(year from contracts.start_date) = ? ", year, year)
    else
      where("")
    end
  end

  def self.search(params)
    if params.empty?
      []
    else
      Contract.joins(:position)
      .where(employee_id: params["employee_id"])
      .search_year(params["year"])
      .active(params["active"])
      .order("#{params['column']} #{params['direction']}")
    end
  end
end
