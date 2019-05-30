module HomeHelper
  def text_date_navigation
    text_field_tag(:report_date, '', id: 'text-date-navigation').html_safe
  end
end
