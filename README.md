# Maha Kali
Great Kali Dockerfile. Play with this image while listening [Dissection - Maha Kali](https://www.youtube.com/watch?v=0_BLuTUXA_M)
## Useful Commands
```
docker build . -t mahakali
docker run -d -it -p 80:8080 --name=mh mahakali
docker exec -it mh bash
```
