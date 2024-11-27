module ApplicationHelper
  def build_order_link(label:, model:, url:, params:)
    if params[:column] == session.dig("#{model}_search_params", "column")
      params[:direction] = next_direction(model)
    else
      params[:direction] = "asc"
    end
    link_to(label, self.send(url, params), data: { turbo_stream: true })
  end

  def next_direction(model)
    session["#{model}_search_params"]["direction"] == "asc" ? "desc" : "asc"
  end

  def sort_indicator(model, column)
    if column == session["#{model}_search_params"]["column"]
      if session["#{model}_search_params"]["direction"] == "asc"
        ('<span class="inline-block align-middle"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
          <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
          </svg></span>').html_safe
      else
        ('<span class="inline-block align-middle"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
          <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 15.75 7.5-7.5 7.5 7.5" />
          </svg></span>').html_safe

      end
    else
      ('<span class="inline-block align-middle"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 15 12 18.75 15.75 15m-7.5-6L12 5.25 15.75 9" />
      </svg></span>').html_safe
    end
  end
end
