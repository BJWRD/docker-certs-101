# docker-certs-101
This example includes the generation of a Self-Signed Certifcate and Docker Container configuration, to ensure the Certificate is included within the Container running Nginx.

## Prerequisites
* Docker Installation - [steps](https://docs.docker.com/engine/install/)
* Docker-Compose Setup - [steps](https://docs.docker.com/compose/)
* Virtualbox Installation - [steps](https://www.virtualbox.org/wiki/Downloads) 
* OpenSSL Installation - [steps](https://www.openssl.org)

## Self-Signed SSL Certificate Generation

To create a new Self-Signed SSL Certificate, enter the following command -

    openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ssl.crt -keyout ssl.key

Here's a breakdown of the flags used within this command:

* `-newkey rsa:4096` - Creates a new certificate request and 4096 bit RSA key. The default one is 2048 bits.
* `-x509` - Creates a X.509 Certificate.
* `-sha256` - Use 265-bit SHA (Secure Hash Algorithm).
* `-days 3650` - The number of days to certify the certificate for. 3650 is ten years. You can use any positive integer.
* `-nodes` - Creates a key without a passphrase.
* `-out example.crt` - Specifies the filename to write the newly created certificate to. You can specify any file name.
* `-keyout example.key` - Specifies the filename to write the newly created private key to. You can specify any file name.

The command will generate the private key and ask you a series of questions -

<img width="851" alt="image" src="https://user-images.githubusercontent.com/83971386/205982474-5d05e3ad-2801-46e0-b8d0-da618b03be7c.png">

Once completed, the certificate and private key will be created at the specified location.

For verification that the *.key* and the *.crt* files have been generated enter the following command -

    ls

<img width="326" alt="image" src="https://user-images.githubusercontent.com/83971386/205982611-ac0f0090-0a86-4e39-97bc-a61effcf31b0.png">


## Docker Nginx Container Startup
### 1. Clone the Git Repository
      sudo yum install git -y 
      cd /home
      git clone https://github.com/BJWRD/docker-certs-101
      cd docker-certs-101

### 2. Moving SSL Certs
You will need to move the .crt and .key files (created during the SSL Certificate generation steps) to the *nginx* directory

     mv ssl.crt ssl.key /home/docker-certs-101/nginx/
     
List for confirmation of the file placement -

     ls -l
     
<img width="290" alt="image" src="https://user-images.githubusercontent.com/83971386/206212973-bcbe79b6-6025-4b84-af2b-4b3c6e3d3d2c.png">
     
### 3. Starting the Container
Enter the following Docker-Compose command to start the Nginx container in detatched mode.

     docker-compose up -d
     docker ps
     
<img width="538" alt="image" src="https://user-images.githubusercontent.com/83971386/206224236-e8ace450-bd56-4dc7-b3f2-a4f3a103df2f.png">

### 4. Site Verification
Now that the Nginx Docker Container is running, we can test whether the site is accessible via the browser -

     https://<VM IP Address>:443
     
OR via the terminal -
    
     curl https://<VM IP Address>:443 --insecure

**NOTE:** As the Certificate is Self-Signed you will receive an error warning you that the site is insecure. This can be accepted via the Browser and you should then be able to proceed to the site

<img width="443" alt="image" src="https://user-images.githubusercontent.com/83971386/206242639-8a503a24-282f-48b6-8c78-f71debb50d3c.png">

<img width="505" alt="image" src="https://user-images.githubusercontent.com/83971386/206243009-64b0a6d1-0369-467a-ae73-3d37fb9638b5.png">

Getting your browser to trust your self signed certificate varies depending on OS/Browser, so please Google for confirmation on this if you're experiencing difficulty.

## List of tools/services used
* [Docker](https://www.docker.com/)
* [Dockerfile](https://docs.docker.com/engine/reference/builder/)
* [Docker-Compose](https://docs.docker.com/compose/)
* [Virtualbox](https://www.virtualbox.org) 
* [OpenSSL](https://www.openssl.org)

## Useful Links -
* https://linuxize.com/post/creating-a-self-signed-ssl-certificate/
