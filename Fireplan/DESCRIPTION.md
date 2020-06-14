# Detailed Solution (Fireplan)

## Content
1. [Description](#description)
1. [How it works](#how-it-works) 
1. [Technology used](#technology-used)

## Description
**Fireplan** is a **fire awareness and detection app** within households. On normal days, it is an **educational tool** which inform members of the household the potential fire hotspots in their house and the respective extinguishers that they might require.

It plays a pro-active role in **early fire detection and firefighting**. Using smart sensors, such as Heat, Smoke level and Air Quality sensor, **Fireplan** will be able to analyse the everyday data collected and raise an alert when there is abnormality. This offers early detection of potential fire. The app will advice household members on firefighting plans and evacuation notices when required.

Lastly, **Fireplan** is also a handy **resource management tool**. It informs SCDF in a timely manner and allows sharing of floor plan for operation planning and execution. 

## How it works
### Education

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/architecture1.jpg" align="center" height="300"></a>

**Fireplan** first takes in data from the household smart sensors, smart devices as well as household floor plans. It also takes note of the registered people within the premises.

Tapping into the database of fire related information such as type of fire, potential risk assessment of household zones, type of extinguisher to use, household floor plan information, **the software will be able to identify the potential of fire** based on the type of rooms, give an assessment on the risk of fire, and advice what fire extinguisher would be effective. This aid the household in planning for **fire fighting and fire evacuation**.


<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Screenshots/1ss.png" align="center" height="300"></a>

### Early detection of fire

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/architecture2.jpg" align="center" height="300"></a>

In the event of suspected fire, **Fireplan** will auto generate a fire alert warning to household members. They will receive information on the location of fire, the assessed size of fire and the action to be taken. 

* If the fire is assessed to be small, **Fireplan** will guide members on how to put out the fire by recommending the most effective extinguisher. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Screenshots/2ss.png" align="center" height="300"></a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This potentially helps to reduce the number of non emergency calls, as it provides early detection of fire that can be avoided or small fire that can be put out during the golden period.

* If it is assessed to be a huge fire, an evacuation message will be prompted immediately, concurrently, the nearest fire station will be notified. If household members happened to be trapped in the house, they can share their location to facilitate swift rescue by SCFD.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Screenshots/3ss.png" align="center" height="300"></a>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Screenshots/4ss.png" align="center" height="300"></a>

### Communication with SCDF

<a href="url"><img src="https://github.com/TeamLions76/TeamLions-Fireplan_SCDFXIBM/blob/master/Fireplan/Diagrams/architecture3.jpg" align="center" height="300"></a>

* The nearest fire station will receive the information of fire location, fire type, fire size and number of people within premises. With these first hand information, the fire station can plan and activate suitable manpower for firefighting.

* On site, it facilitates a seamless sharing of floor plan with Ground Commander. The Ground Commander can sync the floorpan which will display heat mapping, identifying the fire starting point and hotspot. The ground commander can then use this live information to give direction to the firefighting team for a targeted fire fighting, boundary cooling and evacuation of people still within the premises.

## Technology used

* **Fireplan** used **IBM Cloudant** as our NoSQL database to store fire-fighting tips and information regarding the different types of household fires.

* **Fireplan** need to be complement with a comprehensive suite of hardware smart sensors and devices. In future iterations, **Fireplan** will be tapping onto **IBM IoT Cloud Services** to facilitate responsive testing with smart sensors and devices.


