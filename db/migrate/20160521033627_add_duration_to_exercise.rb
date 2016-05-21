class AddDurationToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :duration, :integer
  end
end
