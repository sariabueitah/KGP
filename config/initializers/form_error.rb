# Override the default behavior of field error
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  # default is below
  # content_tag :div, html_tag, class: "field_with_errors saritest"
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at("input,select,textarea")
  label = fragment.at("label")

  html = if field
    field["class"] = "#{field['class']} text-red-400 border-red-400"
    html = <<-HTML
      #{fragment}
      <p class="text-xs text-red-400 h-0">#{instance_tag.error_message.join(", ")}</p>
    HTML
    html
  elsif label
    label["class"] = "#{label['class']} text-red-400"
    html = <<-HTML
      #{fragment}
    HTML
    html
  else
    html_tag
  end
  html.html_safe
end
