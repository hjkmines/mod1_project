require 'bundler/setup'
Bundler.require
require 'rest-client'
require 'json'
require 'tty-spinner'

ActiveRecord::Base.logger = nil

require_all 'lib'