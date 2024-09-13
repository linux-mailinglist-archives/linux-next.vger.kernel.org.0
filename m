Return-Path: <linux-next+bounces-3816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A179777BC
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 06:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04951F258D8
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 04:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B631C461C;
	Fri, 13 Sep 2024 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KmIMA84I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7512F34;
	Fri, 13 Sep 2024 04:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726200804; cv=none; b=b6oAFfG6tBs0oIu6E9d1nCtQhWGKi48mF691n/9wq3ws1utaPjz3wOLQ3uIoxjOy3/QeHFW2zxqXXZ7girE8GpNyJHhDUAT2IK1+tIyFEe3QcQt1X1ITLWf65sDf4sgmc3E9o4bzxJTlxDO9IrVqV/ApYQunqwWczG7bhyPNjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726200804; c=relaxed/simple;
	bh=4XqDGGtz1dCKr7V/BZ88LjM75pJZcMSO9nE8I1H3svo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fW/PipalJVlTNvpdM7OMZ7h7lhrsFEKsL3WS8CwNOHuEnbr3ZA/EeAQ9/dRIfPwJHUBOIlKRDmJ/okXKZsYBjK4Kb/MLAhoQjW6tylvPidC41s8+sNNIAsgdg1qkxXY0qPWAHMjKuwq9N2orgok+1Qf9+4rDBrRQQUiBTb0NUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KmIMA84I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726200799;
	bh=X4PBrmZHLei+R69RRoCehgALDzSHVQBLSOFAUmTzQ3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KmIMA84IY6t0WB+nrP6u2VJpWtSIdrP9reMzoaCOVR/OLay1GE88JfHNTzJPxnSNI
	 16Xg+6eCQL3Sjh/DMZiJMIIb9VLF5cfHLo+ZVhTQp/LD9QxtK/wvh2cXj6peYSHFGy
	 LXGvoUAhJPh9F1Zl4d+PbkRrny0qsUoCuKjm10Mli5FtFviHzyPYZm19QUgVZzJmJL
	 4zUZ/c6G4Bun63II9FRsg1j6lI+2HKiC9CvYcDFcoiM1pucF9eqzhmZjJg+nrW0B9E
	 tisGr87MOSvs0SpsEQJX1JUCjvcHQbDQIW4h4YtKdbv0fvGnlj+lQPFjw0cWZ1sa8U
	 J7uE4okzSBMLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4gsB4FZXz4x8v;
	Fri, 13 Sep 2024 14:13:18 +1000 (AEST)
Date: Fri, 13 Sep 2024 14:13:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913141317.3309f1c6@canb.auug.org.au>
In-Reply-To: <20240912210008.35118a91@kernel.org>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<CAHS8izN0uCbZXqcfCRwL6is6tggt=KZCYyheka4CLBskqhAiog@mail.gmail.com>
	<20240912210008.35118a91@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y+XH_ig6bj5yTZruu/bMi=S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y+XH_ig6bj5yTZruu/bMi=S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Thu, 12 Sep 2024 21:00:08 -0700 Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 12 Sep 2024 20:14:06 -0700 Mina Almasry wrote:
> > > On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:   =20
> > > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (3=
9 is not a multiple of 4)
> > > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/c=
ore/page_pool.o] Error 1   =20
> > >
> > > Ugh, bad times for networking, I just "fixed" the HSR one a few hours
> > > ago. Any idea what line of code this is? I'm dusting off my powerpc
> > > build but the error is somewhat enigmatic.   =20
> >=20
> > FWIW I couldn't reproduce this with these steps on top of
> > net-next/main (devmem TCP is there):
> >=20
> > make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- ppc64_defconfig
> > make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- -j80
> >=20
> > (build succeeds)
> >=20
> > What am I doing wrong? =20
>=20
> I don't see it either, gcc 11.1. Given the burst of powerpc build
> failures that just hit the list I'm wondering if this is real.

$ gcc --version
gcc (Debian 14.2.0-3) 14.2.0
$ ld --version
GNU ld (GNU Binutils for Debian) 2.43.1
$ as --version
GNU assembler (GNU Binutils for Debian) 2.43.1

All on a Powerpc 64 LE host.
--=20
Cheers,
Stephen Rothwell

--Sig_/Y+XH_ig6bj5yTZruu/bMi=S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbju90ACgkQAVBC80lX
0GweJQf8Ca95bs0DiLRrvi+xGpDhhoYVs89TRHyQMR03NlBKZikWFmWOFrWyb/Ki
NFCbTiep4nyWVzx5R8SqbTovHY4WeGgGDrrxUoy+r4UxZP7vwVz3hW8qxvyoBwi5
dJyMQYZfG2CUSewluk5d89ch/TcFcx76J0qE/f1rTm03RI0KZfjJfQeU+vEar9Gw
6d0rBVCRQt+MECIGyfa+nVowoz/TL69bwum4aS6oQMk9A7TaJE6Ba3I2MOIclvGy
GLt77ZW9M3o//aQ3B8zug0rw4OmX2Jxv5WjY9tmJ0m7xf7cCWwSHxWZZsRgv0AWF
OXk3svuX1SB3UsSwx6wCXXPHAza7aQ==
=pvdE
-----END PGP SIGNATURE-----

--Sig_/Y+XH_ig6bj5yTZruu/bMi=S--

