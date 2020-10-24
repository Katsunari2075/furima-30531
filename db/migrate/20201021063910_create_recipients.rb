class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|

      t.string :post_code
      t.integer :area_id
      t.string :city
      t.string :address
      t.string :building
      t.string :tel
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
