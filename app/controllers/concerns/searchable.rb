module Searchable
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class
    # that includes this concern
  end

  class_methods do
    def text_search_query(text_search)
      flat_columns = []
      self::SEARCH_COLUMNS.each do | table, column |
        column.each do |c|
          flat_columns.push("#{table}.#{c}")
        end
      end

      terms = text_search.split(" ").reject { |item| item.blank? }
      where_clause = terms.map { |x| "(" + flat_columns.map { |c| "#{c} like ?" }.join(" OR ") + ")" }.join(" AND ")
      search_params = terms.map { |x| flat_columns.map { |c| "%#{x}%" } }.flatten
      return where_clause, search_params
    end
  end

  def search!(resource)
    store_search_params(resource)
    apply_search(resource)
  end

  private
  def store_search_params(resource)
    session["#{resource.to_s.underscore}_search_params"] = {} unless session.key?("#{resource.to_s.underscore}_search_params")
    session["#{resource.to_s.underscore}_search_params"].merge!(search_params_for(resource))
  end

  def search_params_for(resource)
    params.permit(resource::SEARCH_PARAMS)
  end

  def apply_search(resource)
    resource.search(session["#{resource.to_s.underscore}_search_params"])
  end
end
