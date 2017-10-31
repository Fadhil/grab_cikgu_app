defmodule GrabCikgu.Repo.Migrations.StudentProfileForeignKey do
  use Ecto.Migration

  def change do
  	alter table(:account_student_profiles) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
