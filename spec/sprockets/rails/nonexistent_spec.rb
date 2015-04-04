require 'spec_helper'
require 'action_view'
require 'sprockets/rails/helper'

describe Sprockets::Rails::Nonexistent do
  it 'has a version number' do
    expect(Sprockets::Rails::Nonexistent::VERSION).not_to be nil
  end

  describe "set assets" do
    before(:all) do
      FIXTURES_PATH = File.expand_path("../../../fixtures", __FILE__)
      @assets = Sprockets::Environment.new
      @assets.append_path FIXTURES_PATH
      @assets.context_class.class_eval do
        include ::Sprockets::Rails::Helper
      end
      @view = ActionView::Base.new
      @view.extend ::Sprockets::Rails::Helper
      @view.assets_environment = @assets
      @view.assets_prefix = "/assets"
    end

    describe "stylesheet_link_tag" do
      describe "non-existent stylesheet" do
        it "should be raise error" do
          expect{ @view.stylesheet_link_tag("application") }.to raise_error(Sprockets::FileNotFound)
        end
      end

      describe "exsitent stylesheet" do
        it "should be link tag" do
          expect(@view.stylesheet_link_tag("foo")).to eq(%(<link rel="stylesheet" media="screen" href="/assets/foo.css" />))
        end
      end
    end

    describe "javascript_include_tag" do
      describe "non-existent javascript" do
        it "should be raise error" do
          expect{ @view.javascript_include_tag("application") }.to raise_error(Sprockets::FileNotFound)
        end
      end

      describe "existent javascript" do
        it "should be link tag" do
          expect(@view.javascript_include_tag("foo")).to eq(%(<script src="/assets/foo.js"></script>))
        end
      end
    end
  end
end
