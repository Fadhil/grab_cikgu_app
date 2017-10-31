defmodule GrabCikgu.Tutorial.Request do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Tutorial.Request


  schema "tutorial_requests" do
    field :rate, :string
    field :subject, :string
    field :area, :string
    field :time, :string
    field :startdate, :string
    field :period, :string
    field :remark, :string

    timestamps()
  end


  @doc false
  def changeset(%Request{} = request, attrs) do
    request
    |> cast(attrs, [:rate, :subject, :area, :time, :startdate, :period, :remark])
    |> validate_required([:rate, :subject, :area, :time, :startdate, :period, :remark])
  end
end