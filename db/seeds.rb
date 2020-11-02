courses = Course.create([
  {
    course_name: "Sunrise",
    description: "Web basics for Front-End or Back-End development"
  },
  {
    course_name: "Phoenix",
    description: "Front-End development with React.JS"
  },
  {
    course_name: "Piranha",
    description: "Back-End development with Ruby on Rails"
  },
  {
    course_name: "High Noon",
    description: "Front-End and Back-End development with React.JS and Ruby on Rails"
  }
])


units = Unit.create([
  {
    unit_name: "Web basics 1",
    description: "Welcome to Web Basics I, the first class in Code the Dream’s six-part Web Development course. Web Basics I serves as an introduction to computer programming. You’ll start with Treehouse’s Digital Literacy track, which covers basic computing principles and introduces you to HTML, CSS, JavaScript, & Git. By the time you finish your final project, you’ll have the foundations every programmer needs.",
    courses: [
      Course.find(1)
    ]
  },
  {
    unit_name: "Web basics 2",
    description: "Now that you have mastered the essentials of programming, it’s time to dive deeper. In Web Basics II, you’ll learn the basics of JavaScript, the most popular programming language. Then, you will learn about databases and SQL, a popular back-end language, and work on some more GitHub. Finally, you’ll apply that knowledge in the final project for Web Basics.",
    courses: [
      Course.find(1)
    ]
  },
  {
    unit_name: "Front-End 1",
    description: "Welcome to Front End 1, the first class in our Front End development track.",
    courses: [
      Course.find(2),
      Course.find(4)
    ]
  },
  {
    unit_name: "Front-End 2",
    description: "Welcome to Front End II, you will be learning the popular and super powerful javascript framework React.",
    courses: [
      Course.find(2),
      Course.find(4)
    ]
  },
  {
    unit_name: "Back-End 1",
    description: "Welcome to Back End I, the first class in our Back End development track.",
    courses: [
      Course.find(3),
      Course.find(4)
    ]
  },
  {
    unit_name: "Back-End 2",
    description: "Welcome to Back End II, the first class in our Back End development track.",
    courses: [
      Course.find(3),
      Course.find(4)
    ]
  }
])


lessons = Lesson.create([
  {
    lesson_name: "Digital Literacy, Intro to Terminal, Intro to Git, Intro to HTML & CSS",
    units: [
      Unit.find(1)
    ]
  },
  {
    lesson_name: "Intro to Wireframing | Intro to JavaScript | HTML Basics",
    units: [
      Unit.find(1)
    ]
  },
  {
    lesson_name: "Beginning JavaScript | Functions | Numbers",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "Loops | Arrays | Objects",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "Additional JavaScript exercises",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "JavaScript and the DOM | CSS Selectors",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "DOM Scripting",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "Build",
    units: [
      Unit.find(2)
    ]
  },
  {
    lesson_name: "Debugging with CSS, CSS layouts",
    units: [
      Unit.find(3)
    ]
  },
  {
    lesson_name: "Advanced HTML & CSS, CSS selectors, Bootstrap 4 basics",
    units: [
      Unit.find(3)
    ]
  },
  {
    lesson_name: "HTML tables, HTML video & audio, Media-player, Intro to FE optimization ",
    units: [
      Unit.find(3)
    ]
  },
  {
    lesson_name: "AJAX basics, ASync JavaScript, Working with Fetch",
    units: [
      Unit.find(3)
    ]
  },
  {
    lesson_name: "Object-oriented JavaScript, Web Accessibility Compliance, Web optimization",
    units: [
      Unit.find(3)
    ]
  },
  {
    lesson_name: "Practice with reusable components, Intro to React",
    units: [
      Unit.find(4)
    ]
  },
  {
    lesson_name: "Fetching data & creating routes",
    units: [
      Unit.find(4)
    ]
  },
  {
    lesson_name: "Using APIs to fetch data in React. Using Airtable as a lightweight CMS",
    units: [
      Unit.find(4)
    ]
  },
  {
    lesson_name: "Authentication patterns. Using Firebase as a backend for a react app. Reviewing React Concepts.",
    units: [
      Unit.find(4)
    ]
  },
  {
    lesson_name: "React Project.",
    units: [
      Unit.find(4)
    ]
  },
  {
    lesson_name: "SQL Basics",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "More SQL, Introduction to Ruby",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "Ruby",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "Ruby II",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "Ruby III",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "Ruby & Sinatra",
    units: [
      Unit.find(5)
    ]
  },
  {
    lesson_name: "Ruby on Rails Basics",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Rails Development",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Additional Rails Topics",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Bringing it all together",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Bootstrap 4 Basics; Bootstrap in Rails.",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Building an API, Swagger, Ajax",
    units: [
      Unit.find(6)
    ]
  },
  {
    lesson_name: "Final Project",
    units: [
      Unit.find(6)
    ]
  }
])


sources = Source.create([
  {
    source_title: "Computer Basics",
    link: "https://teamtreehouse.com/library/computer-basics",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "How the Internet Works",
    link: "https://teamtreehouse.com/library/how-the-internet-works",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "How the Web Works",
    link: "https://teamtreehouse.com/library/how-the-web-works",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "Introduction to the Terminal",
    link: "https://teamtreehouse.com/library/introduction-to-the-terminal",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "Introduction to Git",
    link: "https://teamtreehouse.com/library/introduction-to-git",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "Introduction to HTML & CSS",
    link: "https://teamtreehouse.com/library/introduction-to-html-and-css",
    lessons: [
      Lesson.find(1)
    ]
  },
  {
    source_title: "Introduction to Wireframing",
    link: "https://teamtreehouse.com/library/introduction-to-wireframing",
    lessons: [
      Lesson.find(2)
    ]
  },
  {
    source_title: "Introducing JavaScript",
    link: "https://teamtreehouse.com/library/introducing-javascript",
    lessons: [
      Lesson.find(2)
    ]
  },
  {
    source_title: "HTML Basics",
    link: "https://teamtreehouse.com/library/html-basics-2",
    lessons: [
      Lesson.find(2)
    ]
  },
  {
    source_title: "JavaScript Basics",
    link: "https://teamtreehouse.com/library/javascript-basics",
    lessons: [
      Lesson.find(3)
    ]
  },
  {
    source_title: "JavaScript Functions",
    link: "https://teamtreehouse.com/library/javascript-functions",
    lessons: [
      Lesson.find(3)
    ]
  },
  {
    source_title: "JavaScript Numbers",
    link: "https://teamtreehouse.com/library/javascript-numbers",
    lessons: [
      Lesson.find(3)
    ]
  },
  {
    source_title: "JavaScript Loops, Arrays, and Objects",
    link: "https://teamtreehouse.com/library/javascript-loops-arrays-and-objects",
    lessons: [
      Lesson.find(4)   
    ]
  },
  {
    source_title: "javaScript reading materials",
    link: "https://learn.codethedream.org/web-basics-ii/web-basics-ii-week-3/",
    lessons: [
      Lesson.find(5)
    ]
  },
  {
    source_title: "Javascript Landscape.",
    link: "https://teamtreehouse.com/library/the-landscape-of-javascript",
    lessons: [
      Lesson.find(6)
    ]
  },
  {
    source_title: "JavaScript and the DOM",
    link: "https://teamtreehouse.com/library/javascript-and-the-dom-2",
    lessons: [
      Lesson.find(6)
    ]
  },
  {
    source_title: "What you need to Know About CSS Selectors",
    link: "https://teamtreehouse.com/library/what-you-need-to-know-about-css-selectors",
    lessons: [
      Lesson.find(6)
    ]
  },
  {
    source_title: "DOM Scripting by Example",
    link: "https://teamtreehouse.com/library/dom-scripting-by-example",
    lessons: [
      Lesson.find(7)
    ]
  },
  {
    source_title: "Explore & understand the concepts being implemented in the week 5 assignment ",
    link: "https://learn.codethedream.org/web-basics-ii/web-basics-ii-week-6/",
    lessons: [
      Lesson.find(8)
    ]
  },
  {
    source_title: "CSS Basic",
    link: "https://teamtreehouse.com/library/css-basics",
    lessons: [
      Lesson.find(9)
    ]
  },
  {
    source_title: "Debugging CSS with Chrome Devtools",
    link: "https://teamtreehouse.com/library/debugging-css-with-chrome-devtools",
    lessons: [
      Lesson.find(9)
    ]
  },
  {
    source_title: "CSS Layout Basics",
    link: "https://teamtreehouse.com/library/css-layout-basics",
    lessons: [
      Lesson.find(9)
    ]
  },
  {
    source_title: "Responsive Layouts",
    link: "https://teamtreehouse.com/library/responsive-layouts",
    lessons: [
      Lesson.find(9)
    ]
  },
  {
    source_title: "Flexbox",
    link: "https://teamtreehouse.com/library/css-flexbox-layout",
    lessons: [
      Lesson.find(9)
    ]
  },
  {
    source_title: "HTML Forms",
    link: "https://teamtreehouse.com/library/html-forms",
    lessons: [
      Lesson.find(10)
    ]
  },
  {
    source_title: "CSS Selectors",
    link: "https://teamtreehouse.com/library/css-selectors",
    lessons: [
      Lesson.find(10)
    ]
  },
  {
    source_title: "Bootstrap Basics",
    link: "https://teamtreehouse.com/library/bootstrap-4-basics-2",
    lessons: [
      Lesson.find(10)
    ]
  },
  {
    source_title: "HTML Tables",
    link: "https://teamtreehouse.com/library/html-tables",
    lessons: [
      Lesson.find(11)
    ]
  },
  {
    source_title: "HTML Video and Audio",
    link: "https://teamtreehouse.com/library/html-video-and-audio-2",
    lessons: [
      Lesson.find(11)
    ]
  },
  {
    source_title: "Create Media Player",
    link: "https://teamtreehouse.com/library/create-a-media-player-with-mediaelementjs",
    lessons: [
      Lesson.find(11)
    ]
  },
  {
    source_title: "Intro to FE Optimization",
    link: "https://teamtreehouse.com/library/introduction-to-front-end-performance-optimization",
    lessons: [
      Lesson.find(11)
    ]
  },
  {
    source_title: "AJAX Basics",
    link: "https://teamtreehouse.com/library/ajax-basics-2",
    lessons: [
      Lesson.find(12)
    ]
  },
  {
    source_title: "Async JavaScript",
    link: "https://teamtreehouse.com/library/asynchronous-programming-with-javascript",
    lessons: [
      Lesson.find(12)
    ]
  },
  {
    source_title: "Fetch API",
    link: "https://teamtreehouse.com/library/working-with-the-fetch-api",
    lessons: [
      Lesson.find(12)
    ]
  },
  {
    source_title: "Object-Oriented JavaScript",
    link: "https://teamtreehouse.com/library/objectoriented-javascript-2",
    lessons: [
      Lesson.find(13)
    ]
  },
  {
    source_title: "Web Accessibility",
    link: "https://teamtreehouse.com/library/web-accessibility-compliance",
    lessons: [
      Lesson.find(13)
    ]
  },
  {
    source_title: "Website Optimization",
    link: "https://teamtreehouse.com/library/website-optimization",
    lessons: [
      Lesson.find(13)
    ]
  },
  {
    source_title: "React Basics",
    link: "https://teamtreehouse.com/library/react-basics-2",
    lessons: [
      Lesson.find(14)
    ]
  },
  {
    source_title: "React Components",
    link: "https://teamtreehouse.com/library/react-components",
    lessons: [
      Lesson.find(14)
    ]
  },
  {
    source_title: "Using Create React App",
    link: "https://teamtreehouse.com/library/using-create-react-app",
    lessons: [
      Lesson.find(14)
    ]
  },
  {
    source_title: "React Context",
    link: "https://teamtreehouse.com/library/react-context-api",
    lessons: [
      Lesson.find(15)
    ]
  },
  {
    source_title: "React Router 4",
    link: "https://teamtreehouse.com/library/react-router-4-basics-2",
    lessons: [
      Lesson.find(15)
    ]
  },
  {
    source_title: "React 16",
    link: "https://teamtreehouse.com/library/whats-new-in-react-16",
    lessons: [
      Lesson.find(15)
    ]
  },
  {
    source_title: "Data Fetching",
    link: "https://teamtreehouse.com/library/data-fetching-in-react",
    lessons: [
      Lesson.find(15)
    ]
  },
  {
    source_title: "Deploying a React App",
    link: "https://teamtreehouse.com/library/deploying-a-react-app",
    lessons: [
      Lesson.find(15)
    ]
  },
  {
    source_title: "Additional Reading on using Airtable API",
    link: "https://blog.crowdbotics.com/use-airtable-cloud-based-database-for-react-app/#:~:text=To%20use%20the%20Airtable%20API,component%20from%20the%20Material%20UI.",
    lessons: [
      Lesson.find(16)
    ]
  },
  {
    source_title: "Authentication patterns using Firebase",
    link: "https://www.robinwieruch.de/complete-firebase-authentication-react-tutorial",
    lessons: [
      Lesson.find(17)
    ]
  },
  {
    source_title: "Final Project Front-End",
    link: "https://learn.codethedream.org/front-end-ii/front-end-ii-week-5/",
    lessons: [
      Lesson.find(18)
    ]
  },
  {
    source_title: "SQL Basics",
    link: "https://teamtreehouse.com/library/sql-basics",
    lessons: [
      Lesson.find(19)
    ]
  },
  {
    source_title: "Modifying Data with SQL",
    link: "https://teamtreehouse.com/library/modifying-data-with-sql",
    lessons: [
      Lesson.find(19)
    ]
  },
  {
    source_title: "Reporting with SQL",
    link: "https://teamtreehouse.com/library/reporting-with-sql",
    lessons: [
      Lesson.find(19)
    ]
  },
  {
    source_title: "Querying Relational Databases",
    link: "https://teamtreehouse.com/library/querying-relational-databases",
    lessons: [
      Lesson.find(20)
    ]
  },
  {
    source_title: "Ruby Basics",
    link: "https://teamtreehouse.com/library/ruby-basics-2",
    lessons: [
      Lesson.find(20)
    ]
  },
  {
    source_title: "Ruby Collections",
    link: "https://teamtreehouse.com/library/ruby-collections",
    lessons: [
      Lesson.find(21)
    ]
  },
  {
    source_title: "Ruby Loops",
    link: "https://teamtreehouse.com/library/ruby-loops",
    lessons: [
      Lesson.find(21)
    ]
  },
  {
    source_title: "Ruby Objects and Classes",
    link: "https://teamtreehouse.com/library/ruby-objects-and-classes",
    lessons: [
      Lesson.find(21)
    ]
  },
  {
    source_title: "Ruby Blocks",
    link: "https://teamtreehouse.com/library/ruby-blocks",
    lessons: [
      Lesson.find(22)
    ]
  },
  {
    source_title: "Build an Address Book in Ruby",
    link: "https://teamtreehouse.com/library/build-an-address-book-in-ruby",
    lessons: [
      Lesson.find(22)
    ]
  },
  {
    source_title: "Ruby Modules",
    link: "https://teamtreehouse.com/library/ruby-modules",
    lessons: [
      Lesson.find(22)
    ]
  },
  {
    source_title: "Ruby Enumerable",
    link: "https://teamtreehouse.com/library/ruby-enumerable",
    lessons: [
      Lesson.find(23)
    ]
  },
  {
    source_title: "Ruby Core and Standard Library",
    link: "https://teamtreehouse.com/library/ruby-core-and-standard-library",
    lessons: [
      Lesson.find(23)
    ]
  },
  {
    source_title: "Ruby Gems",
    link: "https://teamtreehouse.com/library/ruby-gems",
    lessons: [
      Lesson.find(23)
    ]
  },
  {
    source_title: "Ruby Sinatra",
    link: "https://teamtreehouse.com/library/building-web-apps-with-sinatra",
    lessons: [
      Lesson.find(24)
    ]
  },
  {
    source_title: "Setting Up for Rails Development",
    link: "https://docs.google.com/presentation/d/1sJmfU4IsAI7XxzO_mmQka0qq8JRf6VIrMu9CAZgqUko/edit",
    lessons: [
      Lesson.find(25)
    ]
  },
  {
    source_title: "Ruby on Rails 5 Basics",
    link: "https://teamtreehouse.com/library/ruby-on-rails-5-basics",
    lessons: [
      Lesson.find(25)
    ]
  },
  {
    source_title: "Rails Routes and Resources",
    link: "https://teamtreehouse.com/library/rails-routes-and-resources",
    lessons: [
      Lesson.find(25)
    ]
  },
  {
    source_title: "Troubleshooting a Rails Application",
    link: "https://teamtreehouse.com/library/troubleshooting-a-rails-application",
    lessons: [
      Lesson.find(26)
    ]
  },
  {
    source_title: "Active Record Associations in Rails",
    link: "https://teamtreehouse.com/library/active-record-associations-in-rails",
    lessons: [
      Lesson.find(26)
    ]
  },
  {
    source_title: "Rails Validation and Error Handling",
    link: "https://docs.google.com/presentation/d/1rcn2UVcTbDBNuu8s6FTsWDKpTZUy9lzsknjDX8QXYdk/edit",
    lessons: [
      Lesson.find(27)
    ]
  },
  {
    source_title: "Rails Testing with Rspec",
    link: "https://docs.google.com/presentation/d/1SLed-cHT_egC1CAVAKrs1c5tPm0Hne8wNdm_nMFXSrQ/edit",
    lessons: [
      Lesson.find(27)
    ]
  },
  {
    source_title: "Rails Guided Assignment",
    link: "Rails Guided Assignment",
    lessons: [
      Lesson.find(28)
    ]
  },
  {
    source_title: "Bootstrap 4 Basics",
    link: "https://teamtreehouse.com/library/bootstrap-4-basics-2",
    lessons: [
      Lesson.find(29)
    ]
  },
  {
    source_title: "Bootstrap and Rails",
    link: "https://learn.codethedream.org/styling-your-rails-application-with-bootstrap/",
    lessons: [
      Lesson.find(29)
    ]
  },
  {
    source_title: "Building APIs, Swagger, Ajax",
    link: "https://learn.codethedream.org/backend-2-json-rest-api-swagger-ajax/",
    lessons: [
      Lesson.find(30)
    ]
  },
  {
    source_title: "Final Project",
    link: "https://learn.codethedream.org/rails-spring-2020-final-project/",
    lessons: [
      Lesson.find(31)
    ]
  }
])