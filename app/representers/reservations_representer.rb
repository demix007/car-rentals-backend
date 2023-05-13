class ReservationsRepresenter
  def initialize(reservations)
    @reservations = reservations
  end

  def as_json
    reservations.map do |reservation|
      {
        id: reservation.id,
        city: reservation.city,
        pick_up: reservation.pick_up,
        return_date: reservation.return_date,
        car: Car.find(reservation.car_id).name
      }
    end
  end

  private

  attr_reader :reservations
end
