 # /bin/bash

yarn build
aws s3 cp /Users/kimsurin/Desktop/vue_study/vue_stagram/vuestagram/dist/ s3://vuestagram --recursive --grant read=uri=http://acs.amazonaws.com/groups/global/AllUsers --profile surin
