Return-Path: <linux-next+bounces-7734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49AB145D7
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 03:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B2CB7AC734
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57591428E7;
	Tue, 29 Jul 2025 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ShKZ764R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D417578;
	Tue, 29 Jul 2025 01:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753752955; cv=none; b=KECkVvvROU7LvUAS+H7nVfpEX4Y/wC1Nl1wkSfN49qB+H7WBpzQiID7zlejzdWc5MYrWcjMg5rSErGTj1wpx4BkfV691Ba+wqNtQU46/Y/R8jPMsh4DBBQ9aaP84mWoVaL/bW+/yx/TgC9h5D53T/EMRvLtJF4Y/e6i16aZaoiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753752955; c=relaxed/simple;
	bh=TBhH0XChIVMo2IjOaCYjQY6MI7eoAjXxiplja+1VcJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ocFNhdGKzmII/N3HTK8YB1PEZv3jU5nQo+opxeWwfy0ndkmyM3zi/LV3pJDo8X1VclNIVnJm8ycPweBmq/fH7Pbzk0FQjRQaNQ1WPEreRZsMBKrlOWBwHH6iW2byZNrzfytjAvI3q9rE6ndLigVwlkK2yzOyNNgtVHoxstznSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ShKZ764R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753752743;
	bh=5pBS3qj7hAH4RQt8bdhJ3MOKUD//BRx+rTop/UWsJi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ShKZ764Rexht1ZHrOTR8r2cV1jYv679Bx0hXQXkXML+0a5U0BE8Dr5rwloOAWFTlm
	 S78f+RJlTBd1zWlLrjL93ldh/bkgV/aI/AU31fAS6UTxUyZWMmzYj1Bq0tZBS2qHJh
	 PiAWlTOu325UOTSSShxr+4t6zSh99Rc70bE43XgHsyp5hW33d584ftapVek40J+xai
	 3H9z0XZ4wJKkYRp4Nxa9ooLOYX/03VVm920Q1NOlN7oxOtopWfxudmtxnXaaVInsZI
	 bQiX0yyWCz9mGW79Ue0raqNSoxU/LOQ6Sy0ssh7368DkGzCisM9S7Ko4srngff5Sm7
	 8NqdJxHuLpXQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brdBH0dcxz4wb0;
	Tue, 29 Jul 2025 11:32:23 +1000 (AEST)
Date: Tue, 29 Jul 2025 11:35:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Message-ID: <20250729113548.4ad9ba1c@canb.auug.org.au>
In-Reply-To: <20250724100314.GW11056@google.com>
References: <20250724115409.030d0d08@canb.auug.org.au>
	<20250724100314.GW11056@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n2/vSPUOBzCI9B_g38cuPgh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n2/vSPUOBzCI9B_g38cuPgh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Thu, 24 Jul 2025 11:03:14 +0100 Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 24 Jul 2025, Stephen Rothwell wrote:
>=20
> > After merging the mfd tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > WARNING: unmet direct dependencies detected for MFD_AT91_USART
> >   Depends on [n]: HAS_IOMEM [=3Dy] && (ARCH_MICROCHIP || COMPILE_TEST [=
=3Dn])
> >   Selected by [y]:
> >   - SERIAL_ATMEL [=3Dy] && TTY [=3Dy] && HAS_IOMEM [=3Dy] && COMMON_CLK=
 [=3Dy] && (ARCH_AT91 [=3Dy] || ARCH_LAN969X || COMPILE_TEST [=3Dn])
> >=20
> > Probably introduced by commit
> >=20
> >   ef37a1e24857 ("mfd: at91-usart: Make it selectable for ARCH_MICROCHIP=
") =20
>=20
> Thanks Stephen.
>=20
> I have reverted this now.

I am still (again?) getting this warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/n2/vSPUOBzCI9B_g38cuPgh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIJXUACgkQAVBC80lX
0Gz6aAf/fzM24sTud166GyNmhYMzfLgUMQ3S83ZpTwRsESnEgcgly+779evtSwqA
MgrbNA+JK4Rf2WglVjgBNmplsxUDBuyYMo9m2SgqhN/EnJOMA+MKXcjYFfgjOG2D
ukHmzvFSN0HzojLfvjRYv58iSBQpIzstITSCuwsqdQTzSOwG9vjSrivJB4+ZeTgK
aJFlMqaV7K9p3UzvAdw+P8WFtx3i1/Vsv5SsCIdOJ/hGcgjq2HwTatmQnnixT1PQ
OKxHO+ngcFKlEawSoGpyuG/7mHKo2bZZjwieD0Fc41YGvzE0wx0qMDRFejjmwTtQ
xlYTVCHo0UDBP2TfbZsTjZwjOs8UcQ==
=0/57
-----END PGP SIGNATURE-----

--Sig_/n2/vSPUOBzCI9B_g38cuPgh--

