# youcanbenefit.deploy
The deployment files for YouCanBenefit. https://github.com/yeg-relief/youcanbenefit

## Helm Chart
 To deploy this Helm chart, first ensure the K8s cluster you want to deploy to has Tiller running in it. Next clone this repository to your local system. From the root, run:
 
 ``` bash
 helm install ./youcanbenefit-chart --set frontend.service.type=LoadBalancer
 ```
 
This will create an instance of YouCanBenefit that is exposed by the load balancer.

Look in `./youcanbenefit-chart/values.yaml` for values you can override.
