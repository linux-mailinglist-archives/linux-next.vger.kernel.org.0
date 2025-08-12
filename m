Return-Path: <linux-next+bounces-7911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BADBBB21C2B
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 06:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A993B4E1A34
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 04:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98821217736;
	Tue, 12 Aug 2025 04:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qIpGpOwL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E91FF7C5;
	Tue, 12 Aug 2025 04:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754973366; cv=none; b=oUV17oDg/eLzLIsYYxWIScuLSiOyZgmotEyJjdxZVUli0fmNS2cBVjsfEQCTp1SYmxnEZU8XKFiLNWG20QmuZgGCrbjC+PQDJ1FLsIFHGtW1Q3PUPZ+0mFaV2767knpOfJhtHJeJKTduZnkDrmy9uyr1HBdcyW4tSKVVhplV3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754973366; c=relaxed/simple;
	bh=a2fFT0SML1HIj0HNz8Dgc6iVsf23KZ0DRHF/eW1eDYk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OECEAxDPWER3AY77inGuZ9dcdNFE4PS7mMTU+aE0eCaqXZpvoxJ0CNKvwM5ZwaXKsxG0zYUPpjVUF0sxHbemQd3k2k83WC14mx39I7sKErsiQqhy0c8W2pAUe+3rhitmSW+zj3eXdh68mwc8N8yH+Sump3H1dt2g7z8TSwC5R9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qIpGpOwL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754973361;
	bh=yB5Ml8I8HYKSrQ/QSf1O5ePzfSDfVmXd+Ij2rdSEMXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qIpGpOwLcmJwom5dsH5tSdIA6MtAxg7UYjSZ2kH44CqnV/MZ4FqGf0Coh6jHl06qF
	 RC3Ye0yOZKbEBGDDDrU4QNC8uU+5HS4oVs+ocX38PNh+AiBu+eoQF0X/RaV9Z+/Fov
	 xXSn8RbDmtw0blohrJcRK1LLqprGesijuJd9AM2jNbH3NkKLSx5AvrMcRs9iG+yW3R
	 SDzpwxvQq01AJXGQ80FAWA34Q9oYXyePi/leBSCbVNKwQCJKNGAamcZMDcNdtIcn1F
	 cZBRe0ACTeBryMNbjdIWukRdS/YU0qIMW1c1InyuEvcFl7ee3Oy3L3noC7T/q+1Zgw
	 CXW0rXAB/62MA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Jbh5K5Wz4wbc;
	Tue, 12 Aug 2025 14:36:00 +1000 (AEST)
Date: Tue, 12 Aug 2025 14:36:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paolo Abeni <pabeni@redhat.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the net-next tree
Message-ID: <20250812143600.387da02c@canb.auug.org.au>
In-Reply-To: <beada520-564a-481e-9f9d-91cd106aaee3@redhat.com>
References: <20250711183129.2cf66d32@canb.auug.org.au>
	<20250801144222.719c6568@canb.auug.org.au>
	<beada520-564a-481e-9f9d-91cd106aaee3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F.92=Yo_jE0NJfV0MmXWkBz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F.92=Yo_jE0NJfV0MmXWkBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Mon, 11 Aug 2025 11:53:38 +0200 Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 8/1/25 6:42 AM, Stephen Rothwell wrote:
> > On Fri, 11 Jul 2025 18:31:29 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> After merging the net-next tree, today's linux-next build (htmldocs)
> >> produced these warnings:
> >>
> >> include/linux/virtio.h:172: warning: Excess struct member 'features' d=
escription in 'virtio_device'
> >> include/linux/virtio.h:172: warning: Excess struct member 'features_ar=
ray' description in 'virtio_device'
> >>
> >> Introduced by commit
> >>
> >>   e7d4c1c5a546 ("virtio: introduce extended features") =20
> >=20
> > I am still seeing those warnings.  That commit is now in Linus' tree. =
=20
>=20
> I'm sorry for the latency, I was off-the-grid in the past weeks.
>=20
> I observed that warnings in an earlier revision of the relevant patch,
> but I thought the previous commit:
>=20
> eade9f57ca72 ("scripts/kernel_doc.py: properly handle
> VIRTIO_DECLARE_FEATURES")
>=20
> addressed it. At least I can't see the warnings locally while running:
>=20
> make V=3D1 C=3D1 htmldocs
>=20
> Perhaps it's sphinx version dependent? I'm using sphinx-build 7.3.7
> Could you please share the exact command line and tools version used?

I have been using the (older) perl version because it coped with files
being missing.  The (newer) python version (which you run) now seems
to cope to have been enhanced, so I sill start using it instead.  It
(as you say) does not report the above warnings, so I will ignore them
as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/F.92=Yo_jE0NJfV0MmXWkBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaxLAACgkQAVBC80lX
0GzPqgf7BH7uMXzImVE97hEtvZmDN1J2SwH1Y0jgUwelXX6jEkeqi6oGP/hHhJfW
Is6ue1TyvneG+OGvqzYIGE6ozHIgW81jg6qSo2nBQ4yS7kypWXkZ9Jk4xm12lfnd
AUrDIWV2/aw+0NiTrLZJ5RwJpz6bCj7Ogu+xpjfwfu23c9o6nxrxBtKqlY/PKHcD
rq/ENX8HHSSCbdPg0iHDwnuga5M7oSoJUWGbCcfCxG60/xkiwPQEpe0yyKlSZJK1
f8tp72+7kdwKCTiM4Ay4yWHfE+cBUBpTUPVcsw9lsfLP5nUiZ+AmFrShuUKE0AzW
WKtCmTcMZOxRb1IXZqjScRn1teZSiQ==
=I2E1
-----END PGP SIGNATURE-----

--Sig_/F.92=Yo_jE0NJfV0MmXWkBz--

