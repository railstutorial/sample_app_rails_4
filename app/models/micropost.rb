class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validate  :has_a_valid_image_url? 

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
  
  private
  
  def has_a_valid_image_url?
    return if image_url.blank?
    begin
      uri = URI.parse(image_url)
      return if uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
    end
    
    errors.add(:image_url, 'not a valid url')
  end
end
