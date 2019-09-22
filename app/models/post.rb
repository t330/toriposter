class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :maps

  mount_uploader :photo, PhotoUploader

  def self.abc
    #@classifications.each do |family|
    #  family.name
    #end
      #- family.children.each do |genus|
      #  - genus.children.each do |species|
      #    - unless species.children.present?
      #      %li
      #        = form_with url: bird_posts_path, method: :get, local: true do |b|
      #          = b.hidden_field :bird, value: (species.name)
      #          = b.submit (species.name)
      #    - else
      #      - species.children.each do |subspecies|
      #        %li
      #          = form_with url: bird_posts_path, method: :get, local: true do |b|
      #            = b.hidden_field :bird, value: (subspecies.name)
      #            = b.submit (subspecies.name)
  end
end
