#create aws_spot_instance

aws ec2 run-instances \
 -- image-id ami-0bb6af715826253bf \
 -- instance_type t3.micro \
 -- instance_market_options "MarketType=spot,SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop"\
 -- security-group-ids sg-082847664aa6e15ac \
 -- subnet_id subnet-05d1c4859acdbc018 \
