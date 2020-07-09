require 'bundler/setup'
Bundler.require
require 'rest-client'
require 'json'
require 'tty-spinner'
require 'tty-font'

ActiveRecord::Base.logger = nil

require_all 'lib'