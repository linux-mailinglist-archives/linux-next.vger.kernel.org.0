Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F1F36BBE4
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 01:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbhDZXDc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 19:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhDZXDb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 19:03:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93310C061574;
        Mon, 26 Apr 2021 16:02:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTgQt2hDTz9sX2;
        Tue, 27 Apr 2021 09:02:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619478166;
        bh=5+7B/p7+zDr5e/IUFh4ZWXlObHNziLW/mUzAD8eFF6s=;
        h=Date:From:To:Cc:Subject:From;
        b=LYr3wjj0dXBUJ0fXm6gdRyF7T19aGjNCRdFkRs8LC+JcYVD/x2UxmlMNk8wvgJXL5
         x2uzWTAaVjTokgC3jDOlbgeuGjUujfzn1f0pNQbWW6yHqtUcHTW8GiNsm/EyHTWpv0
         CyJ9dRnEF6qFkqa8zWsCRiQm8C899sGxA7px3dNctmtd4JL2m2sVNY35Kqf5MPYjTM
         XvrXa6DCQXZI8vyqdKRq2PTDY17b1LE+FGPVJp99WA5R+OY3Jt5fSMWKQ5IqO2r3i4
         X+qGWEuTLuthOxGoo4uaApKW9SCbEBctNlwbQXy3uovSUZfPkornXMp0Sxd6YIyY+d
         0V6+RvKWRLkPQ==
Date:   Tue, 27 Apr 2021 09:02:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Message-ID: <20210427090245.42df6272@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/keV52pTvhC5ArZEcxHCrjPA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/keV52pTvhC5ArZEcxHCrjPA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  certs/.gitignore

between commit:

  81f202315856 ("certs: add 'x509_revocation_list' to gitignore")

from Linus' tree and commit:

  8573271e6946 (".gitignore: prefix local generated files with a slash")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc certs/.gitignore
index 6cbd1f1a5837,5759643f638b..000000000000
--- a/certs/.gitignore
+++ b/certs/.gitignore
@@@ -1,3 -1,2 +1,3 @@@
  # SPDX-License-Identifier: GPL-2.0-only
- x509_certificate_list
- x509_revocation_list
+ /x509_certificate_list
++/x509_revocation_list

--Sig_/keV52pTvhC5ArZEcxHCrjPA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHRpUACgkQAVBC80lX
0GzEOgf9HuEZNNZKBfTC2qMlgOOOuHLKQUNqfsOdY3cedbgJwitZi2TPBO92EBY/
bWUshfJHSf1uu/DVdR0aoBLs8JC0yShx38OoBFrTLImITw2zYo8FW/xAaIclxKBs
iHILuGSSmcbOhGqEv+SGki3Xgv9RfEhUyKA67gI4WE5lA4+LmxMCEGTEYto0lbbt
AQLYlZ5sJ23eSyGBLtFCmzGLVSpJJRkjhgOpKAqrek0Yw/bYNhC0nUyh1Eoy829v
jz+kcZn1k6Skw1moVAaGyZEE7GPq6CT/G9Y9sCTdnqOEm9FcPIne2RGdwbufl7M3
XnM37QL4SoI5pyEdeSRYHof4iYtU1g==
=5/Qo
-----END PGP SIGNATURE-----

--Sig_/keV52pTvhC5ArZEcxHCrjPA--
