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

end
