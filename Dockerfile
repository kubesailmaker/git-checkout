FROM alpine/git:latest
RUN apk update && apk add bash
RUN mkdir /opt/app
RUN addgroup -g 1000 -S app && adduser -u 1000 -G app -S app && \
    chown -R app:app /opt/app
USER app
COPY --chown=app:app git-checkout.sh /opt/app/git-checkout.sh
RUN chmod a+x /opt/app/git-checkout.sh
CMD ["/opt/app/git-checkout.sh"]


