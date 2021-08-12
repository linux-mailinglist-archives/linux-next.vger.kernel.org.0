Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B47D3E9EAD
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 08:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhHLGf3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 02:35:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44075 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229956AbhHLGf2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Aug 2021 02:35:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlcPH6BzXz9sRf;
        Thu, 12 Aug 2021 16:34:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628750101;
        bh=mgH3BL5eJH6UnVLbFgGbxe6ga9Q7rU2E2XVd+whIA/4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mVw1j03cQxZktmJS5Hddibfl75JSEixJ2HQTqqHRrkTz5QjTGgg2nVCAueJWVtFzL
         K6ENKPVOM375UmO1GeetrkHO/L/rsE88EianJ5hx2pwyldLud8JHOt/LhOCViTtDnl
         efbOWASIGYDsCYIaHE+FinCgAUfwXkwx7AoaoW6m+XgtW1bfP747tKIPCH3DnBeC/6
         YziAPkptLs8fbIrFi4vVPuo27t6NGgSOZhCnl4/sKApldMB/bfVASWVoqO9dTXKsZ9
         9V+UrFbwxCYJpnHOd/k7b1jDJ0NExm619J4e/UErCIApoxunk7dU3CB2e14JO4YmJg
         fDhE8QM+1I+Zw==
Date:   Thu, 12 Aug 2021 16:34:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20210812163458.37ba7ed3@canb.auug.org.au>
In-Reply-To: <CAKwvOdkv+L6LQO2NPr7EmGS3mp3AN=5CBfFkS0v6YU4j4YAm6A@mail.gmail.com>
References: <20210811172605.72d6650e@canb.auug.org.au>
        <CAKwvOdkv+L6LQO2NPr7EmGS3mp3AN=5CBfFkS0v6YU4j4YAm6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cWMm4Pn7qTSRkzXaG+4/ig8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cWMm4Pn7qTSRkzXaG+4/ig8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Wed, 11 Aug 2021 10:04:36 -0700 Nick Desaulniers <ndesaulniers@google.co=
m> wrote:
>
> Thanks Stephen for taking the time to resolve this and send a patch.
> We owe you one. We knew this conflict was coming.
>=20
> Miguel, would you mind rolling this patch into your tree, then
> crediting Stephen if possible (on the patch that adds
> TENTATIVE_CLANG_FLAGS)?
>=20
> I think the above `ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)`
> should stay in the top level Makefile though. It does look nicer to
> bury it in scripts/Makefile.clang, but I worry that someone doing a
> GCC build might trip the $(error) in that file (if CROSS_COMPILE was
> set and we're building a non-llvm-supported target).

OK, I have changed the patch today to be this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Aug 2021 17:18:36 +1000
Subject: [PATCH] fixup for rust integration with Makefile.clang creation

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Makefile               | 17 -----------------
 scripts/Makefile.clang | 19 +++++++++++++------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/Makefile b/Makefile
index 5d504a1dcb06..3638ce07f208 100644
--- a/Makefile
+++ b/Makefile
@@ -625,22 +625,7 @@ endif
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --version 2=
>/dev/null | head -n 1))
=20
-TENTATIVE_CLANG_FLAGS :=3D -Werror=3Dunknown-warning-option
-
-ifneq ($(CROSS_COMPILE),)
-TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
-endif
-ifeq ($(LLVM_IAS),1)
-TENTATIVE_CLANG_FLAGS	+=3D -integrated-as
-else
-TENTATIVE_CLANG_FLAGS	+=3D -no-integrated-as
-GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
-TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS=
_COMPILE))
-endif
-
-export TENTATIVE_CLANG_FLAGS
-
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
=20
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 3ae63bd35582..555b5255d9b3 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -12,24 +12,29 @@ CLANG_TARGET_FLAGS_s390		:=3D s390x-linux-gnu
 CLANG_TARGET_FLAGS_x86		:=3D x86_64-linux-gnu
 CLANG_TARGET_FLAGS		:=3D $(CLANG_TARGET_FLAGS_$(SRCARCH))
=20
+TENTATIVE_CLANG_FLAGS :=3D -Werror=3Dunknown-warning-option
+
 ifeq ($(CROSS_COMPILE),)
 ifeq ($(CLANG_TARGET_FLAGS),)
 $(error Specify CROSS_COMPILE or add '--target=3D' option to scripts/Makef=
ile.clang)
 else
-CLANG_FLAGS	+=3D --target=3D$(CLANG_TARGET_FLAGS)
+TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(CLANG_TARGET_FLAGS)
 endif # CLANG_TARGET_FLAGS
 else
-CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
+TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
 endif # CROSS_COMPILE
=20
 ifeq ($(LLVM_IAS),0)
-CLANG_FLAGS	+=3D -no-integrated-as
+TENTATIVE_CLANG_FLAGS	+=3D -no-integrated-as
 GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS=
_COMPILE))
 else
-CLANG_FLAGS	+=3D -integrated-as
+TENTATIVE_CLANG_FLAGS	+=3D -integrated-as
 endif
-CLANG_FLAGS	+=3D -Werror=3Dunknown-warning-option
+
+export TENTATIVE_CLANG_FLAGS
+
+CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
 KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
 KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
 export CLANG_FLAGS
--=20
2.30.2

Please give it a spin when linux-next has been released.

--=20
Cheers,
Stephen Rothwell

--Sig_/cWMm4Pn7qTSRkzXaG+4/ig8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEUwRIACgkQAVBC80lX
0GwtZQf+JG+k/GeSyQCXPjmotR47CEAgwMkR5z5WNNrxmHRnx/WPK3s6XmcEOyeP
9bjxXDjX7QsbjjkHZf++TTuJdMECHfS8BtxcgkSGlZ+965k0dJNOn98PUn7mfPj4
bntuREgyQwgCrHz3LlL9DUBZzTfQu+LErAxHhzvE9jRcoE9z2vwhSSyKjWYul8tc
eAQt0a8p67JOAofACXqAck2cJq7fcqnT4dzmBP7dpr1Y2Oa/ka6UBWHYr22aFhSN
FZkVVw7S6Km/qOf3vLJqmD9d3QuHHxKx2UrrFuDjsSqFlIcTFoUqLehtCf5NQlfc
+82zclFhp6qilLZNOaeyCp3S+X1Sgg==
=OnXM
-----END PGP SIGNATURE-----

--Sig_/cWMm4Pn7qTSRkzXaG+4/ig8--
