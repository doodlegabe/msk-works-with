class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :description
      t.boolean :is_live
      t.timestamps
    end
  end
end
