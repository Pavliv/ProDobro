# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do
        resource.skip_register_validation = true
        resource.save
      end
    end
  end
end
