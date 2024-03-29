class Purchase < ActiveRecord::Base
  attr_accessible :address1, :card_expires_on, :card_type, :city, :contact_no, :country, :email, :first_name, :ip_address, :last_name, :product_id, :purchased_at, :state, :total_cost, :zipcode, :card_number,:card_verification
  belongs_to :product
  has_one :transaction, :class_name => "OrderTransaction",:dependent => :destroy
  attr_accessor :card_number,:card_verification

  validate :validate_card, :on => :create

  def purchase
  	puts "Entered into purchase method"
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
     puts "first step completed"
    create_transaction(:action => "purchase", :amount => price_in_cents, :response => response)
     puts "transaciton step completed"
    self.update_attribute(:purchased_at, Time.now) if response.success?
     puts "response success"
     puts response.success?
    response.success?
  end
  
  def price_in_cents
    ((self.total_cost).to_i*100).round
  end
  
  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => first_name+" "+last_name,
        :address1 => address1,
        :city     => city,
        :state    => state,
        :country  => country,
        :zip      => zipcode
      }
    }
  end
  def validate_card
	 unless credit_card.valid?
		credit_card.errors.full_messages.each do |message|
		  errors[:base] << message
		  puts message
 	    end
	  end
  end

  def credit_card
	 @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
		:brand              => card_type,
		:number             => card_number,
		:verification_value => card_verification,
		:month              => card_expires_on.month,
		:year               => card_expires_on.year,
		:first_name         => first_name,
		:last_name          => last_name
	 )
  end

end
