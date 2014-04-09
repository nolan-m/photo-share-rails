class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => { :thumb => ["32x32#", :jpg], :medium => ["300x300#", :jpg] }

  validates_attachment :photo, :presence => true,
    :content_type => { :content_type =>  /\Aimage\/.*\Z/ },
    :size => { :in => 0..5000.kilobytes }

end
