class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string    :title,                null: false      #商品名
      t.text      :explanation,          null: false      #商品の説明
      t.integer   :category_id,          null: false      #カテゴリー
      t.integer   :condition_id,         null: false      #商品の状態
      t.integer   :shipping_fee_id,      null: false      #配送料の負担
      t.integer   :shipping_source_id,   null: false      #発送元の地域
      t.integer   :shipping_schedule_id, null: false      #発送までの日数
      t.integer   :price,                null: false      #販売価格
      t.references :user,                null: false, foreign_key: true #ユーザー
      t.timestamps
    end
  end
end
