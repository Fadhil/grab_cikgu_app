defmodule GrabCikgu.Account.StudentProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Account.StudentProfile


  schema "account_student_profiles" do
    field :age, :integer
    field :gender, :string
    field :grade, :string
    field :ic_no, :string
    field :name, :string
    field :school, :string

    timestamps()
  end

  @doc false
  def changeset(%StudentProfile{} = student_profile, attrs) do
    student_profile
    |> cast(attrs, [:name, :ic_no, :gender, :age, :grade, :school])
    |> validate_required([:name, :ic_no, :gender, :age, :grade, :school])
  end
end
