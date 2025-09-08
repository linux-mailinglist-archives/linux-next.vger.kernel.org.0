Return-Path: <linux-next+bounces-8229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1515B4867C
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BB3B7A571A
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BBD2E62A4;
	Mon,  8 Sep 2025 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TlJewlmK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B2E72602;
	Mon,  8 Sep 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319594; cv=none; b=Tv90V/wzkdag7iUSmoJkhBajy96K36c4iMKT1PWc0NYQWOQIcvKgWc/pbqVXx9sSNCae+TLd6Dm4NEVzl0d23msRkkAFAgEp+/j8yu1t9USd5DF4kQhzk/YYoWXOB5jlNUqrOCzkcf2v2NoV3e4CdbjrR5LY5qmIvyjO8PCX1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319594; c=relaxed/simple;
	bh=Bg7hpjqVmHqdsaJUWMHHH6a8dl3LEhEbwpfonC8IYhc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZkZ6R3Mlg8Z5jrsWghOdmOQkKUuT+GlbXryZxSa16hJJu1HVrZKhnWaXyudug2v/BezWqcWvkAN4QHnLjhVIZH/XKDfjGX8RqBcqwbQrICxkKPBbFCn8YbLEbUWHFJo7xMneWJwzw6hx0GWTa99bA83N7YtC5gyK+lJGxedNX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TlJewlmK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757319589;
	bh=k68hfVlZ1X8QVpHaZybtf7fq/v7xPmggjK6r5nWQhs0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TlJewlmKVPkiWkWIMymDoWV0FQB7n0B00xtp4iVT2mWGI+vN79ho2sG5Dvkm/ug72
	 6Q8eaIIvfj3ZkKJR+c1ups5VrqL4fGx3gDVImF/+zYFwN73Fon3LjDp8YyTRfpfKgT
	 ZW8IsrTwANG0OJaIjBpA/aZEFn2lVNkMmiQvLxO/Xy3KfqYIZEhj7Ywdlejy0KbFpR
	 fm5MzNjVDn6AjPbNcHue3+DDG9xiWAcilxahFye8uUkVMaf0vTzAo1YCTtch7VZhtV
	 TE6xmDSMuxSHIjj6nXtvybzEv8Tyip/JUTNxIZFum9vmx1qzls+rQ+bn0fLNA9wCLZ
	 KgsRCJsDvsLig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cL0HT057tz4wBM;
	Mon,  8 Sep 2025 18:19:48 +1000 (AEST)
Date: Mon, 8 Sep 2025 18:19:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the extcon tree
Message-ID: <20250908181948.283dfbd8@canb.auug.org.au>
In-Reply-To: <ddf0bd24-4e03-4346-84b7-c5caad8d885f@infradead.org>
References: <20250908160311.2184ebbb@canb.auug.org.au>
	<ddf0bd24-4e03-4346-84b7-c5caad8d885f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yi2Q8Fv3HNqD.MWnDNe2b/0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yi2Q8Fv3HNqD.MWnDNe2b/0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun, 7 Sep 2025 23:15:48 -0700 Randy Dunlap <rdunlap@infradead.org> wrot=
e:
>
> On 9/7/25 11:03 PM, Stephen Rothwell wrote:
> >=20
> > In commit
> >=20
> >   9f65e74d9185 ("extcon: max14526: avoid defined but not used warning")
> >=20
> > Fixes tag
> >=20
> >   Fixes: 45af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUI=
C")
> >=20
> > has these problem(s):
> >=20
> >   - Target SHA1 does not exist
> >=20
> > Maybe you meant
> >=20
> > Fixes: 145af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUIC=
") =20
>=20
>=20
> Is that a real commit ID? I don't find it.
>=20
> My email said this:
>=20
> Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
>=20
> (see https://lore.kernel.org/lkml/20250513210252.1139749-1-rdunlap@infrad=
ead.org/)
>=20
> Maybe some commit IDs are not stable?

I have:

$ git branch -l -r --contains 145af3ddd1cd
  extcon/extcon-next
$ git branch -l -r --contains c2aeb8647e53
<nothing>

So I guess the extcon branch was rebased and 145af3ddd1cd will be in
today's liux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/yi2Q8Fv3HNqD.MWnDNe2b/0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+kaQACgkQAVBC80lX
0Gxslwf/SWFz85ht6G7cCyi1xtFamywAMMc+WXrChAYsKIaO5t7AgWqjI2Qd3GKg
laCWjLVTaUi6pqgRVdEsFx1rFkJiY7WJmX/b667HF9I3rvh008FXP332IfN1jjcC
2NqqmWOvtAbfKp25Pgl+9u6ubao1VHjZlH42vTIcOyMkAKq3JJB6wr949xf5Ra4j
pFIO+7gGuES54rcYclycHc5JPaP2S2/X1phuKkwS5darkvAdnhNHbybAfOcI3X1A
Ec46y2bikbLd32+XTxfhOtgCP3icUS2E9OPhpaOFJWfzrSIUa1rwb5uPQWCn2thL
yJjYNdjvIF3RTyN5m8Z6MdPX36s36w==
=+LKI
-----END PGP SIGNATURE-----

--Sig_/yi2Q8Fv3HNqD.MWnDNe2b/0--

