require "spec_helper"

describe Portfolio do

	describe "#new" do

		before(:each) do
			@portfolio = Portfolio.new
		end

		it "#name" do
			@portfolio.respond_to?(:name).should be_true
		end

		it "#description" do
			@portfolio.respond_to?(:description).should be_true
		end

		it "#specs" do
			@portfolio.respond_to?(:specs).should be_true
		end

		it "#url" do
			@portfolio.respond_to?(:url).should be_true
		end

		it "#is_featured" do
			@portfolio.respond_to?(:is_featured).should be_true
		end

		it "#featured?" do
			@portfolio.respond_to?("featured?").should be_true
		end

	end

end
