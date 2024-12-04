# Coordinator

### This repo exemplifies the use of the Coordinator design pattern on a UIKit project

---

#### Create Coordinator Protocol
<img src="./README-images/protocol.png" width="700" alt="Coordinator Protocol">

#### Then you can create a class that conforms to this protocol to control navigation on a UIViewController
<img src="./README-images/coordinator-class.png" width="550" alt="Coordinator Class">

---

#### Create protocols that contains the methods you want to use to implement navigation
<img src="./README-images/navigation-protocol.png" width="500" alt="Navigation Protocol">

---

#### Create a reference to the coordinator inside your UIViewController
<img src="./README-images/vc-reference.png" width="550" alt="Coordinator ref inside VC">

---

#### Use a method from coordinator inside your UIViewController
<img src="./README-images/vc-call.png" width="400" alt="Coordinator ref inside VC">
<img src="./README-images/start.png" width="400" alt="Coordinator ref inside VC">
<img src="./README-images/nav-delegate.png" width="400" alt="Coordinator ref inside VC">
<img src="./README-images/transition-delegate.png" width="400" alt="Coordinator ref inside VC">
