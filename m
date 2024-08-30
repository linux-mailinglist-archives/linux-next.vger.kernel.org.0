Return-Path: <linux-next+bounces-3510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A296574C
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 08:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53F11F2530C
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 06:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0588714D294;
	Fri, 30 Aug 2024 06:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JWQiediG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012D83C0B;
	Fri, 30 Aug 2024 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997789; cv=none; b=t9gzRzURwEaw8XRO5ZixOWz0pVkqTiivlhpxDQfIW2eCUUHBxrHsJG1NLC5erC5DbmQm6R+KvVAEXNFLoOcE0kZkeHD1o44Lqc4yFC17I+n5irxr/obdS23ylhsCnORAwsbWLVc3FlPTXUHLnIfw7e/011wGu9xc4TehD2EyHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997789; c=relaxed/simple;
	bh=wkZvU5bFZfT0b1TFtgLJUO4XgwyKqPzYuSEu1PLe3uA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kwn6q8iRZl/ZZBgc9AWgVYVLn3TQwAd1GFrqPqrLg+khi9GIJaNi2S+xyMblFzKlFFzTcBLpsux7Q9+Kkp48PmFn7KdweRLQ+0EoxGq/zQz6qtshsN+Vz59CF5BNc725fx5ZvACAn0uHSAzqxmaUFXLgfCpWax4yjzJWg+2a1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JWQiediG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724997785;
	bh=dJ1DZ+DPenHM5Y1EIs6zbTCmR1vCKo6nH4A7unnFGII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JWQiediGynUx3AI5t/re/57W1+z+Fak6pDm1wv0hXSH+K6bP8QfQ9iMIvXP4ygkij
	 IXuTEDgJQj7dS9JL7OTJVHTdqDWUlsk68UiUJ67OhTIv4UxEwiVMzdx57FI/rLNuxr
	 LjEoWNV474PyOAcXVqKVZeSmQ6igaEhzTZzOCFC7Ava2wseA6RAJdWgKhgM/BT3Vzn
	 j2CUkMM2cdxJQbOL2KtaVE1mY62/HQBUS5AaGQXEHZPXIPgoIZ0ObL/o9Jg/FzrYt9
	 3wIbbqmYmdOCmU11OtzwaWOndeX4NEvO5SAxcr6dxdCoeQQ7Yt2rs28g0jayUlGMFX
	 eWzyPxmD44xwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ww6yJ4sHsz4wj1;
	Fri, 30 Aug 2024 16:03:04 +1000 (AEST)
Date: Fri, 30 Aug 2024 16:03:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Jeff Xie <jeff.xie@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20240830160304.69c97ebe@canb.auug.org.au>
In-Reply-To: <20240827153426.4499c093@canb.auug.org.au>
References: <20240827153426.4499c093@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cbTHQPiX74gFLdd2sZWuJsc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cbTHQPiX74gFLdd2sZWuJsc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 27 Aug 2024 15:34:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig
> and others) produced this warning:
>=20
> /home/sfr/next/next/kernel/irq/proc.c: In function 'register_irq_proc':
> /home/sfr/next/next/kernel/irq/proc.c:343:17: warning: unused variable 'u=
mode' [-Wunused-variable]
>   343 |         umode_t umode =3D S_IRUGO;
>       |                 ^~~~~
>=20
> Introduced by commit
>=20
>   0b39441eaab8 ("genirq/procfs: Correctly set file permissions for affini=
ty control files")

I am still seeing that warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/cbTHQPiX74gFLdd2sZWuJsc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbRYJgACgkQAVBC80lX
0GzDQQf8DVSEDZIZ63/1UpPOnJ7zP/52mZC9BWrIEg89yVERFXefwn9TJQ4QbL+8
PzQJnz08yhNhkmHExXRzhLYspozu6k1hcKQXO/iW/tr+vc3eQneUsKC7XkGuEzi5
QuumFuVrmSdvrmCx8XvfvH1JadtUnkElNd1umL01YuOTM9wCCpiM0XmbiDM2Vm9J
wpRme/NKkwVQt+Ze/GeYMYfaSAg3lEEp1w6qelvsjEZrPU6HbIImgFzOY3Pc4ZuI
Y8HtDL+7D/6onbBzpfmehoSVACDCAP7x8IDe84bQnuQh5mlNlBG8PGE6/YgdIhGw
RaZlIV2ndNTywk/8QAjoHWJk0ifz4Q==
=yo6t
-----END PGP SIGNATURE-----

--Sig_/cbTHQPiX74gFLdd2sZWuJsc--

