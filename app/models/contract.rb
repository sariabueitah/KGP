class Contract < ApplicationRecord
  include Searchable
  belongs_to :employee
  belongs_to :position

  SEARCH_PARAMS = %i[text_search employee_id year active column direction action].freeze
  SEARCH_COLUMNS = {
    "employees" => [ "first_name", "family_name", "ar_first_name", "ar_family_name" ],
    "positions" => [ "title" ]
  }.freeze

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
    if params["action"] == "contracts_index"
      text_search = params["text_search"].blank? ? [ [], [] ] : Contract.text_search_query(params["text_search"])
      Contract.joins(:position, :employee)
      .where(text_search[0], *text_search[1])
      .search_year(params["year"])
      .active(params["active"])
      .order("#{params['column']} #{params['direction']}")
    elsif params["action"] == "index"
      Contract.joins(:position)
      .where(employee_id: params["employee_id"])
      .search_year(params["year"])
      .active(params["active"])
      .order("#{params['column']} #{params['direction']}")
    end
  end
end
