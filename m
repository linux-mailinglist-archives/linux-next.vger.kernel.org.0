Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A9C33FE41
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 05:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCREhy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 00:37:54 -0400
Received: from ozlabs.org ([203.11.71.1]:52879 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhCREhm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 00:37:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1Dlj057mz9sVm;
        Thu, 18 Mar 2021 15:37:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616042258;
        bh=GnaRO+iVdl6DaDLiKu201fmx+/gRC9YhaNUAhFgycLU=;
        h=Date:From:To:Cc:Subject:From;
        b=iXLoJkRBIFv5HZmpGbjJY1DBrjEc0Jq0I+n3ZuOV/l+46GCPAcr+EUNl+JM5r4mP4
         ecA0J81rQTCEOgjF2C3ERpucxz3i2PAlmd8hZJVxPGrhi/PGsx+pcI4HBUEfe8n/7L
         6eSbIQJYelUYhQKB1FA+jMFeuKvwZsmHk0ya97JP1TXFNJJKP2r9GMyP671/G5rH16
         BUjvKi/W97VX1EtOSHU47j8tHjToQdqa8C4HVTYa3bg1UB+MDZXzk/r4NT1Z0+OPtN
         ExA+JYQoQBfZdg0g6Q+yYIWFd76GQkgBrl/68Ra32/a5/AxUVQKDraANyJKqGD6d06
         eIYiJBYRbvV2Q==
Date:   Thu, 18 Mar 2021 15:37:35 +1100
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
        Nathan Chancellor <nathan@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20210318153735.691c9c37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E43vM88nGuLMKyLJbsYs+LI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E43vM88nGuLMKyLJbsYs+LI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  Makefile

between commits:

  a14efe0d73eb ("kbuild: include Makefile.compiler only when compiler is ne=
eded")
  9fc2872b700a ("Makefile: Remove '--gcc-toolchain' flag")
  71eb5c859a59 ("Makefile: Only specify '--prefix=3D' when building with cl=
ang + GNU as")
  884a7fa1b090 ("kbuild: replace sed with $(subst ) or $(patsubst )")

from the kbuild tree and commit:

  c77c8025525c ("Rust support")

from the rust tree.

I fixed it up (see below - I think I got this right ...) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index cc5b7e39fde4,6e6562591a91..000000000000
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
@@@ -570,22 -588,31 +599,27 @@@ ifdef building_out_of_srctre
  	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
  endif
 =20
+ TENTATIVE_CLANG_FLAGS :=3D -Werror=3Dunknown-warning-option
+=20
+ ifneq ($(CROSS_COMPILE),)
+ TENTATIVE_CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
 -GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
 -TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROS=
S_COMPILE))
 -GCC_TOOLCHAIN	:=3D $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 -endif
 -ifneq ($(GCC_TOOLCHAIN),)
 -TENTATIVE_CLANG_FLAGS	+=3D --gcc-toolchain=3D$(GCC_TOOLCHAIN)
+ endif
+ ifneq ($(LLVM_IAS),1)
+ TENTATIVE_CLANG_FLAGS	+=3D -no-integrated-as
++GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
++TENTATIVE_CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROS=
S_COMPILE))
+ endif
+=20
+ export TENTATIVE_CLANG_FLAGS
+=20
  # The expansion should be delayed until arch/$(SRCARCH)/Makefile is inclu=
ded.
  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 -CC_VERSION_TEXT =3D $(shell $(CC) --version 2>/dev/null | head -n 1 | sed=
 's/\#//g')
 +CC_VERSION_TEXT =3D $(subst $(pound),,$(shell $(CC) --version 2>/dev/null=
 | head -n 1))
 =20
  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
- ifneq ($(CROSS_COMPILE),)
- CLANG_FLAGS	+=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
- endif
- ifneq ($(LLVM_IAS),1)
- CLANG_FLAGS	+=3D -no-integrated-as
- GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
- CLANG_FLAGS	+=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
- endif
- CLANG_FLAGS	+=3D -Werror=3Dunknown-warning-option
+ CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
  KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
  KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
  export CLANG_FLAGS

--Sig_/E43vM88nGuLMKyLJbsYs+LI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS2Q8ACgkQAVBC80lX
0GyRZwf/S/PEqf84OCcj9t4zhVZ0jO7jN4y0yE+penASJE0qJomeFnM3tR02re5j
Pug46iNQo5aATZedReOEGeMOOvMDFXJz1+IpYNmjhfx8NhUpk9SpHxC3EP2xKSRu
fx3sxjKljbEvquPTX5Qw4XtFVhPRvrEs8Hi+A6JYbujcaizFjThrcilAKY1Kfk9C
EBMADizZvv0op+3vET3N3m8wZBMG5v3V9qApwH80G0utqQilDzIfqrJFecmm+jv3
9qtLCOPIx7d6i5nJtyYPpTuOBAk3vo0DP1dswN7JdKuVeTHAMcIZ1Ij7oQN7E4aP
STddcFuG2qRuWN2EABFVvTQ3rbdgIA==
=APXk
-----END PGP SIGNATURE-----

--Sig_/E43vM88nGuLMKyLJbsYs+LI--
