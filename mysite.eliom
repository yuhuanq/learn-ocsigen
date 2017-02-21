

let f _ () =
  Lwt.return "<html><head><title>Hello world</title></head><body>Welcome</body></html>"

let main_service =
  Eliom_registration.Html_text.create
    ~path:(Eliom_service.Path ["aaa"; "bbb"])
    ~meth:(Eliom_service.Get Eliom_parameter.any)
    f

let g getp postp = Lwt.return ("t = " ^ (string_of_int postp))

let post_service =
  Eliom_registration.Html_text.create
    ~path:(Eliom_service.Path [""])
    ~meth:(Eliom_service.Post (Eliom_parameter.any, Eliom_parameter.int "t"))
    g

let g' getp postp = Lwt.return "..."

let post_service =
  Eliom_registration.Html_text.create
    ~path:(Eliom_service.Path [""])
    ~meth:(Eliom_service.Get Eliom_parameter.any)
    g'

