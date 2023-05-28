# Golden container image - Python

## Overview

A golden image is an archetypal version of a container image that can be used as a template for various kinds of container images. Some refer to the golden image as a master image because multiple copies are used to provide a consistent process for using a disk image.

In terms of security, golden images are important because they can cause high spread of vulnerabilities since they are being used as a base image for many other containers in an organization.

Therefore, in case of a vulnerability in a golden image, there is a high chance that the amount of applications that get affected from it is high - causing alert fatigue (same alert across many apps / containers).

Dazz remediation engine is able to detect golden images, and de-duplicate all the alerts that were affected from a golden image, and help security teams to reduce time to remdiation by fixing the golden image.

In order to mimic that scenario in Dazz demo environment, we will create our own golden images, and we will use them in other repositories and applications.

## Known vulnerabilities

* The `python:3.11.0a7-buster` image contains many vulnerabilities (can be seen here: https://snyk.io/advisor/docker/python/3.11.0a7-buster)
* Specific Python packages with known vulnerabilities were added to requirements.txt

## Contributing

Every code push to the main branch triggers a new container image build (tags are created automatically).

In order to add a new vulnerability or change docker base image, simply change Dockerfile / requirements.txt and open a pull reuqest against the main branch.

In order to keep everything in place, We recommend going through a regular code review by one of the R&D / SE teams.