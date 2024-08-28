Return-Path: <linux-next+bounces-3467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA7961DD7
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 07:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC5D1F244C5
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 05:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C5814B945;
	Wed, 28 Aug 2024 05:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j/suvuDJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5A14A4F9;
	Wed, 28 Aug 2024 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724821747; cv=none; b=TKU7XlOHHtPJnSRbocxa531dH0jZwXh2YS0+IBfHAj0DGoUXB3PuA88Mwdcskmebg+OjibMDgeWWc/Y8gf+eev7DRHEdUrchGC3xYfcEMkn1ikF0ThUe7etqYFc5hZSgJzPv12MrgaVwA4ABxHkbfnRqdKuPuI8iBCEGcF1eKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724821747; c=relaxed/simple;
	bh=iTFQe/kwXrRAE44sAW/yE00OkbvQ4fjshb5sLjMfnWY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5XvpWtObAYNACQh/1lbzC9xA+/wHtQLwj2JgymwuyjatRh9vo8T3nbVkomEZxJuEeLubzDGXlCaU2NMYSn4f3L1gyJHka0YsVPG62eZRxUVXXFpKN8hIHGRmaoyapHRSUbQGaTyz69Aewy46tqj+Vk1Ho95cedT1r5CpEZQxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j/suvuDJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724821741;
	bh=wWS/3XwMPWbLizyXgbtaa0pAPtCX7ZPHnreBYKZImfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j/suvuDJSSCZTJkPY6UBqWzXLFwArrj2cfDLHqjnPE+L0Ot3tf6g7/93T22W8xLv3
	 J9IP8iT70FmJRRUckzjzqVodVqRZRv5LM3ZAWADVu/97bAxoY4QU4XI1befNuxvDsG
	 BFsCHtRwLM8lYD8enIW+ilKRl+YPsLNGfy0/dwbs9/ZPGPrZzL55IWZfyMrpiooq8k
	 C6ge+6Vq33vzWfREFUxSL2Uyrt6kZWHVVRG+qF75XQxekmMZEgULpa+S20ZUQ35LS3
	 Td4LHpLxHrKQ3VNogw2Qo2+pAfqXTO4tLoKNKllLUjoThT4FgUUOT3IZnBNLpnFx1c
	 CuMgaX6ooo4vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtsrr5s5Bz4x11;
	Wed, 28 Aug 2024 15:09:00 +1000 (AEST)
Date: Wed, 28 Aug 2024 15:09:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Martyn Welch
 <martyn.welch@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
Message-ID: <20240828150900.7ffd7588@canb.auug.org.au>
In-Reply-To: <20240822142603.3608a26d@canb.auug.org.au>
References: <20240822142603.3608a26d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fM0rjuX7VFpS2GFW=nJdDKW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fM0rjuX7VFpS2GFW=nJdDKW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the rpmsg tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
>   Selected by [m]:
>   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMPIL=
E_TEST [=3Dy])
>=20
> Probably introduced by commit
>=20
>   ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsy=
stem")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/fM0rjuX7VFpS2GFW=nJdDKW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOsOwACgkQAVBC80lX
0GzPNwgAo+FfMq+DpVjNyNgdVvwDYbuiPtX22ns//6imEfEYsa4dUSyyAWjEthKw
YsjrGf2DPKM3wea2Zas61zOnniTT1e0iXk9UrmnxSQq0npu4yp+qfDx1XABzaU0J
5TMKlEXFlgatS9m5cFhHBPJP25V8ndyydns2MGzf5d4wfdV8CtldOG9mGVT/50M5
WcPUjE1aZklhByVsGGAITZLh39Z86mtKxA0LAaDoVtxB82HSpUcMXNz0+G9HeAOp
bgLmU3hM994gMWS5iv1OQGlYGLabNVPaY8SF9cfLRkn7KjPy9Olhi6TqPs89HAvF
sTTOzUcOfcP6L6mbNcZGrQe//KYwtQ==
=yDni
-----END PGP SIGNATURE-----

--Sig_/fM0rjuX7VFpS2GFW=nJdDKW--

