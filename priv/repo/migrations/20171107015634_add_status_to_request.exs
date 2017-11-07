defmodule GrabCikgu.Repo.Migrations.AddStatusToRequest do
  use Ecto.Migration

  def change do
    alter table(:tutorial_requests) do
      add :status, :string
    end
  end
end
