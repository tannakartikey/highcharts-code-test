class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :client_id
      t.datetime :period_starting
      t.string :operation_type
      t.string :operation
      t.string :start_result
      t.string :finish_result
      t.integer :operations_started
      t.integer :operations_finished
      t.integer :distinct_identities
      t.integer :total_elapsed_time_minutes
      t.integer :total_elapsed_time_seconds
      t.integer :total_elapsed_time_miliseconds
      t.integer :average_elapsed_time_seconds
      t.integer :average_elapsed_time_miliseconds
      t.references :app, index: true

      t.timestamps
    end
  end
end
