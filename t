  
kind: pipeline
type: docker
name: build
steps:
- name: build
  image: golang:alpine
  pull: if-not-exists # always never
  environment:
    KEY: VALUE
  commands:
    - echo $KEY
    - pwd
    - ls
    - CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
    - ./app
- name: docker
  commands:
    - ./app

trigger:
  branch:
  - master
