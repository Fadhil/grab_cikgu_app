defmodule GrabCikgu.Repo.Migrations.AddEducationToProfiles do
  use Ecto.Migration

  def change do
    alter table(:account_profiles) do
  	  add :qualification, :string
  	  add :achievement, :string
  	  add :experience, :string
  	  add :about, :string
  	  add :document, :string
      add :teaching, :string
      add :area, :string
      add :tuitioncenter, :string

  	end

  end
end
