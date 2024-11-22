Return-Path: <linux-next+bounces-4832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4E9D58BD
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 04:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985481F2367C
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 03:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702D5161326;
	Fri, 22 Nov 2024 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h+EQiDSH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFBE155308;
	Fri, 22 Nov 2024 03:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732247894; cv=none; b=gk11dpIC0x4FYS/3VlQShk7hyLXAL+y0q7KpD+0gaFPCbrvSUXoYXxwh9kUoi1ajRjhyEx1lCvEthtyp/HQX/FRw3PtIE7piEXoDmZhIXKzDko4YkZUbQEZ+L/UtD+Uo/K4iWkYdvK7XMJgQD5GHb3Pel7Aj32PkDdxZQ2vDfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732247894; c=relaxed/simple;
	bh=u5L/YJtJAR2keFWLC8ZiA46RP25hwYUeXyLicH3qgzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O7jYtJSf23Vz5hLviUrS94Qp5mPSr/0x62chMrohN42P7tAD3RfvV5piLZ7nV2l3HhCQhmrFoyrPI6sC0CIEq/fxgMD85EnwBPIUsStXYa2ZDbSAw/qMT6cGA8tFBCJ+28k3M4ccIKSBSjHMeJUAtG0UjMapY/Sjt94IWUUKMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h+EQiDSH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732247886;
	bh=REK3oFmOmHvdpR3JLVTOnL9a9/i2Yxb5hvWeyaru/kg=;
	h=Date:From:To:Cc:Subject:From;
	b=h+EQiDSHLI8wuWmyb5uM6ZBcriDPNBPcg9AuBJXbU6MLnEby4E55h3crL/SqtLcqG
	 mveMndKqk0VEylAtzIHFqyhib5KdQBOWy0BYxq1jTlQpEAOikJEp2PJ9TZotjdGjPR
	 lR754J3Eeo6vzx1b3lPmEFlUIvL0Qqdfjs5R3GZsL/WBPuovMx8NeJYsJR/X2LoLzq
	 2c3t/X8QlPZY+gPvnYRDSghYT2cIUZ2EuLffj7hlTesgXsXmOYLWRXsqWRgybS/c8u
	 T1yqqqvEgaA5oObHVqiNaF29kHE1e34hBPbNWCjEG62xX4+tPMTXlurFQREfZV/S5o
	 9VA7sMxHRZ+9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XvhCL34Rfz4wy6;
	Fri, 22 Nov 2024 14:58:06 +1100 (AEDT)
Date: Fri, 22 Nov 2024 14:58:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jinyu Tang <tjytimi@163.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: linux-next: manual merge of the kvm-riscv tree with the risc-v tree
Message-ID: <20241122145809.3d6a3feb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jp4wl8DYUdE/c6mctH5Sgb2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jp4wl8DYUdE/c6mctH5Sgb2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  arch/riscv/include/asm/hwcap.h

between commits:

  2e6f6ea452aa ("riscv: Add ISA extension parsing for pointer masking")
  1658ef4314b3 ("riscv: Implement cmpxchg8/16() using Zabha")
  2d36fe89d872 ("riscv: Add ISA extension parsing for Ziccrse")
  64f7b77f0bd9 ("Merge patch series "Zacas/Zabha support and qspinlocks"")

from the risc-v tree and commit:

  94a7734d0967 ("RISC-V: Add Svade and Svadu Extensions Support")

from the kvm-riscv tree.

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
index 08d2a5697466,7f72789ba3d5..000000000000
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -93,11 -93,8 +93,13 @@@
  #define RISCV_ISA_EXT_ZCMOP		84
  #define RISCV_ISA_EXT_ZAWRS		85
  #define RISCV_ISA_EXT_SVVPTC		86
 -#define RISCV_ISA_EXT_SVADE		87
 -#define RISCV_ISA_EXT_SVADU		88
 +#define RISCV_ISA_EXT_SMMPM		87
 +#define RISCV_ISA_EXT_SMNPM		88
 +#define RISCV_ISA_EXT_SSNPM		89
 +#define RISCV_ISA_EXT_ZABHA		90
 +#define RISCV_ISA_EXT_ZICCRSE		91
++#define RISCV_ISA_EXT_SVADE		92
++#define RISCV_ISA_EXT_SVADU		93
 =20
  #define RISCV_ISA_EXT_XLINUXENVCFG	127
 =20

--Sig_/Jp4wl8DYUdE/c6mctH5Sgb2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdAAVEACgkQAVBC80lX
0GzGzAf8C6HxYU95tPHn1Vsec0dfm4BmfMjsTq+4B8mrczYAF8SRdAYlcnLmhBHm
CM8ZbgDFljG2De7MD8TpOj36LTrYkDd5V/yX6wOjblwdsbYlwmAHg1CGLTLhNDpq
KvK0HhJSOoi00LlS4OqA75Q/xtGHW1sd5SC7d0V3cA2E9/xT6QkFmwbnbdVtbEba
nZsOAfu2YUoN4vjsPJf85gEZ+6uDt/h6H+iryz3c8HvvOtqx1PJC/t9myxie2JWi
BtLo4hUdL2bqE/vpBWpADrCNexqeRwvDEIGDdoceYrQXzWTYrZ+/HyCiUi8iavkv
9qR/h8hVdBcF1PoRhbW/Qy16J+46ow==
=zKN3
-----END PGP SIGNATURE-----

--Sig_/Jp4wl8DYUdE/c6mctH5Sgb2--

