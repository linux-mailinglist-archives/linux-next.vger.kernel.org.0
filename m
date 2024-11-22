Return-Path: <linux-next+bounces-4833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76C9D58C5
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 05:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C691B20EEC
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 04:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97108155308;
	Fri, 22 Nov 2024 04:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qz4Gw5uD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B867603F;
	Fri, 22 Nov 2024 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732248042; cv=none; b=OxZ8Uq0bA9Oh6ypHKHFz7WYSVIIHI+xbMXnfYUcq3Tz61B3Ucw6jfVcBD1XnfqxU3kfKmtpRhCyuxWGzQMipNgaL3mKQslb+RpxZEZ+ggQWMLwCKUUnPSpPuXriLFlIKKD2mtJmDrEmeMxNrWWmoGYNniAYBBKDjU25h1XEq8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732248042; c=relaxed/simple;
	bh=qKIf34OkFC2YM6N84wF8TKhsdSfPIyLMzdhm9Rw6EH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V8WJelEdT7goy67s/W6NiVi5nXv26dcnhNZRuEbMY5a8/Xe9rm4o3eqDDPSdkkvemEK26CuXTLiLBCjZBz0c4skfN+D4xbBj9/4zcuu+bVqrBb2XAtYtwG4fq7OKLkhhEhD5QcWflAQOTiG+LiSAsMyhTjmCJuv3qqxzJFScRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qz4Gw5uD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732248035;
	bh=Rdt/cP7z9YEqAD3dvmt0bKLkrU/L2GCLdQEwhHFtwt0=;
	h=Date:From:To:Cc:Subject:From;
	b=Qz4Gw5uD9+cpZxGFS7elp9OYxK/3/2wimGhMKaJ0BoP6NlzXRR3eOcfxhdofjYZpc
	 NhvUYOq8CVlcvgms75+Ei8xlvN2pJn8t++FAAM+PsQzlk6ZFSN+fv2/QEk3qVI/jSW
	 VbBL7FtH54JmjUV1Cps4px+Pt2ezGmHp246oF53MPq3RSR9ZhMQw/TUzS+OK+JJ2vB
	 0LNd3qxDk1RXeky3jh+AMAYSeaofNzBBesj7hMkMlypjDQnlYjDanWcqdUTBMbNmaf
	 rJDqKhwtqCqAxyvky8wDtS6MW4Wz/bqLcHZBfuGSY/PU/ojWhyMXsOB1/s/3RcRWNi
	 hzCk814HexDZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XvhGC5YJZz4w2M;
	Fri, 22 Nov 2024 15:00:35 +1100 (AEDT)
Date: Fri, 22 Nov 2024 15:00:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: linux-next: manual merge of the kvm-riscv tree with the risc-v tree
Message-ID: <20241122150038.680eab25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Al/oLvNfFhFhjv6fSzaij77";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Al/oLvNfFhFhjv6fSzaij77
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  arch/riscv/include/uapi/asm/kvm.h

between commit:

  1851e7836212 ("RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests")

from the risc-v tree and commit:

  97eccf7db4f2 ("RISC-V: KVM: Add Svade and Svadu Extensions Support for Gu=
est/VM")

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

diff --cc arch/riscv/include/uapi/asm/kvm.h
index 4f24201376b1,85bbc472989d..000000000000
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@@ -175,8 -175,8 +175,10 @@@ enum KVM_RISCV_ISA_EXT_ID=20
  	KVM_RISCV_ISA_EXT_ZCF,
  	KVM_RISCV_ISA_EXT_ZCMOP,
  	KVM_RISCV_ISA_EXT_ZAWRS,
 +	KVM_RISCV_ISA_EXT_SMNPM,
 +	KVM_RISCV_ISA_EXT_SSNPM,
+ 	KVM_RISCV_ISA_EXT_SVADE,
+ 	KVM_RISCV_ISA_EXT_SVADU,
  	KVM_RISCV_ISA_EXT_MAX,
  };
 =20

--Sig_/Al/oLvNfFhFhjv6fSzaij77
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdAAeYACgkQAVBC80lX
0GxHgAf/f+vqaqPuN77tVobiLbHp9RaHeV0poD+mUubimEjqTsDzB2a7MF60AsWE
gHNnYdCfPhGOBSBvMUsBM3zO4v9YlSjuUTYQ/fDsfqhoiP8iSbGlfbAz8yfP8WWd
96qtYcJB7+cX6ggD/lA4soLCcUu3S62yePqiRRRwm6FHYapYtdYXxDOvgY7kkitd
9aC8tiI7yXTUzqB5cLhNKmK7eqzeSkY1SHi9F4rIhcBorX/XXJOLQL0kQx1HVGl6
5Z45e9o5XW+OF4Po3vJGSh1EB+HXPLNJ98wvIVZYHmQXbnVDOuoACUQmipGwQMTV
8rS3U4RdjHHlJaaXnXsNIP9qZPkfhQ==
=qgFg
-----END PGP SIGNATURE-----

--Sig_/Al/oLvNfFhFhjv6fSzaij77--

