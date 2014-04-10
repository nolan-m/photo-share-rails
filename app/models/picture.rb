class Picture < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :users, :through => :tags

  has_attached_file :photo, :styles => { :thumb => ["32x32#", :jpg], :medium => ["300x300#", :jpg] }

  validates_attachment :photo, :presence => true,
    :content_type => { :content_type =>  /\Aimage\/.*\Z/ },
    :size => { :in => 0..5000.kilobytes }

  def find_next(current_user)
    current_picture = current_user.pictures.index(self)
    next_picture = current_user.pictures[current_picture + 1]
    if next_picture == nil
      next_picture = current_user.pictures[0]
    end
  next_picture
  end

  def find_previous(current_user)
    current_picture = current_user.pictures.index(self)
    previous_picture = current_user.pictures[current_picture - 1]
    if previous_picture == nil
      previous_picture = current_user.pictures.last
    end
  previous_picture
  end
end
