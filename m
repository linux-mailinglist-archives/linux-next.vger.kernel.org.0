Return-Path: <linux-next+bounces-4072-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE598E8C5
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 05:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7347286A6D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 03:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47F11DDEA;
	Thu,  3 Oct 2024 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WcK/zkh+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E13110A0C;
	Thu,  3 Oct 2024 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727925535; cv=none; b=mOPjyOWxqbWpmxfdoTmbocnS4Xc6DEF5NPOFMuo2I+lo1M9FVCntn5hvLIwQicrmDurXWiogm69y8+4NtDOV6N29OKNfEA8JTaDraCHSdCrPJ+Yu5b/7uTIrbjlg45KwWFTOQjb8F49wh38pA7jgf05UgkHBKeEA1Z9Vb8YYwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727925535; c=relaxed/simple;
	bh=wxGa2GlRlw4QcElZIwjg+iANkn6BSXZgIaQxhbUFUNo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4XOpZx+9HS1mSfJYSYaEMIy7HOmPTjx8uLXWB6kGppQoBU7GTMoOYU+ev6cGcgq+pVhPyVdIvIQ36KZsnto9LFD6sKLob4SkWvGSgSaI4HBg4BZmLcI4c2KLEd3jhGWy9Wh2NKpI3M6Gi2iKZoBKZkE5LTvxbjO4NTZxczMreQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WcK/zkh+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727925529;
	bh=sDvw8D1PI1ZTzHpg6uOFCydd3DerhO2pfO6MVvc+MUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WcK/zkh+movQQfKXtEpCKn0L1pA72Z9c7ZkspDf6ri747oEJGOCqW5WmXJY+5VR3A
	 Np2jnn2BRM7s9eXnhkHu8Fa8EQPrQBhIcXG3sn+ccYwoc2xxm5kR/D05UsZLf0KgNJ
	 XniNZk1duNCUUybeJ0cV30kUO1sduimA+rbzUtihbyBm7QySxATfEt/wfGY73wEDx/
	 C5wzyeky+k37/RTxKPslxGEcyXQbZYfl5WAEBON0aepLHOQpAYAG/SiytRZr5DCstr
	 Xbz4T/JY23NZA176XK76/fE2b2WmAhBNjdRpp0uoy2JVYNcsjV8z7G5gnh5pTdkKQL
	 FUk4LxuYjfHdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJxj55YRlz4wcl;
	Thu,  3 Oct 2024 13:18:48 +1000 (AEST)
Date: Thu, 3 Oct 2024 13:18:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the block tree
Message-ID: <20241003131848.62a8a6e4@canb.auug.org.au>
In-Reply-To: <e6971851-477c-41c1-b0fe-1d813f8b9319@kernel.dk>
References: <20240916183622.105641d8@canb.auug.org.au>
	<20240927134337.021b1ec2@canb.auug.org.au>
	<e6971851-477c-41c1-b0fe-1d813f8b9319@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ExcDI6eatqy.hGxnZPhq/ie";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ExcDI6eatqy.hGxnZPhq/ie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi All,

On Fri, 27 Sep 2024 04:20:40 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 9/26/24 9:43 PM, Stephen Rothwell wrote:
> >=20
> > On Mon, 16 Sep 2024 18:36:22 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> After merging the block tree, today's linux-next build (htmldocs)
> >> produced these warnings:
> >>
> >> block/blk-integrity.c:69: warning: Function parameter or struct member=
 'rq' not described in 'blk_rq_map_integrity_sg'
> >> block/blk-integrity.c:69: warning: Excess function parameter 'q' descr=
iption in 'blk_rq_map_integrity_sg'
> >> block/blk-integrity.c:69: warning: Excess function parameter 'bio' des=
cription in 'blk_rq_map_integrity_sg'
> >>
> >> Introduced by commit
> >>
> >>   76c313f658d2 ("blk-integrity: improved sg segment mapping") =20
> >=20
> > I am still seeing those warnings. =20
>=20
> Due to travel, didn't get it queued up before just now.

These warnings have reappeared today :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/ExcDI6eatqy.hGxnZPhq/ie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb+DRgACgkQAVBC80lX
0GwyDwgAkys4dlHAJrNWx75TrAGxhNzm6FkqXNgaSTnxyOHTIOV66BMSEKjjNa4j
ImREv+i4AlrEagD0Z1uWzzUfULy3fC9+0uxp1Tv/VcGUoJJd0jrWnuIQL59B1dIK
ps1TinqTWb3+gzWR1lW/JBlKvi66lPpXjDRB6iUJeBqoNu8rJvRuSBOitCzLTn+f
IEWE3lWoncNEOtwQga825hNhwGEfL3bvSkx6yT18tFv6h5GOsc+QHcX2TCJ1tK5M
0zHzJwFLX0RacXvgmg34EhuP248dcLCHaEeI0Xl1DLZu8e6xi0jAABgXsGWOOfGX
7wRnQragc+LmCSrWXC4baifdYT2hSw==
=a7ts
-----END PGP SIGNATURE-----

--Sig_/ExcDI6eatqy.hGxnZPhq/ie--

