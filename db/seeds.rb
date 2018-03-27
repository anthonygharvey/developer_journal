User.create(username: "Rick", email: "rick@example.com", password: "password", first_name: "Rick", last_name: "Grimes")
User.create(username: "Negan", email: "negan@example.com", password: "password", first_name: "Negan", last_name: "Lucile")
User.create(username: "Daryl", email: "Daryl@example.com", password: "password", first_name: "Daryl", last_name: "Dixon")
User.create(username: "Michonne", email: "Michonne@example.com", password: "password", first_name: "Michonne", last_name: "Sword")
User.create(username: "Morgan", email: "Morgan@example.com", password: "password", first_name: "Morgan", last_name: "Jones")

Goal.create(duration_in_days: 10, languages: "Ruby, Sinatra", user_id: 1, name: "Build a Sinatra App to Show Negan", start_date: "Mar 20 2018", end_date: "Mar 30 2018", progress: 0)
Goal.create(duration_in_days: 20, languages: "Ruby, Ruby on Rails", user_id: 2, name: "Level up with Ruby", start_date: "Mar 10 2018", end_date: "Mar 30 2018", progress: 0)
Goal.create(duration_in_days: 30, languages: "Javascript, CSS", user_id: 3, name: "30 Days of Code", start_date: "Mar 1 2018", end_date: "Mar 30 2018", progress: 0)
Goal.create(duration_in_days: 20, languages: "Angular, React", user_id: 4, name: "Sharpen My Skills", start_date: "Mar 1 2018", end_date: "Mar 20 2018", progress: 0)
Goal.create(duration_in_days: 20, languages: "Ruby", user_id: 5, name: "Be the Code", start_date: "Mar 1 2018", end_date: "Mar 20 2018", progress: 0)

Entry.create(content: "<p><img src=\"http://digitalspyuk.cdnds.net/16/46/980x490/landscape-1479479557-rick-and-negan-twd.jpg\" style=\"width: 50%;\"><br></p><p>I'm taking my first&nbsp;<a href=\"https://learn.co/tracks/full-stack-web-development-v3/sinatra/sinatra-basics/what-is-sinatra\" target=\"_blank\">Sinatra</a> lesson so I can build a web app to show Negan!  Maybe that will make things better between us.", languages: nil, goal_id: 1, created_at: "2018-03-207 14:14:48", updated_at: "2018-03-20 14:19:22", title: "Sinatra - Day 1", files: nil)

Entry.create(content: "<p><img src=\"https://vignette.wikia.nocookie.net/walkingdead/images/8/85/Cy44zWrUAAErkJv.jpg_large.jpg/revision/latest?cb=20161205073426\" style=\"width: 200px;\"></p><p>Once I learn Ruby and Ruby on Rails I can create a web application I have in mind to streamline operations at the Sanctuary.</p>", languages: nil, goal_id: 2, created_at: "2018-03-10 14:42:48", updated_at: "2018-03-10 14:45:28", title: "Getting Started with Ruby and Ruby on Rails", files: nil)

Entry.create(content: "<p><img src=\"http://www.logicstudio.net/spa//wp-content/uploads/2018/01/LogicStudio_HTML5.png\" style=\"width: 25%;\"></p><p>I know HTML already.  Learning Javascript and CSS will add two more arrows to my quiver.</p>", languages: nil, goal_id: 3, created_at: "2018-03-1 14:42:48", updated_at: "2018-03-1 14:45:28", title: "Aiming High!", files: nil)

Entry.create(content: "<p><img src=\"https://cdn-images-1.medium.com/max/700/1*yq7TPrTheULIcxwfTD96SA.png\" style=\"width: 75%;\"></p><p>Combining Angular and React will make me unstopable!</p>", languages: nil, goal_id: 4, created_at: "2018-03-1 14:42:48", updated_at: "2018-03-1 14:45:28", title: "Angular & React... a Winning Combination", files: nil)

Entry.create(content: "<p><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTqkhqkgUFQKyoEmGZO6TimPovlQ1v42Z-epSwvluEe-p5M7OwQ\" style=\"width: 25%;\"></p><p>Learning Ruby will help me focus.... plus it was made for my happiness!</p>", languages: nil, goal_id: 5, created_at: "2018-03-1 14:42:48", updated_at: "2018-03-1 14:45:28", title: "Ruby for the Win!", files: nil)

