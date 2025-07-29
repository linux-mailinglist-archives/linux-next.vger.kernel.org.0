Return-Path: <linux-next+bounces-7758-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF8B155CE
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972E4541814
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269B927F00F;
	Tue, 29 Jul 2025 23:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qp6ngrvS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE020297C;
	Tue, 29 Jul 2025 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830954; cv=none; b=FSv3WKEKCBC1nPnXOMIIrvZcw6Ba1I9ZIwxZtjiO9lMUGeqM2oSDFVMoZ/vmSTtlt0C+/HXP4xC03sGkfHkC7EP4J1GxEsF/z/zGXmHOjkrEevcb8rrfyJ/fJ453S4rgr+iMHaaejT1jT3g5lrbI1LwLTvdMqUKXb2fIIAe2Db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830954; c=relaxed/simple;
	bh=qw7CWqSd6oZf0Z8ILiZBY1eV+DFDUmALXlkorRsMdks=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZRXOjgRv2vKJHBrMgLkV87RXAw89iN6VZ/NbEDKiDN7DtTuIjrvfX+OkxOeyDlJuIFZMHtUHKpIAggWZEi+n6fuvEgZAgO/uPA7ATxAAf+JjfzwEXcSKqtsGhhxqvcByoOdVMNcN8dPAhMZloP9f+blaHh1405iO73gWz9iG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qp6ngrvS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830737;
	bh=y1gnCkDtwbsvqAdt3oH79k4yrCqtzkqYGdqm6MG9Zkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qp6ngrvSuBw1dLd9peBD1AYYAtaQPkFW0wzhQ5pVsc16mFU16vPrLsObkZF+D5kZi
	 7UB7LvsWdLYWNzGJcfY5SuyuFj2pvZqiEnZapoC7j9PaxSENfaTJ4MtGczkh7pZZ+4
	 P6piHemhxAXtZRhQj4UMb044d23KihOUxSYo1POHkLbWMhGys1zhoMw0tC3Dc8x/l2
	 JXCT6H31WpWM4USD7pACDeoc6ExBGDH0LgLyafGpbY2ydDnnVest7s2mG50ikhPcO1
	 ps7iQDLoz1lLBWioHb0kuztAs7W8yZ0PdW7Rm5HY68tIo/OxCf4D4qSe4LO6KkRQPY
	 OpCVT4yAUOUeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsB273nlBz4w2N;
	Wed, 30 Jul 2025 09:12:15 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:15:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe
 <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the rdma
 tree
Message-ID: <20250730091548.0d669f33@canb.auug.org.au>
In-Reply-To: <20250619163041.7e4f9c96@canb.auug.org.au>
References: <20250619163041.7e4f9c96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NsXP2ADsV4nc52zm6pKZcxX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NsXP2ADsV4nc52zm6pKZcxX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Jun 2025 16:30:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/infiniband/hw/qib/qib_sysfs.c
>=20
> between commit:
>=20
>   24baad32b710 ("RDMA/qib: Remove outdated driver")
>=20
> from the rdma tree and commit:
>=20
>   fb506e31b3d5 ("sysfs: treewide: switch back to attribute_group::bin_att=
rs")
>=20
> from the driver-core tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the rdma tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/NsXP2ADsV4nc52zm6pKZcxX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJViQACgkQAVBC80lX
0GzcbwgAiILxTUwatuf4Fw3AdQd2R4FklpWSGZoXYLRQVHY63ph610qunPjYP1rm
s7JG4tcHAzLmMjRdGs7bQM3izQxGqYxIb9YVDYtjPXN//hVV+LvLGKpqTDnBsUkE
gxHeHEHplBcOlPLCDNjDWB2YnDG+qf4GAZxri5OWsIRMK+RLSLHVwJQlLlVa53G0
XTMqkgUe3x9qrhfK/fTTl/HGlZlwbSe8vl7KCZq/hlgL28Eg/IdFwh62uoXk4Q5e
0NNgLmXkM6UwhIo9TP4e+9nSb7+U6U+BQ41d4LdeeiFqFFWeHL92ds3X2+Ltd3GP
SDdikad4t0PaQK7mrKj3vjxsH9ev1w==
=Pi3h
-----END PGP SIGNATURE-----

--Sig_/NsXP2ADsV4nc52zm6pKZcxX--

