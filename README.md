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
   * [Automated Testing](#automated-testing)
   * [Exploratory Testing](#exploratory-testing)
1. [IBM Cloud Resource](#ibm-cloud-resource) 

## Team Lions
Lee Yin Jie, Tan Ying, Ho Hol Yin

We are a group of students from **SUTD** (Architecture) and **NUS** (Industrial Design and Computer Science).

## Problem Description
Fires are a key concern of the SCDF. Being a phenomenon that occurs almost instantaneously without any warning and has the potential to quickly spiral out of control, we identified such situations to require an immediate response. We intend to use technology to make sense of data collected from state-of-the-art sensors and use these data to educate and inform people.

Our technological solution: **Fireplan**.

**Fireplan** is a fire awareness and detection app within households. On normal days, it is an educational tool that informs members of the household about the potential fire hotspots in their house and the respective extinguishers that they might require.

It plays a pro-active role in **early fire detection and firefighting**. Using smart sensors, such as heat, smoke level, and air quality sensors, **Fireplan** will be able to analyse the everyday data collected and **raise an alert** when there is an abnormality. This offers **early detection of potential fire** and guides household members to **put out the fire before the situation worsens**.

## Pitch Video
[![](http://img.youtube.com/vi/3SdK-1p0-PY/0.jpg)](http://www.youtube.com/watch?v=3SdK-1p0-PY "")

## Architecture of Fireplan
* This is the **high-level architecture** of **Fireplan**, illustrating the relationship between the **users**, the **application** and the **back end**.

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/architecture.png" align="center" height="300"></a>

* **Fireplan** is an iOS app that was created in 48 hours, of which the engineering process include elements of:
  * Test-driven development
  * Application of useful design patterns (including the Observer pattern, Facade pattern, etc.)
  * Communication aspect with designers on requirements of application
  * Stubbing a <a href="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Fireplan/Util/Sensor.swift">programatic sensor</a> to send mock data to the application (to be replaced with real IoT sensors for actual product). Stubbed sensor will pick up **temperature (in units of °C)**, **current in ionized air (in units of 10^-10 amperes)** as well as **concentration of carbon monoxide (in units of ppm)**.
  


## Detailed Solution
* <a href="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/DESCRIPTION.md">Fireplan Detailed Solution</a>

## Timeline
<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/timeline.jpg" align="center" height="500"></a>

## Getting Started

### Prerequisites
* You will require the latest version of Xcode (Version 11.5).

#### Installing
1. Clone the project into your local machine using the following command:
```
git clone https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM.git
```
2. Navigate to the project directory and install the required pods using the following command. The podfile will be provided in the repository. The pod that we are adding to the project is <a href="https://github.com/cloudant/swift-cloudant">*SwiftCloudant*</a>.
```
pod install
```
3. Open up the file `.xcworkspace` file (`Fireplan.xcworkspace`).

4. Create a file named `Keys.swift` in the project `TeamLions-Fireplan_SCDFXIBM/Fireplan` and replace `username` and `password` fields with your IBM Cloudant judge credentials.

```swift
//
//  Keys.swift
//  Fireplan
//
struct Keys {
    static let username = "username"
    static let password = "password"
}
```

5. To run the app, ensure that the target is set to `Fireplan` and the target device set to a device of your choice (an iPhone or a simulator attached). **Fireplan** is optimally designed for **iPhone 8** (but can be extensible to include all iPhones/Android devices in the future).

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/target.png" align="center" height="100"></a>

6. Run the app! Click on the 'Run' button at the top left hand corner or execute the run command using ⌘-R (when editing the code).

## Tests

### Automated Testing
* We use **XCTest** module that is built-in in Xcode to run our automated tests for our app.

  * <a href="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/tree/master/Fireplan/FireplanTests">Automated Tests for Fireplan</a>

* To run the tests in Xcode, navigate to the Test navigator and run from there.

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/tests.png" align="center" height="300"></a>

### Exploratory Testing
To make the app more testable, we have added the following features (that can be disabled/modifed):
* Every 10s, the sensor will send a reading to the application.
  * If no rooms are on fire and the sensor's data is interpreted to suspect a fire, the room which contains the sensor will trigger a fire alert. ***In the actual production app, alarms will be triggered independently across rooms***.
  * If there is already an existing room on fire, sensor's data for all other rooms will be ignored (So that there is no sudden influx of fire alerts from other rooms. ***In the actual production app, alarms will be triggered independently across rooms***.
  * In order to "reset" the fire alarm, the user can toggle to the settings page (at the top right icon) and toggle back to the floorplan again. This is intentionally designed to allow us to reset fire alarms, as we did not want to add a "reset" button, which will not be practical for the actual app (room state should solely be based on the sensor's data as the single source of truth). ***In the actual production app, toggling to the settings page and back to the floorplan will not reset the fire alarms. Again, the room state should solely be based on the sensor's data as the single source of truth***.
  
## IBM Cloud Resource
We used **IBM Cloudant** as our noSQL database to store fire-fighting tips and information regarding the different types of household fires.

* <a href="https://cloud.ibm.com/catalog/services/cloudant">IBM Cloudant</a> - The NoSQL Database used

