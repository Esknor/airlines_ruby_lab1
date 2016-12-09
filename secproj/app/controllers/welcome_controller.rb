class WelcomeController < ApplicationController
  def index
    @title = "I love Miku"
  end
  def about
    @title = "Мы учим людей программировать)))"
  end
end
