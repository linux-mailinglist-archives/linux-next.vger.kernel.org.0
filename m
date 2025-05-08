Return-Path: <linux-next+bounces-6598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE9AAF6B8
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91B99C4E7B
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156332571D7;
	Thu,  8 May 2025 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="etTWGR0W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE52144A8;
	Thu,  8 May 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696441; cv=none; b=BR6ZJnBnZBV8GDTRwNl3ILkvBKDcI7xa4JhORJBWzRNfxGn6z6O1TOrzYvGO2d7qqLYbO8I6jLDW+L75LwmNKduAVfxwSx5vYMZ6D1eyLmYtKMl0wodByRulCvw/Wv0Nkpi0NzZPO85FJWAiFXSD9v7jAQn8a7qP5KRaVQVxz6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696441; c=relaxed/simple;
	bh=0erWkF40pUIGwAGypE58a7+XvzGDRJetEZCo9MO5foM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCR1u4dib9YfJKo/afSK0H/mXrd6W4qpJjZ7VSVNHwfOj7FgQZfVz3IHsftY8RiKcbe1vVH6RFaWjcf6EcEAjVWkypxxf0I6xAsZ1rbMEVrUo/HzvuqVP91/Ug4H27hEaTCOe7/m9OvOu9jA5oqQWte6J3kTGHGr8iYVynO8sdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=etTWGR0W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746696435;
	bh=0erWkF40pUIGwAGypE58a7+XvzGDRJetEZCo9MO5foM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=etTWGR0Wll5fBy9t5srO8h/sXmNhgcI4x8MxXW13utYR+H+IL+a7m0G66tUmeGjmI
	 MDdp4PD0mYQ7CbsXjJ/4+mUJZbxbNPERBD8hISz8yPRah03psDg76Qv9W6zWhy1DI+
	 Xpm6uqW6BB2YMai/7X0lkiolwnaS+Z0KiUU5Nh9Br4cq2i19KqVawgtrndLdiDh0rt
	 sjiGobXikchTjZLnXMC1mp7kZyONAUw2F+KB24u7vpoubkkn/yfPiVI3NMDqg+D9Vh
	 /JFt2cu0s7fQBaB4NDHGkc+eiMaREp8k3BYJct1TKDEqK0yzUipSqe42hXws8EgT62
	 9waxKj3MJEY6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtRc25qHhz4x89;
	Thu,  8 May 2025 19:27:14 +1000 (AEST)
Date: Thu, 8 May 2025 19:27:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ozgur Kara <ozgur@goosey.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250508192713.4fd440e4@canb.auug.org.au>
In-Reply-To: <01100196af3237f3-279dac0b-ad07-4f5c-bbd7-0e0f2d14659a-000000@eu-north-1.amazonses.com>
References: <20250508182504.418552ef@canb.auug.org.au>
	<01100196af3237f3-279dac0b-ad07-4f5c-bbd7-0e0f2d14659a-000000@eu-north-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VNRsE7+549brboJktW=gpak";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VNRsE7+549brboJktW=gpak
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ozgur,

On Thu, 8 May 2025 09:20:26 +0000 Ozgur Kara <ozgur@goosey.org> wrote:
>
> Did you run this command before you got this error?
>=20
> $ make htmldocs
>=20
> but the error shows itself because index.rst is not in need requested
> directory, please run:
>=20
> $ git restore Documentation/index.rst
>=20
> Can this solve it?

Please see my second email.

--=20
Cheers,
Stephen Rothwell

--Sig_/VNRsE7+549brboJktW=gpak
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcePEACgkQAVBC80lX
0GyV2gf9F4QSC5T8YyDkghJMlrjWYKzoKDEaU1zZ/hxM8Q2EKy6w9oZhibUVZLbh
jJBv1pIwfzdSFXORitr1a3J67oGD8DV9Mo0qhh+sy/4S9RFVm5CxMLj+M5/RKkSt
rBST6WDc4hv1FPFEN3k+boGYWMy6FzPohB16yziFQj9FylTHTS83hzQYCF3teheT
6VAkxgy9+jBJ+tlsj2fM6ncA4g4dS6rZh1ofZtuUxY6foAsvN551I5Ww+26jkEVf
Ee91zfO/nuPoR59KL/CmBQUfAfGOK+ZlRzZkcixxyduRdvoDJhW5qoNwU9DsPwqC
XtTPtCPtOwt3u5ce+DIHUN35uPohbw==
=5KsZ
-----END PGP SIGNATURE-----

--Sig_/VNRsE7+549brboJktW=gpak--

