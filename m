Return-Path: <linux-next+bounces-7262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A4AEB039
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 09:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5CD11C220F0
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 07:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043CA21771A;
	Fri, 27 Jun 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iST3r6EZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C19B21ABDC;
	Fri, 27 Jun 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009907; cv=none; b=kU0C8sVlxt9QTcxW+BMoL520dUSIA3aavCDY1mjtH78uI216Yn2qyFzyg6i7Oki1NVjvBaioK8QS/3RytwfJPFVRg44SwDMOHAk++PJ5tehud7UEjJ6QSyL72kn7X/akMF7SCd8FBpeY/qN15OONvB9kGcnb591nvkJoU6xX9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009907; c=relaxed/simple;
	bh=RdrxADOdsxoPnOwYtt03vlOaC0xPIDneKAjclMLallM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kYoQxCpxmfps8mhdD3LX/nzcUv0zYqzcpGkj4uee86CVl6vntxkEwGO+w4EBGPwXn8fPGxR8EI5tu6Xxe2xfB/9u2ddnu4+0wydVdz3G7DteTZbfbtifq9XAV96CQkOT6vT/kcdzn3FlzHhU941ay+HLAG8iCDFRZtzvGTzQoKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iST3r6EZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751009899;
	bh=wEmLQnJmm28eVRSRfVN5eTXV0yS9bPe1k/XZgaAzsy0=;
	h=Date:From:To:Cc:Subject:From;
	b=iST3r6EZhL6A/0MD0DTsPnJNV5/4AxugsFKOCA8vTNP0BR5stXHumDHDvjzPU7nSz
	 1VDG0cqqksVDNeG68TX44BoIv+g4mP11thL9PzbkZ30ezUkfdmsrE9H2OJ5EP3gZPn
	 7p+v9vAQ1YwV5UlUydlxGUGaNND5ohFFWXRPHIa5gp9QpZtEP/2390I7U/gsQI4BXh
	 dcmFXljST2Heo7rhkULneq448AsqoZULBjmc1MIaWDCGU0yeus2se55pPZz1ZvhYOp
	 kO4UhFRWLritEKzllH7DkE3ls8NzM6/h+gzU+na8x0LeAohN/6Us1B0tp3pxFWmqzk
	 TzSjJ52fxcfCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bT6qH29m2z4wcn;
	Fri, 27 Jun 2025 17:38:19 +1000 (AEST)
Date: Fri, 27 Jun 2025 17:38:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen
 <chenhuacai@loongson.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the crc tree with the loongarch tree
Message-ID: <20250627173818.0bb7ca3f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4U+cyd_pcmEZR.yaEqmmiZ+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4U+cyd_pcmEZR.yaEqmmiZ+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crc tree got a conflict in:

  lib/crc/loongarch/crc32.h

between commit:

  7d69294b8a8d ("LoongArch: Fix build warnings about export.h")
(where the files is arch/loongarch/lib/crc32-loongarch.c)

from the loongarch tree and commit:

  56d6d22b2bb1 ("lib/crc: loongarch: Migrate optimized CRC code into lib/cr=
c/")

from the crc tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/4U+cyd_pcmEZR.yaEqmmiZ+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmheSmoACgkQAVBC80lX
0GxX3Af/Z4cUDyIkPznxilO8xzmll1vwODfc0V/yLlp3fOj3QwrFE+21+yfa+RHF
rhymFUfj4kURC/yVeJDWRrh4cJhgHNDIjlUGnM1Tk9rde+qjAx4YWmIGDgxOjnpL
THYXEk9dtZ5/ZcvAL4kVAhuSmGNYPYIxOjqMC+CQWyM5B/vtjyU5F0FcIOa7PaSq
fOlAtEOQIDGkySIAlP1SJ/nlRoxaIhwfcYnW7pQpPJRG5MyvZFJHztM4YQHOXbHU
sLYsFuwEGfNHWAV0eXsoqGUpppRtrBHuBtuGgyayfRx4LXHfD/5caEy9wKe5kdB7
5gIrlShGRqXgdfB4B3cyxqqqs/kDIg==
=3w+R
-----END PGP SIGNATURE-----

--Sig_/4U+cyd_pcmEZR.yaEqmmiZ+--

