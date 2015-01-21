module SessionsHelper
  def log_in(airport)
    session[:code] = airport.code
  end

  def log_out
    session.delete(:code)
    @current_airport = nil
  end


  def current_airport
    @current_airport ||= Airport.find_by(code: session[:code])
  end

  def logged_in?
    !current_airport.nil?
  end
end
