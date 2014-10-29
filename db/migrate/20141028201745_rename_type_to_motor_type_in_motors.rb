class RenameTypeToMotorTypeInMotors < ActiveRecord::Migration
  def change
    rename_column :motors, :type, :motor_type
  end
end
