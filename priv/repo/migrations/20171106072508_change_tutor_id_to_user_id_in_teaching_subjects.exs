defmodule GrabCikgu.Repo.Migrations.ChangeTutorIdToUserIdInTeachingSubjects do
  use Ecto.Migration

  def change do
    rename table(:teaching_subjects), :tutor_id, to: :user_id
  end
end
