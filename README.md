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
 
