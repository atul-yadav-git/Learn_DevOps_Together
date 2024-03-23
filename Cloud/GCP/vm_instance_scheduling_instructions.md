# Instance Schedules for Automated VM Deployment

-  Instance schedules automate the deployment of VM instances by starting and stopping them based on predefined schedules. 
-  This automation helps in optimizing costs and efficiently managing VM instances.

## Granting IAM Roles for Instance Schedules

To use instance schedules effectively, you need to grant the required Identity and Access Management (IAM) roles to specific principals:

-  Compute Engine Service Agent
-  Grant the necessary IAM roles to the Compute Engine Service Agent for your project.

## Ways to Grant Permissions

You can grant permissions to the service account via the Google Cloud Console. Follow these steps:
```css
1. Go to the IAM & Admin section of the console.
2. Select "IAM" from the left panel.
3. Enable "Include Google-provided role grants" on the right.
4. Find the service account `service-<account-number>@compute-system.iam.gserviceaccount.com`.
5. Edit the service account and add one of the following roles:
   - Roles/Compute.InstanceAdmin
   - Roles/Compute.InstanceAdmin.v1
   - roles/compute.admin
6. Save the changes.
```
### Role Assignment and Permissions

Once you assign the "Compute Admin" role to the service account, it will have all the necessary permissions to manage Compute Engine resources, including starting and stopping instances.

## Additional Resources

For more information and detailed documentation on VM instance scheduling, refer to the [official GCP page for VM instance scheduling](https://cloud.google.com/compute/docs/instances/schedule-instance-start-stop).

