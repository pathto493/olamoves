class Order < ApplicationRecord
  belongs_to :user
  belongs_to :video
  belongs_to :purchase
end
