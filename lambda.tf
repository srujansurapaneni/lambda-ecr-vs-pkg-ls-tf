data "archive_file" "lambda_zip" {
  type = "zip"
  source_dir = "path-to-your-lambda-code-directory"
  output_path = "path-to-your-lambda-code-directory/pkg.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts.AssumeRole",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
EOF
}

resource "aws_lambda_function" "lambda-container" {
  function_name = "lambda-container"
  filename     = "${data.archive_file.lambda_zip.output_path}"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.lambdaHandler"
  runtime       = "nodejs12.x"
  timeout       = 60
}
