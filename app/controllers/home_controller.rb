class HomeController < ApplicationController
  def index
    @feed_levels = Level.all.ordered
    @feed_materials = Material.all.ordered
    @feed_courses = Course.all.ordered
  end
end
