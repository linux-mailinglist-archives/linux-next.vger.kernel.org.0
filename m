Return-Path: <linux-next+bounces-6343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30FA97AEB
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC3B33B2C20
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 23:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9434A2C257B;
	Tue, 22 Apr 2025 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SpKfoai3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047181EBFE0
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363331; cv=none; b=aEQ/92krInOh4sbA22oYqpDhuAPQycoKHIdXEmIoP2eeGBGTYyzoxsn5u2EkAWYIe06AcFDM9BKhY8W8mlo8BxXqf6LMznbM5k4t8jg6mQH9U/aiTbuVZsDl5b9Gc2jlhP/1DKmbuCXwNUIGYAL/HnMsblOI2LKpASYUk6kUAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363331; c=relaxed/simple;
	bh=stvGs7FAB4VwG+OCW5CfiSWziagXDz+VqOna70qQHf4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jiIYfmxK+hLJKn1QtDKCg3sNnhee5xVMeiWm/9V9/HXw1uRu1G3ZYJWmXTxXw0rs3aR8fGU4wYbzRcUsA0qlNAODFn004MJPaCCOKIsdAG4Cfco/l6cXIRyLEqY2l3fruYsor0m0+WVlAZvqZsbwOHhuwmdUfh/IBZhxShtzInM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SpKfoai3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745363326;
	bh=OLFLLsQrslIYId0FuHtM5kSK7eSSYHNzNb6H5L3F70I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SpKfoai3lSYCDhBQVKTmSP9jj1SNYaSmduA34eDuXNcS3QbEFYQnDVCZIkWSDlUm3
	 i9ZdJZqbl6F7Vih3zH+SG5oGGZxCv02Gvek8h+P7bNlGMhNf7qy3FLC81P7xoqN3on
	 afgIeZ5fXJl2VhtvHgGWrstmITocAXRk0doa02jxj6SnBKYSwWmWInJI5A7hSz7cek
	 dG/95Ev6CA0j51GYmG09ZCIFrtnyhf83DNEfSoHzjKI1WtlX+ZtETfSQgN9K6ksQXA
	 ejZet0h+Zp+AkqDmq2To61uCTE38NPFlwMIZTmRfiLuSH89OmhcgJGqS8QqyfwDD+A
	 2WyjCuPUym3nA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhybL0PyNz4xFt;
	Wed, 23 Apr 2025 09:08:46 +1000 (AEST)
Date: Wed, 23 Apr 2025 09:08:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: Please add fwctl to linux-next
Message-ID: <20250423090845.4d5929f3@canb.auug.org.au>
In-Reply-To: <20250422165219.GA1645809@nvidia.com>
References: <20250422165219.GA1645809@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/knAuq0gpkY0jWzlRQcfhaFV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/knAuq0gpkY0jWzlRQcfhaFV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Tue, 22 Apr 2025 13:52:19 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> We now have an official tree for fwctl, can you add it to linux-next
> please?
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/fwctl/fwctl.git/
>=20
> Branches for-rc and for-next

Added from today with all three of you as contacts.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/knAuq0gpkY0jWzlRQcfhaFV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgIIX0ACgkQAVBC80lX
0GzOKQf/Rx854IoFS69STnGZHm+iIaQqjI5d7/C89+W4PfZ+fEzWXSVv+DBmiSEr
cVS6O4IDHDSXs/8v8U7wvkQleunQoejcxI7lbFvuDf53y0pXN/1wFxjWckA77RqQ
4Dmher1kgV/sUX0xMzAX4fOdDPDzVSS2jfiyW6u6PZwZuHepE+D66sq7JHMZx/x8
D1atAv2/y4IlzIT7JTy6kwN/UiE6CgN3fYRliXoRw+/XU06LnVsDG2hjfGvucHwD
dXQYmy6GMPUwlh2CM7RZci0OH58i9540At58QqgFiWiYRXJZ1KNnGg0ir/VWyRRV
dka7vGfGrEBlHigkMeKDc7H3a+Eqsg==
=WG8r
-----END PGP SIGNATURE-----

--Sig_/knAuq0gpkY0jWzlRQcfhaFV--

