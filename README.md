# Using Terraform to Create a Static Website and Hosting it on Google Cloud Storage Bucket

This Terraform configuration allows you to set up a Google Cloud Storage bucket to host a website. It also includes configurations for setting up DNS records and a global forwarding rule for serving the website over HTTP.

## Prerequisites

Before you begin, make sure you have the following:

1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. Google Cloud Platform (GCP) account and project set up.

## Configuration

The provided Terraform script (`main.tf`) creates the following resources:

- A Google Cloud Storage bucket (`google_storage_bucket.website`) for hosting your website's static files.
- An HTML file (`index.html`) is uploaded to the bucket.
- A public access control rule allows all users to read objects from the bucket.
- A global external IP address (`google_compute_global_address.website_ip`) for your website.
- A DNS managed zone (`google_dns_managed_zone.dns_zone`) for managing DNS records.
- A DNS A record (`google_dns_record_set.website`) linking your website's domain to the global IP address.
- A backend bucket (`google_compute_backend_bucket.website-backend`) to be used as a Content Delivery Network (CDN) backend.
- A URL map (`google_compute_url_map.website`) and HTTP proxy (`google_compute_target_http_proxy.website`) for routing incoming HTTP requests to your website's backend bucket.
- A global forwarding rule (`google_compute_global_forwarding_rule.default`) to forward incoming traffic to the HTTP proxy.

## Usage

Follow these steps to set up your website using this Terraform configuration:

1. Clone this repository to your local machine:

   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. Create a `terraform.tfvars` file to define your variables. Example:

   ```hcl
   project_id = "your-project-id"
   domain_name = "your-website-domain.com"
   ```

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Review and apply the Terraform configuration:

   ```bash
   terraform apply
   ```

   Confirm the changes when prompted.

5. Once the Terraform script completes successfully, you will receive the output values including the website URL.

6. Access your website via the URL provided in the Terraform output.

## Cleanup

To destroy the resources created by this Terraform configuration, run:

```bash
terraform destroy
```

Confirm the destruction when prompted.

## Additional Information

- For more information on Google Cloud Storage buckets, refer to the [Google Cloud Storage documentation](https://cloud.google.com/storage/docs).
- For information on serving static websites from Google Cloud Storage, check the [official guide](https://cloud.google.com/storage/docs/hosting-static-website).
- Customize the Terraform script and variables to match your specific requirements.

---

This README provides an overview of how to use the Terraform configuration to set up a website on Google Cloud Storage. Make sure to replace the placeholders (`<repository_url>`, `<repository_directory>`, `your-project-id`, `your-website-domain.com`) with your actual values.