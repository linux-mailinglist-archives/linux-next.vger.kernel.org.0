Return-Path: <linux-next+bounces-9549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B3CF6561
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 02:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A174301BCD7
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 01:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6CE328247;
	Tue,  6 Jan 2026 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rDi+QyPo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A5328251;
	Tue,  6 Jan 2026 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663810; cv=none; b=QCe9yiUbL48nBK4Lvp+edAk86KJtWpN9tUCVTf7W/c2K3EhW8uRRE8Dq/RbQ3w09+orZvZPBjHXjPvqEzXe2kAun9BLoHBwGGIy48XqcVoDbtuNkQk0RbYVITv9t/BQ4nM+irzErZY4lFxatCgKST6dv2tCM0g5oqEvmX2W7fYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663810; c=relaxed/simple;
	bh=KT6RWJwTj2h6y+ZZjkz/wt2ZV6hGgPiHzC12LMkq6VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RBnZxlfHSXBAskC0sB93ju8/aKfDIGp9NpZL2ZtUBSDq+DSqyev+hNHQuYsinSDKqGacsU+Ls0aqYSJyAKnhVStWMKAM61wc446wokIt1Pxwghxz45kyPWIzFOC45mj3zLTAApDLE3sSW8JhA56eM37ZN7XHUU3r3gOsrjUWhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rDi+QyPo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767663804;
	bh=brdMu+eCBNJdWk7nduKymJPFqaWGjMuZrjnlACJuZOw=;
	h=Date:From:To:Cc:Subject:From;
	b=rDi+QyPoRZq5bsN6lbVY3DEZR3acL5kl1f4lddaWh/zULjGy9FWB0Ev+KOu9ImN/n
	 imMbTVc3G99r0FlKzi4fl6HUUBOIEbTgBYYxKBQ2tktiFnont0k0eQdakksBuBXc+b
	 SdWhjwlfvHXyL5EsPNNrk9s2SjzNt8SvIHeG1MeSz20jFLqlJVujXjgz9CB/vu1kYX
	 cBRnfYEPMnRu7iCFAvwbYSwG02g3gFma9sNqpha6kgX2qaTJdtiGl4LJduMSFeI5u7
	 tRXLBsgXGAEWQaF2p1VJeuh9CNLDm+HCl1LTUTFlf5N1ArrQjF6zCWiBJvFhSWi86Q
	 Lz5/8QnAI2V1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dlYpf3Pxnz4w23;
	Tue, 06 Jan 2026 12:43:21 +1100 (AEDT)
Date: Tue, 6 Jan 2026 12:43:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20260106124321.20bbbe84@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4WPk344kP8pNq95xdfn/sib";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4WPk344kP8pNq95xdfn/sib
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (s390 defconfig)
produced this warning:

scripts/Makefile.asm-headers:39: redundant generic-y found in arch/s390/inc=
lude/asm/Kbuild: kvm_types.h

Introduced by commit

  01122b89361e ("perf: Use EXPORT_SYMBOL_FOR_KVM() for the mediated APIs")

Presumably the "generic-y +=3D kvm_types.h" should be removed from
arch/s390/include/asm/Kbuild now.

--=20
Cheers,
Stephen Rothwell

--Sig_/4WPk344kP8pNq95xdfn/sib
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcaLkACgkQAVBC80lX
0Gw46Af/VWwPXjgYWLz/1kMcrR/dntjGWRP6iBoYtneCNFPPWBhgpy/etwEpvMJp
oekmL88bpiSvS66Vrs5ANWefmSbtPFMQeQTx2gqnhYlYGkTPqSJ0VKNzmxakBZDY
iHXFSobd+pjIMGG5T6ZvYzv7TXd28roDxJPuM0fwHx258mJO1KEpGp4cYCdpBUIJ
kJeE66CMR5KvVNfxAcL+k0Z07pFT0b8wn/V1DFE/6+XjoioK2Oo3FJb/v0RKHSOA
ZLNrCkeyHcRB90RZb1S7LXJdSwijNtYMoWACiQSXDcdfLTO6afRIkyRZN5q/AeRH
e2sYE55hdRZFu3Q2Jg4BNaQORcxMdQ==
=7rWO
-----END PGP SIGNATURE-----

--Sig_/4WPk344kP8pNq95xdfn/sib--

