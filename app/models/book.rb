class Book < ApplicationRecord

	belongs_to :author
	#ManytoMany Book_Category
	has_many :bookcategories, dependent: :destroy
	has_many :categories, through: :bookcategories	#, source: :category
	accepts_nested_attributes_for :bookcategories, allow_destroy: true
 	#ManytoMany Book_Liked_User
    has_many :likes, dependent: :destroy
	#ManytoMany Book_Reviewed
	has_many :reviews, dependent: :destroy
	#Many to Many Poly Follow book, author
	has_many :follows, as: :target, dependent: :destroy
	#ManytoMany _Request details
	has_many :request_details, dependent: :destroy
	#has_many :requests , dependent: :destroy
	has_many :users, through: :requests
     
	#Validate
	validates :name, presence: true, length: { maximum: 50 }
	validates :quantity, presence: true, length: { maximum: 1000 }
	validates :point, length:{ maximum: 10}
	
	has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end
