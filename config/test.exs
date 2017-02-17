use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fun_in_the_sun, FunInTheSun.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fun_in_the_sun, FunInTheSun.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "fun_in_the_sun_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
