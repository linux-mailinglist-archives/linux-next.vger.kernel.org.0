Return-Path: <linux-next+bounces-9461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699FCCA952
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 08:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AC59304CC0E
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 07:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA34513C918;
	Thu, 18 Dec 2025 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ntVljVSZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC823A99F;
	Thu, 18 Dec 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041648; cv=none; b=WIJZoexSlADB34tMJ6VqtXwH83Cv5tiHRsz2hr0SNT3NodZ/02CXFFZic3hJDxnP2WQ2wQhQrThwkyqpAeIX5gNCkNqTaEW0m4UjPy3+trlFLb1jJMougJ7jDYXudqh3ftzuURmQjBtxEuExO/LvDUUPLOTjP/Td2/lrbeQbwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041648; c=relaxed/simple;
	bh=wM9Vu+TbKzimy8ZPyrTYK3liFaG0FBW/opNwYtAzAkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tgded20UBepVo/1NWyBP9eG5rub8fFbKv9Duam9mwdufkvEVACbupKpJiDmFitoM+j4mEkm+kWs+237OTjyLkPKgKIF5Tb+f0Ynbxffe4KUCq1/yr1c700CyD0N0mQXlToTxfPz8kFQC+G87ne8YHm7XAVLs4OACpf8aJhaDTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ntVljVSZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766041642;
	bh=dOLMd9gQdgGFvZVAt/z8fMrq6phMUnqAujwDVbKAFqw=;
	h=Date:From:To:Cc:Subject:From;
	b=ntVljVSZ8VCup8fzVxMyhLfv39GpvFTfulb8jiTn4MgBTeZa/8l3B6hoZuXDmmq/3
	 5mbDdpgOu6NkMRLdGgJRmIRBIkuVa/+OlZdJPd+C7HcNMkveY5fam1O0mKQIjiZ7m9
	 KBijMnWBKzcu3FSs8Go+m+vup94refY8DujNCn4XI917xpnEG5TAzPzxMtWc8Ngfch
	 HW6+UeNV6J6pFCEd/o04gJqPL51pNmtZBWvdQROLgWcx6ctAIPtnZuP2GznESQQimh
	 dYw6sEVk88KcG1Gsn8XxA2vyRLeVeIt8k8ZkhVWFSZH383gbHm6Uq0xeDHLpsLz0bq
	 m7SWZARpPeK1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dX1vG1nyYz4wDn;
	Thu, 18 Dec 2025 18:07:22 +1100 (AEDT)
Date: Thu, 18 Dec 2025 18:07:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: changing maintainership
Message-ID: <20251218180721.20eb878e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_M9xq1uhiG/dORbR=DMwzEr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_M9xq1uhiG/dORbR=DMwzEr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Some of you already know this, but this is a general announcement.

I will be stepping down as Linux-Next maintainer on Jan 16, 2026.  Mark
Brown has generously volunteered to take up the challenge.  He has
helped in the past filling in when I have been unavailable, so
hopefully knows what he is getting in to.  I hope you will all treat
him with the same (or better) level of respect that I have received.

It has been a long but mostly interesting task and I hope it has been
helpful to others.  It seems a long time since I read Andrew Morton's
"I have a dream" email and decided that I could help out there - little
did I know what I was heading for.

I hope to still be around the kernel community, but just not so active.
--=20
Cheers,
Stephen Rothwell

--Sig_/_M9xq1uhiG/dORbR=DMwzEr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDqCkACgkQAVBC80lX
0Gx6LQf9HP3eAr8AARDJ8t+auiGFCzO09rXXLZXkHuuF6FdaHwePW5Ejb9xSnWCB
YqqbTUeoJ0Ywtl/b1mKf+cDSIe06/Oy8ijEiH88pI3TsO8TyeVFagkE+BbQOo/s4
wf+L9t3gFSJki2uk/FZXn5XfHFbWoyRhWbDQEfCqRG3+NihsIHMkwkGa5hUw+ZW2
SgKP/Ed0WKdXMbCSAKZbGN4Mx/BbT7lUvnbl9RNQ89HGTcIc/gY8cpJxI42SICL6
iJ44VWSB+bA0KUDeuoEKXnJKcV/Y9+FvsMK0sJYGmd/8zBp7O3Wyxl4orHjXfhpd
kCWaHL3OxQovmylym8rh9O/tFyEzxw==
=YLPF
-----END PGP SIGNATURE-----

--Sig_/_M9xq1uhiG/dORbR=DMwzEr--

