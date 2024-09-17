Return-Path: <linux-next+bounces-3900-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC197B640
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 01:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978AA284F77
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 23:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D8E174EFA;
	Tue, 17 Sep 2024 23:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gB//o3h3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122C174ED0;
	Tue, 17 Sep 2024 23:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726616419; cv=none; b=adadDokRIiQC2UOdE8pQZhhhCxIei2xQ+gCcfi0+G6OY7Jwlf7czYd1JyVzZAWkz19WBtbDt+0hdt3zzYLExMqjnLzyO7jwlRazrTtkSIarV9v30uxNSHjyqUPGHK1g+bqid/XoW8jvEQlB1w4MnjN91spacG8fRbZYuOeI/B1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726616419; c=relaxed/simple;
	bh=c7RscH+uvoWMjam8G1+bSx82G7TcKmVEfUSUMwHRSxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwzdNZlhpw+jFAaXKLLvtk0UNerFdbbB2lO4ULCyjOceKd0lXMcN1SK7yyrh67V5Zc9KQBvpTf2bDtgr/YBeXlnSlFSvCW7TWLYvlVi9beFP1hKElf2v1B1RE7gwcIOYydRz+ozOFugH+VdyPn5WGTKanHmpJHVdIOYhfC3Uwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gB//o3h3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726616415;
	bh=jOTcV9hwK+U4WVorEYR8++SpfSQxK3A4utopYq68IXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gB//o3h3Au4VxKuu2CEl8GfkwxyolpAPM0A10i4fUJ6WZI1ymHAMuxP8YDmWeZDCq
	 9ppTYM6PouC1nq7xFSo9k8kKO/2JsNeTegKRA0nK61Drv/o+eolnUpsQDhz+l8u41x
	 0xEvp/bOV+VWVAcypCzkwcsk+jTpf/AfU1v4NvK3U9zPkKCPQJ7TjIVszIXGONN7hq
	 0yL8hDVorKkMoC7E7+pb9qyILaKwsqdxbc/wj8I7S3xluP0v0FkbhxYffXrpvXR4G8
	 U8SHBrdaTvnNa1VYhJkuD11gEVRbYjHvHE2EaCpplAe6XgflAFr/kyfDPdXlxPIlZQ
	 Vp3CBx5prV6/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7dYp4Bb9z4xWK;
	Wed, 18 Sep 2024 09:40:14 +1000 (AEST)
Date: Wed, 18 Sep 2024 09:40:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Sven Schnelle
 <svens@linux.ibm.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240918094013.3c9797f7@canb.auug.org.au>
In-Reply-To: <20240917092739.46dcf943@canb.auug.org.au>
References: <20240917092739.46dcf943@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BQ2GDlJI+LV1XBLGCGVoTIU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BQ2GDlJI+LV1XBLGCGVoTIU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 17 Sep 2024 09:27:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the mm tree got a conflict in:
>=20
>   kernel/events/uprobes.c
>=20
> between commit:
>=20
>   e240b0fde52f ("uprobes: Use kzalloc to allocate xol area")
>=20
> from Linus' tree and commits:
>=20
>   33a5eafea601 ("Revert "uprobes: use vm_special_mapping close() function=
ality"")
>   073317dc2f28 ("uprobes: introduce the global struct vm_special_mapping =
xol_mapping")
>   efb93ed4c836 ("uprobes: turn xol_area->pages[2] into xol_area->page")
>=20
> from the mm tree.
>=20
> I fixed it up (I used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BQ2GDlJI+LV1XBLGCGVoTIU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqE14ACgkQAVBC80lX
0Gy6aQf/ZYxk5b1LIxipdHk5AqCT7wJEOfG3/7p37z2lS/lYu/FfkRP6jo3Pc6EU
hfJ/Zytl6pKsoNrcr3t9gNljS7LJR/ofTnDs3R/QNwHMGOpGHSzSymOBOA8I0wBG
SNX1OYHvBsXTvqCQLaHGEC9BiecxjBcHTQzXBdfLLsPTGPNCbpn9M7pIaqUqK88s
rWhObHrBREzKwH/wc3TaVSYFIMfv/pb4EAhCvYBSFugvMkI2/4Y/v02YhCdqsIVr
mDH7LJ1qn342DqzMD5V5c/kQGy8zh0WwU0ugaKfq/vbBkxv6Nsi5qI3ha/4/IvY9
uDXIfLPVxnVtOX1Fdh80BsOXTZSNRw==
=JqDz
-----END PGP SIGNATURE-----

--Sig_/BQ2GDlJI+LV1XBLGCGVoTIU--

