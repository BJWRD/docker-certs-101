# docker-certs-101
This example includes the generation of a Self-Signed Certifcate and Docker configuration, to ensure the Certificate is included within the Container running Nginx.

  openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ssl.crt -keyout ssl.key

Here's a breakdown of the flags used within this command:

* `-newkey rsa:4096` - Creates a new certificate request and 4096 bit RSA key. The default one is 2048 bits.
* `-x509` - Creates a X.509 Certificate.
* `-sha256` - Use 265-bit SHA (Secure Hash Algorithm).
* `-days 3650` - The number of days to certify the certificate for. 3650 is ten years. You can use any positive integer.
* `-nodes` - Creates a key without a passphrase.
* `-out example.crt` - Specifies the filename to write the newly created certificate to. You can specify any file name.
* `-keyout example.key` - Specifies the filename to write the newly created private key to. You can specify any file name.

<img width="851" alt="image" src="https://user-images.githubusercontent.com/83971386/205982474-5d05e3ad-2801-46e0-b8d0-da618b03be7c.png">

Here's a breakdown of the flags used within this command:

* `-newkey rsa:4096` - Creates a new certificate request and 4096 bit RSA key. The default one is 2048 bits.
* `-x509` - Creates a X.509 Certificate.
* `-sha256` - Use 265-bit SHA (Secure Hash Algorithm).
* `-days 3650` - The number of days to certify the certificate for. 3650 is ten years. You can use any positive integer.
* `-nodes` - Creates a key without a passphrase.
* `-out example.crt` - Specifies the filename to write the newly created certificate to. You can specify any file name.
* `-keyout example.key` - Specifies the filename to write the newly created private key to. You can specify any file name.

For verification that the *.key* and the *.crt* files have been generated enter the following -

  ls

<img width="326" alt="image" src="https://user-images.githubusercontent.com/83971386/205982611-ac0f0090-0a86-4e39-97bc-a61effcf31b0.png">
