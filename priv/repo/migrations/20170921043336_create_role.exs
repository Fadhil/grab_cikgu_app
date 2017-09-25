defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Role do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string

      timestamps()
    end

    create unique_index(:roles, [:name])

  end
end
