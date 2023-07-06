class Pokemon < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_one_attached :image, dependent: :purge
end
