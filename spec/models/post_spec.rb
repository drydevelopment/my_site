require "spec_helper"

describe Post do

	describe "#new" do

		before(:each) do
			@post = Post.new
		end

		it "#title" do
			@post.respond_to?(:title).should be_true
		end

		it "#body" do
			@post.respond_to?(:body).should be_true
		end

		it "#meta_title" do
			@post.respond_to?(:meta_title).should be_true
		end

		it "#meta_keywords" do
			@post.respond_to?(:meta_keywords).should be_true
		end

		it "#meta_description" do
			@post.respond_to?(:meta_description).should be_true
		end

		it "#is_published" do
			@post.respond_to?(:title).should be_true
		end

		it "#published?" do
			@post.respond_to?("published?").should be_true
		end

	end

	describe "validates" do

		context "presence of" do

			before(:each) do
				@post = Post.new(:title => Faker::Lorem.words(5))
			end

			it "#title" do
				@post.title = nil
				@post.valid?.should_not be_true
				@post.errors[:title].should == "can't be blank"
			end

			it "#body" do
				@post.body = nil
				@post.valid?.should_not be_true
				@post.errors[:body].should == "can't be blank"
			end

		end

	end

end
