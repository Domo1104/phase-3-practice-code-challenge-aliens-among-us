class Alien < ActiveRecord::Base
    has_many :earthlings, through: :visitations

# Alien#visitations returns all the visitations that alien has been involved in
# Alien#earthlings returns every earthling the alien has visited
# Alien#visit(earthling) takes in an instance of an earthling and creates a visitation linking that earthling and alien for today's date
# Alien#total_light_years_traveled returns the light years from the alien's home planet multiplied by the number of visitations for that alien ... times two (because they have to travel both ways right?)
# Alien.most_frequent_visitor returns the alien with the most visitations
# Alien.average_light_years_to_home_planet returns the average distance for all aliens to their home planets

def visit(earthling)
    Visitation.create(date: Date.today, alien_id: self.id, earthling: earthling)
    # earthling.visitations.create(date: Date.today, alien: self)
  end

  def total_light_years_traveled
    self.visitations.length * self.light_years_to_home_planet * 2
  end
  # returns the light years from the alien's home planet multiplied by the number of visitations for that alien ... times two (because they have to travel both ways right?)

  def self.most_frequent_visitor
    self.all.max_by { |alien| alien.visitations.size }
  end
  # compare all of the numbers of visitations, return the alien with the highest number

  def self.average_light_years_to_home_planet
    # self.all.sum { |alien| alien.light_years_to_home_planet }
    self.all.sum(:light_years_to_home_planet) / self.all.length.to_f
  end
  # add all the elements and divide by the number of those elements
end
