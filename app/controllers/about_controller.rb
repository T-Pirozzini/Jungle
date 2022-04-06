class AboutController < ApplicationController
  def index
    @about = Product.all.order(created_at: :desc)
  end
end