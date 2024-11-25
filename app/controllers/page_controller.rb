class PageController < ApplicationController
  def dashboard
    reset_session
  end

  def countries
    if params[:search].nil?
      @countries = ISO3166::Country.countries.sort_by { |c| c.iso_short_name }.map { |c| { name: c.iso_short_name, flag: c.emoji_flag } }
    else
      countries = ISO3166::Country.countries.sort_by { |c| c.iso_short_name }.map { |c| { name: c.iso_short_name, flag: c.emoji_flag } }
      @countries = countries.select { |c| c[:name].downcase.start_with?(params[:search].downcase) }
    end
  end
end
