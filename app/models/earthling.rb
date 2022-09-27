class Earthling < ActiveRecord::Base
    has_many :aliens, through: :visitations
    has_many :visitations, dependent: :destroy

# Earthling#visitations returns all the visitations for an earthling
# Earthling#aliens returns every alien that has visited that earthling
# Earthling#full_name returns the combination of the human's first name and last name
# Earthling.filter_by_job(job) takes in a job as a string and returns all earthlings with the specified job

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def self.filter_by_job(job)
        self.where(job: job)
    end

end
