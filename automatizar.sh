#!/bash
docker build -t buscanime-img .
docker run -d --name samplerunning buscanime-img