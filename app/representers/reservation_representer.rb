class ReservationRepresenter
  def initialize(reservation)
    @reservation = reservation
  end

  def as_json
    {
      id: reservation.id,
      city: reservation.city,
      pick_up: reservation.pick_up,
      return_date: reservation.return_date,
      car: Car.find(reservation.car_id).name
    }
  end

  private

  attr_reader :reservation
end
