# Hosting Static Websites on S3

If you want to host a static website on an S3 bucket, follow this typical flow:

---
![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/018104c2-3f3a-42aa-a778-b51d9fed9420)
---

1. **Local Development:**
   - Create HTML and CSS using a code editor.

2. **Testing and Preview:**
   - Use a local web server to test.

3. **Version Control (Optional):**
   - Use version control for better SCM and tracking.

4. **Upload to S3 Bucket:**
   - Create an S3 bucket using AWS CLI.
   - Tags can be added.
   - The bucket can be used for website hosting.

5. **Deployment Automation (Optional):**
   - Utilize CI/CD tools for direct deployment to the S3 bucket.

6. **Public Access:**
   - Ensure S3 bucket objects have public access enabled.


