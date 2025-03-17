Return-Path: <linux-next+bounces-5845-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7640A662C4
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 00:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C019917029C
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB68B204840;
	Mon, 17 Mar 2025 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="apWNZs+A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921441A7249;
	Mon, 17 Mar 2025 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742254513; cv=none; b=lANDMxzHN5StjhyP9+eC25p2k7KrjEnT3Oynzmy7K88ACOFu3wvwnH1uGbJE1l+SCdtA7ttujY9kz5MvlHGaqnwH6idNJwGEzct3UsPtLW0z9S8DxUpve1Rhf7VxX4ArBVyP0ytzZB97vWqNag2FvLqv8wX/ZBmGjPEIspWhFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742254513; c=relaxed/simple;
	bh=7UoWRwyHzqBBehirgFLNvlLP+45LmrF4dy3eicA0GKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbApUtxHsMYn5rKNQ9zjgPM5DSawOEwrbWCWkfO8X0XgZLOwe4k8Y6JnXVL7H1oQwhBz0dtf4EaRWzJI3y78FrdgOaD9ZX0ATIhkf47JWPAu2My+Cl1R7BVx6z8xsVBmyL2bOjyO3sBakB/IuEuum+/eDgdlVw5m8B3xDy9ZNTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=apWNZs+A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742254505;
	bh=D7cfFiiScayhlIqzpWBB2VE4W5qnbzK4TlXB83dimwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=apWNZs+An410bWexLMvKI1PqEU5bKoqoqgzmjQqlKvLalzSqVo2NIr7isDReItup7
	 OFbrUBiwXs0NXJRZlw19Mdz7x773fxlnq7u8Al2fUb27zeidh3dzwGdYOMzkJ2XZav
	 IsbVBbADCeaEOymDQNEJS8anIh760QcaierVykwEc7TOpXyLg6EXzvAslx8zcBF/mG
	 X1QjEbxGxc0K8qy470rBuMOh+ulBdfHVHWzp6tXHNuYiihxD9pQUB/mtEoXNv9o6lh
	 dtVynLCqZIDwxw78duupYzYGROJ89CApezEo30CEwA4yQKmandPb9odYfq5jixhwBP
	 YqctC1X65PPwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGrtK0QcRz4wcd;
	Tue, 18 Mar 2025 10:35:05 +1100 (AEDT)
Date: Tue, 18 Mar 2025 10:35:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20250318103504.4cbfe7e1@canb.auug.org.au>
In-Reply-To: <CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
References: <20250317215757.2412aef1@canb.auug.org.au>
	<CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/awfpBApde4zvnA23wkvrEX2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/awfpBApde4zvnA23wkvrEX2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Mon, 17 Mar 2025 23:35:54 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Mon, Mar 17, 2025 at 11:58=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > Presumably this is caused by my merge resolutions :-(  Please have a
> > look and let me know what te resolutions should be. =20
>=20
> No, it is due to hrtimer-next, which I still have to merge on my side.
> I have created an example merge of hrtimer-next into rust-next which
> should solve you mention error above -- but please feel free to drop
> hrtimer-next today if you prefer, since I will be pushing to rust-next
> the proper merge if linux-next goes well, so you will get it:
>=20
>     https://github.com/ojeda/linux.git rust-next-merge-hrtimer
>=20
> For the other things mentioned in the other threads, I have also
> created two branches, one merging rust-next into Linus, and another
> into next-20250317 -- not sure which is the one you usually prefer:
>=20
>     https://github.com/ojeda/linux.git linus-merge-rust-next
>     https://github.com/ojeda/linux.git next-merge-rust-next
>=20
> It is a bit subtle because we have to "redo" a fix from mainline in 2
> different places since the lines of the fix are moved in rust-next.
>=20
> I build-tested the branches a bit -- I hope they are all OK.
>=20
> I didn't modify anything in rust-next today to avoid further issues
> and get this part over with.

Thanks, I will see what I can come up with.

--=20
Cheers,
Stephen Rothwell

--Sig_/awfpBApde4zvnA23wkvrEX2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYsagACgkQAVBC80lX
0GyFDggAnJI5y/xmdhW+fSnakrNZbJSAtyEClpUNHb+FdbYWROVYKHavH5FdXEDb
BYTYu/zdelGpYmiWOwIpy9icsC1TiHt0byogLv4f/oPSwr5VNa6G1uJWIq+LhWnf
c9/pIVUC58gPFkyoSuhDVwKrGnItq1uIFipxuE1xuUp5gDKxtRV+RBIUdcf4nYqf
/mvDvwkSArp1CpeuN0zBiqNaYzd8fAX7emUSvsqcilf537be74l1LHTpMCh3yant
a+Q2dLkL59Lp3cllHTA+dQVsPGy9/TDOKk6Z0qC6qx9HPiXQG1s3yH+VmdgO9LVg
cRqPqLfoGz9mfYed3reM3ya6vUG2QQ==
=gpVy
-----END PGP SIGNATURE-----

--Sig_/awfpBApde4zvnA23wkvrEX2--

