# coding: utf-8
require "sprockets/rails/nonexistent/version"

require 'sprockets/railtie'
require 'sprockets/rails'

module Sprockets::Rails::Helper
  def stylesheet_link_tag(*sources)
    sources.each do |stylesheet|
      unless stylesheet.kind_of?(Hash)
        raise Sprockets::FileNotFound, "#{stylesheet}.css" if (Rails.env.development? || Rails.env.test?) && lookup_asset_for_path(stylesheet, :type => :stylesheet).blank?
      end
    end
    super
  end

  def javascript_include_tag(*sources)
    sources.each do |javascript|
      unless javascript.kind_of?(Hash)
        raise Sprockets::FileNotFound, "#{javascript}.js" if (Rails.env.development? || Rails.env.test?) && lookup_asset_for_path(javascript, :type => :javascript).blank?
      end
    end
    super
  end
end
