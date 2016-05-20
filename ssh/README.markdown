# SSH Client and Server Puppet Module

Manage SSH client and server via Puppet

## Client only
Collected host keys from servers will be written to known_hosts

```
    include ssh::client
```

## Server only
Host keys will be collected for client distribution.

In addition, there have been some MOC-specific changes to this module,
specifically:

* an authorized_keys file containing public keys for developers will be
  installed for the root user.
* Password authentication will be disabled in sshd_config.

Still on our TODO list is creating separate users for the developers,
and putting the keys there, then disabling root login.

NOTE: The module now only supports redhat derivatives. Getting it
working with debian-family distros won't be hard, but isn't an immediate
priority for us, since our servers are mostly RHEL/CentOS.


```
    include ssh::server
```

## Both client and server
Host keys will be collected and distributed

```
    include ssh
```

# Requirements
Requires Exported resources and augeas in order to work

