class PingController < ApplicationController
  def pong
    render json: { message: "pong" }
  end
end
