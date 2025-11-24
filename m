Return-Path: <linux-next+bounces-9163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD895C7EBB4
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 02:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C16B3A3FF4
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4347E226D14;
	Mon, 24 Nov 2025 01:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lSWgsgyg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0A225788;
	Mon, 24 Nov 2025 01:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763946353; cv=none; b=B+BIQqyA/rguiUEuQ/saqIoHRmJ1oa7I24F9g0Pb0oN1Acnj9QyqScYwCex+hArEwCx85NPv2ojL7FkDpgM7xJInZ9fl18uSHoYLh9YXu4Lf8M6BX3wzBqfhs+HIxwk3NDiC0w8V0zx/uCOPSnjjnVVMzX4V4qj7We/Wm48VvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763946353; c=relaxed/simple;
	bh=VwNeXNBp30ak9D+KB1fOWDRmu+eRdLYsAhaE/QtPf2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YOUdBCvwzuBbOZdLrD5dhejGps+yL1G/9GEW+Uz8qWDNNsKKBkv6O/MLG2yF69ru3/uByVcWyE7sF3551zd4jB0ElsV4/ICqIBNLmL1JXN/PZpA+A8/SFthpL0c0CVy/9DyIN90uOX1M5fxhB1EEAKnbicMPDzcPYSzmJF8bLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lSWgsgyg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763946346;
	bh=/iXCg/0kK1GfBC1kokbKodGt87v6ukeyDj8nMYBaVh4=;
	h=Date:From:To:Cc:Subject:From;
	b=lSWgsgyg0XTA7b3R64T2G2ZarvLQ5HEYlJth7iaV9Qwc37JkW+uIdu7rW6R3Haj+A
	 7nNSej/KnWNNn4enEgb7FuG/DYzCg24LX1Ub/O6khks6MqHliSn9bvmFoxfte3VRi+
	 yvXBLT6P8TXZ+512rlsHQLL+qoUxZPb89576rPDGMG4o/Gcv7B4yUyPapA2iKRX8hd
	 Y29i8MlM+uGRFXherwgEp8fKi6D/cduZm4nmpb/LhdATZ8Gwa+mr0cLkkNZASkFhuD
	 pnf3kKEBG837XxPyqvcIeYFQKXZxVJYorsGPf8jsGGDPD92owkZmpV4MX/9UNr6F0L
	 unV5IeDOAeQQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF7134yXYz4wCk;
	Mon, 24 Nov 2025 12:05:43 +1100 (AEDT)
Date: Mon, 24 Nov 2025 12:05:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>, Xu Lu
 <luxu.kernel@bytedance.com>
Subject: linux-next: manual merge of the risc-v tree with the mm-unstable
 tree
Message-ID: <20251124120543.7dee3c33@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YqASzQfh9UeJi0ZawOADNJS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YqASzQfh9UeJi0ZawOADNJS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/include/asm/hwcap.h

between commit:

  a2fb99195ca8 ("riscv: add RISC-V Svrsw60t59b extension support")

from the mm-unstable tree and commit:

  0597b9c8627e ("riscv: Add ISA extension parsing for Zalasr")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/hwcap.h
index f98fcb5c17d5,ae3852c4f2ca..000000000000
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -106,7 -106,7 +106,8 @@@
  #define RISCV_ISA_EXT_ZAAMO		97
  #define RISCV_ISA_EXT_ZALRSC		98
  #define RISCV_ISA_EXT_ZICBOP		99
 -#define RISCV_ISA_EXT_ZALASR		100
 +#define RISCV_ISA_EXT_SVRSW60T59B	100
++#define RISCV_ISA_EXT_ZALASR		101
 =20
  #define RISCV_ISA_EXT_XLINUXENVCFG	127
 =20

--Sig_/YqASzQfh9UeJi0ZawOADNJS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjr2cACgkQAVBC80lX
0GyoWgf/cL45LRFeFjCeKGd8/5ctBHaA7ccQlDfx0Omlx/KbOtW4xS47yIxe86Ia
581wtgo1ipoJjDbuXAti5Sv9CGkik6JYrcIC9Q+PB7/m02veugDfGH1lPrm4+uf/
Dy7WxZcjvestyHhJLObSfnz8lshXmZGcrg5jzGRCVjdd7mU2x85TxZB+8Ed4b0bV
63wIOSVNkvGn/ZPIWdJhqCWCJ6vNF6b4i7CP9CXJfcoa1B57bU8uZI9MIub6rYeM
b03D2KAyBcRsEXI6FURqEonf/2Ei+JI8vpIHZp3ionr1MLdHJSPDu9U/BcwdZK4K
Sfhl6Tfz08KDyiS1agp8+Ez069QH8w==
=Of2s
-----END PGP SIGNATURE-----

--Sig_/YqASzQfh9UeJi0ZawOADNJS--

