Return-Path: <linux-next+bounces-8640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B724BEEFEE
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0FA3BF888
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 01:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892441C84DF;
	Mon, 20 Oct 2025 01:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zwtz0csG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0D33F6;
	Mon, 20 Oct 2025 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760923632; cv=none; b=OEcSmQ97MosBZRMTN5ItToq2Bko5XecpfLcvFpU3vUgNZ0WKv9I9ARPahKmjJLYeSOc15XsSWyaM5YzpBFN+SQsQSapbPAK9DCJLpDS4uZ99u+/hFVhx1pnp5+tczVgVxxGGKmQodITIPn79QM7ywh2I5odszzvd++zfZNeTK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760923632; c=relaxed/simple;
	bh=2RCcX1FkBJhaxxKaYdfl9YmBMQ9p8SESDEGnknRek+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtaClc1VYRIjXTrPnv+JgOVhMBk4/RIWs+edelme8kY/7U1/2TaDCs87gEhKX+Ytc9XbSDRV8/Q7pMMXmpTO3Uq6GhZjeUGRh5X4NNFgg3MNFE7dVVmtiEgpUyei42vEEtbbWBxmoicPkOX5cKZECHVShsLb+v0jai44uuVa95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zwtz0csG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760923626;
	bh=aTCgF4R2/StQ0TsobNLt1z2cAJrZM+osfSAC9odaV/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zwtz0csGEjPrPvJMTa2jPENzu4QVMWxs9T7o+bPTtki1tPllz9hz6wyCG6q8sOjU/
	 Q8wbNs+Tx41BPuAn2j3SEEm2DYSZ3KVyHOyY6yVE2IG8OkDxZng4K6tX7PjMnbM9z2
	 ZNUfQkSsPkuyKbHzPn4G2t+vIV/mQ6JA/jupKdougyybHkxlaXEFEQ3OLyHd2K5KZA
	 nUHy6TFy+TJlSEOn+tolkB6+3eTlOrkiKCF7WFQrdwYG6JX5ccDxs/RqKvx9bcI/v8
	 hCxfIuMnRvTIIOyMzryYGdW+gyZnHSOC8+zNgqqsxqCgF8F8PL6wwo625lHAU/wtIf
	 EYTTeS+6vYAVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqd7s6gKyz4wB8;
	Mon, 20 Oct 2025 12:27:05 +1100 (AEDT)
Date: Mon, 20 Oct 2025 12:27:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20251020122705.61031892@canb.auug.org.au>
In-Reply-To: <20251020115611.6170f156@canb.auug.org.au>
References: <20251020115611.6170f156@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0yMOVyCe5+2=fyIfOeyX41A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0yMOVyCe5+2=fyIfOeyX41A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Oct 2025 11:56:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis=
-fpga.o
>=20
> Caused by commit
>=20
>   e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
>=20
> I have used the gpio-brgl tree from next-20251017 for today.

Actually from next-20251016 as Mark did.

--=20
Cheers,
Stephen Rothwell

--Sig_/0yMOVyCe5+2=fyIfOeyX41A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1j+kACgkQAVBC80lX
0Gwg3Af/foBirw9idx3VmLbj6ofS9BAdHX7jfz7R4WDN1Xx6kIxWsdXlS2bcXvHr
rLiTC/beDWcT0CDaNE1SrKpgxFScNErpoXH7jxd/NYytlgksIzTQbw8zMxIuAZlW
3smnw7eMODOMr0clJ8ln2VqyCEoV0i8moFDa2CoX5Z088ucJtaq0fXSarj3kRmMW
dmRkNbnnwxs7TALvKHug7DU3V27gEusurB3fifdQoLaCvqUOQl0rgpIAqPOb402/
/dnoQyRHoNKcmr+H7C9yjY9ZV0JP6h2KD1CK46ntVd6o5iOR6f4+bLxs16fwpNg1
jgHMsBy3nt3ajmFzVQiadOYbpgGAaA==
=3Z6d
-----END PGP SIGNATURE-----

--Sig_/0yMOVyCe5+2=fyIfOeyX41A--

