LINUX INSTRUCTIONS
Prerequisites:
Node
Node Package Manager
Python

1. Download the project files to a directory of your choosing
2. Install dependancies: In the terminal, run "npm install" to install the project dependancies. 
3. Type "nodemon" to start the server. Nodemon should be running on port 3000.
4. To host the HTML files, we're using Python's HTTP server feature. To start the HTTP server, open the project directory in the Terminal. Enter in: "python -m SimpleHTTPServer 8000". In this example, we're using port 8000, but you may choose any free port. 
5. To view the webpage, navigate to http://localhost:8000/. Note: if you choose a different port, modify the URL to point to that port. 
6. Open the SQL data dump, Dump20181128.sql, in MySQLWorkbench. You will need to configure the SQL server with a username, password, name and host. Once you have these details configured, open app.js, and modify the mysql.createConnection({}) object to match these details. This function is located at the top of the document. Save the JS file, and nodemon will reload.
7. Finally, you need to disable Cross-Origin Restrictions in your browser. In Google Chrome, you can use the following extension linked below. In the extensions UI, be sure to toggle "Enable cross-origin resource sharing" off and back on to ensure that the extension is operational. After you are complete testing the project, be sure to disable cross-origin resource sharing again, and uninstall the extension. 
7. The project should now be fully operational at http://localhost:8000/

Our API and its routing (using Express) exist in the app.js file
The individual HTML and CSS files are for the layout of the individual 
