new_post = Post.create({name: "Why Hello?", author:"Angga Putra", description:"By World"})
new_comment = Comments.create({name: "Hello", author: "Angga", body: "Hello World"})
new_tag = Tag.create({name: "Cool"})

new_post.tags << new_tag
new_post.comments << new_comment
