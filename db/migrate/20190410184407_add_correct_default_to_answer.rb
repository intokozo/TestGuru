class AddCorrectDefaultToAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :correct, to: false
  end
end
