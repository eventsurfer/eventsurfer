# frozen_string_literal: true

module Admin::EventsHelper
  def getFullAddress(location)
    address = location.street + " " + location.street_number + ", " + location.postcode + " " + location.city + " " + location.country
    return address
  end
end
