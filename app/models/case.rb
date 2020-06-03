class Case < ActiveRecord::Base
  belongs_to :user

  def pleasant_time
    self.created_at.strftime("%m/%d/%Y")
  end

end
