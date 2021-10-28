Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893E343DD70
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 11:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1JL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 05:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1JL6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 05:11:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCC8C061570;
        Thu, 28 Oct 2021 02:09:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg09y6rtTz4xcC;
        Thu, 28 Oct 2021 20:09:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635412170;
        bh=6bxZMa6u3BdmZNcWDX7MjL0GNbyqtdo/SRu92As+UL8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hG3JmjhWcSB4EDi4Xu/QR5Tt6PY/1DrDw866wpE3S/pNzUfAjEMtxtmfnG+M6v4EM
         YP62Kxpl5SeM5fjMy8yyPz6nJwJxKWEtJ6vbbrN1MlWnuXR3LEtpOqVgkyu76wFUv2
         rQq4MDBMefCm+2CO8+bCe7k0dR/ND5zOCY3RYCkNqwOBV7XSaGhxlFe74ChZIprNFx
         PLndJv2nnFE83pVkiksk4sclFxafYnis1QesBSHeGLYsijZ9VZiPOb7fhSneawIs9G
         iEPcfHkmvebuZgAtDU/eEbO1pXSz+983PQnjryYUqkb4F9P6s/mm5CjOq7Gqn44a+Y
         vzXUlFO/5/Vkg==
Date:   Thu, 28 Oct 2021 20:09:25 +1100
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
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20211028200925.64f16df2@canb.auug.org.au>
In-Reply-To: <20211015182404.0355bef6@canb.auug.org.au>
References: <20211015182404.0355bef6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vvi=bl.Rr0pN0CqAV8ZNVTF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vvi=bl.Rr0pN0CqAV8ZNVTF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Oct 2021 18:24:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   Makefile
>=20
> between commit:
>=20
>   09708df61f2b ("kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug=
")
>=20
> from the kbuild tree and commit:
>=20
>   dc08d49444e9 ("Kbuild: add Rust support")
>=20
> from the rust tree.
>=20
> I fixed it up (I used the Makefile conflicting part from the former and
> applied the patch below) and can carry the fix as necessary. This is
> now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The fixup patch now looks like this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Oct 2021 18:16:09 +1100
Subject: [PATCH] Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to
 scripts/Makefile.debug"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/Makefile.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..c664af3ccc6b 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,4 +1,5 @@
 DEBUG_CFLAGS	:=3D
+DEBUG_RUSTFLAGS :=3D
=20
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+=3D -gsplit-dwarf
@@ -10,6 +11,12 @@ ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+=3D -Wa,-gdwarf-2
 endif
=20
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D1
+else
+DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D2
+endif
+
 ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) :=3D 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) :=3D 5
@@ -31,3 +38,6 @@ endif
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

--Sig_/vvi=bl.Rr0pN0CqAV8ZNVTF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6aMUACgkQAVBC80lX
0Gwa0Qf+LZYWYOrgNlZxCXHxfx0/2s9nJjvXc+upbheQHszM6ho9nOolaMchN+RF
h4lA7IeYvbvOArK5LM3wIxPAIb0vUTNooXrW2+u+NkSLEroUMfcSXfeLcxaD5Pd8
longZPyCobQ6lIEZXLXFe4q2cJP4Fj/1SJQccyCCXLgJ+rVHlljqRv1wZ041KXU8
jkcgEWIpOETLgKwIp/qSJah6EyTfFNwr6F1beE2BgGNhzjTkdFsI0t9+W8CTfa14
JRT3+FjEXmcPDSgAIpPZxTfkhppm9ZenlMp9a8F6WhPxNGVb/ym2seXyqTFGPBuc
S0R/Div6hklj/wppqNzlKxZeW+tcoQ==
=3618
-----END PGP SIGNATURE-----

--Sig_/vvi=bl.Rr0pN0CqAV8ZNVTF--
