require "spec_helper"

describe User do

	describe "#new" do

		before(:each) do
			@user = User.new
		end

		it "#first_name" do
			@user.respond_to?(:first_name).should be_true
		end

		it "#last_name" do
			@user.respond_to?(:last_name).should be_true
		end

		it "#website" do
			@user.respond_to?(:website).should be_true
		end

	end

end
