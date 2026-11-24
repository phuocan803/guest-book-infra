# CloudFormation Infrastructure

Deploy the lab infrastructure on AWS using a parent stack and three nested stacks.

## Structure

| Template | Purpose |
| --- | --- |
| stacks/lab.yaml | Connects the nested stacks and passes parameters and outputs. |
| templates/network.yaml | Creates the VPC, subnets, gateways and routing. |
| templates/security.yaml | Creates dedicated EC2 security groups. |
| templates/compute.yaml | Creates the public bastion and private EC2 instance. |

## Configuration

- Region: us-east-1
- Environment: lab
- Resource prefix: lab-cfn

Copy `parameters/lab.parameters.example.json` to `parameters/lab.parameters.json`
and fill in the actual deployment values. Do not commit the local parameter file.

## Deployment

1. Validate templates with cfn-lint.
2. Package the nested templates into a dedicated S3 bucket.
3. Create and review a change set.
4. Execute the change set and wait for completion.
5. Verify SSH access and private-instance Internet connectivity.

## Cleanup

Delete the parent stack and check for remaining billable resources.

Deployment and connectivity have not yet been verified.
