Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5606A2C5C
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 03:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfH3BeZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 21:34:25 -0400
Received: from ozlabs.org ([203.11.71.1]:60381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727110AbfH3BeY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 21:34:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KMTV17VQz9sBp;
        Fri, 30 Aug 2019 11:34:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567128862;
        bh=awTBaBJl56A+S7GfW/Xcq9lE7spMHnHfrUK3flSZHzI=;
        h=Date:From:To:Cc:Subject:From;
        b=VcqB8P9R26rjQPKiTfmSn6Sqkfjfu1e0ecsWfw/xpLygx0SMwaiNbOQwJCDLFekjO
         Y7JZg5XI34nYOfco50K11XFdFVgEDMwvfVjxW50GnDQsgbKHCJ4//4/y1kG8KK3fcf
         KhdF956G5st6SJSzNMdhqUHTodWOqVZKpeG/0UrsLOm2Gn20v/FWqEm/+S2Agihawc
         WOAtty3LCjzr2Yhctu+1sSrcx5k5uUXy3KhiovZ57WSfOTtYnqgbpQkSXmUcRyLIk4
         2AuIpbvbiZx1iebcyVlG5eepOkwWNmhIiZKxLe9GPKaZLRITOqufv3GeeGRju99c36
         V6Nijg4P4v2CA==
Date:   Fri, 30 Aug 2019 11:34:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>,
        Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the fsverity tree
Message-ID: <20190830113419.7e647876@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+=MyOkevnlEbI7qUf2a25HP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+=MyOkevnlEbI7qUf2a25HP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  Documentation/filesystems/index.rst

between commit:

  6ff2deb2e8f6 ("fs-verity: add a documentation file")

from the fsverity tree and commit:

  709dc8bf7f48 ("virtio-fs: add Documentation/filesystems/virtiofs.rst")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/index.rst
index 54f2c6aac187,56e94bfc580f..000000000000
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@@ -32,4 -32,13 +32,14 @@@ filesystem implementations
 =20
     journalling
     fscrypt
 +   fsverity
+=20
+ Filesystems
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ Documentation for filesystem implementations.
+=20
+ .. toctree::
+    :maxdepth: 2
+=20
+    virtiofs

--Sig_/+=MyOkevnlEbI7qUf2a25HP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ofRsACgkQAVBC80lX
0GzgVwf/aRuSmvnYce2ypyy7YXEIdboaVJ51wi8AWz+eFoIREYcMmgzsFpuMlKci
DPt9X1ndK0wuUtdtmIQPiUC1+Z5stkmrOt5C00V6jAmcfgmqvqvehu8I7dPB/sbV
xcqi0uYYDIuXaTmnNqv8t0l7xfwtHHZS2bpwROEeltcJUJ+LbUm2K9PqjbDRfoB2
8j5DGeVw4pZ3kphN9yAOjXACLaniaNyPLLqrSeJ7rz4rNYkdJJRnrHLPOkKw1+lR
iY6JbbitjEZJ2UTgBa6T2QI7986QFwzKjmsfnRZVUcaeBRVMiR1yNlF8VYN0MM38
4FqYXecwigMxki2Faer8v0PaVUcRqw==
=+JT3
-----END PGP SIGNATURE-----

--Sig_/+=MyOkevnlEbI7qUf2a25HP--
