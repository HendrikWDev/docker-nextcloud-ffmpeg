FROM nextcloud:28.0.3
RUN apt-get update && apt-get install -y smbclient ffmpeg
RUN apt-get upgrade -y
