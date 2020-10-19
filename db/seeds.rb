# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Language.create(name: "Python", description: "Python is an interpreted, high-level and general-purpose programming language.")
Language.create(name: "JavaScript", description: "JavaScript is an object-oriented computer programming language commonly used to create interactive effects within web browsers.")
Language.create(name: "Java", description: "Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.")
Language.create(name: "C", description: "C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system.")
Language.create(name: "C#", description: "C# is a general-purpose, multi-paradigm programming language encompassing strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.")
Language.create(name: "C++", description: "C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or 'C with Classes'.")
Language.create(name: "Go", description: "Go is a statically typed, compiled programming language.")
Language.create(name: "PHP", description: "PHP is a general-purpose scripting language especially suited to web development.")
Language.create(name: "Swift", description: "Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community, first released in 2014.")
Language.create(name: "Ruby", description: "Ruby is an interpreted, high-level, general-purpose programming language.")
Language.create(name: "R", description: "R is a programming language and free software environment for statistical computing and graphics.")
Language.create(name: "TypeScript", description: "TypeScript is a programming language developed and maintained by Microsoft. It is a strict syntactical superset of JavaScript and adds optional static typing to the language. TypeScript is designed for development of large applications and transcompiles to JavaScript.")
Language.create(name: "Rust", description: "Rust is a multi-paradigm programming language focused on performance and safety, especially safe concurrency.")
Language.create(name: "Scala", description: "Scala is a general-purpose programming language providing support for both object-oriented programming and functional programming.")
Language.create(name: "MATLAB", description: "MATLAB is a proprietary multi-paradigm programming language and numerical computing environment developed by MathWorks. MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages.")

Topic.create(title: "Artificial Intelligence", description: "The theory and development of computer systems able to perform tasks that normally require human intelligence, such as visual perception, speech recognition, decision-making, and translation between languages.")
Topic.create(title: "For Loops", description: "A for-loop is a control flow statement for specifying iteration, which allows code to be executed repeatedly.")
Topic.create(title: "While Loops", description: "A while loop is a control flow statement that allows code to be executed repeatedly based on a given Boolean condition.")
Topic.create(title: "Data Types", description: "A data type or simply type is an attribute of data which tells the compiler or interpreter how the programmer intends to use the data.")
Topic.create(title: "Math Operators")
Topic.create(title: "Recursion")
Topic.create(title: "Variables")
Topic.create(title: "MVC")
Topic.create(title: "Domain Modeling")
Topic.create(title: "Security")

30.times do
    topic = Topic.all.sample
    language = Language.all.sample
    LangTopic.create(language_id: language.id, topic_id: topic.id)
end

15.times do
    User.create(
name: Faker::Name.unique.name,
password: Faker::String,
bio: Faker::Lorem.paragraph_by_chars(number: 35)
    )
end