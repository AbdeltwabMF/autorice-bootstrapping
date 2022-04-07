FROM archlinux:base-devel

RUN pacman -Syu --noconfirm git

WORKDIR /home/amf/autorice-bootstraping

COPY . .

CMD [ "./autorice.sh" ]
