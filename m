Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD4F125A5D
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 05:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfLSEzX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 23:55:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbfLSEzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 23:55:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dfh85HQfz9sP6;
        Thu, 19 Dec 2019 15:55:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576731321;
        bh=4oisl15yYHcWvrgH7/qJUhxc0HGkWrgz8xu4a08nXFA=;
        h=Date:From:To:Cc:Subject:From;
        b=V+e8y+pNOKeLNBURT7kjixANS4SVEDYceNYtrVJRyVxgEvz2dKe04Lb/t5K5aSB+S
         yQ9fycQ5g6a291V/NrF4hzrPwY3FBGP5W4mKejkgIb31ME2I3LqiKqYIR30E9pn3SB
         QNsgKr3nRWHRn3bifsNWWe3+rLwmK2CLVE1pKJKzH8gtmapf+GVARfzCSnHEf4UrJv
         bXIVyQ/goN9DjDkpbQejiGhJLZTJTUW2HRhAxGF9ucJWU11uQ9x/I3BYEes7GbgDj8
         tHt9Gbe7RYUhTF2dPSlFG4wHFmxK5EWkcdFwfhhfoBunmxOK9zJT/uk6b6jfZsM8CW
         4vb2PY8QkN+2Q==
Date:   Thu, 19 Dec 2019 15:55:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Jordan <daniel.m.jordan@oracle.com>
Subject: linux-next: manual merge of the y2038 tree with the crypto tree
Message-ID: <20191219155514.49589ea3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XanQVetIlfap.mZksF7WZM3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XanQVetIlfap.mZksF7WZM3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  Documentation/core-api/index.rst

between commit:

  bfcdcef8c8e3 ("padata: update documentation")

from the crypto tree and commit:

  07430b71bd51 ("Documentation: document ioctl interfaces better")

from the y2038 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/core-api/index.rst
index ab0b9ec85506,3f28b2f668be..000000000000
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@@ -39,7 -39,7 +39,8 @@@ Core utilitie
     ../RCU/index
     gcc-plugins
     symbol-namespaces
 +   padata
+    ioctl
 =20
 =20
  Interfaces for kernel debugging

--Sig_/XanQVetIlfap.mZksF7WZM3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl37ArIACgkQAVBC80lX
0GwIFQf+JkHLyLZhpezGSHADWZfyGY5U0ShJRjjfKtXqojKdTrXfZ/3cG0IdY4fs
Kc0V0+zz6+So5uBVAi+GbheVn4N5RrWS9n+fn4UKZ4NckR0UZMCbQ8zgLQaS6710
8x1LVT0QRe8HLoD49eJ02YBHCKS4ULNI0OXtSk5Q04Uh8l4Rj67n2JQMSRI+tMVQ
iHBfsFi8qGtEo+71HqX5tJx1uF/JcVpkrzm4hjmc6Go8glS4bPhbK+UDk+0OrKLB
ez6IA6BlDQDt+nRmn0qNJQGj2UxWe9qnppb1Gn004ZcNW1Jgp6szRKxLcnq3vyHR
dcUsmWye0W7xA+Qx3c1GOdI34dh8oQ==
=zKDt
-----END PGP SIGNATURE-----

--Sig_/XanQVetIlfap.mZksF7WZM3--
