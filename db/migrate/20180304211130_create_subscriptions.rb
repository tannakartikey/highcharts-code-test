class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
    	t.integer 	:user_id
    	t.string 		:plan_id
    	t.string 		:customer_id
    	t.string		:subscription_id

    	t.timestamp
    end
  end
end
