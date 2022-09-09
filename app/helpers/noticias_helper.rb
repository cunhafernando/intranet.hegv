module NoticiasHelper
    def month_day_comma_year(datetime)
        datetime.strftime('%e de %B de %Y')
    end
    
end
