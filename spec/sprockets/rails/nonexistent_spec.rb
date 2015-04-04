require 'spec_helper'

describe Sprockets::Rails::Nonexistent do
  it 'has a version number' do
    expect(Sprockets::Rails::Nonexistent::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
