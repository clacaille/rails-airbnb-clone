module BookingsHelper
  def elper(booking)
    if booking.accepted
      "accepted"
    else
      "pending"
    end
  end
end
