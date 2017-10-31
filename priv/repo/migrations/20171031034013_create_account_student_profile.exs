defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Account.StudentProfile do
  use Ecto.Migration

  def change do
    create table(:account_student_profiles) do
      add :name, :string
      add :ic_no, :string
      add :gender, :string
      add :age, :integer
      add :grade, :string
      add :school, :string

      timestamps()
    end

  end
end
