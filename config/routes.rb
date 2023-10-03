Rails.application.routes.draw do
  # User routes
  get("/", { controller: "users", action: "index" })
  get("/users", { controller: "users", action: "index" })
  get("/users/:username", {controller: "users", action: "show"})

  post("/add_user", {controller: "users", action: "create"})
  post("/edit_user/:id", {controller: "users", action: "update"})

  # Photo routes
  get("/photos", { controller: "photos", action: "index"})
  get("/photos/:id", { controller: "photos", action: "show" })
  post("/add_photo", {controller: "photos", action: "create"})
  post("/update_photo/:id", {controller: "photos", action: "update"})
  get("/delete_photo/:id", {controller: "photos", action: "destroy" })

  # Comment routes
  post("/add_comment", {controller: "comments", action: "create" })
end
