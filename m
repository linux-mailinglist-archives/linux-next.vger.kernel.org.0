Return-Path: <linux-next+bounces-6159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC6A7B6AC
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 05:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E436189BDA8
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 03:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32E02AF0A;
	Fri,  4 Apr 2025 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H3kL6MPW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1284689;
	Fri,  4 Apr 2025 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743738035; cv=none; b=O6+kvse1JLarADH537HuWaoB7SThUD95DyeC//CRBd9ErBsdvvxtGSVbtGdHPIyaRsyU8cLEEtUwDWfeU4YqONdLIoxK9AK/X9f7lgN7lalcChVtrNYk7ZptxMIrL2ZFlq/Li+QJX5EyMBugb0dSTZ2scoaG6fpSoYntqI610aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743738035; c=relaxed/simple;
	bh=DvmDzuXaCilJDt/FxIBKe4n7YJz0dlU1VFkzvLEq3/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N7NkZQLQ3eeKBhYzGK9rRn7fAzqKU1TEvfdJejT4D3i37KyxRyzq2+1wjWq6ywpe44axeCy+8dQcm5FjLCH8q9ZoHBiI1nF73IOxv2QlpgnxUHPpbfZSHR7XbBmCTVjZqa/aV3cc25YQnWDCmRDS/nqt31kScrnzjWkaeg9WbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H3kL6MPW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743738030;
	bh=7vu0EdCOhGEjErHVj0J2NvdtTi+JMtUt3Mx1qru7CME=;
	h=Date:From:To:Cc:Subject:From;
	b=H3kL6MPWKczMLN7ZhAZ9GiKcpHD36X4gzg23lgWWF+5eD6Gvwr5jPQw2kZHUiwzKI
	 sTMKW6aib7TeluWrQrtIvZpnyY/R5SKDYn/Wgqijr3XP09ERhfVOX7JkAc5QAlSndz
	 dc+YfbF5SuJnR5yjPkMj1lD2cOdFBq6C+7FLRBLcRxiHrPt+MTMCYo4tBoc01LEH+R
	 M+8g4ZnQG3Z+hWSgRV6rY2fbf4YwKKiITB9uVbO0jrrrgJzWNvvGAZAuS8otbv+lsf
	 j2zq1C11w5stZPUmODC77xxqiKGLldl/90kJL547XVLVeWnAmePo68dUX1xKVcMVPb
	 pMg8IZXCNLriw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZTPWf5Vwyz4wbX;
	Fri,  4 Apr 2025 14:40:30 +1100 (AEDT)
Date: Fri, 4 Apr 2025 14:40:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner-fixes tree
Message-ID: <20250404144030.78e21c89@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nGhadcBemrMg6J_tXExYfRA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nGhadcBemrMg6J_tXExYfRA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  f5ff87a84a88 ("fs: actually hold the namespace semaphore")

This is commit

  c0dbd11ada2c ("fs: actually hold the namespace semaphore")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nGhadcBemrMg6J_tXExYfRA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfvVK4ACgkQAVBC80lX
0Gw83AgAj6+6TwLiHEcz9eixuBceNKaA7p2Lsm6NKNRzCc/zgY87ZnlMyhi3d1DE
m1+CZvYxFoKvqqofnmuJq8YesgKlxiph/PRcB64AgdU0JwbbUoL9XQ3snYl4+enb
xh2UhWBwCMMt4GnE23cJjNXGCzpCGKGn2QSzWhccsewxmZ8pY6t4qGe7Z9Z5WKag
TicBfDvhANM/NGL3GtkefZ6SrJeyuSZu30f/He+5pv2G3346XLdubYasJ3v1t+a9
ApK+GY3w4Z2oAYXkyt0/3okJx2BTc97AmND2TvKkKrD965SYBOBCU+yQKYBxYG+Y
Nwi2O4g2l0gA9ox9pMbu0f/7Anh4yQ==
=oQf2
-----END PGP SIGNATURE-----

--Sig_/nGhadcBemrMg6J_tXExYfRA--

