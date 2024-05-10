Return-Path: <linux-next+bounces-2259-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D58C1EAF
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914C01C22199
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0515B543;
	Fri, 10 May 2024 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JetRuolg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C32B15217A;
	Fri, 10 May 2024 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715325054; cv=none; b=qIkkcymTXeGPFKeREJG93yqfh4NXSdw53SD0i3sFedmJgeciiYRAX/EhzMr7LfWMXMrAagWG7HVkLk+8kLtVb1FefOs8uZDUV2vteARLNPCm/EAdFa/mFj0xrFnRqI7phML6HCAfouw3KatTYH9j6Vto+fBLrPk8Kq5Nhtnp87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715325054; c=relaxed/simple;
	bh=91uA+O7LaVa+y2/MyVhYHsTtYOICk/7/5I17xeo8sEU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VM0T6uLcyTU43ME7yrY73BIL+oeepULiEHXLQp+hcfPBTbCWvDL52FyGot8Y4cPGr2Si4Q7nD3O88a8cSSrWTptcWV/+pEwG4fHihjysCEv+dUaOs7HDMv0aoom/S6iIamlTEQKmTli49N8JC1Hc4mJ2wX6bWhjGfLZbD3DCJVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JetRuolg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715325050;
	bh=91uA+O7LaVa+y2/MyVhYHsTtYOICk/7/5I17xeo8sEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JetRuolg62V2a1Dbfd//ggCWvcVJGOfChv62JAStKKEKPGAkMg07x9t/WaT2gS+YQ
	 BypybJwy97qPLpWKeGGmF+5I9IpdvdZI1omI5Uw86VvddGPeX2diObFaEEGewRF1Wn
	 q0etvda5jR4/cL/ykVcWYyHF63t6Ya0HL/f0ZfKp0ceLwrJAbl6Lk4sX8oyaxx2pWd
	 61uaBsVM5+CYdv3ObgatKb/P1o7BD2TqEfXLpyL5n5Tyx76RZXMyWGxtZzvMAUY4Fx
	 nqK3Dsamd+tJJa73lXueKj+dmW6c4J0CFCwbcU8RvLvTwcM4zBCgBHfjO3rOw/5hRV
	 KmbAjrmilgd4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbKmB3mKTz4wcn;
	Fri, 10 May 2024 17:10:50 +1000 (AEST)
Date: Fri, 10 May 2024 17:10:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20240510171049.2e0e3c56@canb.auug.org.au>
In-Reply-To: <20240510170827.2b655636@canb.auug.org.au>
References: <20240510153212.246fbf31@canb.auug.org.au>
	<CACMJSev6EDeLdQ0e7A7f6AMhh08FznA67x5ONG+vSseC5QLt6A@mail.gmail.com>
	<20240510170827.2b655636@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TiryxWMPeUDXpac3mjWVpQ1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TiryxWMPeUDXpac3mjWVpQ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 10 May 2024 17:08:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Bartosz,
>=20
> On Fri, 10 May 2024 08:33:37 +0200 Bartosz Golaszewski <bartosz.golaszews=
ki@linaro.org> wrote:
> >
> > Thanks! I will send the fixes upstream today and then pull v6.9 into
> > my tree before the merge window PR to fix this conflict. =20
>=20
> Or you could just merge your for-current branch into your for-next
> branch and avoid possible issues with all the rest of v6.9 ...

Or, since it is a pretty simple conflict, just do not merge and just
mention the conflict to Linus in your merge window PR.

--=20
Cheers,
Stephen Rothwell

--Sig_/TiryxWMPeUDXpac3mjWVpQ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9yHkACgkQAVBC80lX
0GzLTwf6AwCZOAHCAJk9sixP1L2st70phXQsjSmCehEzPvLHsKHCwujWFm7xAMV3
lrwDfroCla7emvSpq4RCiic24GbNNfRjONdQwr70ECMdtqfks9dsauaOoxfy4HlS
H8wM+qHufygwR+ZsQ5/ZGsX9Kv8rAirLAp18ei/p2Hlb6ywUrSw28icKvguJiGGU
l9q6f0Q1AVpyuA2tRt8nvhbud/FJt5RpLzBFSnHrvdu7NsipfjEJTOpAiSV7U7vv
oOI913yfGJtFheHz8uZWve3H48Z0BB42OqhYtmqA9cU6XKtLzkC/Axk8fadF8nYu
eGhHI68Pj/tL3MwffliapxEXBibQEQ==
=P9ZB
-----END PGP SIGNATURE-----

--Sig_/TiryxWMPeUDXpac3mjWVpQ1--

