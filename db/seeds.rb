
User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all


User.create!({
 :username => "test",
 :email =>  "t@t.com",
 :password => "password"
 })


10.times do (
   user = User.create!({
    :username => Faker::Internet.user_name,
    :email =>  Faker::Internet.safe_email,
    :password => Faker::Internet.password(8)
    })

  answer =  Answer.create!({
      :response => Faker::Lorem.sentence,
      :user_id => rand(1..10),
      :question_id => rand(1..10)
      })

  question =  Question.create!({
        :title => Faker::Name.title,
        :body=> Faker::Lorem.sentence,
        :user_id => rand(1..10),
        })

    Comment.create!({
         :response=> Faker::Lorem.sentence,
         :commentable_id => question.id,
         :commentable_type => question.class
         })

    Vote.create!({
         :votable_id => answer.id,
         :votable_type => answer.class,
         })
)
end
