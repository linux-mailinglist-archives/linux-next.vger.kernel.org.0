Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC98443BCD
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 04:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKCDWO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 23:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhKCDWN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 23:22:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859B0C061714;
        Tue,  2 Nov 2021 20:19:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HkX7F2lDgz4xbC;
        Wed,  3 Nov 2021 14:19:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635909565;
        bh=mXNiDRbvftcWwQQwxnyYXK5OgdpAMzBq9zZ7/YFPumk=;
        h=Date:From:To:Cc:Subject:From;
        b=lRDeW1gaLDTEmpeGRgH0wSX9B9eqUK1wK5lXMAVY3iTihV+lfj7KLdqKGNB6ZZHlK
         sLRYJphTESScFge6FYY1sUl9lN/PQQquJXHWPC4f95ljkTjoHjWaQ0SJd9iiWdfB4g
         iGJ2HmJkCjrqxl/2FBsgil1w10eknPHUzeErWTke+WRiR0kTUyYvTBP1+izCCzOWG1
         iFW/TKWgTxdlb/IlHihrMaM/HjLv/tIINKMzDm4/TJTTtt7jrt1gpFqcWNRxdrEVaO
         cyX0hJh3pTgTSV93E/TYljZOToTKu4CtjHBL+EZREn411fKEPFaYr53x54W9+zn58+
         k2kKK8banh6cw==
Date:   Wed, 3 Nov 2021 14:19:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Gary Guo <gary@garyguo.net>, Jiri Olsa <jolsa@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20211103141919.4feefaf0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i.X8tMgFsm0alWFe66nkbZF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i.X8tMgFsm0alWFe66nkbZF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got conflicts in:

  Makefile
  scripts/Makefile.modfinal

between commit:

  9741e07ece7c ("kbuild: Unify options for BTF generation for vmlinux and m=
odules")

from Linus' tree and commit:

  fcd48fa27403 ("Kbuild: add Rust support")

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
index 8581ffca7f96,c4dd2c6b55e4..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -533,10 -572,10 +574,11 @@@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTL
 =20
  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LD=
FLAGS
  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+ export KBUILD_RUST_TARGET KBUILD_RUSTFLAGS RUSTFLAGS_KERNEL RUSTFLAGS_MOD=
ULE
  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
- export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
- export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
+ export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTFLAGS_MODULE =
KBUILD_LDFLAGS_MODULE
+ export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
 +export PAHOLE_FLAGS
 =20
  # Files to ignore in find ... statements
 =20
@@@ -1089,9 -1203,12 +1167,13 @@@ export MODORDER :=3D $(extmod_prefix)modu
  export MODULES_NSDEPS :=3D $(extmod_prefix)modules.nsdeps
 =20
  ifeq ($(KBUILD_EXTMOD),)
 -core-y		+=3D kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 +core-y			+=3D kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
 +core-$(CONFIG_BLOCK)	+=3D block/
 =20
+ ifdef CONFIG_RUST
+ core-y		+=3D rust/
+ endif
+=20
  vmlinux-dirs	:=3D $(patsubst %/,%,$(filter %/, \
  		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
  		     $(libs-y) $(libs-m)))
diff --cc scripts/Makefile.modfinal
index 7f39599e9fae,c0842e999a75..000000000000
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@@ -39,11 -39,12 +39,12 @@@ quiet_cmd_ld_ko_o =3D LD [M]  $
 =20
  quiet_cmd_btf_ko =3D BTF [M] $@
        cmd_btf_ko =3D 							\
- 	if [ -f vmlinux ]; then						\
- 		LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vml=
inux $@; \
- 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
- 	else								\
+ 	if [ ! -f vmlinux ]; then					\
  		printf "Skipping BTF generation for %s due to unavailability of vmlinux=
\n" $@ 1>&2; \
+ 	elif $(srctree)/scripts/is_rust_module.sh $@; then 		\
+ 		printf "Skipping BTF generation for %s because it's a Rust module\n" $@=
 1>&2; \
+ 	else								\
 -		LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
++		LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vml=
inux $@; \
  	fi;
 =20
  # Same as newer-prereqs, but allows to exclude specified extra dependenci=
es

--Sig_/i.X8tMgFsm0alWFe66nkbZF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGB/7cACgkQAVBC80lX
0GwfVwf/d/0OQpkbR8tnolQawx/EByyl0Fm/vgrwWY9A6FRwAzuFFPVOpLgz4Mh0
So5JpktRS3q9UMDhq/yXWV/j0c3Hnn45oDxoWy1c7+U6sxKYhucW98Ki8O294Oh1
par5hFWRvtcjRNxwBAFbzXKfUw62XkmpnTGV6Rzira+i6qmPb8h0e2y372+cRdyL
592vQ3HuKBv24EWxfR1442tb7/mhacxNIvrL9yCsaYjtLrmlVUkYKV/3VHuxp6XE
OrJqY8OolDIdtSg83H1UakrBNbShUWMKS1vwmGsi1f+1KSm+y/mg4hJ1B9aOnRh/
KOKaD2V+BWPKyBxn0jvdzr+YPs39oQ==
=yY7i
-----END PGP SIGNATURE-----

--Sig_/i.X8tMgFsm0alWFe66nkbZF--
