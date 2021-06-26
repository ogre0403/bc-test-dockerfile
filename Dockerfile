FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins@sha256:2e7f3c6063265f340bfd36097028f8960d50e21608a3f4c7bf140d83ae487a47 as jenkins

USER root
WORKDIR /usr/lib/jenkins/
RUN ls -lst jenkins.war
RUN rm -f jenkins.war
RUN wget --quiet https://updates.jenkins.io/download/war/2.249.3/jenkins.war
RUN ls -lst jenkins.war

VOLUME ["/var/lib/jenkins"]

USER 1001
ENTRYPOINT ["/usr/bin/go-init", "-main", "/usr/libexec/s2i/run"]

