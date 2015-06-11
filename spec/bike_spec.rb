require 'bike'

describe Bike do 
  
	it { is_expected.to respond_to :working? }

	it 'is working?' do
		expect(subject).to be_working
	end

	it 'can be reported as broken' do
		expect(subject.report_broken).to eq false
	end

	it 'is broken after being reported as such' do
		subject.report_broken
		expect(subject).to be_broken
	end
end