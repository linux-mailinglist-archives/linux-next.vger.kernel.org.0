Return-Path: <linux-next+bounces-3608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120E96CEE5
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 08:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1295B22079
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 06:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400C5155725;
	Thu,  5 Sep 2024 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WqTYDIYk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D02142E7C;
	Thu,  5 Sep 2024 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516543; cv=none; b=RjIpcr0Vn8Pm0fd8/bnCh+2NXjWrLvI+fIt9IRgzWdRk2LYAnOhctohXosBCRKd9g518sceDwgUJfK4HhnfNfyYxOIA5N4pTkzuwQD5MZYG0WBgl9tX55BmUJRPBtEIggzEm02vk38/agdgiUXOHOEkuC9sqmIT7oxlDc+JQ18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516543; c=relaxed/simple;
	bh=9QENB0o4nyaLfofSyD6RoLN4QRJDKtxD1J0WUqjOKWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CkOde+0OIBKks3XRQyh06JSMHBLHATovauwLXtoYHImf87gv3hR2xhtxX3qX3qW70UvTB7veO5z844nipcMMBUUL8PkSzZRvd8ZHFhR75LndKDMf6OtqvmuglT0d7UufG+V0MP/ZbBMuLxZdEkjw30NqmdeVvn2Wo/BnsLgXPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WqTYDIYk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725516537;
	bh=06INmMRoiDRBYZmnHdxOF/I9YWke6O4gL0HIUGjiKsw=;
	h=Date:From:To:Cc:Subject:From;
	b=WqTYDIYkTzUmiCf/0pXwl8KOBvvuCS7llKStBWLTY9dudnok6NZ0NCG7KKtlj6ySd
	 BzXbMSqKtMllNO7UTkxC/vhgcd4P7pgeqVHaSpjL8q3Hidt+e41VQZ3NBwEXAkHTMJ
	 7kGX5hkJmf1k49Ij3JuKZ42XRx0wDbi+lFTvMeRwXuNDB0u8O4a6JsZdPfl9AjnUKu
	 xzLlJzVG8u4t5e3V/s5HAzUcnxqyuBSD/vVdwvx8AGqOturQsK6WHElXit1P9DGW5H
	 05VLjMfuQDcHqKy8lDk512I8gezCcnYndSS++mcX7OYH1F7Gz20h792j50YKyNwOzR
	 Oq27SXGprUCNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzppK2Ntbz4x0H;
	Thu,  5 Sep 2024 16:08:56 +1000 (AEST)
Date: Thu, 5 Sep 2024 16:08:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20240905160856.14e95d14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4mMHkZjH=44Y7SmP_.x7.Ja";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4mMHkZjH=44Y7SmP_.x7.Ja
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/kvm_host.h

between commit:

  b86c9bea6349 ("KVM: arm64: Save/restore POE registers")

from the arm64 tree and commits:

  b55688943597 ("KVM: arm64: Move SVCR into the sysreg array")
  7d9c1ed6f4bf ("KVM: arm64: Move FPMR into the sysreg array")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/kvm_host.h
index d5857452a1ec,b9ca899041db..000000000000
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@@ -446,8 -446,10 +446,12 @@@ enum vcpu_sysreg=20
  	GCR_EL1,	/* Tag Control Register */
  	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
 =20
 +	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
 +
+ 	/* FP/SIMD/SVE */
+ 	SVCR,
+ 	FPMR,
+=20
  	/* 32bit specific registers. */
  	DACR32_EL2,	/* Domain Access Control Register */
  	IFSR32_EL2,	/* Instruction Fault Status Register */

--Sig_/4mMHkZjH=44Y7SmP_.x7.Ja
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZSvgACgkQAVBC80lX
0GyCSwf+JOJsuXfEsXD2/W0H804WC71DFcR+OL2W8QeCNOdZQxF9lNcRYnAGVPZ6
idlvG+zOyc/egKWrywejeKPvLZ8udwTKR0RdUfrdaEaBZzIAMa2ymd7WXksP8RPb
zZqK9WG5CrR+97WU5/owlDzr0p0M1N/oTyPemuuJwxtvMMUwth9K0tZizbfQqsdD
ObTpOEv+GTWVDXkqEgAV4shQ3LJ4UEJzvYQFtH0Vudo6u4z6OQjy014paBzGHkj4
Fd8PByDzDEVZ+gFHi0ysEdFlPZlYEDPW05jGSwbycn8IZOTylYCDIGc4q1BrxhZB
B++VS5G3i3jfe8aJ3DB47oOfhgWlWg==
=pcu2
-----END PGP SIGNATURE-----

--Sig_/4mMHkZjH=44Y7SmP_.x7.Ja--

