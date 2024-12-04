# Coordinator

### This repo exemplifies the use of the Coordinator design pattern on a UIKit project

---

#### Create Coordinator Protocol
<img src="./README-images/protocol.png" width="700" alt="Coordinator Protocol">

---

#### Create protocols that contains the methods you want to use to implement navigation
<img src="./README-images/navigation-protocol.png" width="500" alt="Navigation Protocol">

---

#### Then you can create a class to control navigation on a UIViewController
<img src="./README-images/coordinator-class.png" width="550" alt="Coordinator Class">

---

#### Create a reference to the coordinator inside your UIViewController
<img src="./README-images/vc-reference.png" width="550" alt="Coordinator ref inside VC">

---

#### Implement your coordinator's methods
<img src="./README-images/start.png" width="900" alt="Coordinator methods implementation">

---

#### Use a method from coordinator inside your UIViewController
<img src="./README-images/vc-call.png" width="400" alt="Coordinator method call inside VC">

---

#### Use UINavigationControllerDelegate or UIViewControllerTransitioningDelegate to observe changes on a navigation
<img src="./README-images/nav-delegate.png" width="800" alt="UINavigationControllerDelegate">
<img src="./README-images/transition-delegate.png" width="900" alt="UIViewControllerTransitioningDelegate">

#### * To use these delegates you must conform your Coordinator class with NSObject

#### * Remember to call 'childDidFinish' method when a UIViewController is dismissed to remove the current coordinator from its parent coordinator

