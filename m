Return-Path: <linux-next+bounces-3741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2C97499E
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EC8A1C252F1
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 05:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE7487BF;
	Wed, 11 Sep 2024 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fCjZQbNk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC561FCF;
	Wed, 11 Sep 2024 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031808; cv=none; b=g00V4/g5rYSoNFH/vq/XowsyGUUaq/O0O72HFzPO4LYU3SwRD6gXhE6HFuGdku+gxkqVLl8I4+JVwgN2VGyDUaknoG0Ldmz4JAGpV6nQ3nsK/g3KUdjFeLw34EIWrdlb7S+5po4MktOghBN9wNyERvk3CZr9flc+FUulW6mAZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031808; c=relaxed/simple;
	bh=hYCJ0s6dm+F/sT8zwaT/MHfyuEhfjOX1lpSF/u10X9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XhrJo4gxln+hciODSCBT1XA3FKPHGeR6WRslmO7DIm1jpQN81yERwF+DF/Fj7lSMo32Au2M2lumJG3nmPNnma2x4GdY/8/if01h3DpBeTqVBy7cq7X2mWPvXoYwTae+2oOxzjyfQNCnvnSymE1ULTYn6g6fx05aR9N0fg9AS0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fCjZQbNk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726031804;
	bh=r8Dwz2/S4WQ7Z+JfjAm2fy++DGmK+OantWD8t5Cj9qI=;
	h=Date:From:To:Cc:Subject:From;
	b=fCjZQbNkUpRVJfNOjBFZWFFHQqLC9xLfqOKXXdbegp+DZqFh3EGlliF2keag8TFhQ
	 MmQH2EmUbGWHaN1X6pyu6lj6gykOlPg9GdofLEvKxhpzP0u9rXrO+K1yjubmzZkkQw
	 KMr49VqSUUUWclZiiW7buH3W3MG/AiNbRsX1gUAbzdou25HkQk5YTBIQoHvSZuft0E
	 kPU/Ougrjy4opqPRWBO40D7P440Br81yKG7giuSUb0tJ6mKeS9XkKqgkpYj+pJAXN9
	 v32DP0wQY6szaxtzWQhsz60hN9F3HkgDZjASi2igA92Ehqdc9CCLA2hTHcqikPUSJj
	 041RZGCBmtAMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3TMH2Xjpz4wc3;
	Wed, 11 Sep 2024 15:16:43 +1000 (AEST)
Date: Wed, 11 Sep 2024 15:16:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Peter Xu <peterx@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20240911151642.7f9d9e02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YekzNBF1Px3tUXyM0AkJyLY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YekzNBF1Px3tUXyM0AkJyLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  02b4dd56f5ba ("mm/arm64: support large pfn mappings")

from the mm tree and commit:

  699fd9104967 ("arm64: Allow to enable PREEMPT_RT.")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I wonder how this would have gone if the "select" statements had been
sorted?
--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/Kconfig
index 3943898f62c9,e68ea648e085..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -101,7 -99,7 +101,8 @@@ config ARM6
  	select ARCH_SUPPORTS_NUMA_BALANCING
  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
  	select ARCH_SUPPORTS_PER_VMA_LOCK
 +	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
+ 	select ARCH_SUPPORTS_RT
  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
  	select ARCH_WANT_DEFAULT_BPF_JIT

--Sig_/YekzNBF1Px3tUXyM0AkJyLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhJ7oACgkQAVBC80lX
0GyxHwgAl5Gyp31ixq5yQAP1KQYhU7p0PlHHTur7r+Xd1s843lEIlziiG8uJGegT
2j8fLn39AsE+5Mg748z+TWl+z2OI1SDGa7Ieo0V05cwTGnkCXXBxu0wWFwluNo2P
7Oen229G3rFtdqwUEVL97TkTgbYVmnBA+6pA+jpjZe6DUq35sKDepZ4Xx86I29lG
eMveupzqwR8AyFjfJx8EiuXjhRBr8psqX5nPM3OciqJCgDTZP04cW072GzMGhsNC
2xMQrrzEfN1wIWPTlxDI3Yf0b4884zLdVQrc4CE1RWwRJ6QIUFKrKo5iItlWee/j
16FMQOk5E4q1cBdgEvwHiMdqbFLyqA==
=gYCu
-----END PGP SIGNATURE-----

--Sig_/YekzNBF1Px3tUXyM0AkJyLY--

