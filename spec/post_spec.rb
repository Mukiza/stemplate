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

end

describe "PostAction" do
    it "gets list all posts" do
        get "/"
        expect(last_response).to be_ok 
        expect(last_response.content_type).to eq("text/html;charset=utf-8")
    end
end
