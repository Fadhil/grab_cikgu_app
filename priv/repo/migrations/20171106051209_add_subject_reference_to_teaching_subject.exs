defmodule GrabCikgu.Repo.Migrations.AddSubjectReferenceToTeachingSubject do
  use Ecto.Migration

  def change do
    alter table(:teaching_subjects) do
      add :subject_id, references(:subjects)
    end
  end
end
