rsync --exclude eureka/outputs --human-readable --stats --progress -az * rsync://localhost:8873/Eureka/
mkdir -p eureka/outputs
rsync --human-readable --stats --progress -az rsync://localhost:8873/Eureka/eureka/outputs eureka/