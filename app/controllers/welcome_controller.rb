class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Ériko Sampaio [COOKIE]"
    session[:curso] = "Curso de Ruby on Rails - Ériko Sampaio [SESSION]"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
