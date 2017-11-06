defmodule GrabCikgu.Repo.Migrations.CreateTeachingSubjectsTable do
  use Ecto.Migration

  def change do
    create table(:teaching_subjects) do
      add :rate, :float
      add :rate_in_cents, :integer
    end
  end
end
