every 1.day, at: "12pm" do
  rake "db:synchronize", output: {error: "error.log", standard: "cron.log"}
end
