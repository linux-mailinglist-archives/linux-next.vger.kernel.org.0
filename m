Return-Path: <linux-next+bounces-3337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0F953EEA
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 03:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AD01F23CE9
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 01:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CDDBE4E;
	Fri, 16 Aug 2024 01:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IJRCrFGc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B720E3;
	Fri, 16 Aug 2024 01:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723771796; cv=none; b=EUlfyRCCIPesFtYuJcKL/EpD9kX7ArCkMNIrv/bkOVP6fagXgOZgfbiz1rF8HJ6Oe8Ja5USB5PJgwnQHD8GTfT/GSNf3h3UVFiJHZwozCiu57YeEMJ3w0kjdeBI+a8jO6eroJovrJOb5d0P45DN3h4npF/IXMuZuiOoOoenS8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723771796; c=relaxed/simple;
	bh=IKN1KI1HOhFsGdjfdZE98WtlUGfSO/KE6OFu/nqp+yo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PssO6UEvF6LPoJJY4acym9t2RUaD2GkKHAvKoIFF7hlD44wjGHpkwgYgPdFP7+yVtMJd0/q8UKq9ObZu7g4cP0sPwrTSot+l9DVqJI2x4U018EsAG6Ycng/m0tKyikYQMw9Y7EuhNpVduYfwBb4w+LqfD2rRxO9YRJFl6DvQWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IJRCrFGc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723771780;
	bh=WFq9OLooRceg9aUlrPvdcvhjWX6Ym6Z+ATEt+nRgojw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IJRCrFGcdp9QD5deGYGUuhf9Zn2t8+1yu8wY58vKYC7xvvShmAwNFCHoBiajgADu1
	 yBteSXQ8uTO6aFpjM3UyCm1v0A0Z42JUOnrTXeSdWqNEEaCmisq8O3PqNHedUXv9Fd
	 wAHpQ4v7YLbH/WKnwEDfn4LbZTwTKkFXMnjMdD5xrcab46If1OGBx0+YhnkIgK6HGU
	 FkcqF6Toab8RWSNxWMu6AxidZETyjjtwe31O8mNv27HaZGJkSEIE1OaI+8ccqd+zq7
	 gJF/VkX0jH5prhTGQIclWgCDJZsStOXmFGCRGOg8AKtuhLYDxrcpoWsbsIXoPl35FC
	 tzi+OxvIhZiUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlPYJ36Rkz4w2N;
	Fri, 16 Aug 2024 11:29:40 +1000 (AEST)
Date: Fri, 16 Aug 2024 11:29:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20240816112920.55d293bf@oak>
In-Reply-To: <CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
References: <20240815093829.275058c7@canb.auug.org.au>
	<CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+1t+iBdkgm1NK2f=ZKsco.j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+1t+iBdkgm1NK2f=ZKsco.j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Uros,

On Thu, 15 Aug 2024 09:42:51 +0200 Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > Caused by commit
> >
> >   8e53757638ec ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_P=
CPU() functions")
> >
> > Does include/linux/err.h really need to include asm/percpu.h?  __percpu=
 is
> > defined in compiler_types.h which is included in every c code compile. =
=20
>=20
> Currently it is not needed, but with the proposed patch [1]
>=20
> [1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.co=
m/
>=20
> that repurposes __percpu to also include percpu named address
> qualifier, it will be needed, because per_cpu_qual will be defined in
> include/asm-generic/percpu.h.

How about putting these new functions in a new header file
(err_percpu.h?) and including that where needed?  Are there going to be
many places that need these new functions?

--=20
Cheers,
Stephen Rothwell

--Sig_/+1t+iBdkgm1NK2f=ZKsco.j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma+q4MACgkQAVBC80lX
0GzHzQf+PlMuymnx+AKcIY2EnKdjjkYY9iBPF7t4F8yQw8NBfJ4UFQ6DEVxZmoJH
eoimbAA83wV/MSq/cOorm+UeVAw+LcmkTxz7FtDWAeFdAWJXKzKXPt27LrS5dESw
79ilMVRjgd83ADH9DyEzA2lM0t36fKWtpMhwIWZgD1Dd5u7k51H9aR1BA4XiPKh3
1X82p/genUaliAillQIEGY8gdbhSY2lOxv1b9kqdnvAZpagEJ9G4Ze/5geix3XXG
iO3nnESJm4SmXP7G8y6KaAYqaTrLYr5lH5sUf9Q8l6JFD8aUNT4370AcO4VM8Fd6
Zao6P1oLFnJftem3wNLCEa9g5uhhiw==
=mDhS
-----END PGP SIGNATURE-----

--Sig_/+1t+iBdkgm1NK2f=ZKsco.j--

