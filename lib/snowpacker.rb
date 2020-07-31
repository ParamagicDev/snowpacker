# frozen_string_literal: true

require "snowpacker/configuration"
require "snowpacker/env"
require "snowpacker/yarn_packages"
require "snowpacker/snowpacker_proxy"

module Snowpacker
  YARN_PACKAGES = YarnPackages.all_packages
  # In case youre not using Rails

  class << self
    attr_accessor :config
  end

  def self.config_location
    Rails.root.join("config", "snowpack.config.json")
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config) if block_given?
  end
end

require "snowpacker/version"
require "snowpacker/runner"
require "snowpacker/snowpacker_generator" if defined?(Rails)
require "snowpacker/engine" if defined?(Rails)
