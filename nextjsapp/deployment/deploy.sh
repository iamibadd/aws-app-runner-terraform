: '
Prerequisite:
1) Install AWS CLI.
2) Configure AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_REGION.
3) Workaround is to define those variables like:
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_REGION=""
'

# close the bash script if any command fails
set -e

# write terraform commands below

