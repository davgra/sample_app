require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('pages/contact')
  end
  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template('pages/about')
  end
  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('pages/help')
  end
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should render_template('users/new')
  end
  it "should have the right links on the layout" do
    get '/'
    response.should have_tag 'a', 'Home' do
      with_tag "a[href=?]", '/'
    end
    response.should have_tag 'a', 'About' do
      with_tag "a[href=?]", '/about'
    end
    response.should have_tag 'a', 'Help' do
      with_tag "a[href=?]", '/help'
    end
    response.should have_tag 'a', 'Contact' do
      with_tag "a[href=?]", '/contact'
    end
    response.should have_tag 'a', 'Sign up now!' do
      with_tag "a[href=?]", '/signup'
    end
  end
  
end

if $0 == __FILE__   # do not run if file is included
  
end
