Return-Path: <linux-next+bounces-9560-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E9CFB1AE
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 22:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09DFD307931D
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 21:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CB430FC24;
	Tue,  6 Jan 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kpLJyuXS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E02C11DF;
	Tue,  6 Jan 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735386; cv=none; b=WZUitm78DEnKSt4ZPCGYb5eH0zgLMwsb/IYvUXF0FBp5ZJXTG5AOQ+vt5MnAhFOBfZASOuuJ9t69qoV4tv9B+od0q2HgwS0PmEVLkNVE92YXENKQU9w7wwkI+hjSM1DcdXDdND3fkIxNobOdQ2jSA4W4xgPMvNQXSM5yKAAf+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735386; c=relaxed/simple;
	bh=ad5llLBN/WRE1GJQyh/RjBb4sKPBN2iONM5+z5hEC54=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+6dDqeWDJgir3C9mgKm9Io6Ne2Qmd3wiZq98G4UsbCAMQw8OQoFOAfR/UnIQPnGbOONRFvCIJsKKqOz241FkzDJqHn3AT7F5Pq7o9CjJD13gfLq+lDVdEz/YIMiBnoUXvm72fGETs55JZ0k2CLyvsaSBFuGJdGEIa7NCfXJBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kpLJyuXS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767735378;
	bh=0XXibsRiOk8iQKmDU/G+fW9fpVmFaSdx53asyjplc3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kpLJyuXSAXItBfE17pLwWkPMKyqRpdHRtmzXwuZxECZh4YTMDetkCF5y9XBEIy0Ne
	 ZPjE728D6us5x20T36A7k0WvlptaZIRLITl3W0ZVozuHQgog83VxncfomC0ix1bvqV
	 l6rKuaqzYMpxJWgPWpnUsknIfiZcC/8ORIp0Msr/wEUKWFkIfez+lJqhE+/6ir5TwG
	 S+DVIsphJamQh1uXTKkJW5Db6cR3l1okgKuFkluyPnKG0SU/qybWWcMxkYb4FUpZ+s
	 x16i2iRVffvBWoW2AHIs5OXY0c5Emfm2VvjFQSeg/ESxQEfpAAero13z4OYZToBk1i
	 wWjqbMPjHL9Qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dm4H62MfSz4wQG;
	Wed, 07 Jan 2026 08:36:18 +1100 (AEDT)
Date: Wed, 7 Jan 2026 08:35:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20260107083549.2dbe6d95@canb.auug.org.au>
In-Reply-To: <58b06cfa-1710-4438-83ba-25b6d17075b9@suse.de>
References: <20260105131607.718d22cb@canb.auug.org.au>
	<58b06cfa-1710-4438-83ba-25b6d17075b9@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 5 Jan 2026 08:07:41 +0100 Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>
> The latter fix is incorrect. You rather want the headline and
> size-parameter description from the first commit and other docs from
> the second commit. Like this:
>=20
>  =C2=A0/**
>  =C2=A0 * drm_gem_shmem_init - Initialize an allocated object.
>  =C2=A0 * @dev: DRM device
>  =C2=A0 * @shmem: shmem GEM object to initialize
>  =C2=A0 * @size: Buffer size in bytes
>  =C2=A0 *
>  =C2=A0 * This function initializes an allocated shmem GEM object.
>  =C2=A0 *
>  =C2=A0 * Returns:
>  =C2=A0 * 0 on success, or a negative error code on failure.
>  =C2=A0 */

Thanks, I have used that from today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldgDUACgkQAVBC80lX
0GwqiQf9EOP6vN6G9ItsWryS9K/NGOpoJMtIybA+7bHqUWsH+ZY2aywc+X5tOB2W
eLqSzc501Quxx53TQAStBubu0+IEvZmMNXOxzorgVm7GwMTUebsCS4urPLcPMzxB
GmecORwWUKyUQ2eAy3yhT5KrOETc4vPPUILa4j0RfwyHHnkbJTXTyqodPxmHDi1L
BRCkrD7gRBtYWXmFYPM8bn7iLU3cggrd8tIWDJ1imVPakgAwpo9TFsuftilA5xxs
6WFMICT3FKo4/sIbnc4FhZ47kFdOsN7zJuP42NQSNb5SJiGSKrVplh/+WpNy6P+o
FbEi8LQjBqgmcGmiNaZ8mbjGt6yGfg==
=bI+a
-----END PGP SIGNATURE-----

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv--

