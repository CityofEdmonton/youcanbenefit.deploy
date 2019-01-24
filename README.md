# youcanbenefit.deploy
The deployment files for YouCanBenefit. https://github.com/yeg-relief/youcanbenefit

## Helm Chart
To deploy this Helm chart, first ensure the K8s cluster you want to deploy to has Tiller running in it. Next clone this repository to your local system. From the root, run:
 
 ``` bash
 helm install ./youcanbenefit-chart --set frontend.service.type=LoadBalancer
 ```
 
This will create an instance of YouCanBenefit that is exposed by the load balancer.

Look in `./youcanbenefit-chart/values.yaml` for values you can override.

### Specifying an admin user
YouCanBenefit should be deployed with an admin account. By default, the user is simply user and the password is password. This must be updated for use in a production scenario. To deploy YCB with a different username and account, run:

 ``` bash
 helm install ./youcanbenefit-chart --set frontend.service.type=LoadBalancer,admin.username=newUser,admin.password=newPassword
 ```
 
 Please ensure you change both the username and the password from that example.
 
### Terminating TLS Traffic
For this example, we're going to switch to using Helm's file overriding syntax rather than passing values on the command line. 

#### Self-signed Traffic
We're going to use a self-signed certifcate for foo.bar.com. Please use a proper cert in production.

``` bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=foobar.127.0.0.1.xip.io"
```

You should now have a temporary key and certificate. We will save this in a K8s Secret:

``` bash
kubectl create secret tls foo-secret --key /tmp/tls.key --cert /tmp/tls.crt
```

We're using [xip.io](http://xip.io/) to loopback to our machine. Now install like this:

``` bash
helm install -f ./youcanbenefit-chart/_example.yaml ./youcanbenefit-chart/
```
