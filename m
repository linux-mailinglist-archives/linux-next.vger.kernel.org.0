Return-Path: <linux-next+bounces-2168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179508BC468
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5C31F211CF
	for <lists+linux-next@lfdr.de>; Sun,  5 May 2024 22:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F43D136E03;
	Sun,  5 May 2024 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EcH2t9Rw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F171B30;
	Sun,  5 May 2024 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714947070; cv=none; b=CSmMcgdruEO9fL0uruLLmMPgSbdbov1AI53WOdc1q91uNhREgNIx3wg7IZih308NVgMG+JL5ZGVU1/YyxHjgSk6JhnJYy1SIkxnLTQVI2xUGS4EJn62IzR6AAoRnBYsOjhsOx2ei60fuKHnlHpzYBi0qWmCNSHdXnvNwRgBtyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714947070; c=relaxed/simple;
	bh=bCK/wd1r+A9YrrItqFQsjxzM+cRuLDupzWwSwQ0ervQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tFTGtfX4FYDK6sD2Co1T2Rf/5T5st42S5FaAQ5SGmknNZifPdz7+3Od+UOwDyeB8yNoUr477PF6VAmmFMA2T+WBRC7Z4MUcNGPy+jtWN7Ye45X+nof7ucleaiqu5ANuNXXlLBPcPg7oI8A5rfXr8x7bAaNKecmQk/u5Ena2ZPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EcH2t9Rw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714947064;
	bh=lROlMkRiXzsog/6xFay548y+Ms9wZUZ1ySr0ErBUm5k=;
	h=Date:From:To:Cc:Subject:From;
	b=EcH2t9Rw+xWAUVj1G+HeA/LDNApF1CIXgZF83pleB4czVHPvuaXgRQwcq0s/tNfYN
	 swRz6KcuIVAVFOI1ZKBc9sjfPw3kpJkjQAnYubPLnUfVb33hB6/xjPCb/8vlQ92w8Z
	 OvQ9QOBnj1SZ+dcb0MwZ/5+TNMyQUOC9rdZaFscdhR5dRxPgU+PInlqhVivk4nxDVO
	 254yDM/+OIojUFOmVXnwk9IlrG35Kq/r7DMYGiIfHtH2tqb2JzjwbywdimARcukHJx
	 NTWETlPODAYjcsUa9B7OjlQeVODcQs1nsP9bE02NR/r3/DTPNfTmVjX7YywDWW6Dvg
	 7cFFbIewQaacA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXdzD0DbLz4wcS;
	Mon,  6 May 2024 08:11:03 +1000 (AEST)
Date: Mon, 6 May 2024 08:11:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the loongarch tree
Message-ID: <20240506081102.2a2649ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n1UjIE+.X38v/nT0Tt.0x3i";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n1UjIE+.X38v/nT0Tt.0x3i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  35d074dfaab3 ("LoongArch: KVM: Add PV IPI support on guest side")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/n1UjIE+.X38v/nT0Tt.0x3i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4A/YACgkQAVBC80lX
0Gz5YAf9FrvpBKqRdQSj9eSDWCdIJTHflhzyhmxznW/Y8jNgpPBHtysZ469494RF
ngpXgAPSMLJw8lcfN9APl2Zqecel/oXjYc9k9iXdgsGzyndFC+Gv5UwE4xD2fVBh
v6C7vD0GAU9ywJAj0TCUr+0ZVAS/QJUYjCCxx/qcITE0gnjZeG/F83IE2PmyKYZH
CYryqO1FF1wQoM6Sz83k0dIkeHKIT8N8M/H0l8Byyx3AiOcn0e+4fkTGmcv2UXiF
sH+HQJSDCCPUafXrFYjOJ1WItqLnvT2ZwsnBqRi8gFEUwN7AcIkNrHD2ejSho+nD
4i6tbA8QUjDUqp9ofORQyFkY5nbXvw==
=rCr8
-----END PGP SIGNATURE-----

--Sig_/n1UjIE+.X38v/nT0Tt.0x3i--

