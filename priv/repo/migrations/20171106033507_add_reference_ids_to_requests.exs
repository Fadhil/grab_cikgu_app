defmodule GrabCikgu.Repo.Migrations.AddReferenceIdsToRequests do
  use Ecto.Migration

  def change do
    alter table(:tutorial_requests) do
      add :tutor_id, references(:users)
      add :student_id, references(:users)
    end
  end
end
