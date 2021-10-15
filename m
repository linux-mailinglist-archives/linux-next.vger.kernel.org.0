Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30D242E9FA
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 09:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbhJOH0R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 03:26:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:50513 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhJOH0Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 03:26:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVySQ2qdkz4xbQ;
        Fri, 15 Oct 2021 18:24:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634282649;
        bh=KKD9ANFW/s8xZ3yMEIw+8GQ1uwACWZHgojK20y1bTew=;
        h=Date:From:To:Cc:Subject:From;
        b=lll2IH1XJeIyLUHgMP+DrJM1IS1rdv5ibzR36BdQxOYUyvUawbcCoFaOLeyCPPY3g
         xBlN+DLrcEZG7VsBvrm2CYmjxNEhNL+vaWNArKTL/ZQr2q4+Ecm0NdMsin1iVh39SE
         Ds756higf3VhRPMBkzPeVcLJpMRP84hEJBfywrl9iTEb3EYjwuDR7+TuOCLkAOItnC
         zps4ehOrAmYtOUYWZFyYhL44niHjUo+7Pat6xjYPFRIZSqm4KWek5l1kh7et831fzc
         HCJgYCieHzGKLNbV5NdLLceJRdIxQV+Qvi0Sd2Tqr4MwuAdTS1aEk1BCBc8scWcICb
         oEXUCQiQP+o3Q==
Date:   Fri, 15 Oct 2021 18:24:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>, Gary Guo <gary@garyguo.net>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20211015182404.0355bef6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dNn3I8xom7PU2ucg8PI6ffw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dNn3I8xom7PU2ucg8PI6ffw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  Makefile

between commit:

  09708df61f2b ("kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug")

from the kbuild tree and commit:

  dc08d49444e9 ("Kbuild: add Rust support")

from the rust tree.

I fixed it up (I used the Makefile conflicting part from the former and
applied the patch below) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

Miguel,  it might be worth do a back merge of v5.14 (or maybe even
v5.15-rc1) to fix up the old conflicts ... If you do that, though,
please don't use github's GUI to do it, do it in your own git tree,
include a good commit message in the merge commit (saying why you did
the merge), and push it up to git hub.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Oct 2021 18:16:09 +1100
Subject: [PATCH] Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to scripts=
/Makefile.debug"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/Makefile.debug | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..ad9308a08240 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,4 +1,5 @@
 DEBUG_CFLAGS	:=3D
+DEBUG_RUSTFLAGS :=3D
=20
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+=3D -gsplit-dwarf
@@ -8,6 +9,11 @@ endif
=20
 ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+=3D -Wa,-gdwarf-2
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D1
+else
+DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D2
+endif
 endif
=20
 ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
@@ -31,3 +37,6 @@ endif
=20
 KBUILD_CFLAGS +=3D $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
+
+KBUILD_RUSTFLAGS +=3D $(DEBUG_RUSTFLAGS)
+export DEBUG_RUSTFLAGS
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/dNn3I8xom7PU2ucg8PI6ffw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpLJUACgkQAVBC80lX
0GwxCQf+MBSaQK+nRcoey+cbsescHyWqk66ldD6O1BBgoxRoD3lj/xfSRcY7OrQE
wa6ymvjHMff7uYExyLy1RGPPqcVj8lkqua8IsVpQgENpDj0wDzuqAPHuCEeaNS8i
kpshKBtD3CpsBiZCUCILoSAdZyILVZ128SSVRwyJhfYI48slFUeeZx5DsBR9EnQH
RV8aaHQ9HBDc5usm6b7cqgyWv5QUcHVTn4luu7Rccco4UoBjheUq5nyuphu1UeMo
+sCxWCH8DcY+biwiCRu13KPyubjuizlFhtib/Hkv6dW0mJi08EQsxo0ozIoYe95O
FxGQHMbqWpUw2SZETVapAREQ2UyAUA==
=VGsj
-----END PGP SIGNATURE-----

--Sig_/dNn3I8xom7PU2ucg8PI6ffw--
