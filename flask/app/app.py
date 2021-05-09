from flask import Flask
import docker

def connect_docker_tcp():
    cli = docker.DockerClient(base_url='tcp://10.100.102.201:2375')
    running_containers_names = 'running containers names : '
    containers = cli.containers.list()
    for container in containers:
        container_id = str(container).split(':')[1][1:-1]
        container = cli.containers.get(container_id)
        container_name = container.attrs['Config']['Image']
        running_containers_names += container_name

    if running_containers_names[-1] == ',':
        running_containers_names = running_containers_names[:-1]
    return running_containers_names


app = Flask(__name__)

@app.route('/',methods=['GET',])
def hello():
    output = connect_docker_tcp()
    return "{}".format(output)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)

