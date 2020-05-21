class Case < ActiveRecord::Base
  belongs_to :user

  def pleasant_time
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end
