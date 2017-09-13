defmodule GrabCikgu.Repo.Migrations.AddFieldsToProfiles do
  use Ecto.Migration

  def change do
  	alter table(:account_profiles) do
    	add :gender, :string
    	add :age, :integer
    	add :job, :string
    	add :status, :string
      add :state, :string
    	add :city, :string
    	add :license, :string
    end

    
  end
end
