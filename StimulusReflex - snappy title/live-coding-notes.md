
^
- Create a to do model with scaffold
  - be rails generate model todo desc:string done:boolean
  - Run the migrations

- Create a basic page to display all todo items
  - be rails g controller todo index
- return todos
  ```ruby
  def index
    @todos = Todo.all
  end
  ```
- Add html
<header>
<h1>Todo</h1>
<h2>All the things I gotta do<h2>
</header>

- Add in styles to not hurt your eyes
    <link rel="stylesheet" href="https://fonts.xz.style/serve/inter.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@exampledev/new.css@1.1.2/new.min.css">

- setup some formatting for the todos
<style>
.done {
  text-decoration: line-through;
}
</style>

<ul>
<% @todos.each do |todo| %>
  <li class="<%= 'done' if todo.done %>" >
    <%= todo.desc %>
  </li>
<% end %>
</ul>

- Setup some dummy data
  ```ruby
  Todo.create(desc: "Complete the presentation", done: false)
  Todo.create(desc: "Finish the dang slides", done: true)
  ```
- FIRST CHECKPOINT `git checkout step-1`


- create reflex
```ruby
  def update_doneness()
    todo = Todo.find(element.dataset[:id])
    todo.toggle!(:done)
  end
```

- setup anchor tag to use reflex action

  <li class="<%= 'done' if todo.done %>" >
    <a href="#"
    data-id="<%= todo.id %>"
    data-reflex="click->Todo#update_doneness"
    >
      <%= todo.desc %>
    </a>
  </li>

- add create reflex action
```ruby
  def create(description)
    Todo.create(desc: description, done: false)
  end
```

- add stimulus controller action
```js
  static targets = [ "desc" ]

  create(event) {
    event.preventDefault()
    this.stimulate('Todo#create', this.descTarget.value )
  }
```

- create the input field
  <h3>New Task:</h3>
  <input data-target="todo.desc" type="text">
  <button data-action="click->todo#create">Create!</button>
- SECOND CHECKPOINT `git checkout step-2`

- create delete reflex
  ```ruby

  def delete()
    todo = Todo.find(element.dataset[:id])
    todo.delete
  end
  ```
- Add delete element to page

      <a href="#"
      data-id="<%= todo.id %>"
      data-reflex="click->Todo#delete"
      >
        X
      </a>
- STEP-3 CHECKPOINT `git checkout step-3`
