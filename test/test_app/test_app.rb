require 'action_controller/railtie'
require 'action_view/railtie'

module ThinreportsHandlerTestApp
  class Application < Rails::Application
    config.active_support.deprecation = :log
    config.root = File.dirname(__FILE__)
  end
end
ThinreportsHandlerTestApp::Application.initialize!


# Route
ThinreportsHandlerTestApp::Application.routes.draw do
  resources :orders, :only => [:index] do
    collection do
      get 'no_tlf'
      get 'other_tlf_path'
    end
  end
end


# Model
class Order
  attr_accessor :name, :num

  def initialize(name, num)
    self.name = name
    self.num  = num
  end
end


# Controller
class ApplicationController < ActionController::Base; end

class OrdersController < ApplicationController
  CURRENT = 1340764893 # 2012-06-27 11:41:33 +0900

  def index
    @orders = [Order.new('order1', 2),
               Order.new('order2', 10)]
    respond_to do |f| 
      f.pdf { render }
    end
  end
  alias no_tlf index
  alias other_tlf_path index
end

