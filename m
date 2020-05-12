Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896F71CF1FC
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 11:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELJ5X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 05:57:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbgELJ5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 05:57:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LtWh03RCz9sRR;
        Tue, 12 May 2020 19:57:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589277440;
        bh=AZatOeJTv47JARaRkWyl6WC5Er0s9tdcpcNGfDPfUu4=;
        h=Date:From:To:Cc:Subject:From;
        b=Y2F7MFOHl2m3fMN9GDs4OWL7tc+6N+yJxjczOjySbsbBhCUZvuCFm9KhwrbU0MyQG
         cOgsPNjS8ICDZ1ssKlZ0B+0qXEa3qLDYXApEtmR0kH3JFCZfkQy+JSBCyXr8iAD1tV
         0brngN2IwATTStZ7kCgHvURgJWTvMmtxshWvnfda0992me71ycdr+wn8JBvOxRQTNm
         wGKlrITWzXwrIBg0mzbupha/rGXoZrOaClHsFZ/Zuis72R/CBZiBYPebYetVBVDd2/
         DVais4I/mZ2ofr/jgs1KMLzJJtxNauc4Ho7/OB3vCOVGOgw80fMYgDL6smEEjGiv3S
         McMyD0lA4lsJQ==
Date:   Tue, 12 May 2020 19:57:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: build failure after merge of the fsinfo tree
Message-ID: <20200512195712.690f02bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AKHzWBb2aZhTunEiz5gpX2P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AKHzWBb2aZhTunEiz5gpX2P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/usr/lib/gcc-cross/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/ld: =
cannot find /usr/lib/x86_64-linux-gnu/libm-2.30.a
/usr/lib/gcc-cross/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/ld: =
cannot find /usr/lib/x86_64-linux-gnu/libmvec.a

I don't know if this is a quirk of the build system or Debian's cross
compiler setup.  Both those files exist in /usr/x86_64-linux-gnu/lib/.

Masahiro, any thoughts?

I have disabled the building of test_fsinfo for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 May 2020 19:49:33 +1000
Subject: [PATCH] disable building fo test-fsinfo for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/vfs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index f5bc5dfdf045..97e54c8be358 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs :=3D test-fsinfo test-fsmount test-mntinfo test-statx
+userprogs :=3D test-fsmount test-mntinfo test-statx
 always-y :=3D $(userprogs)
=20
 userccflags +=3D -I usr/include
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/AKHzWBb2aZhTunEiz5gpX2P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66cvkACgkQAVBC80lX
0Gxu9wf2LLj9CiDJL0K6ih3CzMRdA/xfvqQ2orRn1omirRJXZpfBhmFxWZ7MrPsJ
AQvUus63utb0XWnPn6zqt3NEBXFUXDlN5oyAJZBlT1lyqrT0JhY3klm9dm6zNi60
CVdZPQbDpxc2qeu9idbKKoq1kZDAcg3R+Xd8NxxuRZJVItru07EAaXY1veqKGyWd
2p0Lol8vFS1vMkNT03BHyWtQysEa9gK+NQ13T8VRdCQ45iW0rC2TLafbJvYAWmMZ
8lLX8AIGldn8W45qz7xm7lNS/DQRk7qjF3Gm94hPbbz57FRdp4CJXLN20o5tZLmk
XuVbrhQ+b90q4maOAIGEzLt0oX9c
=FZTT
-----END PGP SIGNATURE-----

--Sig_/AKHzWBb2aZhTunEiz5gpX2P--
