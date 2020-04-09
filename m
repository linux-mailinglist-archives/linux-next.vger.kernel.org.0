Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F37D1A2D28
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 03:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDIBD0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 21:03:26 -0400
Received: from ozlabs.org ([203.11.71.1]:48423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbgDIBDZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Apr 2020 21:03:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48yNDq1rnxz9sSM;
        Thu,  9 Apr 2020 11:03:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586394203;
        bh=FZpptNNsj2BTSupbP87BJKZWb2UD0XwPkOLhJMORMuQ=;
        h=Date:From:To:Cc:Subject:From;
        b=nvnY+UsJ+teefS3BjUG7hUF7mQUakrA9ZCgfAF4NYJ26LT9Mknn1zx2zKM6bSwgsD
         uHNy2CBVfIrpwXeWBo+PCdaaI/D8MaTIlmIRNVCFvH9IPw50U5kkq3UDgFNdt4qWBj
         wK+HauP9V2bbTXcCaUwswLgw376r2SkLFuQJ9eABISNdLnNr3Bg7JEX/XHcOlJgWkQ
         atvsYUIuhw8cp2Dqq7Cf8ff3CUekYQkIJj36sPowAzKxtwNwjV/rmR86Zwyb8rwEeN
         ytI58/bZrElq5eUnJ8pI7pnd3We8UIdLKJhtSvLZrZKcqEb4ORQswyczYMRF41K/ir
         5gny7woK1weig==
Date:   Thu, 9 Apr 2020 11:03:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: linux-next: manual merge of the v9fs tree with Linus' tree
Message-ID: <20200409110320.3de95e0b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7UzRnTtmIQ_7K+rYqm3JZaO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7UzRnTtmIQ_7K+rYqm3JZaO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v9fs tree got a conflict in:

  Documentation/filesystems/9p.rst

between commit:

  07d241fd66ba ("docs: filesystems: convert 9p.txt to ReST")

from Linus' tree and commit:

  c6f141412d24 ("9p: document short read behaviour with O_NONBLOCK")

from the v9fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/9p.rst
index f054d1c45e86,3fb780ffdf23..000000000000
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@@ -156,9 -132,18 +156,19 @@@ Option
    cachetag	cache tag to use the specified persistent cache.
  		cache tags for existing cache sessions can be listed at
  		/sys/fs/9p/caches. (applies only to cache=3Dfscache)
 +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 =20
 -BEHAVIOR
++Behavior
+ =3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ This section aims at describing 9p 'quirks' that can be different
+ from a local filesystem behaviors.
+=20
+  - Setting O_NONBLOCK on a file will make client reads return as early
+    as the server returns some data instead of trying to fill the read
+    buffer with the requested amount of bytes or end of file is reached.
+=20
 -RESOURCES
 +Resources
  =3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  Protocol specifications are maintained on github:

--Sig_/7UzRnTtmIQ_7K+rYqm3JZaO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6OdFgACgkQAVBC80lX
0Gzcggf/eMKJQ5GCmdyz/iulfFyjM+G6heVxzUT5Dej1oimPC/sfbE3S5CV5Apvo
WcvjF3RogPFcMzHW9vx1J1VqTdN4drR/B0RbPgvbuR1QsrE8cL6DzWpoVyApI4l9
8QSS7RfgfbPNjv3U2Ee6SRXryBqt3BA+5Vk8HSByGtERQqFeO464LB/ENWSTODDH
KK6aAIDPnPpF6Zi6JKvE7D2uWJlB/icfmrEVSr/lJF8iWsmPdCaYDMG0l2jM7eZL
lswgSdLtzYoTUyzfxsqoePnnPkMEt+w/w30X9fYJt/RijjyIwzDEPAroopvBt8dS
/M220bR+kUKHGG29c5yww3VZPGFttw==
=0dH9
-----END PGP SIGNATURE-----

--Sig_/7UzRnTtmIQ_7K+rYqm3JZaO--
