# == Schema Information
#
# Table name: paypal_tokens
#
#  id               :integer          not null, primary key
#  community_id     :integer          not null
#  token            :string(64)
#  transaction_id   :integer
#  merchant_id      :string(255)      not null
#  created_at       :datetime
#  item_name        :string(255)
#  item_quantity    :integer
#  item_price_cents :integer
#  currency         :string(8)
#
# Indexes
#
#  index_paypal_tokens_on_token  (token) UNIQUE
#

class PaypalToken < ActiveRecord::Base
  validates_presence_of :community_id, :token, :transaction_id, :merchant_id
  attr_accessible :community_id, :token, :transaction_id, :merchant_id, :item_name, :item_quantity, :item_price, :currency

  monetize :item_price_cents, with_model_currency: :currency, allow_nil: true
end
