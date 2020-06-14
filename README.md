# Fireplan
<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Assets/FireplanLogo.png" align="center" height="150"></a>

## Content
1. [Team Lions](#team-lions) 
1. [Problem Description](#problem-description) 
1. [Pitch Video](#pitch-video) 
1. [Architecture of Fireplan](#architecture-of-fireplan) 
1. [Detailed Solution](#detailed-solution) 
1. [Timeline](#timeline) 
1. [Getting Started](#getting-started) 
1. [Tests](#tests) 
1. [IBM Cloud Resource](#ibm-cloud-resource) 

## Team Lions
Lee Yin Jie, Tan Ying, Ho Hol Yin

We are a group of students from **SUTD** (Architecture) and **NUS** (Industrial Design and Computer Science).

## Problem Description
Fires are a key concern of the SCDF. Being a phenomenon that occurs almost instantaneously without any warning and has a potential to quickly spiral out of control, we identified such situations to require an immediate response. We intend to use technology to make sense of data collected from state-of-the-art sensors and use these data to educate and inform people.

Our technological solution: **Fireplan**.

**Fireplan** is a fire awareness and detection app with in households. On normal days, it is an educational tool which inform members of the household the potential fire hotspots in their house and the respective extinguishers that they might require. 

It plays a pro-active role in **early fire detection and firefighting**. Using smart sensors, such as heat, smoke level and air quality sensor, **Fireplan** will be able to **analyse the everyday data collected** and **raise an alert** when there is abnormality. This offers **early detection of potential fire** and guide household member to **put out fire before the situation worsens**.

## Pitch Video
[![Audi R8](http://img.youtube.com/vi/KOxbO0EI4MA/0.jpg)](https://www.youtube.com/watch?v=KOxbO0EI4MA "Audi R8")

## Architecture of Fireplan
* This is the **high-level architecture** of **Fireplan**, illustrating the relationship between the **users**, the **application** and the **back end**.

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/architecture.png" align="center" height="300"></a>

* **Fireplan** is an iOS app that was created in 48 hours, of which the engineering process include elements of:
  * Test-driven development
  * Application of useful design patterns (including the Observer pattern, Facade pattern, etc.)
  * Communication aspect with designers on requirements of application

## Detailed Solution
* <a href="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/DESCRIPTION.md">Fireplan Detailed Solution</a>

## Timeline
<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/timeline.jpg" align="center" height="500"></a>

## Getting Started

### Prerequisites
* You will require the latest version of Xcode (Version 11.5).

#### Installing
1. Clone the project into your local machine.
```
git clone https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM.git
```
2. Navigate to the project directory and install the required pods. The podfile will be provided in the repository.
```
pod install
```
3. Open up the file `.xcworkspace` file (`Fireplan.xcworkspace`)

4. To run the app, ensure that the target is set to `Fireplan` and the target device to a device of your choice (an iPhone or a simulator attached). **Fireplan** is optimally designed for **iPhone 8** (but can be extensible to include all iPhones/Android devices in the future)

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/target.png" align="center" height="100"></a>

5. Run the app! Click on the 'Run' button at the top left hand corner or execute the run command using Command-R (when editing the code)

## Tests
* We use **XCTest** module that is built in in Xcode to run our automated tests for our app.

  * <a href="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/tree/master/Fireplan/FireplanTests">Automated Tests for Fireplan</a>

* To run the tests in Xcode, navigate to the Test navigator and run from there.

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/tests.png" align="center" height="300"></a>

## IBM Cloud Resource
We used **IBM Cloudant** as our noSQL database to store fire-fighting tips and information regarding the different types of household fires.

* <a href="https://cloud.ibm.com/catalog/services/cloudant">IBM Cloudant</a> - The NoSQL Database used

