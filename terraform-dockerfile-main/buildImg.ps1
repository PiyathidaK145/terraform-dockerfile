# Define the image name and tag
$imageName = "my-docker-app"
$tag = "latest"

# Build the Docker image using the Dockerfile in the current directory
docker build -t "${imageName}:${tag}" .

# Output the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "Docker image '${imageName}:${tag}' built successfully."
} else {
    Write-Host "Failed to build Docker image '${imageName}:${tag}'."
}