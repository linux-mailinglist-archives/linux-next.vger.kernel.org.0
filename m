Return-Path: <linux-next+bounces-9394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3499CBC0BD
	for <lists+linux-next@lfdr.de>; Sun, 14 Dec 2025 23:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59C0D30088A6
	for <lists+linux-next@lfdr.de>; Sun, 14 Dec 2025 22:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA05280CD2;
	Sun, 14 Dec 2025 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IhFMv2fO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9D2741A0;
	Sun, 14 Dec 2025 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749758; cv=none; b=hGmeSS00lMVl12GbbkLqaZO9pVqT77xVm86R6JQp2szp3B0w73c4dzT1euExOpp76Mt7tlJTMcIIgE8zRvtNTl8FSq8PKcppKYS7BoEi8HhSbIeK6zxF+VG5jBVackRrPzZisd3+FxByWs8LdU12JKW1poEhYg2jNVxcIQZ4598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749758; c=relaxed/simple;
	bh=Dg6dBimztfpxKiGvVIXluLtN8bG9FMFcImd4JcGVB5c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEBK8H59GSrsPFHgI6HNCjUxexzuntj76XDciR5lOWBxFGHEEvGVNq0ioacZUNWt1PuE2R6ryI0gCtKy+9HC5n1UyY2j5K9hEDvTjR/2+leVf27EUcGDOm+OPrB42xiRUJWBmMZdc0JraJl3rjK9/gnZgepDH9gkRAm6/rYm2M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IhFMv2fO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765749746;
	bh=VVAcwTSfLysdou6zB+jR9K8H2KZiVTRtPnWDNpIMYXo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IhFMv2fOGmLzWuaVkZSnJQIWZJWn4rIms3Sj96PH1d1UDeFJCX71IX16J9qJRACZJ
	 +C97eoSmM9zOL6AozQJ6Db7ZJnTIf1ApjK5m/KBkD47YoWBA6FIK9V0nMZLvUz1sR6
	 vT5BL/fpL20V1fm46RQi9YeCxmlZzZNUIgekgj94Dq6IjSr8VQDuOGpvqpWWETJUaK
	 r99GO5YbMHPPPeOQKq9Yu0rV0/o2siJcTq79INQAiH6VW3DVP5hVk8tviKnrhTvP6i
	 wOfPpfbqn1kG9uSfxNiiQxWv3AfM0xQcHQANUeOmb5KMjJFPMc5AB+8UZGw3CyZzCw
	 NJXVdj6N3/JmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dTxxt3BFQz4w2R;
	Mon, 15 Dec 2025 09:02:26 +1100 (AEDT)
Date: Mon, 15 Dec 2025 09:02:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host-fixes tree
Message-ID: <20251215090225.0b606b8b@canb.auug.org.au>
In-Reply-To: <20251210082333.1b9554b8@canb.auug.org.au>
References: <20251210081243.31ae8740@canb.auug.org.au>
	<20251210082333.1b9554b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=YTGpRsF4.2.E8DBSvPJHjq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=YTGpRsF4.2.E8DBSvPJHjq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Dec 2025 08:23:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 10 Dec 2025 08:12:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > The following commits are also in Linus Torvalds' tree as different
> > commits (but the same patches):
> >=20
> > <elided list of hundreds of commits>
> >=20
> > You have managed to rebase a large amount of Linus' tree into your tree.
> > You need to reset your tree to some tag in Linus' tree (abd then add
> > any new commits after that.  Your tree is usuable as it is. =20
>=20
> "unusable"
>=20
> > I will drop your tree for today. =20

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/=YTGpRsF4.2.E8DBSvPJHjq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk/M/EACgkQAVBC80lX
0Gz7ywgAplPJW113QNZIvOnw5q8dChlqH2VvYIwdcTzJXEua5X08sSTNHKAkgZ4G
M1E2aYNSkUkV1cFO0Mpp+zsF4Q7O+tWSYr9IdSxDz+XlGgDQI/h23kUivBwS3j2r
06G+cGAF0WlhrnfXkzA/DT/1th3AJ96mbhUDEetfusJHW/AgqI67x0gZHj7LpTzI
DzuyO8Lcp9JT9Gi//22cy2D//lhO8ifaBR1pznxeSwo6Lq5aM20pEtS8jy3wMbTh
bCAZfuuF5CziN8Cq+Bd1kl3jzBQ782zMHywckCRAxphLMf6jt33w5xv0wzwmrUto
AsgpMGwmvOMhDFKanZPMeixCZOfccw==
=G+V6
-----END PGP SIGNATURE-----

--Sig_/=YTGpRsF4.2.E8DBSvPJHjq--

