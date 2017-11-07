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
alias GrabCikgu.Tutorial.Subject

for role <- ~w(Admin Tutor Student) do
  Repo.get_by(Role, name: role) ||
	Repo.insert!(%Role{name: role})

end

subjects = [
 {"Mathematics", "Primary 1"},
 {"English", "Primary 1"},
 {"Bahasa Malaysia", "Primary 1"},
 {"Science", "Primary 1"},
 {"Mathematics", "Primary 2"},
 {"English", "Primary 2"},
 {"Bahasa Malaysia", "Primary 2"},
 {"Science", "Primary 2"},
 {"Mathematics", "Primary 3"},
 {"English", "Primary 3"},
 {"Bahasa Malaysia", "Primary 3"},
 {"Science", "Primary 3"}
 ]

for {name, grade} <- subjects do
  Repo.get_by(Subject, %{name: name, grade: grade}) ||
  Repo.insert!(%Subject{name: name, grade: grade})
end
