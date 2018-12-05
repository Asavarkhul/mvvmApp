# README 🔥

This architecture is split in differents layers/concepts 🏋️‍♀️: 
* `Coordinator`
* `ViewControllers`
* `ViewModels`
* `Repositories`
* `Tests`

### Context

Since I've bin hired in my team I learned a lot of new concepts on clean architecture. This project is representing at this time my guideline for every workdays.
I hope that you'll have as pleasure as me to read it and understand the different parts. Please be free to make any pull request if you think that some parts needs to be improved.

### Architecture

#### Coordinator:

Coordinator is a separate entity responsible for navigation in application flows. With the help of the `Screens`, it creates, presents and dismisses `UIViewControllers`, by keeping them separate and independent.
Coordinator can, create and run child coordinators too.

Since a coordinator is responsible of the entire flow of a specific flow (or stack), do not create a coordinator per viewController ☝️.

The only way of using a coordinator, is to instanciate it (by injecting in it if necessary some specific ojetcs) and call the `start()` method, and **that's all**. The entire logic will be encapsulated by delegation for the rest of the navigation.

#### Repository:

This layer is responsible of calling the `Network` layer (will be implemented later), and managing the data from it, in order to present it to the viewModel.

You can see that on the top of each repository, a protocol `RepositoryType` will allow us to test everything by dependency injection 💪.

#### ViewModel:

The `ViewModel` encapsulates the whole logic which doesn't have to be in the ViewController. It's divided in two parts :

* **Inputs**: Every event from the viewController needs to be implemented in the viewModel, since it's listening for them. The main event which always need to be added is `viewDidLoad()`.
* **Outputs**: After `viewDidLoad()`, the viewController is listening for some changes from the `viewModel`. For this, the `viewModel` needs to provide reactive var for each data/state needed. The main rule is to keep separate the UI logic between viewModel and viewController, so keep in mind that a viewModel can only `import Foundation` -> reactive var con't provide data from `UIKit` like `UIImage` for example ☝️.

If your viewModel needs a `Repository`, so you'll need to inject a `RepositoryType`, in order to mock it more easily in the tests 🏋️‍♀️

#### ViewController:

The last layer and not the less important 🙇‍♂️. But as it is mentioned in it's name, a `ViewController` only exists for **control**. So, if you want to test it, you'll only provide UI test, since the logic is extracted in the corresponding `ViewModel`. I recomand to add a custom snapshot to test it correctly.

#### Tests

This target contains the differents tests on `ViewModels` and custom classes.
The project is connected to `Travis CI` and contains a `.travis.yml` file, which allow us to run test on `master` branch, each time a new commit is added.

You can find the output [there](https://travis-ci.org/Asavarkhul/mvvmApp).
