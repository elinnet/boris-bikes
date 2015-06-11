class Bike

	def initialize
		@broken = false
	end

	def report_broken
		@broken = true
	end

  def working?
    !@broken
  end

	def broken?
		@broken
	end
end