
set CLASSPATH=.;%CLASSPATH%;
set CLASSPATH=%CLASSPATH%;javax.servlet.jar;
set CLASSPATH=%CLASSPATH%;org.apache.sling.commons.json-2.0.4-incubator.jar;
set CLASSPATH=%CLASSPATH%;..\..\..\..\lib\servlet-api.jar;
set CLASSPATH=%CLASSPATH%;..\..\..\..\lib\org.apache.sling.commons.json-2.0.2-incubator.jar;

javac -J-Xss2m BANK\*.java
pause


