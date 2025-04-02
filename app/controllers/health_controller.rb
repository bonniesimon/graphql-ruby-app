class HealthController < ApplicationController
  def show
    render json: {message: "Success"}
  end
end
