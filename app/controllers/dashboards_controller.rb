class DashboardsController < ApplicationController
    def show
        @user = current_user
        @user.owner = true unless @user.venues.empty?
    end
end
