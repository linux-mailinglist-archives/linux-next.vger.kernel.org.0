Return-Path: <linux-next+bounces-9432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0740CC5310
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 22:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B413040664
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 21:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7342FDC3D;
	Tue, 16 Dec 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cnn3yXId"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6324A058;
	Tue, 16 Dec 2025 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765919895; cv=none; b=rf5HbseImpgN7ufUtlKsPWr6NupkyYm3Pf3733gsCQhDZ7hZPPfUNBLsE81NHKOL+9q2of/mzrNTRJz3AyuzwOvaF+Z+0qhhPHdHoZ5EKy8Ssa9X7ro+GqoT94dvxNPz4KIVYEGtPZ4hPCkwAROPkkGUJ6sdAcWKJ1rEce5JcUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765919895; c=relaxed/simple;
	bh=S16++XRyjpmZECOuhl+nWIsK4xOtGNip4kusMeqwueA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dpWJGRQ3XLqdM7YX0CQDvNl2Hz8OS7uSHDlF8v75NqRm/ENV5LEaNLYpVt2+wFvcvT1HNlkS62FKUUR2DlZbBm7465+qxDQoqaydnrzjFD0QFNgtscGDaMPPczFJtrZYOzTAtn39ZHrKC/29Njr1AN4EI1khrhx/Nt4YtaaZxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cnn3yXId; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765919888;
	bh=PPkTAVylZrbWSxRQm96PnxJJn7K+nCl/En1uL5yPE0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cnn3yXIdok5TETsJ7w4ANbWkj252SyjOyA9hsb7VFiLT0Fzjm5FOfAAtL8PvywL2q
	 xM5ULDXl40ieV5FaX9zi6RJY/AzfHr7SVHgHD2cqIFiGU1Bb4Z/rStLZnJyioTZDdH
	 4xoCP2RsEUpX1HNz+mDr3eiX/IfVi4GrTzPV/wYqrZxO48iNc51swZTwJ3u91wxslK
	 6YN7FhRGr6fxBwnp7v4UeCAgBH/sjYnmPnmktmwtDUE+12baG6DH+CUgVBilwdtNCB
	 T2UoVqBGIERtGuCI/lQV5HfBQwrz549Ktqu1aOXKRuqYJ4Iv6Xnhl5vkOqQ6lu846j
	 gXOxafxW6FkCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dW8sr37d7z4wBD;
	Wed, 17 Dec 2025 08:18:08 +1100 (AEDT)
Date: Wed, 17 Dec 2025 08:18:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host-fixes tree
Message-ID: <20251217081806.3fdc6b5d@canb.auug.org.au>
In-Reply-To: <20251215090225.0b606b8b@canb.auug.org.au>
References: <20251210081243.31ae8740@canb.auug.org.au>
	<20251210082333.1b9554b8@canb.auug.org.au>
	<20251215090225.0b606b8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U+Cn9fvJcK1PgLZKNl63O8Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U+Cn9fvJcK1PgLZKNl63O8Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Dec 2025 09:02:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 10 Dec 2025 08:23:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Wed, 10 Dec 2025 08:12:43 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >=20
> > > The following commits are also in Linus Torvalds' tree as different
> > > commits (but the same patches):
> > >=20
> > > <elided list of hundreds of commits>
> > >=20
> > > You have managed to rebase a large amount of Linus' tree into your tr=
ee.
> > > You need to reset your tree to some tag in Linus' tree (abd then add
> > > any new commits after that.  Your tree is usuable as it is.   =20
> >=20
> > "unusable"
> >  =20
> > > I will drop your tree for today.   =20
>=20
> Ping?

It is still unusable ...

--=20
Cheers,
Stephen Rothwell

--Sig_/U+Cn9fvJcK1PgLZKNl63O8Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlBzI4ACgkQAVBC80lX
0GzkpwgAhJvnQvy5xHA4TMn4ppHXVD9EXVoKMv0Xio0HIf2tC00Hrxz7DlH6osX+
fzT54rh9t2Enos4bsgYynDfQoIe3KnmR2mIC5NjRg7/oQ11x+zTzJ25xrfqRXUce
pxf7P71X8yxEhESu7e1oe7JvRQP3cA1NDNCywie+5s0/3049EyNk79nQslL6A1wg
YQLQxBdYzMIWERcXlNCWUkIxWv52N+VJKJcJZ8bMR6J3ooALPXv7cCQhOWSuy4M9
XHZ6I8pAG1px44wBqIyi1iMRLhjDi9ozcpwGyRwwT1WkVtt3eARt6H9CBP26deyL
7CTeMgzucL26F2xO4JsM2opgQBQzwg==
=RiRy
-----END PGP SIGNATURE-----

--Sig_/U+Cn9fvJcK1PgLZKNl63O8Y--

