require "spec_helper"

describe Message do

	describe "#new" do

		before(:each) do
			@message = Message.new
		end

		it "#name" do
			@message.respond_to?(:name).should be_true
		end

		it "#email" do
			@message.respond_to?(:email).should be_true
		end

		it "#message" do
			@message.respond_to?(:message).should be_true
		end

	end

	describe "#validate" do

		before(:each) do 
			@message = Message.new 	:name => Faker::Name.name,
															:email => Faker::Internet.email,
															:message => Faker::Lorem.paragraph
		end

		context "presence of" do

			it "#name" do
				@message.name = nil
				@message.valid?.should_not be_true
				@message.errors[:name].should == "can't be blank"
			end

			it "#email" do
				@message.email = nil
				@message.valid?.should_not be_true
				@message.errors[:email].should == "can't be blank"
			end

			it "#message" do
				@message.message = nil
				@message.valid?.should_not be_true
				@message.errors[:message].should == "can't be blank"
			end

		end

	end

end
