# SteamCMD in Docker optimized for Unraid
This Docker will download and install SteamCMD. It will also install PixARK and run it. Update Notice: Simply restart the container if a newer version of the game is available.

## Env params
| Name | Value | Example |
| --- | --- | --- |
| STEAMCMD_DIR | Folder for SteamCMD | /serverdata/steamcmd |
| SERVER_DIR | Folder for gamefile | /serverdata/serverfiles |
| GAME_ID | SteamID for server | 824360 |
| SERVER_NAME | Session name | PixARK |
| MAX_PLAYERS | Maximum players | 20 |
| SERVER_PASSWORD | Server password (for private servers) | |
| SERVER_ADMIN_PASSWORD | Server admin password | |
| GAME_PARAMS | Values to start the server | -NoBattlEye -CubePort=15000 -cubeworld=world -nosteamclient -NoHangDetection -game |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |

***ATTENTION: You have to disable Steam Guard for games that require authentication, Steam recommends to create a seperate account for dedicated servers***

>**NOTE** GAME_ID values can be found [here](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List)

> And for GAME_NAME there is no list, so a quick search should give you the result

## Run example
```
docker run --name PixARK -d \
	-p 27015:27015 -p 27015:27015/udp -p 27016:27016 -p 27016:27016/udp -p 27017:27017 -p 27017:27017/udp \
	--env 'GAME_ID=824360' \
	--env 'SERVER_NAME=PixARK' \
	--env 'MAX_PLAYERS=20' \
	--env 'SERVER_PASSWORD=0nlyFr13nds' \
	--env 'SERVER_ADMIN_PASSWORD=4ur3y3s0nly' \
	--env 'GAME_PARAMS=-NoBattlEye -CubePort=15000 -cubeworld=world -nosteamclient -NoHangDetection -game' \
	--env 'UID=99' \
	--env 'GID=100' \
	--volume /mnt/user/appdata/steamcmd:/serverdata/steamcmd \
	--volume /mnt/cache/appdata/pixark:/serverdata/serverfiles \
	unraider/steamcmd:pixark
```

This Docker was mainly edited for better use with Unraid, if you don't use Unraid you should definitely try it!


This Docker is forked from ich777, thank you for this wonderful Docker.
