Return-Path: <linux-next+bounces-3091-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB59938686
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 00:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5146A1C20853
	for <lists+linux-next@lfdr.de>; Sun, 21 Jul 2024 22:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED368F70;
	Sun, 21 Jul 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QpIMNm6y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8B1396;
	Sun, 21 Jul 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721601120; cv=none; b=qN5TD4T8lhQ1ihppEr7hY+66ZKuZhYbxPCMHM5E8P3iu0l18NBcIbQLfD9I5QUZ/QFCYeBII4WhK3uYnVkkqbZoMzpgrhcF6TCKEJ3oDBmN6IhQBVNNG9s1q+mkHOFi9e7aaH5Gczto5EWWoY/6bfECPPhlWPp79aHo7gVHHWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721601120; c=relaxed/simple;
	bh=ND8K5aZ81smhrq/oIokEPe7dyVnQOHmgy74xAZJ+V5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EHb5zcn1rusBp13KoT6VAvAk2TGvmp7XU0d4FSiP5FOpYc6P2ibrUJeA//UaOwq5C9FVOmT/IgxTuA0A1xtaEMDYCNCWPupT92YaDhFer1q1ilAJZqSZ6TiigBJUe1cFEKDgNOty+ASj2IFyaJR10a79b4GPTWw44aa96q4hzCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QpIMNm6y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721601116;
	bh=PNXawNyiS/c3XgjIXFgyQXDYC+SNEMx07f/TiXPjJW4=;
	h=Date:From:To:Cc:Subject:From;
	b=QpIMNm6yX/J5hYcKdqfE1EE7xlhlwc/TOmcmg7jToiv0l/Ik3rCsgbVTZBU2ew2mY
	 ivHdoGyTDi3HKj6alLCPO1Bar3Ngsj2RBAOc3EnwS9XJft1pRLULgcRoW15xQu1M+T
	 iTZ8bdBnLIKRFyGVTCliduwJayUL5u4sFAd+nYME5cL2XwCwPIhov+G6HReielS4hn
	 owD355vW0goNcc/rUprFiiUoAUXCRHGPXWWf6JggH6il8me415a0Ly/w1LkyBjKQM8
	 jOQDu9sVKkq+5wyiybJouEg63iJK9HwCamdItAt97aQczmGAYd1ylWuDBDTRdYuRHr
	 JkRa96PEHUwiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WRynk1j7nz4wc4;
	Mon, 22 Jul 2024 08:31:53 +1000 (AEST)
Date: Mon, 22 Jul 2024 08:31:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20240722083153.24896521@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C_QgJ.HpZ6Er+q/16M50guX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C_QgJ.HpZ6Er+q/16M50guX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c9b4f313f6b8 ("irqchip/gic-v3-its: Correctly fish out the DID for platfor=
m MSI")

Fixes tag

  Fixes: 80b63cc1cc146 ("irqchip/gic-v3-its: Switch platform MSI to MSI par=
ent")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7f2baef05d6a ("irqchip/gic-v3-its: Switch platform MSI to MSI parent=
")

In commit

  99d7fbf8f813 ("irqchip/gic-v3-its: Correctly honor the RID remapping")

Fixes tag

  Fixes: 6adb35ff43a16 ("irqchip/gic-v3-its: Provide MSI parent for PCI/MSI=
[-X]")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b5712bf89b4b ("irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X=
]")

--=20
Cheers,
Stephen Rothwell

--Sig_/C_QgJ.HpZ6Er+q/16M50guX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmadjFkACgkQAVBC80lX
0GwvuQgAmRbQpBAMoqFQpfQWOTYgUcfGmy2m/sUeMmP8UDmeXVAsQdJ6QuWnB5aK
/WY6fo5dhtiXCWumJodiRx3VBoFupvZQDR8t4gZf/bnuDwxIpD348G5qaFqUWT/g
yvRaPVQZyAN08CMTdbD/FzfGrbGOCYHQ4mItXXfU+Tptj1AVj84KmpfB8Vln7G9q
9GYdJrs4KE3aUZEdoKiCJ9/HYvvCRpy8ck5kyCTefKhdD723SCt1ivvDvvIwxiXp
ly1PXYoOD8tdj8lnRhe7i2OBbrD/eMlTDDE8zL6KxlnrBPJiiQQFH6JCv5pcFv2i
d21QfIFWGwYBfI+vrYDFdRzwwfUigQ==
=huSn
-----END PGP SIGNATURE-----

--Sig_/C_QgJ.HpZ6Er+q/16M50guX--

