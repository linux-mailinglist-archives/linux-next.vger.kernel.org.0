Return-Path: <linux-next+bounces-3301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3C94FE2C
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 09:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 588C7B23A57
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 07:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E4642A93;
	Tue, 13 Aug 2024 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HV/6Pj6X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630F41C69;
	Tue, 13 Aug 2024 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723532397; cv=none; b=SK/jRjXMh2wVOCmE13A40Xb39iucH5WG5UBky0UmgvXh9pL+OqFun3PK/+tNloDETDirZCmffqus78XG7XDkVC1b66Urc8BzCkWwU28rbkRxwWCKPIaJ3Zwlp8mP3t/8I07FFWTgf41o46LegGIBto12KRja/5IE+vP926EQE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723532397; c=relaxed/simple;
	bh=VZr9+g3TonfhfL9O2H3JrlZBYqBBMFGNsrt75xLa3n8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9ro/AjE+StgiubYBNVghm1kscHkWftigVswdVCzMCVr2PQBi7qCUyK6gwdqOa8X0T39Hqwm4AkMH57BD7yW5t6Uo5a0Du5I2WyF43KmnFtMNAvFX7Vg7C5hhoAB7lRzbIyVeKufk/obb3c2LQjTLGZyr+0LygihMQn8f6mMAJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HV/6Pj6X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723532390;
	bh=KE/bfftZEhpL+r9jdzcURqXZdm0w4ewKA1C93p1/Tu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HV/6Pj6Xqx87KuIiZklkCf5ORCrtvqO9iCreOvWWhVJt5se1CAvLfQZqLklbidS0v
	 4iaCsBDZJSuvmCf6lKzO1gXVmRCcH9Tcu6OhbsYMJjfILUaDgXxOJtli7YumfY7PSB
	 BlexM0zPMa4PTXTSl3MHScBD3HI4fja91tyPt4iADXVBQM8zZLvW6JNEe7FfgRbJ4n
	 ZciAwkmt91k6c0R9M3zrN28AEeTRai6mHhDJuHvU/4fbO9wfn8fWGzOdbCCwvw9gtL
	 gIZs0RjjqHU/7cIz1HeMeiQM/24MjNX2RHoUr6P/bZA2Zo+/eHb1jgyWKhxIBUkEVI
	 GjSZEWBRlbLEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wjj1d06Dmz4xD0;
	Tue, 13 Aug 2024 16:59:48 +1000 (AEST)
Date: Tue, 13 Aug 2024 16:59:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Rosin <peda@axentia.se>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Christian Brauner
 <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Leo Li
 <leoyang.li@nxp.com>, Richard Weinberger <richard@nod.at>, Thierry Reding
 <thierry.reding@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: linux-next: trees being removed
Message-ID: <20240813165946.1a55bbf3@canb.auug.org.au>
In-Reply-To: <47cf6a9d-82b5-65b2-0937-d7ee667f5d26@axentia.se>
References: <20240813085147.786004fb@canb.auug.org.au>
	<47cf6a9d-82b5-65b2-0937-d7ee667f5d26@axentia.se>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BitRUMN9eqAv345BS0NStcx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BitRUMN9eqAv345BS0NStcx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, 13 Aug 2024 07:13:08 +0200 Peter Rosin <peda@axentia.se> wrote:
>
> > mux			2023-05-21 14:05:48 -0700
> >   https://gitlab.com/peda-linux/mux.git#for-next
>=20
> Could you please keep the mux tree for a while? I have been very busy
> lately and not much is going on, but I would still like to be able to
> get things into -next. I guess I could just ask to include it again
> when I need it, but...

No worries, I will keep it in.  You might consider fast forwarding your
for-next branch to v6.10 or v6.11-rc1 (or something else recent), then
I won't forget this email and ask you again in a few months.  :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/BitRUMN9eqAv345BS0NStcx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma7BGIACgkQAVBC80lX
0Gy/YQgAlPgP5kCYemlK+sYh3FkqwNlurx0FHOcHDrdvJAEQcrqYxjtPvqlEaCgD
h2XTYiiRiv728wkPnbZbV2mLqO5uXk2mmZu642utAKS5EDcOwmcw0+/swHiU/qTX
6WCL6H9h45KFnMeFCcGxTqMHgaZfZPzra81DXOPRacT+5UzQlEBe5r9VlZiivZHm
gsOC44B2iZBt136RyF7saIXDGqqaqf40qSrnqhpUjNI2firaZuqdXNsyrjA6Sdbz
MQNwKxzO/f1XAtlLeXksxISXaVPzws+fZT9X+3o8H+SeWe6Is9VsWjZfUfBkSWxp
cfOdrAp/G8l15l4nS3ORJSOecbmwVQ==
=XJgJ
-----END PGP SIGNATURE-----

--Sig_/BitRUMN9eqAv345BS0NStcx--

