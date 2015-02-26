require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end

  describe "#html_content" do

    it "should escape HTML chars" do

      @micropost.content = "<b>I want to be bold!</b>"

      expect( @micropost.html_content ).to eq "&lt;b&gt;I want to be bold!&lt;/b&gt;"

    end

    it "should hyperlink HTTP URLs" do

      @micropost.content = "Check out http://sparkboulder.com"

      expect( @micropost.html_content ).to eq "Check out <a href=\"http://sparkboulder.com\">http://sparkboulder.com</a>"

    end

    it "should hyperlink HTTPS URLs" do

      @micropost.content = "Check out https://www.conspire.com"

      expect( @micropost.html_content ).to eq "Check out <a href=\"https://www.conspire.com\">https://www.conspire.com</a>"

    end

  end

end
