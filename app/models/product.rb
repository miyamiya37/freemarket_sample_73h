class Product < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :postage_code, presence: true
  validates :explanation, presence: true
  validates :status, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_code, presence: true

  has_many :likes
  has_many :comments
  #テスト段階ではとりあえず全てにoptional:trueをつけておく。関連テーブルのデータがなくても登録できるようにする
  belongs_to :order, optional: true
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :code, optional: true
  has_many :product_images, dependent: :destroy
  belongs_to :code, optional: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :code

  accepts_nested_attributes_for :product_images, allow_destroy: true
end
