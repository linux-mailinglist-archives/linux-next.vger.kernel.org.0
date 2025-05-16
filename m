Return-Path: <linux-next+bounces-6815-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC7AB998A
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C996188139B
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A747231A37;
	Fri, 16 May 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fIaI54+B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1022F77D;
	Fri, 16 May 2025 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389394; cv=none; b=hjEKYS5oljpbQUrK09UYu8D/Trj9qGKyRgmfPeZdq7DtJpkhLKv1LUQ9fwyp/AYXcDgW1EZZYDjlO7DXDXacSm+9r3gsX+DG1JN6Ns1pAX061D/rhf1b1vZ42XBNOky/YiJnHw/5AJWTKSaj/z5ZfeR89n9U5v5yFp4bAkjyOJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389394; c=relaxed/simple;
	bh=wEsq/EugUrAourWcqA+9i7TXsSPX8Xeax5oxtp8ZnZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxw1tKly8+GWlSzz0lpi2jyY0PQG/WFM7dGLeBm670K/nYJSizOQ5wVEI27SrSEJl8JGqjUhXLIy1ZgVm28uAGxG0w/GpgWm47X39oR6upv6hJ0xk9nlciTvy6cl5KNunFlvte6Gm58KvSVjUdnql1cMefaBy6NW/pzVM2X0eXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fIaI54+B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747389390;
	bh=cb85dVWg1we1fk0xY734p3uoIb9PJIpo3bgtAyyB54s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fIaI54+BJyZE9e5dGkmNvGliH3tKiEShmEwFIi5tgj7ZBT0VexU1j+EXH4veIXFCv
	 JWSzKwbwIow3YuyKl/jezue3kk/FbHap/wDunssKJuv3uniX+UegDGk5GxDT2TeI8o
	 61dUr2pojsVxoucr5dxtwddWeJGphmNmpmUZUyM+pmm1s9C3G0/wNxmLlh4YyNwt3K
	 Xj1fMEuQN2G5YJjUcUM2uGo9Yrmlu5wscoB1tvbK1PSOBmTtMtmSKw3Rmpaiu7/Tdj
	 z1YavU6cMX8MQcQZDSkWyHyjSBG1hnLjQYuPfW0ydKKgYHo3Y9bw9Y1XtdHGlpZHoe
	 pPJK4OLFGMijA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzMt56gYyz4wbX;
	Fri, 16 May 2025 19:56:29 +1000 (AEST)
Date: Fri, 16 May 2025 19:56:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-intel tree
Message-ID: <20250516195629.1d15d4ad@canb.auug.org.au>
In-Reply-To: <aCcLH25PSNqtPeSk@smile.fi.intel.com>
References: <20250516193436.09bdf8cc@canb.auug.org.au>
	<aCcHKK8FflYRhx2m@smile.fi.intel.com>
	<20250516194237.03371ba7@canb.auug.org.au>
	<aCcLH25PSNqtPeSk@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=b8W_+jr=YSpoRK=0sSj0Gt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=b8W_+jr=YSpoRK=0sSj0Gt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, 16 May 2025 12:53:35 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>=20
> I have just sent 20250516095306.3417798-1-andriy.shevchenko@linux.intel.c=
om, it
> should fix the error here.

Thanks.  Hopefully that will be in the gpio-intel tree soon.

--=20
Cheers,
Stephen Rothwell

--Sig_/=b8W_+jr=YSpoRK=0sSj0Gt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnC80ACgkQAVBC80lX
0GxXeAgApki5Oi+6edw7affeeRPVktBIOt85z5oiQWChJXF6yPhmRZ9y98jIbCkz
bCPuAlCIFJXGqUznkJ4AtZ5WHeLSimn52ht0oF9BDaDtWlJjLkW3W4tcLYVI58zn
O9udWIF0riaROrrjGh7fNDitG6ppa4XtGgk5iSely/DC64KRSkUidSPzKBz597ny
4JgCd4HZ7HlNXrHKtUtKPpZpgMNw5+aUW+0kwRbTkak+oC5QH2Gbj3ulHiD5p82B
EqP3Io7mryfzDY9e3C9a9n9bA+DO4fTU+a3aysMkQEYbwT8YrxECksqzM7TsUgVw
VAKbhYXusPOOssD9O6hxU9ELjR6+ug==
=oEdG
-----END PGP SIGNATURE-----

--Sig_/=b8W_+jr=YSpoRK=0sSj0Gt--

