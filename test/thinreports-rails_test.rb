$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'

require 'test/unit'

require 'thinreports-rails'
require 'test_app/test_app'

require 'rails'
require 'rails/test_help'

class ThinReportsRailsTest < ActionController::TestCase
  tests OrdersController

  test 'index.tlf is selected.' do
    get :index, :format => :pdf
    assert_response :success
  end

  test 'other tlf can select.' do
    get :other_tlf_path, :format => :pdf
    assert_response :success
  end

  test 'use default tlf. no call set_layout. ' do
    get :no_set_layout, :format => :pdf
    assert_response :success
  end

  test 'tlf can not choose not. raise Exception.' do
    assert_raise(ActionView::Template::Error) { get :no_tlf, :format => :pdf }
  end
end

