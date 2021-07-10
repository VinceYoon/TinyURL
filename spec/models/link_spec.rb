require 'rails_helper'

RSpec.describe Link, type: :model do

	let!(:original_url) { 'https://github.com/VinceYoon' }
	let!(:subject) { Link.new(original_url: original_url) }

	context 'validates presence' do
		it 'validates presence of url' do
			subject.original_url = ''
			subject.validate
			expect(subject.errors[:original_url]).to include("can't be blank")
		end

		it 'validates presence of token' do
			subject.validate
			expect(subject.errors.count).to eq (0)
		end
	end

	it 'validates uniqueness of token' do
		subject.validate
		subject.save!
		token = subject.token
		other_link = Link.new(original_url: original_url, token: token)
		other_link.validate
		expect(other_link.errors[:token]).to include("has already been taken")
	end

	it '#generate_token' do
		expect(Link.generate_token.length).to eq(9)
	end

	it '#initialize_token' do
		expect(subject.initialize_token).to be_present
	end

	it '#is_presence_original_url?' do
		expect(subject.is_presence_original_url?).to eq true
	end

	context '#get_uri_from_original_url' do
		it 'return true if the original url is valid' do
			expect(subject.get_uri_from_original_url).to eq true
		end

		it 'return false if the original url is invalid' do
			subject.original_url = 'https://invalid_url.com/'
			expect(subject.get_uri_from_original_url).to eq false
		end
	end

	it '#increase_visits_counter' do
		expect { subject.increase_visits_counter }.to change { subject.visits }.from(0).to(1)
	end
end