defmodule GrabCikgu.Repo.Migrations.CreateSubjectsTable do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :name, :string
      add :grade, :string
    end
  end
end
