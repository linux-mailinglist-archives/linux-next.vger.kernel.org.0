Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D71180D1D
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 02:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbgCKBIL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 21:08:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgCKBIL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 21:08:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cYjf3Bbpz9sPJ;
        Wed, 11 Mar 2020 12:08:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583888888;
        bh=xL5gRERG+tXKda/H6O66oGES5jwZVd7h6GReVkqNsc0=;
        h=Date:From:To:Cc:Subject:From;
        b=XKAgSNj3aolnLdBSQ7axiO3n7rde7Bq9OVrapzK+DQyZESY8kqHoAjecHhVXZB5So
         dGUqlVE1zA5Nwmj6felmbnxASi5FsKx7QyJlmX3jFLPHMZ7h10rA4ECbAbRyGd1zys
         WNJqRsDlR8cQ8db3zBJxaIjvXs5oFGwtVT3OVJblgfIJU76ql/UoH4UW32ymjw7u+6
         aFtnjwg+/jQ743qK7dYjwOCmDtd0vK/3Tih6TgnSiH8haA19TeOlqc9fE4lnUabBQZ
         6gJPfKeQGLT0b+b/HFLULeh7MZPTfld0eMRgWH5bIFvvc7dwccXQobHEw/Eh8qGRoZ
         dNDrI9pr7cMEA==
Date:   Wed, 11 Mar 2020 12:07:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the jc_docs tree with the kbuild tree
Message-ID: <20200311120742.074ca2ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+DiTLaWpe0SVmX41DLPgh_l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+DiTLaWpe0SVmX41DLPgh_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/kbuild/index.rst

between commit:

  fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang=
/LLVM")

from the kbuild tree and commit:

  2b4cbd5c9505 ("docs: move gcc-plugins to the kbuild manual")

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

diff --cc Documentation/kbuild/index.rst
index 3882bd5f7728,82daf2efcb73..000000000000
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@@ -19,7 -19,7 +19,8 @@@ Kernel Build Syste
 =20
      issues
      reproducible-builds
 +    llvm
+     gcc-plugins
 =20
  .. only::  subproject and html
 =20

--Sig_/+DiTLaWpe0SVmX41DLPgh_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oOd4ACgkQAVBC80lX
0GylkAf/X2jioLnGX2xfzj/Hj8inJiy66h8hEn5KoYraroxYITX0cpOEhrb3DqDV
B3t2d81OIf682ui7vRBcLMi1jYTu5LAGSkJwaOxIdrtfo0DYPQLZvBjrPtzORI0F
6D2UjPQ67SvTzpCGbvJPywER1zerzcHMM9BX86OeGNYPWht75kU2PSa6clQEb38d
sKvqIHglur5qPyp8/o7s2Vsrs7lPMp+RNZWyVm22yzDT+XWhjquf8CGHDTS+9058
VsCplAIDxPy4zCX12HU11ErLZfN1zZ93ipEdP5T1UrVj71kG+inEH7fbMt1Uzwrb
y1BIv8184i3cE8cTxmbtUXgWP64h3w==
=vuhw
-----END PGP SIGNATURE-----

--Sig_/+DiTLaWpe0SVmX41DLPgh_l--
