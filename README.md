# Rebate-Mall-System

## Backend Technology Stack
The program is newly developed using THINKPHP6 and VUE, enhancing code execution efficiency while ensuring security. The admin interface utilizes the latest version of the LayUI frontend framework, offering a clear and intuitive layout that allows administrators to quickly understand and manage operations. Resources are loaded using RequireJs, significantly speeding up backend management loading times. Additionally, the backend is secured through RBAC authorization management, strengthening data security and effectively preventing malicious intrusions.

## Frontend Technology Stack
The user interface on the frontend is developed with Vue, providing faster and smoother responsiveness compared to traditional HTML pages, greatly enhancing user experience and making the interface feel more like a native APP. Frontend-backend separation technology not only speeds up page loading but also optimizes overall interface performance. Moreover, user authorization and data interactions employ a new solution for frontend-backend separation: Json Web Token (JWT). This involves signing the header and payload of data transmissions to ensure security during data exchanges and prevent data tampering.

Demo address to be accessed via mobile browser: Coming soon...

## Server Environment
	•	LINUX system CentOS 7+
	•	PHP 7.2+
	•	MYSQL 5.6+
	•	Nginx 1.6+

## Admin Panel URL
http://yourdomain.com/admin
	•	Account: admin
	•	Password: a123456

## Frontend URL
http://yourdomain.com
	•	Test Account: 13800138000
	•	Test Password: 123456

## Installation Process
	1.	Upload the website program files to the server and unzip, import the database file.
	2.	Configure the database: Open the file /config/database.php and modify the relevant settings (as shown in the image).
	3.	Add two cron jobs: automatic dividend settlement and automatic sales growth.
 
	•	Automatic Dividend Settlement (http://yourdomain.com/index/index/item_crontab) with a frequency of once per minute.
	•	Automatic Sales Growth (http://yourdomain.com/index/index/item_auto_sale) with a frequency of once per minute.

## Licensing
This project is licensed under the MIT open-source license. The complete licensing information is available in the [LICENSE](https://github.com/iwei000/Rebate-Mall-System/blob/main/LICENSE) file.
