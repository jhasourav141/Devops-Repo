1.Create an IAM Policy and Role:

2.Create an IAM policy that grants the necessary permissions to access the AWS Secrets Manager secret. You can create this policy in the AWS Management Console or via the AWS CLI.

3.Create an IAM role and attach the IAM policy to it.

4.Create a Secret in AWS Secrets Manager:

Create a secret in AWS Secrets Manager containing your database credentials (e.g., username, password).
Configure the Kubernetes Service Account:

5.Create a Kubernetes Service Account manifest file (e.g., service-account.yaml) and include annotations to associate the IAM role with the Kubernetes service account:

apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-app-service-account
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::YOUR_ACCOUNT_ID:role/YourIAMRoleName
Apply the Service Account manifest to your cluster using kubectl apply -f service-account.yaml.

6.Create the Deployment Manifest:

Create a Kubernetes Deployment manifest file (e.g., deployment.yaml) for your application and specify the serviceAccountName to use:

yaml
Copy code
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-deployment
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: my-app
    spec:
      serviceAccountName: my-app-service-account
      containers:
        - name: app-container
          image: my-app-image
          env:
            - name: DB_USERNAME
              valueFrom:
                secretKeyRef:
                  name: my-db-secret-name
                  key: username
            - name: DB_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: my-db-secret-name
                  key: password
Replace my-db-secret-name with the actual name of your AWS Secrets Manager secret.

Apply the Deployment manifest to your cluster using kubectl apply -f deployment.yaml.

By following these steps, you're creating a Kubernetes Service Account associated with an IAM role that has permissions to access the Secrets Manager secret. Then, you're using environment variables in your Deployment manifest to inject the secret values into your application pods.

Please remember to replace placeholders like YOUR_ACCOUNT_ID, YourIAMRoleName, my-db-secret-name, my-app-image, and adjust other configurations according to your environment and requirements.





***
Kubernetes Service Account Namespace:
You should create/apply the Kubernetes Service Account in the same namespace where your applications will be deployed. This ensures that the pods running in that namespace are associated with the correct service account and, consequently, the appropriate IAM role.

IAM Permissions for Accessing AWS Secrets Manager:
To allow an IAM user to access AWS Secrets Manager, you need to grant them the necessary permissions. Below is a sample IAM policy that provides read access to Secrets Manager secrets:

json
Copy code
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue"
            ],
            "Resource": "arn:aws:secretsmanager:REGION:ACCOUNT_ID:secret:SECRET_NAME"
        }
    ]
}
Replace the placeholders:

REGION: The AWS region where your secret is stored.
ACCOUNT_ID: Your AWS account ID.
SECRET_NAME: The name of the secret you want to access.
You can attach this policy to an IAM user or an IAM group. Remember that granting overly broad permissions is not recommended for security reasons, so tailor the permissions to the specific secrets and actions the IAM user/group needs.