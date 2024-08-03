Return-Path: <linux-next+bounces-3221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F169A94688C
	for <lists+linux-next@lfdr.de>; Sat,  3 Aug 2024 09:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974631F2164D
	for <lists+linux-next@lfdr.de>; Sat,  3 Aug 2024 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE160136338;
	Sat,  3 Aug 2024 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KPvG6B0i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061C2D2EE;
	Sat,  3 Aug 2024 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722670713; cv=none; b=S26CeeGq9rD7ZAK48ezxx9eWOEccONrbZeUg2lmea6cdEGqeFsCPORNb+IMZBmR7t9Et6X2K0xi36G0DgtZPErnuL2Jw54yCEnQea3P5Zr+ev0DuNC0z7CbyirGgrxkm1jYYu5kOlYndf/czMs35oPjIBjvWU3WVCeVb6HkoZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722670713; c=relaxed/simple;
	bh=n8doIJ/4dFdeGOKckWB1A7HnGQOdLFnIAefL5IyIIvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XugQUVJaPuL4VkCK8Wvj13JWUHOEhkQiO2lki0z/5yOfT9RQrUEg21GJIsonGUUpwiNXAWC943suHIqXkcktWjx9/IXkOXeijiL5qSSuJkGqY9l4CPmFZDhFkYFOLRktVhtzvCzNX19Cq4JdvJXD2eTWQC/yCjbBvqsHC28fPkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KPvG6B0i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722670707;
	bh=HcR0a5td/JPNyJ8T94+GL56wlz2LR5fBNgA1C8UPaUM=;
	h=Date:From:To:Cc:Subject:From;
	b=KPvG6B0ib+UQDHmWy5fG5SzSb7J8CpZvzUOdK+U43pxoBbV64eoho6qZZGfyYwyM8
	 qWl32xidcVdRNB5bL7SSrQdd9zGubvwnD4nB0ACOM5R/S36VfLdlyGtEQIx7Em1qCE
	 LlTNv9Gwfyxq/MvJzvvOhu0W/B2FApkwrNVk0uKdoCwewwUzvvfpSY0+KnS5LI/6kK
	 2/GF3TBdnp9tpka6tX7D3GMPltp2bU5OO1InwOTSyEAS6aVsnyzRYslQi/OydYdsEc
	 nlDTAhTP5ynrVqyAi21IvgHtJPQcvlxE0sxnwmfgzEoitbaEY5dHkC8x/IgROtDqcw
	 P+nuPrZKBrj0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WbZLq3FZRz4wbv;
	Sat,  3 Aug 2024 17:38:27 +1000 (AEST)
Date: Sat, 3 Aug 2024 17:38:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the asm-generic tree
Message-ID: <20240803173826.4ace6131@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bUxDDmMu9jGU4y.w+ABU6Pm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bUxDDmMu9jGU4y.w+ABU6Pm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  a73df08ebb5a ("syscalls: fix syscall macros for newfstat/newfstatat")

--=20
Cheers,
Stephen Rothwell

--Sig_/bUxDDmMu9jGU4y.w+ABU6Pm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmat3nIACgkQAVBC80lX
0GxyVQf+O30j9fSujqKPxpK6CkV6j/oa/Quf0xSWkUMkdyufXHC3wHRZpwUJbJuM
hMWJ9YHxdyj0ku1i1D0z5p+gR9ETYIb3SgOrcexq9YbftyLpj0DtoxAZT4NJUmOr
JMGpNaK/W/Bq/drETMpkaXgyqt7VASu2bx9IPEWP6ukBRDywwwV/3pNgoz5nG+QD
4lF3wBk+x0naNiFu3RqwK9IGN2SKqgqBO0P6rt4CxJul3naGA4FDVpLRgKkHzEeN
s8v0xO35QykBKLXQvXS0cb/0BRZ5cRduTWhXPUVEUltkxsNS5L6eEiGt5l+A+qT7
Z7asWlEDQMdkYJ3O8TzhmUrcXqWuHg==
=72h0
-----END PGP SIGNATURE-----

--Sig_/bUxDDmMu9jGU4y.w+ABU6Pm--

