Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31111A2D1C
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 02:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDIAxN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 20:53:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgDIAxM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Apr 2020 20:53:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48yN1001c6z9sSM;
        Thu,  9 Apr 2020 10:53:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586393588;
        bh=td7zWu9A57uAgcqYbDR6JomCVw9j8UCPCqXefO2plMs=;
        h=Date:From:To:Cc:Subject:From;
        b=LlhdspLReeSZHU+WjfdBmw7zGknz6otlRlLllp8Pt6ZTmMhHJs7XAvOZmNjftQqLM
         IUCQpeS8tK73MVDXbLHHWhk6gt4pV25wlNLjLcSSqVWlxXEq1wqs+ygYaZZivFbzqg
         RulaOYmzWfbFI+DneIMrjvjOK1ijdzBOqDAGEMjdzNqFfOAFhXuoocNsxaVvJLZE06
         to2GEsdoJA+5RluMyxmgcDPJQsI0xXiOa7aGDTsJvbsZ2d65MIWPYgV6YvoC3dyz/p
         PuERZQlETa2L1qFjN9R8hLZjwkNh1qfcB5t4afIl9ipGfMfeA9j8z4ztf8rYiFVF6V
         RVdCic2E8QhcA==
Date:   Thu, 9 Apr 2020 10:52:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Marshall <hubcap@omnibond.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: linux-next: manual merge of the orangefs tree with Linus' tree
Message-ID: <20200409105253.1c86f4c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rvXmnNHMk.PswxU_vgXx3tz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rvXmnNHMk.PswxU_vgXx3tz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the orangefs tree got a conflict in:

  Documentation/filesystems/orangefs.rst

between commit:

  18ccb2233fc5 ("docs: filesystems: convert orangefs.txt to ReST")

from Linus' tree and commit:

  aa317d3351de ("orangefs: clarify build steps for test server in orangefs.=
txt")

from the orangefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/orangefs.rst
index 7d6d4cad73c4,5a3865702a71..000000000000
--- a/Documentation/filesystems/orangefs.rst
+++ b/Documentation/filesystems/orangefs.rst
@@@ -41,17 -38,7 +41,7 @@@ Documentatio
 =20
  http://www.orangefs.org/documentation/
 =20
-=20
- Userspace Filesystem Source
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-=20
- http://www.orangefs.org/download
-=20
- Orangefs versions prior to 2.9.3 would not be compatible with the
- upstream version of the kernel client.
-=20
-=20
 -RUNNING ORANGEFS ON A SINGLE SERVER
 +Running ORANGEFS On a Single Server
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  OrangeFS is usually run in large installations with multiple servers and
@@@ -73,29 -60,37 +63,37 @@@ single line.  Uncomment it and change t
  controls clients which use libpvfs2.  This does not control the
  pvfs2-client-core.
 =20
 -Create the filesystem.
 +Create the filesystem::
 =20
 -pvfs2-server -f /etc/orangefs/orangefs.conf
 +    pvfs2-server -f /etc/orangefs/orangefs.conf
 =20
 -Start the server.
 +Start the server::
 =20
 -systemctl start orangefs-server
 +    systemctl start orangefs-server
 =20
 -Test the server.
 +Test the server::
 =20
 -pvfs2-ping -m /pvfsmnt
 +    pvfs2-ping -m /pvfsmnt
 =20
  Start the client.  The module must be compiled in or loaded before this
 -point.
 +point::
 =20
 -systemctl start orangefs-client
 +    systemctl start orangefs-client
 =20
 -Mount the filesystem.
 +Mount the filesystem::
 =20
 -mount -t pvfs2 tcp://localhost:3334/orangefs /pvfsmnt
 +    mount -t pvfs2 tcp://localhost:3334/orangefs /pvfsmnt
 =20
 -USERSPACE FILESYSTEM SOURCE
++Userspace Filesystem Source
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=20
+ http://www.orangefs.org/download
+=20
+ Orangefs versions prior to 2.9.3 would not be compatible with the
+ upstream version of the kernel client.
+=20
 =20
 -BUILDING ORANGEFS ON A SINGLE SERVER
 +Building ORANGEFS on a Single Server
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  Where OrangeFS cannot be installed from distribution packages, it may be
@@@ -105,51 -100,55 +103,57 @@@ You can omit --prefix if you don't car
  in /usr/local.  As of version 2.9.6, OrangeFS uses Berkeley DB by
  default, we will probably be changing the default to LMDB soon.
 =20
 -./configure --prefix=3D/opt/ofs --with-db-backend=3Dlmdb --disable-usrint
 +::
 =20
-     ./configure --prefix=3D/opt/ofs --with-db-backend=3Dlmdb
 -make
++    ./configure --prefix=3D/opt/ofs --with-db-backend=3Dlmdb --disable-us=
rint
 =20
 -make install
 +    make
 +
 +    make install
 =20
- Create an orangefs config file::
+ Create an orangefs config file by running pvfs2-genconfig and
+ specifying a target config file. Pvfs2-genconfig will prompt you
+ through. Generally it works fine to take the defaults, but you
+ should use your server's hostname, rather than "localhost" when
 -it comes to that question.
++it comes to that question::
 =20
 -/opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
 +    /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
 =20
 -Create an /etc/pvfs2tab file.
 +Create an /etc/pvfs2tab file::
 =20
 -Localhost is fine for your pvfs2tab file:
++    Localhost is fine for your pvfs2tab file.
+=20
 -echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0 > \
 -    /etc/pvfs2tab
 +    echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0=
 > \
 +	/etc/pvfs2tab
 =20
 -Create the mount point you specified in the tab file if needed.
 +Create the mount point you specified in the tab file if needed::
 =20
 -mkdir /pvfsmnt
 +    mkdir /pvfsmnt
 =20
 -Bootstrap the server.
 +Bootstrap the server::
 =20
 -/opt/ofs/sbin/pvfs2-server -f /etc/pvfs2.conf
 +    /opt/ofs/sbin/pvfs2-server -f /etc/pvfs2.conf
 =20
 -Start the server.
 +Start the server::
 =20
-     /opt/osf/sbin/pvfs2-server /etc/pvfs2.conf
 -/opt/ofs/sbin/pvfs2-server /etc/pvfs2.conf
++    /opt/ofs/sbin/pvfs2-server /etc/pvfs2.conf
 =20
  Now the server should be running. Pvfs2-ls is a simple
 -test to verify that the server is running.
 +test to verify that the server is running::
 =20
 -/opt/ofs/bin/pvfs2-ls /pvfsmnt
 +    /opt/ofs/bin/pvfs2-ls /pvfsmnt
 =20
  If stuff seems to be working, load the kernel module and
 -turn on the client core.
 +turn on the client core::
 =20
-     /opt/ofs/sbin/pvfs2-client -p /opt/osf/sbin/pvfs2-client-core
 -/opt/ofs/sbin/pvfs2-client -p /opt/ofs/sbin/pvfs2-client-core
++    /opt/ofs/sbin/pvfs2-client -p /opt/ofs/sbin/pvfs2-client-core
 =20
 -Mount your filesystem.
 +Mount your filesystem::
 =20
-     mount -t pvfs2 tcp://localhost:3334/orangefs /pvfsmnt
 -mount -t pvfs2 tcp://`hostname`:3334/orangefs /pvfsmnt
++    mount -t pvfs2 tcp://`hostname`:3334/orangefs /pvfsmnt
 =20
 =20
 -RUNNING XFSTESTS
 +Running xfstests
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  It is useful to use a scratch filesystem with xfstests.  This can be

--Sig_/rvXmnNHMk.PswxU_vgXx3tz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6OceUACgkQAVBC80lX
0Gxiiwf5Ae8IcNtjg9NKnY8RUpeRxrTek5Km442Qw7uZAT0+AoeDH8MMHubriDPF
fuH9ElZloftvPWytaai7Z77faMqfgaGJ+ZQu9EBfwDQpc1aRLqZV0rHx1r3JVI1D
JpQf8NRE9ft0bvY7wTgDcKcqt8FC/+WSezLfzJmElbntx2l7c3vMoyGOJz0dEUO2
YmbR7zHWRrwR9qsJ8NXOP8/hQ0IXlMGOVpxjPddgfl3uKuHn/QeNgOyk5nqmZLBV
1nCFtM9v25JxdvH7PJi+KHSnaLKlhVsK1LiwgSMlMy5kEn9cSk871Xc5sgLo/h28
Bu1X+tByKeRdVdHkijXOzLJm+YDZAg==
=8h3o
-----END PGP SIGNATURE-----

--Sig_/rvXmnNHMk.PswxU_vgXx3tz--
