This is a custom drug selling script designed for QBCore servers. It allows players to engage in a drug trade system where they can sell drugs for in-game money. This script provides basic functionality for purchasing and selling drugs at specified locations with relevant checks.

Features
Players can buy drugs from a designated NPC.
Sell drugs at specific locations within the game world.
Basic drug-selling mechanics with a variety of drugs (can be customized).
Fully integrated with QBCore framework.
Installation
Download/Clone the Repository: Download or clone the repository into your QBCore server directory.

bash
Copy code
git clone https://github.com/RoninDevelopment/Drug-Selling.git
Add to Server Resources: Move the script folder into your server's resources directory.

bash
Copy code
cp -r Drug-Selling/ /path/to/your/qbcore/server/resources/
Start the Resource: Add the following line to your server.cfg file to start the script:

bash
Copy code
start Drug-Selling
Customization:

You can customize the drugs, selling locations, and NPC by editing the provided configuration files.
Modify the script as needed to fit your server's economy or gameplay style.
Configuration
The script is highly configurable, and you can change:

The types of drugs available for sale.
The prices of the drugs.
The selling locations where players can sell their items.
NPC locations for purchasing drugs.
These settings can be easily adjusted in the configuration file found within the script folder.

Requirements
QBCore Framework: This script requires a QBCore-based server to function correctly.
Basic knowledge of Lua scripting: Modify or expand the script to add more drugs or features.
License
This script is available for free use and modification. Feel free to fork, modify, and redistribute it, but please credit the original work if you share or use it in your own public projects.

Credits
Script by RoninDevelopment.
Uses the QBCore framework.
