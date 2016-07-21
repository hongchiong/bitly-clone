require 'byebug'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates_uniqueness_of :short_url
	validates :long_url, presence: true
	validates :long_url, format: { with: URI.regexp }, allow_blank: true

	before_save :shorten, if: :new_record?

	def shorten
		alpha_numerals = [*'0'..'9',*'A'..'Z',*'a'..'z']
		alpha_numeric = Array.new(7){ alpha_numerals.sample }.join
		self.short_url = alpha_numeric
	end

	def add_count
		self.count += 1
	end
end
