Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354E91CD3B1
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 10:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgEKIXK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 04:23:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728556AbgEKIXK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 04:23:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LDTR5RnBz9sRY;
        Mon, 11 May 2020 18:23:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589185388;
        bh=rYX0zvouVsESSpJo2+ujy2QOVvrkO7whe2vLWd5IIDM=;
        h=Date:From:To:Cc:Subject:From;
        b=AUyhwVrMjpBsVHbYqjLMZ4m2XBvZEZbkL+q7aa6BEC8MkY0JCf7tRI7z6a3wZ1G5x
         k6yB9hmmkgmvLYEsFm58f+pNx3lWiX2iTdK7gKA46jNYAOY6WBuLCdBAG08r/894BO
         v5hQ6N6Usux81hTdCioYkGaJPW3HlsTxvh9kpnFXcst9gAR6D3s3/lZAO+34NKiOW2
         Z85XHiymG6rtPPlgp+QOepWduwB/wxMoS/xSKzkQumwMh2sLNDHVimVSizciVLiVxh
         OmG8w+jmllYyUxZgVz85y4RtSqB9vU6RktSedpCrvGh0ho9AsOi2mrZA/JlZtrGKus
         LHE3dlljlCCDA==
Date:   Mon, 11 May 2020 18:23:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        xujialu <xujialu@vimux.org>
Subject: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Message-ID: <20200511182305.6001b046@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hN=BRP2r8XB2+YTIp0UGRV_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hN=BRP2r8XB2+YTIp0UGRV_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Makefile

between commit:

  0e92fd54b7c1 ("kbuild: remove {CLEAN,MRPROPER,DISTCLEAN}_DIRS")

from the kbuild tree and commit:

  51b26a64f220 ("scripts/tags.sh: add a intermediate file for 'make gtags'")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index 4334bcffa886,995020716343..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -1413,7 -1397,8 +1413,7 @@@ MRPROPER_FILES +=3D include/config includ
  		  *.spec
 =20
  # Directories & files removed with 'make distclean'
- DISTCLEAN_FILES +=3D tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
 -DISTCLEAN_DIRS  +=3D
+ DISTCLEAN_FILES +=3D tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS gtags.fil=
es
 =20
  # clean - Delete most, but leave enough to build external modules
  #

--Sig_/hN=BRP2r8XB2+YTIp0UGRV_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl65C2kACgkQAVBC80lX
0GwZAgf9GwhR7slYqegVbEUR0opTkMG0LxS/zOyB5h5qFWACsjzJP/WUdc4WnAEz
Ke0EXGrj9t0DF2sz4puNd1LHLFtrz7eCCBtjvPEKEYZ81ykjPm0GgQVdMYOEIRwa
HL6ZJ51CowwK/Ww8jl9Wng/us6GeKMdgkVYL4uFopXiUeabZM7sfVTmOaizXuHFy
LbHMYO2f906NKC26PR0ob1fDr+s6EogqeCE7Z9N8bC9vQh7mGnMKXHWh2atbh8mn
xpEvGW7HtbwSdvkJ7lM9YnM+gYiS44z3X86rA0hnpvj1eV1CBcxITDgpNuBoX9ft
sX9LrO+5fqDICfDHvknNlRXLst1Ryg==
=CwnC
-----END PGP SIGNATURE-----

--Sig_/hN=BRP2r8XB2+YTIp0UGRV_--
