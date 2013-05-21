Time::DATE_FORMATS.update(
  standard: lambda { |date| date.strftime "%B %d, %Y @ %I:%M%P"}
)

Date::DATE_FORMATS.update(
 standard: "%e %b, %Y"
)
