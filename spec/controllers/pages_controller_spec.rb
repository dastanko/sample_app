require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @basic_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should contain right title" do
      get "home"
      response.should have_selector("title", :content => "#{@basic_title} | #{@title}")
    end

    it "should have non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should contain right title" do
      get "contact"
      response.should have_selector("title", :content => "#{@basic_title} | #{@title}")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should contain right title" do
      get "about"
      response.should have_selector("title", :content => "#{@basic_title} | #{@title}")
    end
  end

end

