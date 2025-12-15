Return-Path: <linux-next+bounces-9405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16DCBFE79
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 22:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4582C30019F4
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 21:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15C930BBAC;
	Mon, 15 Dec 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RAnTzgoD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BF3595D;
	Mon, 15 Dec 2025 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833678; cv=none; b=EO2tvkMq9jWeoCiGwx2Dal0kYm9MBp++/Gx7NkFICd/oZOVJ06FWInkd/bpQSVQ6Nhnx55lksTKwUkFHcUoBR3KJQZl02NVhsOtghE9ZGXdvuUEPTqxQl69BSpF2I275uQsWlZwYS5oKzJvtuS4L0inxvAVJq0qeIgCLjwXTcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833678; c=relaxed/simple;
	bh=JVeZyRZ0VJKUsKISQhZ/yKuMcR2Ic0v6PfD8os/Ae5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnTyj8FnqgSSPWs8p/7xir6G4Rn2Fg5awKoWU1fWqvhpPrNLC1c/dAfPfc2YaHbYSGhqdbXMiinXUzmlDhFAPdQsM20oAcf61nBO2uDtJNx38j4yCApW5WHyKMkLr/qkhj6q894ShkfBNOQtEKhfFsBqxACRcFNXMhLr9B2EJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RAnTzgoD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765833672;
	bh=Ycwy8go6kkOU1cmXP4qHakt2chpqksQ7tkvYm2aMju4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RAnTzgoDQnyWTiRDeUWTTGany85AsBHIQ7QH/NeYDx4HjbcDWM8FFNV21a40Dipaf
	 YlaYvFj9ahDqX32FEXgY/r4WmOQSvf01cXo0zRKYpjM1sGtMp3ZQ75DTCG4sI98li9
	 yp5+kmdIIqWBfTPosUVQX3n5p6WOy53anofXkuxkp/MB0GGIW4U8ULJx3U2B7wAh71
	 5sKeR5iX6BsGNgPCYQ+1gCUJm2K/1+/oQ8w8C4drBcOxASm2QKNVF4N69wLwoezQHY
	 Upnfu2ZbItvsxptNHOVdUozeTuY6nlfGR2sLFvrn+fpRQtwf4SF3bg11+ulRpcrHcm
	 8630kttPujzzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVXzr1PYvz4wCm;
	Tue, 16 Dec 2025 08:21:12 +1100 (AEDT)
Date: Tue, 16 Dec 2025 08:21:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20251216082111.64f6f646@canb.auug.org.au>
In-Reply-To: <45a76e4e-12f2-413d-b9ab-3c453df23ff9@oracle.com>
References: <20251215184126.39dae2c7@canb.auug.org.au>
	<45a76e4e-12f2-413d-b9ab-3c453df23ff9@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DXlMR4_jcInwOLmvgd2/YB3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DXlMR4_jcInwOLmvgd2/YB3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chuck,

On Mon, 15 Dec 2025 09:55:16 -0500 Chuck Lever <chuck.lever@oracle.com> wro=
te:
>
> On 12/15/25 2:41 AM, Stephen Rothwell wrote:
> >=20
> > exportfs		2024-11-17 14:15:08 -0800
> >   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git#exportf=
s-next =20
>=20
> re: the exportfs tree: yes, that's fine with me. I asked for that to be
> added to linux-next before we knew that exportfs patches would be going
> through the VFS trees instead.

Thanks, I have removed it now.

--=20
Cheers,
Stephen Rothwell

--Sig_/DXlMR4_jcInwOLmvgd2/YB3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAe8cACgkQAVBC80lX
0GyrPAf9HNs41/brLW7Te9UXDpX1wUaj93mf0QZ86znzYZXUaWDq1FvQq+zUQcPj
lSNiPjx6w8jREbilDIqwBCdCekSprrndh83pTIqJtrTshxbOdxx2cxNIPJdQ00UY
HuOn+lyrL2WMSgBYJdsl7z7MomLhZSrEW8KqQHDmCz70/EhHbWZ+fc9uu6ML5XwN
4dZcY/QASBSc4j6TS53WG9bPy9Bj0p5JS9BtDH+QRKb1fC9dXsQOJUehRyLoFbV8
P4swsu+VjjglcNcOpIQilNIs0hnHhN8Y31ad1zVC2MaLudyHTMTz05Vh6A5+08Zx
Gaz3DUHztuLOnf9TO+UNEN0Ztjx/dw==
=PvHG
-----END PGP SIGNATURE-----

--Sig_/DXlMR4_jcInwOLmvgd2/YB3--

