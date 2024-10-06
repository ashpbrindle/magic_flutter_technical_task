# Magic AI Flutter Technical Task

## Use of third-party packages

- `flutter_bloc`

    Flutter Bloc is the State Management tool I am most familiar with. In my opinion, it is the best and simplest to use. With the use of Flutter Bloc, I opted to use Cubits as my state management solution, as Cubits are more lightweight compared to their Bloc counterparts while removing bloc events.
    Another reason for using `flutter_bloc`, is that it also allows me to use another package named `bloc_test`, making it very easy to quickly create understandable tests for my cubits and their actions.

- `equatable`

    Equatable was chosen as it works quite nicely with `flutter_bloc`. While using Equatable on entities, it allows for better comparison against 2 objects, such as its used in `flutter_bloc` to detect when 2 instances of the same entity are different. This also allows you to customise which attributes of an entity you wish to be compareable while customising the overridable props callback.

- `get_it`

    GetIt was used in this project as my solution to dependency injection, this helps for organising my code and registering my dependencies in each of my packages (which I will discuss in my architecture overview)
    GetIt is also useful for any common initialisation of services, such as initialising Repositories or Usecases which in this case were accessed multiple times in the project.

- `go_router`

    As my routing solution for this project, i have chosen to go with `go_router`. Although the basic flutter navigation would have served its purpose in this project, I wanted to demonstrate other solutions. GoRouter is a very popular package, being one of the most popular on pub dev, which allows for a more strutured approach to defining routes (as will also be discussed with my architecture overview).

- `freezed` and `freezed_annotation`

    In this case both freezed and freezed annotation couple together and go hand in hand. Freezed is used for code generation and can be useful for building useful methods which I in this case used alongside `flutter_bloc` with my states. freezed_annotation is needed in this case to define the models I used for my states. Freezed in this case allows for better state management while letting you create multiple types of states for your viewmodel, as well as providing useful methods such as copyWith which allows you to manipulate an existing state and state.when which allows you to build based on the current state.

- `bloc_test`

    As mentioned above I used `bloc_test` along with the `flutter_bloc` package, this solution is good for writing quick unit tests for your bloc, while providing a method which can be used to configure your test to best suit your means, as well as making it more readable in my opinion. In this case it was useful to write tests for verifying calls within my cubit as well as the order the states have been emitted after calling methods.

- `mocktail`

    Mocktail was used in this project as a simple way of mocking my states, repositories and usecases for testing. This allowed for me to unit test my code and mocking potential responses from my services, without having to call the services directly. This allows for a more streamlined process when running your tests and more control in what scenarios you would like to test.

- `build_runner`

    In this case, `build_runner` was a required package for this project, both being used for my database generation as well as the freezed files for my view model states.

- `drift`, `drift_flutter`, `path_provider`, `path` and `drift_dev`

    For my solution on storing the Workouts and the Workout sets, I used drift. I think a SQL solution was the best solution here because it allowed for relationships between tables. In this case I needed a one to many relationship between my Workout Table and the Workout Set Tables. This also provides a brilliant structure for storing multiple of the same entities as well as providing easy ways to insert, update, delete and listen to my records.

## Architectural choices
In this project I have chosen to keep to clean architecture as much as possible with the use of internal packages to the project, this allows only certain packages to have access to certain other packages to keep each layer independent. 

For example; the Database layer does not have access to the repository package or the use case package, while only having access to entities.
The repository package only has access to the entities and database package.
The usecase package only has access to the repository and entities packages.

In this case, I used a dependency injector in each package to avoid having to directly expose certain services in each package to over, e.g. the actual database for the workout records can only be accessed in the database layer or through the use of Daos which are used to directly access the database without exposing it to other layers.

The packages used in this project are the following:

- `entity`

    The entity package acts as the center of my app with all layers having access to it, this works as my Domain Models for the app as a common layer.

- `use_case`

    The Usecase package acts as a bridge to the repository package, meaning that the repository cannot be directly accessed. Usecases are also useful for complicated logic in which multiple repositories need to be called. This helps separate the code into a common place which can be called when needed; An example of this in the project was for deleting a workout, in which all of the sets needed to be deleted first before the workout could have been deleted, this was moved to a usecase as 2 different repositories needed to be accessed and that logic did not need to be inside of the view model for the screen. This acts as my application layer.

- `repository`

    The repository layer acts as an interface between my data sources and my application layer. This allows me to call and do any transformations with the data before it reaches the application layer for the usecases. In this case, it was used to directly interface with the database layer through daos, however, this can also be used to interface with an API layer if needed, or any datasource.

- `database`

    In this project the database layer is used to store all of the datasources for the application, in this case it stores all of the workouts and the workout sets for the user. The database was never exposed from this layer (as we are using packages) and was instead accessed through the use of daos which were exported to be called from the repository layer. Any actions to retrieve the datasources, add or manipulate data was done through this layer, through interfaces in the repository layer.

- `root`

    Finally, my presentation layer was in the root `\lib` directory of the app, with all of the UI logic and presentation widgets.
    In this layer, I also defined the routing system for the app as well as registering all of the dependencies in the app through methods defined in each package.
    For this structure, I decided to create a features folder which would separate out each feature in the app into its own presentation and view_model folders. I beleive this allows for easy navigation of the project.