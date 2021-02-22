Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E8F322223
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 23:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhBVWZw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 17:25:52 -0500
Received: from ozlabs.org ([203.11.71.1]:46007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230079AbhBVWZo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 17:25:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkxZM2vBnz9sTD;
        Tue, 23 Feb 2021 09:24:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614032702;
        bh=90SJyiEzH4lSBkPUptt6HyNSTqL7GO789g6VBOtprr0=;
        h=Date:From:To:Cc:Subject:From;
        b=dTVYiEK1qPlTAuWqxJQiiDOLbNFzY0n1f0WxJYg+mmaRHi3RjR2ESKsd0eNX8Dwfj
         +vcl5WvePrWPC0YQ87KugErTwXpPVINYHDXWTny2PxOtIQYq9c4hW6VFKIxc6SCFMf
         0AF4nnMQFETKt3DNmJHJ2BZ2vzIndzqcdKiuo608IEbo3gyl5oaFBBu96s+jw0X22I
         WX5/ysRtsXR8ifrZGAy/s/d492G/Sgvtudnbax4pX95Phc+H3/0SnUypEGJ5lDePQr
         7iK0VQs4nO3rKGEsEo0Zzyi7KJ6NYjqIFA1luGejijGP81hWXKLKKf5a3LwS+FCSgs
         L2AuJ5x/95KXQ==
Date:   Tue, 23 Feb 2021 09:24:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Message-ID: <20210223092458.38bf35bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+PaLokU5Wxu_w1NbAbux2Ii";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+PaLokU5Wxu_w1NbAbux2Ii
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/mips/kernel/syscalls/Makefile

between commit:

  ccb21774863a ("MIPS: UAPI: unexport unistd_nr_{n32,n64,o32}.h")

from Linus' tree and commit:

  865fa29f7dd1 ("arch: syscalls: add missing FORCE and fix 'targets' to mak=
e if_changed work")

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

diff --cc arch/mips/kernel/syscalls/Makefile
index a1ce8b7dbcfa,ed22b711ccb7..000000000000
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@@ -44,17 -44,17 +44,17 @@@ $(uapi)/unistd_o32.h: $(syscallo32) $(s
 =20
  sysnr_pfx_unistd_nr_n32 :=3D N32
  sysnr_offset_unistd_nr_n32 :=3D 6000
- $(kapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr)
 -$(uapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr) FORCE
++$(kapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr) FORCE
  	$(call if_changed,sysnr)
 =20
  sysnr_pfx_unistd_nr_n64 :=3D 64
  sysnr_offset_unistd_nr_n64 :=3D 5000
- $(kapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr)
 -$(uapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr) FORCE
++$(kapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr) FORCE
  	$(call if_changed,sysnr)
 =20
  sysnr_pfx_unistd_nr_o32 :=3D O32
  sysnr_offset_unistd_nr_o32 :=3D 4000
- $(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr)
 -$(uapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
++$(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
  	$(call if_changed,sysnr)
 =20
  systbl_abi_syscall_table_32_o32 :=3D 32_o32
@@@ -83,14 -86,12 +83,15 @@@ uapisyshdr-y		+=3D unistd_n32.h		=09
  kapisyshdr-y		+=3D syscall_table_32_o32.h	\
  			   syscall_table_64_n32.h	\
  			   syscall_table_64_n64.h	\
 -			   syscall_table_64_o32.h
 +			   syscall_table_64_o32.h	\
 +			   unistd_nr_n32.h		\
 +			   unistd_nr_n64.h		\
 +			   unistd_nr_o32.h
 =20
- targets	+=3D $(uapisyshdr-y) $(kapisyshdr-y)
+ uapisyshdr-y	:=3D $(addprefix $(uapi)/, $(uapisyshdr-y))
+ kapisyshdr-y	:=3D $(addprefix $(kapi)/, $(kapisyshdr-y))
+ targets		+=3D $(addprefix ../../../../, $(uapisyshdr-y) $(kapisyshdr-y))
 =20
  PHONY +=3D all
- all: $(addprefix $(uapi)/,$(uapisyshdr-y))
- all: $(addprefix $(kapi)/,$(kapisyshdr-y))
+ all: $(uapisyshdr-y) $(kapisyshdr-y)
  	@:

--Sig_/+PaLokU5Wxu_w1NbAbux2Ii
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0LzoACgkQAVBC80lX
0Gx55Af/VitEVAARZKObIsd4/qjzqVgnJ6DfTYBsnGgNOrVVAHCMHTT4oGhq1yF2
4a5HP3tHio6tYVDIUdvkvweGQA+Uo29hnDqlmMQu2ECxAgSdTXnhrMfGYo2uTnZF
bCwO8orVJi++lFYD+tQ8AdzYoLmaG+Cd34c8sgpb4FN8mjh+ybd0A8c1j3jGSLK4
J/g/bZw4D3wlIPif87onLL6LfS0e5pDglYMWihGsOAn7UM0QBdU03id8jDkqsm+F
6xcnqABQf/aHzNlv3SP9TEWFpyrlbtLzkAGUSa2shZOeXS5MP80G+YWUH4+v/wRb
nxVjk2c0G1p/pFktRO2b3mkSnqhPbA==
=P/l8
-----END PGP SIGNATURE-----

--Sig_/+PaLokU5Wxu_w1NbAbux2Ii--
