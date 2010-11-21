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

	describe "validates" do

		context "presence of" do

			before(:each) do
				@portfolio = Portfolio.new	:name => Faker::Lorem.words,
																		:url => Faker::Internet.domain_name,
																		:description => Faker::Lorem.paragraph,
																		:specs => Faker::Lorem.paragraph
			end

			it "#name" do
				@portfolio.name = nil
				@portfolio.valid?.should_not be_true
				@portfolio.errors[:name].should == "can't be blank"
			end

			it "#url" do
				@portfolio.url = nil
				@portfolio.valid?.should_not be_true
				@portfolio.errors[:url].should == "can't be blank"
			end

			it "#description" do
				@portfolio.description = nil
				@portfolio.valid?.should_not be_true
				@portfolio.errors[:description].should == "can't be blank"
			end

			it "#specs"do
				@portfolio.specs = nil
				@portfolio.valid?.should_not be_true
				@portfolio.errors[:specs].should == "can't be blank"
			end

		end

	end

end
