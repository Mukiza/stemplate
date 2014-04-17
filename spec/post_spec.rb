require 'spec_helper.rb'

describe "Post" do
    before(:all) do
        @post = Post.new :title=> "Awesome post", :content=>"Intresting content"
    end

    it "post to respond to know signals" do
        expect(@post).to_not respond_to(:unknown_signal) 
    end

    it "post responds to know signals" do
        expect(@post).to respond_to(:title)
        expect(@post).to respond_to(:content)
    end

    it "gets a list of posts" do
        get "/new"
        expect(last_response).to be_ok 
    end
end
