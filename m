Return-Path: <linux-next+bounces-3509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE92965747
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 08:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9563FB211CB
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 06:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93917136E3F;
	Fri, 30 Aug 2024 06:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cRTNcrwH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4B1494B8;
	Fri, 30 Aug 2024 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997738; cv=none; b=gBntxyrLMM9sJwz9QMYGL8cpgbW66tuwatHaABsvXA1eF/2bnJbIuib+BwAek6Xo1nggSN2JQYT7HJgvuf26cSg33y8kLy2qca1bCds3HzgtP6pFHGOKSq7wvlnitakZ15XoZ2XEcCPTaZODgOlcpZFJP47DQsbTwjIw1Boklw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997738; c=relaxed/simple;
	bh=Q7tC1AG+EdXaXNVdQRANVT1cbEPcg+8haHB/y20eA4s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duTEK8AUJpvbvZNxe8b6ljoGKRhERvaTA/yay3ln9HMHmAjQKAErKTdsFArQeg/H26usv/IkbPuab5cSbBi0/evBGt6HO4Ud/bVRVNNc4VBdxKQbXAA6s1O6avGLtnU/wcTgrUxsc3G44mNSg2lGZxwmHO+bpKFmECEMXXuUvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cRTNcrwH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724997732;
	bh=R+C5XwgKGSOCnlhTRrL7/Em/ErrOM5M8BTnwZfhjshg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cRTNcrwH8BEVZynqZi162WZE8EvRk3+gkNdyPmmEUy5YghDewIHn2/DQlezpz7D22
	 hr5g60SBOV0yk1qxG9x8fwace6kl+C9BRYm9xosB/QShtGYoJWdmeYM+m2SacXuR+8
	 Or+6g3xCNVBbcNauYBwMa6frOjjHCswTMvBo75TvKiwZYEwixFxY6rUkCgQaYRQNfu
	 iceRFkbB/NMd+pCaPMznwAXJQoaA5KoNtEIa6sGKdC7TeZp1cacpYKnf6UH+FDNqY+
	 gl8f3op9Ep/L0JSDD4HdB1iXVdtY50eezMYWM8Kj5CKgUa06vJYJQSHvZV9BCdnIQH
	 3ZZ4EBeE0lI+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ww6xH2cm8z4wj2;
	Fri, 30 Aug 2024 16:02:10 +1000 (AEST)
Date: Fri, 30 Aug 2024 16:02:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Chen Yufan <chenyufan@vivo.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20240830160210.365b47d7@canb.auug.org.au>
In-Reply-To: <20240827080925.32a7aec4@canb.auug.org.au>
References: <20240826130137.631e5e31@canb.auug.org.au>
	<8734mremla.ffs@tglx>
	<20240827080925.32a7aec4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VWt9V/71Brma0118SDH3Cji";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VWt9V/71Brma0118SDH3Cji
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, 27 Aug 2024 08:09:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Thomas,
>=20
> On Mon, 26 Aug 2024 10:04:49 +0200 Thomas Gleixner <tglx@linutronix.de> w=
rote:
> >
> > On Mon, Aug 26 2024 at 13:01, Stephen Rothwell wrote: =20
> > > kernel/time/timekeeping.c: In function 'timekeeping_check_update':
> > > include/linux/typecheck.h:12:25: error: comparison of distinct pointe=
r types lacks a cast [-Werror]
> > >    12 |         (void)(&__dummy =3D=3D &__dummy2); \   =20
> >=20
> > Offending commit has been removed. =20
>=20
> That commit is still in the tip tree this morning.

I am still reverting that commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/VWt9V/71Brma0118SDH3Cji
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbRYGIACgkQAVBC80lX
0GxItQf/bpgOvzZlyzpYiMw2SWUknQIeZWDVF2zBqkI+5NIKat7Yd+yp8fRC5C/r
otQhVabJuYAW+qo7REjJQpACYjrGiYW3ArH82xUQSfVt2ySUXkSI8etCP4KlGubS
WTNeIWJYhixSoahNrEZmGIqUH7R4+lb70l5VJcDOI8oJ/JKgTTR7UK3DwiyGjmT8
gXcVw54Tf3KncFJo7l11Zj0EFBYamo0LTHSvYJUyMIiVBFJJzbS7KEm0NGZLrFE9
s7TM1wytETAg3n4aOWPf28mvRTB+2WN2V6h/lb2ZN+12cCoYAWOwaLX1nQhj0fQP
k+oH4P4cJxSDFZw5yq5dX/UieRP86g==
=yR4i
-----END PGP SIGNATURE-----

--Sig_/VWt9V/71Brma0118SDH3Cji--

