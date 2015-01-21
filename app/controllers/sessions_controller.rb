class SessionsController < ApplicationController
  def new
  end

  def create
    airport = Airport.find_by(code: params[:session][:code].upcase)
    if airport && airport.authenticate(params[:session][:password])
      log_in airport
      redirect_to airport
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
  	  flash.now[:danger] = 'Invalid Password'
  	  render 'new'
    end

  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
