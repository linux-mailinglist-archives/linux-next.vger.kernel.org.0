Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69933E8B01
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 09:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235452AbhHKH0e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 03:26:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40291 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235359AbhHKH0d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 03:26:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gl1Zl2L40z9sCD;
        Wed, 11 Aug 2021 17:26:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628666769;
        bh=ApZY7sdKJTtZjV2Cn9hrzkwA1rir9how/UT5nlTzYBM=;
        h=Date:From:To:Cc:Subject:From;
        b=s+wJaNiwhlXQ35ZP4P81n92bCfGoG8k40ALjhksbBpwZKoWcIbOMIVJqapV7U9756
         lYZsj7N7wFPZxlKprcxiFQL97Rnu9cumUu4N4ePd9KyGnuV3O8l4Tp+sOB0U/hYh+A
         JEVazkPJAKroWQhEplGjE/1FBiiklKYloMLk29WsaJr74Gb0dJIvuFOS05/GkNT/GL
         xMoKLBV9ADhT+NXKrYAIkaOwtkrMJu/Bgch0qwtPsaAg8QvSE5g9GH8CBCSLWCqzZh
         suXMjE4pX0lrfd+/gQO3lied3Ew8gkSCIzYKFPq/Mk5wEzjHAlNB+zabuttEpZ+f6u
         ocNQZ2br9ucDQ==
Date:   Wed, 11 Aug 2021 17:26:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20210811172605.72d6650e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4fknM.pxh5D=U5MAgPnwX28";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4fknM.pxh5D=U5MAgPnwX28
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  Makefile

between commit:

  6f5b41a2f5a6 ("Makefile: move initial clang flag handling into scripts/Ma=
kefile.clang")
  231ad7f409f1 ("Makefile: infer --target from ARCH for CC=3Dclang")
  f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=3D1")

from the kbuild tree and commit:

  e17f1b1f3e01 ("Makefile: generate `CLANG_FLAGS` even in GCC builds")

from the rust tree.

I fixed it up (Makefile fix up at the bottom, plus the following patch)
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

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
@@ -625,24 +625,7 @@ endif
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
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
-endif
=20
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 3ae63bd35582..555b5255d9b3 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -12,24 +12,31 @@ CLANG_TARGET_FLAGS_s390		:=3D s390x-linux-gnu
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
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
+CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
 KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
 KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
 export CLANG_FLAGS
+endif
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index fcda81da6c20,c814b209b6c9..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -581,10 -613,28 +623,25 @@@ endi
  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 -CC_VERSION_TEXT =3D $(subst $(pound),,$(shell $(CC) --version 2>/dev/null=
 | head -n 1))
 +CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --version =
2>/dev/null | head -n 1))
 =20
+ TENTATIVE_CLANG_FLAGS :=3D -Werror=3Dunknown-warning-option
+=20
+ ifneq ($(CROSS_COMPILE),)
+ TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
+ endif
+ ifeq ($(LLVM_IAS),1)
+ TENTATIVE_CLANG_FLAGS	+=3D -integrated-as
+ else
+ TENTATIVE_CLANG_FLAGS	+=3D -no-integrated-as
+ GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
+ TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROS=
S_COMPILE))
+ endif
+=20
+ export TENTATIVE_CLANG_FLAGS
+=20
  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 -CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
 -KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
 -KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
 -export CLANG_FLAGS
 +include $(srctree)/scripts/Makefile.clang
  endif
 =20
  # Include this also for config targets because some architectures need
@@@ -713,12 -763,11 +770,12 @@@ $(KCONFIG_CONFIG)
  # This exploits the 'multi-target pattern rule' trick.
  # The syncconfig should be executed only once to make all the targets.
  # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
 -quiet_cmd_syncconfig =3D SYNC    $@
 -      cmd_syncconfig =3D $(MAKE) -f $(srctree)/Makefile syncconfig
 -
 +#
 +# Do not use $(call cmd,...) here. That would suppress prompts from syncc=
onfig,
 +# so you cannot notice that Kconfig is waiting for the user input.
- %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONF=
IG_CONFIG)
+ %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/genera=
ted/rustc_cfg: $(KCONFIG_CONFIG)
 -	+$(call cmd,syncconfig)
 +	$(Q)$(kecho) "  SYNC    $@"
 +	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
  else # !may-sync-config
  # External modules and some install targets need include/generated/autoco=
nf.h
  # and include/config/auto.conf but do not care if they are up-to-date.
@@@ -848,8 -926,13 +939,13 @@@ els
  DEBUG_CFLAGS	+=3D -g
  endif
 =20
 -ifneq ($(LLVM_IAS),1)
 +ifndef CONFIG_AS_IS_LLVM
  KBUILD_AFLAGS	+=3D -Wa,-gdwarf-2
+ ifdef CONFIG_DEBUG_INFO_REDUCED
+ DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D1
+ else
+ DEBUG_RUSTFLAGS +=3D -Cdebuginfo=3D2
+ endif
  endif
 =20
  ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
@@@ -1201,9 -1327,12 +1305,12 @@@ archprepare: outputmakefile archheader
  prepare0: archprepare
  	$(Q)$(MAKE) $(build)=3Dscripts/mod
  	$(Q)$(MAKE) $(build)=3D.
+ ifdef CONFIG_RUST
+ 	$(Q)$(MAKE) $(build)=3Drust
+ endif
 =20
  # All the preparing..
 -prepare: prepare0 prepare-objtool prepare-resolve_btfids
 +prepare: prepare0
 =20
  PHONY +=3D remove-stale-files
  remove-stale-files:

--Sig_/4fknM.pxh5D=U5MAgPnwX28
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmETe44ACgkQAVBC80lX
0GwGIggAlGFGUOstwwMDOwJEhGaWVQfqBWAIN6DSEsxKaAcjPUcA9Hd85kO2g/RD
qo+GoQap9geRUpI+OE9dqNY5VN/M4GebQiOKbJAlxqmjPViyotL3mLAbnWnZ6mtL
Q00OcsDipId+emMpM4S7gp0joui84a8ZJkvLQ7xk7yrGtM1UJVtphwGMTFMQdsVn
ihaVR3+oH/YGGpkmmmbyo1f5yZz2d20hxWsOccKKo3qMsG8LFIw/yuGOn8uo/YAN
ebahIyG/ETUKOQMbPXbIQA64EG5NG0o5QZzq2kCMmNoQykTuzVQxUDinZs39BJ2f
kocRXx7IjcFwoHfkpsk2JaCfJgHUFw==
=2cNS
-----END PGP SIGNATURE-----

--Sig_/4fknM.pxh5D=U5MAgPnwX28--
