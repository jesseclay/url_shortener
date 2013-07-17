class Url < ActiveRecord::Base
  validates :full_url, presence: true
  validates :full_url, format: { with: /https?:\/\//,
    message: "needs http:// formatting"}
end