class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  class CustomersController < ApplicationController
    def index
      @customers = Customer.all
    end

    def alphabetized
      @customers = Customer.order(:full_name)
      render :index
    end

    def missing_email
      @customers = Customer.where(email_address: [nil, ''])
      render :index
    end
  end
  allow_browser versions: :modern
end


