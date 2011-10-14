@REM
@REM Copyright (C) 2011 eXo Platform SAS.
@REM
@REM This is free software; you can redistribute it and/or modify it
@REM under the terms of the GNU Lesser General Public License as
@REM published by the Free Software Foundation; either version 2.1 of
@REM the License, or (at your option) any later version.
@REM
@REM This software is distributed in the hope that it will be useful,
@REM but WITHOUT ANY WARRANTY; without even the implied warranty of
@REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
@REM Lesser General Public License for more details.
@REM
@REM You should have received a copy of the GNU Lesser General Public
@REM License along with this software; if not, write to the Free
@REM Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
@REM 02110-1301 USA, or see the FSF site: http://www.fsf.org.
@REM

@REM production script to set environment variables for eXo Platform

set LOG_OPTS=-Dorg.apache.commons.logging.Log=org.apache.commons.logging.impl.SimpleLog
set SECURITY_OPTS=-Djava.security.auth.login.config=..\conf\jaas.conf

set EXO_OPTS=-Dexo.product.developing=false -Dexo.conf.dir.name=gatein/conf
set IDE_OPTS=-Djavasrc=$JAVA_HOME/src.zip -Djre.lib=$JAVA_HOME/jre/lib

set EXO_CLOUD_OPTS=-javaagent:..\lib\cloud-instrument-1.1-M2.jar=..\gatein\conf\cloud\agent-configuration.xml
set EXO_CLOUD_SECURITY_OPTS=-Djava.security.manager=org.exoplatform.cloudmanagement.security.TenantSecurityManager -Djava.security.policy==..\conf\catalina.policy

@REM set Cloud Admin properties in command line (can be used in standalone admin server)
set EXO_CLOUD_ADMIN_OPTS=-Dcloud.admin.log.dir=../logs/cloud-admin -Dcloud.admin.data.dir=../gatein/data -Dcloud.admin.configuration.dir=../gatein/conf/cloud/cloud-admin -Dcloud.admin.configuration.file=../gatein/conf/cloud/cloud-admin/admin.properties

set JMX_OPTS=-Dcom.sun.management.jmxremote.password.file=${CATALINA_HOME}/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=${CATALINA_HOME}/conf/jmxremote.access -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.ssl=false

@REM Remote debug configuration
@REM set REMOTE_DEBUG=-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n

set JAVA_OPTS=%JAVA_OPTS% %LOG_OPTS %SECURITY_OPTS% %EXO_OPTS% %IDE_OPTS% %EXO_CLOUD_OPTS% %EXO_CLOUD_SECURITY_OPTS% %EXO_CLOUD_ADMIN_OPTS% %JMX_OPTS% %REMOTE_DEBUG%

set CLASSPATH=%CATALINA_HOME%\lib\cloud-security-1.1-M2.jar;%CATALINA_HOME%\conf\;%CATALINA_HOME%\lib\jul-to-slf4j-1.5.8.jar;%CATALINA_HOME%\lib\slf4j-api-1.5.8.jar;%CATALINA_HOME%\lib\cloud-logback-logging-1.1-M2.jar;%CATALINA_HOME%\lib\logback-classic-0.9.20.jar;%CATALINA_HOME%\lib\logback-core-0.9.20.jar;
