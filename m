Return-Path: <linux-next+bounces-4539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFD9B6E3D
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 21:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417A71C20C7E
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 20:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3262141B4;
	Wed, 30 Oct 2024 20:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U61t0CmV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886219CC24;
	Wed, 30 Oct 2024 20:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730321910; cv=none; b=nfDZ8aws9TuBFkO9tDYqh5t/GfsI/bZELWm1ws7Te/AGebLQPXpFgEqvQzaR/DQfDeJIqEkJ7XNCcDGjoK/7w6x4dpC3adluz6yl75WOacdhnTeSKJKWJEG7BQ8/AoAgR4CkQxUgqdUMbz6b48Cm6dlmadxW7Ee74h45QEh/bZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730321910; c=relaxed/simple;
	bh=6WZJ71sYfqTqrRuN6+2uKpilffhn5yXDugtSkNSYacA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g1ciStrSiYmCKEejRZU22cB1Ww0FEnjXg49SON2rUJahuCIJF8TaqALPnexymm31INkLGSnynoB6zbEAoyNx4u+PkTtlNDQr4NDhkjXhIr/BD9+lZWNc7ABElQ8nmoLS2ecA5jsN99nE4G24ciUJpT47w4F7fCBued+BqdizafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U61t0CmV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730321901;
	bh=JnEABQPAfOI7S9mesrEFg4+kDvvkfpF9xvx6TUTgelo=;
	h=Date:From:To:Cc:Subject:From;
	b=U61t0CmVbNFYzaGPevEXxDYuIqk52NzUe5OSlEiJY9TntmzehIjQoxHYKYPhjlnFt
	 XwtoOVSjlhaw5mCqdYdPe/cH3rSiRvyhJf0KqiBctWMPQ/womqCuoYgEMzG0w5A84I
	 RIYNx/zieyH1B3c91F2tbXMT0XLpJle8jCWSlsXG6u2P15tYUu1GbqJX4DzRy0yqCZ
	 tVYPqP0H/KF+CTLHkTRE4obI91kyiApsKWuXOE4kFuMibxE/i29d0lnhuH4e5Ihmzb
	 nlDzAU+78gl5RTOBNLl/SPW93rc4GplaBbPZwoumXfxOffXRY3A9UFO4h6M8PSDFjc
	 gTOiZYU4lm1CA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xdzx86rzcz4wc4;
	Thu, 31 Oct 2024 07:58:20 +1100 (AEDT)
Date: Thu, 31 Oct 2024 07:58:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mips tree
Message-ID: <20241031075820.0ba865e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E_YRW_01KD+xwyKv4q9nosD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E_YRW_01KD+xwyKv4q9nosD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  ee0be8e29234 ("MIPS: mobileye: eyeq6h-epm6: Use eyeq6h in the board devic=
e tree")
  fa56cf6be226 ("mips: bmips: bcm6358/6368: define required brcm,bmips-cbr-=
reg")
  d22885a98173 ("MIPS: Allow using more than 32-bit addresses for reset vec=
tors when possible")
  129847db02dc ("mips: asm: fix warning when disabling MIPS_FP_SUPPORT")
  81205381c4fa ("mips: sgi-ip22: Replace "s[n]?printf" with sysfs_emit in s=
ysfs callbacks")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/E_YRW_01KD+xwyKv4q9nosD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcine0ACgkQAVBC80lX
0Gw8pwgAiRmfF3Hlj40sUaGaz7bAj/ADxyNvLaaM0yJbNhKtnM/Oh2gvtVD6j0HO
nH/dRvP/GquJT4rFTjxwyc3UWFl/T5Onz3J/BY7cAemFFyhUJFM3bQCffvwo+lOD
sVJBaQmNdXvS1m3t5iNkcPa8JihjQayrnNIhHry0j5VTJBEU7jp3VoE5nxrNBOzl
AJ6gpgHd/YmHnhiulRfApmY75keWE2Y4kSU22e2yGN5addUdscSb9NzXP90ZDsuU
HXRoYqZRKB8uIxFId6z9Zcp7m6h9zeWgJq7BM50j2nElYi1L9cI6DgWngvkLSHr1
w5JsUPBFxjV6/6cCIVIRlIi9oLc+XA==
=+n3n
-----END PGP SIGNATURE-----

--Sig_/E_YRW_01KD+xwyKv4q9nosD--

