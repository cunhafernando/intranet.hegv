module ApplicationHelper
    def month_day_comma_year(datetime)
        datetime.strftime('%e de %B de %Y')
    end
    def render_if(condition, template, record)
        render template, record if condition
    end
end
