# Terraform Infrastructure

Deploy the lab infrastructure on AWS using reusable network, security and compute modules.

## Architecture

- **Network:** VPC, public/private subnets, Internet Gateway, NAT Gateway and route tables.
- **Security:** Dedicated EC2 security groups and a default SG with no inbound or outbound rules.
- **Compute:** One public bastion and one private EC2 instance.

## Configuration

| Setting | Value |
| --- | --- |
| Region | `us-east-1` |
| Environment | `lab` |
| Resource prefix | `lab-tf` |
| AWS profile | `lab` |
| Root module | `terraform/environments/lab` |

## Requirements

- Terraform `>= 1.10, < 2.0`.
- AWS CLI with valid credentials and sufficient permissions.
- An EC2 key pair and a compatible AMI in `us-east-1`.

## Modules

| Module | Purpose |
| --- | --- |
| [network](modules/network/README.md) | Creates the VPC and routing infrastructure. |
| [security](modules/security/README.md) | Configures security groups. |
| [compute](modules/compute/README.md) | Creates the public and private EC2 instances. |

## Deployment

Run all commands from the repository root.

### 1. Configure AWS access

```bash
export AWS_PROFILE=lab
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1

aws sts get-caller-identity
```

### 2. Prepare deployment values

Copy the example once. If `terraform.tfvars` already exists, edit it instead of replacing it.

```bash
cp -i terraform/environments/lab/terraform.tfvars.example \
  terraform/environments/lab/terraform.tfvars

nano terraform/environments/lab/terraform.tfvars
```

Set the actual AMI ID, key pair, available AZ and administrator public IPv4 `/32`. Review the remaining values before continuing.

### 3. Initialize and validate

```bash
terraform fmt -recursive terraform
terraform -chdir=terraform/environments/lab init
terraform -chdir=terraform/environments/lab validate
```

### 4. Review and apply

```bash
terraform -chdir=terraform/environments/lab plan -out=lab.tfplan
```

Review the proposed changes, then apply the saved plan:

```bash
terraform -chdir=terraform/environments/lab apply lab.tfplan
```

Run commands one at a time and stop if any command fails.

## Verification

Inspect deployment outputs:

```bash
terraform -chdir=terraform/environments/lab output
```

Verify that:

- SSH to the bastion is allowed only from the administrator's configured IP.
- The private instance is reachable through the bastion using SSH ProxyJump.
- The private instance has no public IP.
- Outbound HTTPS from the private instance uses the NAT Gateway's Elastic IP.

See [verification instructions](tests/README.md) for detailed checks.

## State and Local Files

The baseline uses local Terraform state. Keep the state until the resources have been successfully destroyed.

Commit `.terraform.lock.hcl` and `terraform.tfvars.example`.

Do not commit AWS credentials, private keys, `.terraform/`, state files, saved plans or the actual `terraform.tfvars`.

## Cleanup

Review the resources scheduled for deletion:

```bash
terraform -chdir=terraform/environments/lab plan -destroy
```

Destroy the deployment:

```bash
terraform -chdir=terraform/environments/lab destroy
```

Check AWS for remaining instances, volumes, NAT Gateways and Elastic IPs that could incur charges.
