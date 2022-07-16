class CreateAppData < ActiveRecord::Migration[7.0]
  def change
    create_table :app_data do |t|

      t.timestamps
    end
  end
end
