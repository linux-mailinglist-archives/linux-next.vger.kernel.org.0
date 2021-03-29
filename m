Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A231934C502
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 09:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhC2HdH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 03:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhC2HdB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 03:33:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ABBC061574;
        Mon, 29 Mar 2021 00:32:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F846s1t7Wz9sRf;
        Mon, 29 Mar 2021 18:32:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617003174;
        bh=Sr7+ycgnN7AD4oqdBODJCVbyuXKwdhgdzbwSLW2yg8c=;
        h=Date:From:To:Cc:Subject:From;
        b=dJRYced75v4wpTUpjdJV0NmZonn8wcrnOpqeEUTblsOYZZzHqbKJC1SqmUfi4o8CC
         LaN2AxO7nCan7FmNZ8D+LQPKewgdW8xmHfHWrXw3Y2rJYzAgKZR4V+IJ19URJYRj4U
         T0xFxmlTGH9l3Q+4VpXwX1JeXgLC8+mvyFHIGIGgyUxEU8f4fVms/HhnjbaYTiBjmI
         DYUEtJWQNpS7A7sjeFAjEbxzk24BZsEgm6tPYVyxXiI61mBcZVX0B/LnI1Ctx3KS2G
         dQP03gN+0GHRaeRtBlR2rl5YAToVZNwqMKNa+NuraDFUeJ51awN/MkG2lYeSGMLL9E
         yK7CJDCx/11dg==
Date:   Mon, 29 Mar 2021 18:32:52 +1100
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
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20210329183252.09e820ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sv0pt/5amk2o1J4hUP1Fh0c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sv0pt/5amk2o1J4hUP1Fh0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  Makefile

between commit:

  b0600f0d9b54 ("kbuild: check the minimum assembler version in Kconfig")

from the kbuild tree and commit:

  98898dfbdf72 ("Rust support")

from the rust tree.

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
index 072e7a6a1a75,62b3bba38635..f86d011caedf
--- a/Makefile
+++ b/Makefile
@@@ -263,11 -270,7 +270,11 @@@ no-dot-config-targets :=3D $(clean-target
  			 cscope gtags TAGS tags help% %docs check% coccicheck \
  			 $(version_h) headers headers_% archheaders archscripts \
  			 %asm-generic kernelversion %src-pkg dt_binding_check \
- 			 outputmakefile
+ 			 outputmakefile rustfmt rustfmtcheck
 +# Installation targets should not require compiler. Unfortunately, vdso_i=
nstall
 +# is an exception where build artifacts may be updated. This must be fixe=
d.
 +no-compiler-targets :=3D $(no-dot-config-targets) install dtbs_install \
 +			headers_install modules_install kernelrelease image_name
  no-sync-config-targets :=3D $(no-dot-config-targets) %install kernelrelea=
se \
  			  image_name
  single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtype=
s %/
@@@ -567,24 -588,31 +596,29 @@@ ifdef building_out_of_srctre
  	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
  endif
 =20
- # The expansion should be delayed until arch/$(SRCARCH)/Makefile is inclu=
ded.
- # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
- # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
- # and from include/config/auto.conf.cmd to detect the compiler upgrade.
- CC_VERSION_TEXT =3D $(subst $(pound),,$(shell $(CC) --version 2>/dev/null=
 | head -n 1))
+ TENTATIVE_CLANG_FLAGS :=3D -Werror=3Dunknown-warning-option
 =20
- ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
  ifneq ($(CROSS_COMPILE),)
- CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
+ TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
 -GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
 -TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROS=
S_COMPILE))
 -GCC_TOOLCHAIN	:=3D $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 -endif
 -ifneq ($(GCC_TOOLCHAIN),)
 -TENTATIVE_CLANG_FLAGS	+=3D --gcc-toolchain=3D$(GCC_TOOLCHAIN)
  endif
 -ifneq ($(LLVM_IAS),1)
 +ifeq ($(LLVM_IAS),1)
- CLANG_FLAGS	+=3D -integrated-as
++TENTATIVE_CLANG_FLAGS	+=3D -integrated-as
 +else
- CLANG_FLAGS	+=3D -no-integrated-as
+ TENTATIVE_CLANG_FLAGS	+=3D -no-integrated-as
 +GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
- CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
++TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROS=
S_COMPILE))
  endif
- CLANG_FLAGS	+=3D -Werror=3Dunknown-warning-option
+=20
+ export TENTATIVE_CLANG_FLAGS
+=20
+ # The expansion should be delayed until arch/$(SRCARCH)/Makefile is inclu=
ded.
+ # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
+ # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+ # and from include/config/auto.conf.cmd to detect the compiler upgrade.
+ CC_VERSION_TEXT =3D $(shell $(CC) --version 2>/dev/null | head -n 1 | sed=
 's/\#//g')
+=20
+ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
+ CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
  KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
  KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
  export CLANG_FLAGS

--Sig_/sv0pt/5amk2o1J4hUP1Fh0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhgqQACgkQAVBC80lX
0GxhLQf9HO0abNScJR/jhS3TBc3cneW2HEcmORke+FeV+oWUFh5z1zeWZIH2spB8
x7PGkvypoC4lfK9WnRamiEtxUUJTvGFLp5ilu6SD0eCD9HgzfOsyh71H7AHhvOcy
7sqgfgObL6eTaqondrQKaHWWr4TaOYp9HIGsp03LOelDkbdRdNja/uawU9SazSyk
aU8w6zC+deZ+vcY2GsM2JjA5K4f97zhVK3H05WuXytTxh4LzZ0MhISfyAwS1GmMA
LOxYPVICdzJXnz5fQfVeLNgVEKFPXaE4YVKfNF6Iqx6lEP+mxtuYOWnn6jHAClik
jvTWY/pY6E5hZ8BbKR0z1+5UFYW4Qg==
=aXqs
-----END PGP SIGNATURE-----

--Sig_/sv0pt/5amk2o1J4hUP1Fh0c--
