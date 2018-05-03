# Kannada-Gottilla-App
A Chatting app for learning language<br />
• Android application which will help users to learn regional language through an interactive way.<br />
• Technologies used: Java, XML, PHP, JSON, MySQL.<br />

# Prerequisites: 
 
You will need to download a XAMPP Server, which can be downloaded from this link:
https://www.apachefriends.org/xampp-files/5.5.33/xampp-win32-5.5.33-0-VC11-installer.exe
 
1. Install XAMPP.
 
2. Download the attached zip folder, KG.rar and extract the files within it. 
 
3. Find the folder server, and within it a folder KannadaGothilla.
 
4. Copy the entire KannadaGothilla file inside xampp/htdocs. (Usually the xampp folder will be in the C drive. Path: c:/xampp/htdocs)
 
5. In the xampp folder, open xampp-control.exe, the xampp control pannel.
 
6. You will find various modules such as Apache, MySQL, FileZilla, etc. Under actions, Click on Start for only Apache and MySQL.
If you encounter any error messages, there might be a port problem. Please check this link for the solution: 
https://phpmysqllearners.wordpress.com/2014/01/27/changing-phpxampp-port-number-in-xampp/
7. Open a web browser and type the URL as localhost/phpmyadmin/
In case there was a port problem, the URL will now be localhost:NewPortNo/phpmyadmin/
For ex, if the new port number you entered in the notepad file was 8080, then localhost:8080/phpmyadmin/
 
8. Load the SQL file (kgfresh200316-2.sql - inside the server folder) into phpmyadmin, under import -> browse file -> go.  
 
9. Connect the laptop and the mobile(s) to the same wifi connection. 
 
10. Check the IP address of your computer by opening up the command prompt and typing the command, ipconfig.
 
11. Set the IP address in the app on your phone by clicking on the SET IP ADDRESS button in the login screen of the app. 
If you had changed the port number, then enter ipAddress:portNo. For Ex: 192.168.0.104:85
 
12. You can now enter the credentials of the app user on your phone. 
 
# For Admin Login:
 
Username: admin1@abc Password: admin
Username: admin2@abc.com Password: admin
Username: admin3@abc.com Password: admin
 
and so on... 
 
# For Mentor Login:
 
Username: mentor1@abc.com Password: mentor
Username: mentor2@abc.com Password: mentor
 
and so on...
 
# For User Login: 
 
Username: user1@abc.com Password: user
 
and so on... 

13. You can check the User Table in phpmyadmin to get the different login details.
