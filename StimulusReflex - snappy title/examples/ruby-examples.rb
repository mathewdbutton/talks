# app/reflexes/counter_reflex.rb
class CounterReflex < StimulusReflex::Reflex
  def increment
    @count = element.dataset[:count].to_i + element.dataset[:step].to_i
  end
end

# app/reflexes/counter_reflex.rb
class CounterReflex < StimulusReflex::Reflex
  def increment(step = 1)
    session[:count] = session[:count].to_i + step
  end
end


# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def index
    @count = session[:count].to_i
  end
end
