ansible systemd-cifs-mounts
===========================
[![Build Status](https://travis-ci.org/hurricanehrndz/ansible-systemd-mounts.svg?branch=master)](https://travis-ci.org/hurricanehrndz/ansible-systemd-mounts)

Setup mounts as sysemd Service.

This Playbook creates a Systemd Service for mounting fielsystems.

So you can use mounts as system Servie.

Works for debian stretch, and Jessie if you use systemd.

It mounts several Folders from one Server.

for Example:

    systemctl status mount-point.mount
    systemctl start mount-point.mount
    systemctl stop mount-point.mount

    systemctl status mount-point.automount
    systemctl start mount-point.automount
    systemctl stop mount-point.automount

Options:
--------

    src: //apps.local/app           # Server to mount From
    dest: /opt/app                  # Folder to mount in
    opts: uid=1000                  # Options, username...
    type: cifs

Example Playbook
----------------

    - hosts: all
      roles:
        - role: ansible-systemd-mounts
          systemd_mounts:
            - src: //apps.local/app/folder1
              dest: /opt/app/folder1
              type: cifs
              opts: uid=1100,gid=1100,cred=/etc/cifs-creds
            - src: //apps.local/app/folder2
              dest: /opt/app/folder2
              type: cifs
              opts: uid=1100,gid=1100,cred=/etc/cifs-creds
            - src: "/opt/app/folder*"
              dest: /opt/app/media
              description: "mergerfs of folder1 and folder2"
              requires: "opt-app-folder1.mount opt-app-folder2.mount"
              type: fuse.mergerfs
              opts: defaults,allow_other,direct_io,use_ino,minfreespace=50G,fsname=mergerfs
