Return-Path: <linux-next+bounces-2887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757892B964
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD6928127B
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3F15886B;
	Tue,  9 Jul 2024 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EZ9C8XoG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C98155A25;
	Tue,  9 Jul 2024 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528019; cv=none; b=G4Ile3Dkhf+Vx1RgNCI8nPiKwEwh4eYW4BRU/TONk2XAYZSFuxvl9YcOyLWL6NB7sp1kDtNAC+d+r7Ttj2DVmc4Lx5+EtRV0zVMLeYjIYQAMwftTZNWPV1a4+tMv3/jZ9fEmMKZUQbdlz0kJDZntokCdU2kFctVbJTbzcv/lKqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528019; c=relaxed/simple;
	bh=sV/kHiERULcn2+CKseOGExeItquaW9e6l/jwQkKffIw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSH2roJlS33V2CnZOS9fSuADqe+28y/Conokd9MXj3QSPEW4X+D+Q/9AYHwSjk663NGrfwQ37TsSFD0V+Mh2vxoRX+qV/4cyo2mGvEvrlb1lhOhDFT1HGsIG0nFUrH2/Gu1WHAWUfyaiywh74nmOmnMP66QDF8mqFr8xTAF67B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EZ9C8XoG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720528012;
	bh=QE5ErKqVAiEnvGSamMcUaE+v5eOBOF3Dca8BGyewkZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EZ9C8XoGNDJz8c6gvDr3geT1YIQdgzFROfspp0YRNXxmg36LiWzurvr4KVKJzwsIh
	 eimy3X35J2pPPOGuo+OyD5S9UYEIX+auBH89colXtIzscCVgRa8A/RBc7w2NtaFC04
	 lCa5q7USl7XD3QBrT9KYgcLI73AvdKEC4UZ7kmq5RET00XrCVPBHq8rXuA1hbYVc8w
	 VxriBWsQY+WaHY1iINGmlmlLb4MOrA2tgViJyURFR0FRJUuVzEqa5ecRIxrJPEAxMW
	 1KpYCUcljxssWoJCvz3nijV/yiZ3MBaJqVCtKLQT4+a9RK4TVcIbOwwg8rOy1xT8Q5
	 ka7jq9CyS83yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJKx81q0Qz4wc3;
	Tue,  9 Jul 2024 22:26:52 +1000 (AEST)
Date: Tue, 9 Jul 2024 22:26:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the battery tree with the leds-lj
 tree
Message-ID: <20240709222645.25c1b3c0@canb.auug.org.au>
In-Reply-To: <20240709092337.GB501857@google.com>
References: <20240709133420.55645c59@canb.auug.org.au>
	<20240709161729.27935749@canb.auug.org.au>
	<20240709092337.GB501857@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L8agdaeq+RDfobJc9Deh4r8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L8agdaeq+RDfobJc9Deh4r8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Tue, 9 Jul 2024 10:23:37 +0100 Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 09 Jul 2024, Stephen Rothwell wrote:
>=20
> > Hi all,
> >=20
> > On Tue, 9 Jul 2024 13:34:20 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > Today's linux-next merge of the battery tree got a conflict in:
> > >=20
> > >   include/linux/leds.h
> > >=20
> > > between commit:
> > >=20
> > >   6b0d3355e5a5 ("leds: class: Add flag to avoid automatic renaming of=
 LED devices") =20
> >=20
> > This is also in the mfd tree. =20
>=20
> That's intentional.  It's a shared branch.
>=20
> Same commit ID, right?

Yeah, not a problem, I was just noting for completeness.

--=20
Cheers,
Stephen Rothwell

--Sig_/L8agdaeq+RDfobJc9Deh4r8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNLIUACgkQAVBC80lX
0Gw3fwf/etON1YTO4cyG1lgez1BoPdRMRQRPF77h02//HPlgYLctmib1qJfGcgCa
NewM6StTktoaaWK80wQDlUB42/NSUzjVz7viiu2Y+adOSoDv/4Qem1nfT2bFJ7Dq
kQnVLzyWriQ55NkjwyBac8CbQk4QDph34uCUT8slz2iMwJTjsXbtIVz1HOJRM14v
ZyqVHl0r0XJUyFVeKLp/pZo6MvM/YShqE+n6dv+ErkuR3TmkuU27hfO9E6EqZO1m
KRKeVNJgVkiYxBZAqY0Q0nVceFexECbV4maKShXiWFIMTS+viIQeAV1M0YsD57Jz
OUWgpHnPIUajHQ65i1cq+F6rgEcKsQ==
=iMZd
-----END PGP SIGNATURE-----

--Sig_/L8agdaeq+RDfobJc9Deh4r8--

