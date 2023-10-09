# config/initializers/country_select.rb

# Return a string to customize the text in the <option> tag, `value` attribute will remain unchanged
CountrySelect::FORMATS[:with_alpha3] = lambda do |country|
  "#{country.iso_short_name} (#{country.alpha2})"
end

# Return an array to customize <option> text, `value` and other HTML attributes
CountrySelect::FORMATS[:with_data_attrs] = lambda do |country|
  [
    country.iso_short_name,
    country.alpha3,
    {
      'data-country-code' => country.country_code,
      'data-alpha3' => country.alpha3
    }
  ]
end