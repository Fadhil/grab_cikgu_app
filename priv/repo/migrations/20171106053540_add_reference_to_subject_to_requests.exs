defmodule GrabCikgu.Repo.Migrations.AddReferenceToSubjectToRequests do
  use Ecto.Migration

  def change do
    alter table(:tutorial_requests) do
      add :subject_id, references(:subjects)
    end
  end
end
