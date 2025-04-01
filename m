Return-Path: <linux-next+bounces-6123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5AA771E3
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 02:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744343A6C46
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 00:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2CE13AC1;
	Tue,  1 Apr 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iMtwiMao"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCECE3595D;
	Tue,  1 Apr 2025 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467474; cv=none; b=tIM18+zTkU/gPO8pYzTcCp437KBlBUWl7kWgTYof8mtdk3WOM1sE5xc7n6N1yH/yzL3Uwec2m1d4LzOJ/El2lXClc6QGd47QQFqaNx30QCGOe+b9RdLpBMwR/0qcfUXP19WTtxaahZBah2+RFkCokxXxnIYva501oOQvt99GxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467474; c=relaxed/simple;
	bh=2bnlZKcqF1QfX8cbYQlebyb0ms5YPOYfQQpLSje/PXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YE5m0pF+RbS6ZCEZ1IIDNSafrTakciKBMKvqpAOqqzz+n1Ezxuk9tPLS9D9xppwiHlTt7p8NLkZSGHd0hJBGly30dvwr6B82SBoIoUobuaiOaUVLWKYbZsjI9f1c1hiH/mDwDE6C4KaFiLEcU7oyCFe/wmjWKkcivNp0qHVte7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iMtwiMao; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743467470;
	bh=f5UFSKlpZMd23yYXyYvmQ+25iHMADDGseIQfDj8UagA=;
	h=Date:From:To:Cc:Subject:From;
	b=iMtwiMaozSMxU4VK/dGIL8xtnSqKDo/jUiqSeV4QuJYSrQjnWdBqvai0Ply8nz8Km
	 sA1XuCft/pr6J7xUtScRH2kYZIjX2a/Eg/nzscBJMpfNDvoCerJsoP8x93svmFIVQp
	 sUhb4ux/uMhjq0vy9o8nL89vOqbQZE3FK6tCh4kJXOadsMsm4VBWkuPyOR+haiw0oZ
	 syFXhb7r/XCYi9cuN6ijNZ8L0duQIuAUOq17pcawG9tQPqjo1GymG1I0vJj1w7mneX
	 8OoYbdqvGaUw7vUcKqp0sh2XiWBtwE2dDLJ/NwWMV6tibMua9H5mFhE5m/KM4dvUoR
	 UVeCE78ZVMJkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRTSY62SWz4xG8;
	Tue,  1 Apr 2025 11:31:09 +1100 (AEDT)
Date: Tue, 1 Apr 2025 11:31:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>
Subject: linux-next: manual merge of the s390 tree with the kbuild tree
Message-ID: <20250401113109.2c8cb2b2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a+.RNlqCLfOPPdabUjbL3_p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a+.RNlqCLfOPPdabUjbL3_p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/Makefile

between commit:

  9b400d17259b ("kbuild: Introduce Kconfig symbol for linking vmlinux with =
relocations")

from the kbuild tree and commit:

  991a20173a1f ("s390: Fix linker error when -no-pie option is unavailable")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/Makefile
index d5f4be440879,fd3b70d9aab1..000000000000
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@@ -15,7 -15,7 +15,7 @@@ KBUILD_CFLAGS_MODULE +=3D -fPI
  KBUILD_AFLAGS	+=3D -m64
  KBUILD_CFLAGS	+=3D -m64
  KBUILD_CFLAGS	+=3D -fPIC
- LDFLAGS_vmlinux	:=3D -no-pie
 -LDFLAGS_vmlinux	:=3D $(call ld-option,-no-pie) --emit-relocs --discard-no=
ne
++LDFLAGS_vmlinux	:=3D $(call ld-option,-no-pie)
  extra_tools	:=3D relocs
  aflags_dwarf	:=3D -Wa,-gdwarf-2
  KBUILD_AFLAGS_DECOMPRESSOR :=3D $(CLANG_FLAGS) -m64 -D__ASSEMBLY__

--Sig_/a+.RNlqCLfOPPdabUjbL3_p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrM80ACgkQAVBC80lX
0GxI0wgApZBKLDbtNZv0NIRRzRuXd4a5KEV+QPNNr38R4se4ygBT9U37ebzferfH
/azTkTnO/4KVTBsgDYB5FPEYTJ582HVEr8lN7MgbH0wzkCpluIQSJHqHBjwkfSB4
DYFcU3LQDdjceL0+cWPpK5WRy2d7Ovf3cbEMi8/MPLLdvBUbaLvmMWtxFjVrkyMJ
Wdh/waIzLSEXfcujFXLOHYmoCsDjcZpMFq8ptiBx31gPLZCLn9ySGMCgF3v2TdGG
nw/Ycl4PG/SfIxbcAyEQXZ4UK/D7BPE0Gxw4wh9DQP0TX8/Kq5ysybZGjfA5N7Fy
xheQa+drfU6jR6RD3wv/0oZT+CqaUA==
=jAJf
-----END PGP SIGNATURE-----

--Sig_/a+.RNlqCLfOPPdabUjbL3_p--

