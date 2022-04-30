class UsersController < ApplicationController
    def owner
        current_user.owner = true
        current_user.save
        redirect_to dashboard_path
    end
end














