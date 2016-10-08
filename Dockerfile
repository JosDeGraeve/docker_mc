FROM openjdk

# Fetch installer
ADD http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.1.2095/forge-1.10.2-12.18.1.2095-installer.jar /opt/minecraft/

# run the forge installer and cleanup afterwards
RUN set -x && \
	cd /opt/minecraft && \
	java -jar forge-1.10.2-12.18.1.2095-installer.jar --installServer && \
	rm /opt/minecraft/forge-1.10.2-12.18.1.2095-installer.jar

# Entrypoint script
ADD entrypoint.sh /

EXPOSE 25565

VOLUME ["/srv/minecraft"]

CMD ["--"]
ENTRYPOINT ["/entrypoint.sh"]
