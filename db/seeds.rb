cats = [
    {
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
    },
    {
        name: "Cali",
        age: 8,
        enjoys: "Chilling and vibing",
        image: "https://unsplash.com/photos/3QCjHVr0l5I",
    },
    {
        name: "Chester",
        age: 20,
        enjoys: "Hot cheetos and creeping people out",
        image: "https://images.unsplash.com/photo-1538100951519-36a3de1136c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80",
    },
    {
        name: "Tom",
        age: 70,
        enjoys: "hating mice and getting wrecked",
        image: "https://cdn.pixabay.com/photo/2020/05/11/15/38/tom-5158824_1280.png",
    }
]

cats.each do |cat|
    Cat.create cat
    puts "creating cat #{cat}"
end