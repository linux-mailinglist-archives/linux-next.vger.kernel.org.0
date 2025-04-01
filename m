Return-Path: <linux-next+bounces-6125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DCFA77390
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 06:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7CE188D4CD
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 04:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA291519B8;
	Tue,  1 Apr 2025 04:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CHl3eL9x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B785C5E;
	Tue,  1 Apr 2025 04:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743482391; cv=none; b=H1nFLCy/MX0NfYP24rtNGXA4tJ6h8SVZaBy6me0kEcU/IJx2xG1GFq2XqT1V1HJESIs2tC1taCfSFKhn7rTYXzTtW/3fdcWZ0gRuIhmKm5plTwXqYfbsOrvePkf2M1oMrgc1VZ6ncvYMUV0xTuXFb24aVHroLQP7ranky6JR2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743482391; c=relaxed/simple;
	bh=GS1OlFhgyF3Siu/oIkub775avi42WrJAVoFodgNIMDk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gcB2rkSR+N/0vIxG06V/K2hBJro8dQAzGT0Vw1dmX+m4srnjNub/NRjtfPAUxjZPDbZ/ryEz0H2y57V6AoO+UgSWLEthYD3EBmrfVzN5SvdqSzTWf1pZAIvdqCULRLfGOhqAcCW00x5t/4wV4/kX/vF67Fbx7jeRhSY4NnoJCmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CHl3eL9x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743482385;
	bh=xYywIpFSmG3+CS3r2bqmQwXU4y1Y3SfoDTT4ElxLcZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CHl3eL9xe9eaxDga0bEVIA5P3ty0w93Xa7eq8d90hrFcjJjWu0kxBdu+Z2G8+rTAh
	 F2I4KG9Fyk+wtokmRqvNxTkK17i6yXws9+cWJQNlORvxw585doR7DtY638M20xuLO2
	 FgKwW77M+SRILTiIEuw2OtwjjxhiGe3e1vfYx36dcklLDyPRYPCURc0FwH0XK27Ymn
	 7pPvtW7QDoo1NbvfJcFGFV5BPvOOIRj8mAKdg8pjTsYN1F/0uqEkJxdkoSdCbIkvFq
	 mKveQaRANF+y9SmkCpHb+rgI+nbK7UdmoQg2X2TUnILGZqr5JM20QS1DJGcGhyhvjf
	 RRNaoy4oJurwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRZzM719sz4x3p;
	Tue,  1 Apr 2025 15:39:42 +1100 (AEDT)
Date: Tue, 1 Apr 2025 15:39:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the edac tree
Message-ID: <20250401153941.517aac17@canb.auug.org.au>
In-Reply-To: <20250228185102.15842f8b@canb.auug.org.au>
References: <20250228185102.15842f8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+6emJ0YDFW9isGnkJ/F5rUC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+6emJ0YDFW9isGnkJ/F5rUC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Feb 2025 18:51:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the edac tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/edac/index.rst: WARNING: document isn't included in any toc=
tree
>=20
> Introduced by commit
>=20
>   db99ea5f2c03 ("EDAC: Add support for EDAC device features control")

I am still getting this warning, but that commit is now in Linus' tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/+6emJ0YDFW9isGnkJ/F5rUC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrbg0ACgkQAVBC80lX
0GycVggAjD2TZu2aoDHFDDY/8VNKteKOatc5yPIR/dN3uqbqxKXkvINkbUUlxh+E
FSlm5/rN1DRxJwJNn4YmouNu1FVl0Oa30JU4KzXclEFAIEIH0Lny/us3AQXflfLY
GGhTGIOepsEraWe/e5evFDBkuCvoLkaGAUK7O8fiXQi8EAqImfuwfH3A6ac97Uiv
qQ2NyU+Lmh/r9sbPDe5Ifx9C25/Oik8QwbgHKRYljk+Ltr3IdF3Kq40lpmG5V4Mp
SwJqbnVeSpru7u5WvPLOymvjZXuyE+HcyDcNZQUmyiCBJaJ08012/xvVdCXVcM3K
0EmvDGT/yCdBeCYOXLt746sgQWs+Lg==
=hGjD
-----END PGP SIGNATURE-----

--Sig_/+6emJ0YDFW9isGnkJ/F5rUC--

