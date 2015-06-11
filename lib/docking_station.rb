require_relative 'bike'


class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

	def initialize
		@bikes = []
    @capacity = 20
	end

  
  def dock bike
  	fail 'Docking station full' if full?
  	@bikes << bike
  end

  def release_bike
  	fail 'No bikes available' if empty?
  	@bikes.pop
  end

  # def capacity
  #   @capacity = 20
  # end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
