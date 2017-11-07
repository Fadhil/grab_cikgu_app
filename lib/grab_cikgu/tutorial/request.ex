defmodule GrabCikgu.Tutorial.Request do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Tutorial.{Request, Tutor, Student}


  schema "tutorial_requests" do
    field :rate, :string
    field :subject, :string
    field :area, :string
    field :time, :string
    field :startdate, :string
    field :period, :string
    field :remark, :string
    belongs_to :tutor, Tutor
    belongs_to :student, Student
    timestamps()
  end


  @doc false
  def changeset(%Request{} = request, attrs) do
    request
    |> cast(attrs, [:tutor_id, :student_id, :rate, :subject, :area, :time, :startdate, :period, :remark])
    |> validate_required([:time, :startdate, :period])
  end
end
