require 'spec_helper'
require 'action_view'

describe Sprockets::Rails::Nonexistent do
  it 'has a version number' do
    expect(Sprockets::Rails::Nonexistent::VERSION).not_to be nil
  end

  describe "set assets" do
    #include Sprockets::Rails::Context
    include ActionView::Helpers::AssetUrlHelper
    include ActionView::Helpers::AssetTagHelper
    before(:all) do
      FIXTURES_PATH = File.expand_path("../../../fixtures", __FILE__)
      @assets = Sprockets::Environment.new
      @assets.append_path FIXTURES_PATH
      # @assets.context_class.class_eval do
      #   include ::Sprockets::Rails::Context
      # end
      tmp = File.expand_path("../../../tmp", __FILE__)
      @manifest = Sprockets::Manifest.new(@assets, tmp)

      @view = ActionView::Base.new
      @view.extend ::Sprockets::Rails::Helper
      @view.assets_environment = Sprockets::Environment.new
      @view.assets_prefix = "/assets"
      #@view.assets_precompile = %w(foo.css foo.js )
      @view.request = ActionDispatch::Request.new({
          "rack.url_scheme" => "https"
        })
    end
    describe "stylesheet_link_tag" do
      describe "non-existent stylesheet" do
        it "should be raise error" do
          expect{ @view.stylesheet_link_tag("application") }.to raise_error(Sprockets::FileNotFound)
        end
      end
    end
  end
end
