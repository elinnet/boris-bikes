require 'bike'

describe Bike do 
  
	it { is_expected.to respond_to :working? }

	it 'is broken?' do
		expect(subject).to be_broken
	end

	it 'can be reported as broken?' do
		subject.report_broken?
	end

	it 'has been reported broken?' do
		expect(subject).to be_report_broken
	end
end