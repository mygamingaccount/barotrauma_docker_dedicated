FROM cm2network/steamcmd:root

LABEL maintainer="decafbad@cocaine.ninja"

ENV STEAMAPPID 1026340
ENV STEAMAPPDIR /home/steam/bds

RUN apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests libsdl2-2.0-0 libicu-dev \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists

RUN mkdir -p $STEAMAPPDIR/Data "$STEAMAPPDIR/Daedalic Entertainment GmbH/Barotrauma/Multiplayer" \
	$STEAMAPPDIR/Submarines/Downloaded
RUN chown steam:steam -R $STEAMAPPDIR

ADD --chown=steam bannedplayers.txt     $STEAMAPPDIR/Data/
ADD --chown=steam clientpermissions.xml $STEAMAPPDIR/Data/
ADD --chown=steam serversettings.xml    $STEAMAPPDIR

USER steam
VOLUME $STEAMAPPDIR

ENTRYPOINT ${STEAMCMDDIR}/steamcmd.sh \
	+login anonymous +force_install_dir $STEAMAPPDIR +app_update $STEAMAPPID +quit \
	&& ${STEAMAPPDIR}/DedicatedServer

EXPOSE 27015/udp 27016/udp
