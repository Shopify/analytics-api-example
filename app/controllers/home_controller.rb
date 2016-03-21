class HomeController < ApplicationController
  before_action :login_again_if_different_shop
  around_filter :shopify_session
  layout 'embedded_app'

  def index
  end

  def pageviews
  end

end
