defmodule GrabCikgu.Repo.Migrations.AddTutorReferenceToTeachingSubject do
  use Ecto.Migration

  def change do
    alter table(:teaching_subjects) do
      add :tutor_id, references(:users)
    end
  end
end
