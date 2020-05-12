Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226371CF103
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 11:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELJGS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 05:06:18 -0400
Received: from ozlabs.org ([203.11.71.1]:51665 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgELJGS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 05:06:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LsNm0Jq9z9sRY;
        Tue, 12 May 2020 19:06:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589274376;
        bh=UKtCMmj3h8KVNRGWszZ5HeqNppiHaCBc4J6oD6lYmog=;
        h=Date:From:To:Cc:Subject:From;
        b=KyT3fk47WT3dI8L02PPGgATiSn0vXelAFJlrZ1RiWlBiK2xVfBu7UqmVlXJbgwlkg
         pEJXe/gkd9vKeCjk0VARd36pO+VN1ZMr7GkkrTQ3mdHo3Dv3y4RY86Mcwx9wCRfJka
         IR0qpN3+MucKu/T0sx3Krjwlg4K1MavNS0oYYAWv0O9kdtIiBWsS+DTsK7veRVSeIm
         wsgG++7gEnRq5rvK0AmyIytKgSCfFNZmurwHDL6cbuBZ4FjaUapxw36FDXTXlGDAYx
         pIubWae3nZa6cuussmO89UTDm6opAkaRmriFEfCsy06NE9qNZuRt6llLNegmii8Ffv
         aNr52/tttjFuw==
Date:   Tue, 12 May 2020 19:06:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the fsinfo tree with the kbuild tree
Message-ID: <20200512190614.1bebd8ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DsywktJnIZ9OIlJ.O2pS6xB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DsywktJnIZ9OIlJ.O2pS6xB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsinfo tree got a conflict in:

  samples/vfs/Makefile

between commit:

  757172f3d6f9 ("samples: vfs: build sample programs for target architectur=
e")

from the kbuild tree and commits:

  51d01aee410b ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")
  d3ee0e9da65d ("fsinfo: sample: Mount listing program")

from the fsinfo tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/vfs/Makefile
index 00b6824f9237,19be60ab950e..000000000000
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@@ -1,5 -1,17 +1,7 @@@
  # SPDX-License-Identifier: GPL-2.0-only
- userprogs :=3D test-fsmount test-statx
 -# List of programs to build
++userprogs :=3D test-fsinfo test-fsmount test-mntinfo test-statx
 +always-y :=3D $(userprogs)
 =20
 -hostprogs :=3D \
 -	test-fsinfo \
 -	test-fsmount \
 -	test-mntinfo \
 -	test-statx
 +userccflags +=3D -I usr/include
+=20
 -always-y :=3D $(hostprogs)
 -
 -HOSTCFLAGS_test-fsinfo.o +=3D -I$(objtree)/usr/include
 -HOSTLDLIBS_test-fsinfo +=3D -static -lm
 -HOSTCFLAGS_test-mntinfo.o +=3D -I$(objtree)/usr/include
 -
 -HOSTCFLAGS_test-fsmount.o +=3D -I$(objtree)/usr/include
 -HOSTCFLAGS_test-statx.o +=3D -I$(objtree)/usr/include
++test-fsinfo-userldflags +=3D -static -lm

--Sig_/DsywktJnIZ9OIlJ.O2pS6xB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66ZwYACgkQAVBC80lX
0Gyrgwf/TroM/ljpR4nfHsAWMy010Dknbm4qYWoXazH+WE9VtxmSC+u/m2cCyOVq
CabYrrq0o5MaTeesrGlnaQwbK8v0Tqu/kJwTUbIakww/+O/Gf8zAqO7YckzIgj0G
X5+vmAzc8/GMMywHmO0X2UApE8D8xy4s+hO+trvFdh9lXgLQ6znUj+o5LO7Pers3
TBEmINhL3mldDr4u0R2NP+pAYzGGCOkFIDk2CYSS2DzNEq85gd7AiHNSlLq1pUCH
5XEY1hzp8dZsOM4Ir3j1EZfNeAO6VPscvzzTPpSe3LMOg9VpJIO/Ldr1troFBKKR
H2Wjz+h1cfLB4h5j2MHLbV4MUV3Qcw==
=QtnA
-----END PGP SIGNATURE-----

--Sig_/DsywktJnIZ9OIlJ.O2pS6xB--
