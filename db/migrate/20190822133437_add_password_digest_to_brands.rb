class AddPasswordDigestToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :password_digest, :string
  end
end
