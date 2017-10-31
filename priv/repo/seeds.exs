# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GrabCikgu.Repo.insert!(%GrabCikgu.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GrabCikgu.Repo
alias GrabCikgu.Account.Role

for role <- ~w(Admin Tutor Student) do
  Repo.get_by(Role, name: role) ||
	Repo.insert!(%Role{name: role})

end
