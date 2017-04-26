FROM openjdk

ENV mc_version 1.11.2
ENV server_jar minecraft_server.${mc_version}.jar
ENV server_jar_list ${server_jar}

# ENV forge_version 1.10.2-12.18.2.2117
# ENV forge_installer_jar forge-${forge_version}-installer.jar
# ENV forge_server_jar forge-${forge_version}-universal.jar
# ENV server_jar_list ${mc_server_jar} ${forge_server_jar}

# Fetch installer
# ADD http://files.minecraftforge.net/maven/net/minecraftforge/forge/${forge_version}/${forge_installer_jar} /opt/minecraft/

# Fetch server jar
ADD https://s3.amazonaws.com/Minecraft.Download/versions/${mc_version}/minecraft_server.${mc_version}.jar /opt/minecraft/

# run the forge installer and cleanup afterwards
# RUN set -x && \
# 	cd /opt/minecraft && \
# 	java -jar ${forge_installer_jar} --installServer && \
# 	rm /opt/minecraft/${forge_installer_jar}

# Entrypoint script
ADD entrypoint.sh /

EXPOSE 25565

VOLUME ["/srv/minecraft"]

CMD ["--"]
ENTRYPOINT ["/entrypoint.sh"]
