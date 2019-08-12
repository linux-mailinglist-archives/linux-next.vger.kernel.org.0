Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF0389533
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 03:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfHLBky (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 21:40:54 -0400
Received: from ozlabs.org ([203.11.71.1]:51147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHLBky (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 21:40:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466JTG5rsxz9sP7;
        Mon, 12 Aug 2019 11:40:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565574052;
        bh=EevmDzavchTrzirQeVBqWWlarYRf4O1/6PgoQ3YXLJI=;
        h=Date:From:To:Cc:Subject:From;
        b=bZxJx1x+W8Ve74HK9shaqfHm4BD8N5C3n9MCBpztql0azxOLLPJgie6Z6pm2ElxSG
         Vnb9ndcl7mT9P1pgpc6d72vdehuyUmk94+FTwwfrqQkUCl+MHUVaWgIvNl6GI73uFp
         vHsO3I3v1il+cgJ+av5HfFQBhLftgEYMuL7LdxusEGfopoRDjrIz4fproOJexY6vFi
         8nQ/JSDRCiDrwjNb76HO3kSqOA16ucW43Bh3HWURbTSFI+Y6OBG6n2JxS2cAiQ7i80
         l+rAM16qkCFHJ6te83SMTRxShj0fkZnpoEP1TB7D0kEymjEQ0VS5OunD3ByKHOx6Eq
         wRbI5EvdA+RvA==
Date:   Mon, 12 Aug 2019 11:40:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paul.burton@mips.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the mips tree
Message-ID: <20190812114050.0c94ad6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y1V_0SkurqAx66nxcd=h5mg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y1V_0SkurqAx66nxcd=h5mg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/mips/index.rst

between commit:

  97689a1a3fda ("doc: Add doc for the Ingenic TCU hardware")

from the mips tree and commit:

  80b1505893b6 ("docs: mips: add to the documentation body as ReST")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/mips/index.rst
index 321b4794f3b8,fd9023c8a89f..000000000000
--- a/Documentation/mips/index.rst
+++ b/Documentation/mips/index.rst
@@@ -1,11 -1,17 +1,19 @@@
  .. SPDX-License-Identifier: GPL-2.0
 =20
 -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 -MIPS architecture
 -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 +MIPS-specific Documentation
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 =20
  .. toctree::
-    :maxdepth: 1
+    :maxdepth: 2
 +   :numbered:
 =20
+    au1xxx_ide
 +   ingenic-tcu
+=20
+ .. only::  subproject and html
+=20
+    Indices
+    =3D=3D=3D=3D=3D=3D=3D
+=20
+    * :ref:`genindex`

--Sig_/y1V_0SkurqAx66nxcd=h5mg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Qw6IACgkQAVBC80lX
0Gx5jwgAi46GBYf0Z1/MlTfftNHnG0/XPH/v4Vpn/lfdPMD9fNo0Bu80IPCtjiTQ
laNFJ40gclPFcXCG0LMUBGGUS75d16zl2zsvXGudb1NcxCVD8Jd57f6wxI3aRakY
McxiAH0hALdKuMA+yZ8fg12hpr++WErlMicUcONGZtioZslWk3benDpgHdPKzzl4
KJ1tTRB2+skN2UTWgCJZltnsFL1TaHJXQFDlMOYVijbn+gvdLswD3aA9gypMhLGy
VH/R2LEC0P3iyRn42dr+2fuSra2xO+PgQ03VcmyVYezr12JvXKX4j5szvyBKeqZE
7qllctkkViH7pjQEVmqbmlcFwQ30SA==
=f4xG
-----END PGP SIGNATURE-----

--Sig_/y1V_0SkurqAx66nxcd=h5mg--
