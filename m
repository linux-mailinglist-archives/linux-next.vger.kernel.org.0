Return-Path: <linux-next+bounces-6819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96AAB9A66
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 12:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4621BC421E
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1190E219317;
	Fri, 16 May 2025 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fQeC30ve"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302A52AD0C;
	Fri, 16 May 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392248; cv=none; b=GsV7huHJhswKLa9Oytbc6nIZ2QYeTPCIKn7k3oJfbjX7ikl3w3qbv797ctyZOxg2wcgdg9ueCH/DCL4flxH7RiPuTvT9va2GXsIqRw8vMY/nSYgsPad91aGL9TaX7yMkEe6SXhaAN7+pGQ2pBxQLLCa1pDqnfCj3WYlwUOhj4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392248; c=relaxed/simple;
	bh=7XQNgE/UNdV57YTgPeRhM0kqgXbMbs6mnOa2aeLZrbI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzRsrR5ISfqjgE/3eirXDpm2s36bf8+dmtBbkCKo4kDHW/S1IHHPEI0e/rX35mj2qKG6rkckptUTVEeDCC//DayNjcFelT0xRtDGZLpVgQBWQqDlguFlKqlvI0vVHuoBaKmQk1AKADVJOgqt4oLcn52Ntiuo5BQ+f7dDX+5a0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fQeC30ve; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747392241;
	bh=D7vV5KrGEGpNVWEegKa9mP6z/xQZa6xx8RgL8tKoWLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fQeC30vea13aAOCrYaXqgQV80jWLKdUUGkl3ieCCWMmJkGf/6HXJCzTFiZJdbQA+F
	 dwZ3Q1KvYEQtalTYnLsepJ3+usCjhEqOANQnA/Ijpa03WCwyzgBBhYkAwLpFU9Fchg
	 UhJY+0nYe+Hxx7H8ZJ+zwnX9C07/dXsMfSSqrpnpH3WMCgjB3ocCX0mfEi6MNTmrn6
	 8QbiLP845zMZziIHJcBIx5hhfzOUh0Pj5aHBMyzXGXdtxyHV2sXgkMR/gXn09uyqRU
	 Zoc+MIwqX8DNZXyHKVZT3meGzl1P1D02L6Z2tR/br93JcbX7z+i1Y3MxpuW30zirfk
	 +ekD5qWT8K1ww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzNwx5Pnzz4xN2;
	Fri, 16 May 2025 20:44:01 +1000 (AEST)
Date: Fri, 16 May 2025 20:44:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20250516204401.5faf1d49@canb.auug.org.au>
In-Reply-To: <20250516100650.DORnSyZx@linutronix.de>
References: <20250516200350.63be46cd@canb.auug.org.au>
	<20250516100650.DORnSyZx@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1FMZwLOrMYyjbI9plMQ5=rk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1FMZwLOrMYyjbI9plMQ5=rk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Fri, 16 May 2025 12:06:50 +0200 Sebastian Andrzej Siewior <bigeasy@linut=
ronix.de> wrote:
>
> I have good news for your. We have a patch in the tip tree since a few
> hours ago:
> 	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3D=
locking/futex&id=3Dbd59f6170968314c82e2b65f8bbaec55896b7a5f

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/1FMZwLOrMYyjbI9plMQ5=rk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnFvEACgkQAVBC80lX
0GwEdgf+OI5f4iOpfZ5MCEUbv4QgpF3FOBaH+Yb3DEsdVhoqAHMAUHtF/YYnJjdZ
XmMuI0Fmb8OOQF+x9m2rTvpMj+Bc/6cfjDRf6ucPTGEDu6UpPntZ0kpnzVVFgtiM
Mpy/ly3rrcjRH/D0NnfTaIc9/HwgvGQyMiMa2RY/41PSfuc2kV7K42wsN/5TINFV
Ck7qJGnr7A8b8nFjUVGuSBqEufa0p9pb333SHQ7PLwRizIzXb+v94Pa9ncxRr//H
unPPjH9e4dAqO40Z/hfd3E7J2N++/cjsrTAg+dAPEKx8s8Fr99eRn5hSePzoWGYg
IHXpwPt3X/J/7qUYTeRlf/jbJARq7w==
=ogvj
-----END PGP SIGNATURE-----

--Sig_/1FMZwLOrMYyjbI9plMQ5=rk--

