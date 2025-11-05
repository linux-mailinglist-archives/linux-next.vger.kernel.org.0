Return-Path: <linux-next+bounces-8832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6DC33DC4
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 04:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B26942853D
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 03:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E53260569;
	Wed,  5 Nov 2025 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cf2VTrnS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE425DB1C;
	Wed,  5 Nov 2025 03:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762313997; cv=none; b=MKZZWumizGmzkBR8XD6gutu7gKM65wpP6ItlGp+fQFN0zAfqGBwpk8bEUAYUC5m4+ZUkTZtk2b/ccFCaaVxdbsQuteTi0cEkrp2n0bNP1DV4ICYMaCEuBWTHpL7I94lEqjIM1HjcMXgtMQlQhEMLJEtwTTjveEhBKAoXd8/uaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762313997; c=relaxed/simple;
	bh=/6mCrdIqsHrAWpDdLKmcAkpZMYZD/W8tD7J7CdDSMOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A70Ly3lB8dTtho7I2cl9SZlaHWofzA+Kr9vdtLBNhSEtY/rUs07ZnPzsrH89XpOGI7hXZ1chNhy4yRGtVznEHvlDayy4G0QjTGJxW2/o8iGGJxFYc4MwhYnW8pXXPBGpPum9ZwRtdCGVWzJTqGFCdKqJfO8D0kJLCPiYIJmsQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cf2VTrnS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762313991;
	bh=Pg7xXHXBveHpXNpRc2DDYfAKSaHLFGrPqwDFBMPm+9g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cf2VTrnS3WGKv3ntjF/9p99K4DAVIJjvAVLOawyoK9AJ+6bYcWljcmDfOxl1sbq8k
	 +4knJA+Wk9rD3qHIfRCKBA7gVdwuIdYEnn43K8BQ7bipzxw1wQYfOSr3VSMd1gWG37
	 +OLILoFbS8P6Dti3wqjRbnE/GVp/ThfhrzRP1nBivpRd7TkN9VmBNl0efm6bMfqy4O
	 doIJMsFCcY6Vb58+Q2s8rmKqHNIqMQvXAkMeZjm72FmQLB270NXLKHCoW2KGqFGejC
	 /rcv9hhjl7e394jHSngEwRRyEO9xAhmImAg9KYXvvxIzOj4cmZLUTSbUVI8Vvnc122
	 XWNSTdf3ADaXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1WKf4pkrz4w2S;
	Wed, 05 Nov 2025 14:39:50 +1100 (AEDT)
Date: Wed, 5 Nov 2025 14:39:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the omap tree with Linus' tree
Message-ID: <20251105143949.379e529a@canb.auug.org.au>
In-Reply-To: <7ha511i7yb.fsf@baylibre.com>
References: <20251105115402.1b03f921@canb.auug.org.au>
	<7ha511i7yb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kdMFl4KSax_HIQweljFzoTI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kdMFl4KSax_HIQweljFzoTI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Tue, 04 Nov 2025 17:28:28 -0800 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Today's linux-next merge of the omap tree got a conflict in:
> >
> >   arch/arm/configs/omap2plus_defconfig
> >
> > between commit:
> >
> >   c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of=
 the defconfigs")
> >
> > from Linus' tree and commit:
> >
> >   810c5ef6efe9 ("arm: omap2plus_defconfig: enable ext4 directly")
> >
> > from the omap tree.
>=20
> Thanks for catching this.  I'll drop the patch from the omap tree.

The omap tree patch has more i.e. adds another CONFIG line.

--=20
Cheers,
Stephen Rothwell

--Sig_/kdMFl4KSax_HIQweljFzoTI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKxwUACgkQAVBC80lX
0Gzr/wf+MuPd4NM3arm0PJ8mWj60VixBwwpYmXxEnie95X6ZUTyhPEVEUrWPKdL7
Q7T99Mvt0kFFKLoYKSeFRO/dMuEo4t6EcNuky/qcYg3Lv1oCriAgmSkAbSkZPAPC
MeWthUOznTXgBmV4OrnWEZMPhPuI+CvO395QwVqvpyse+52kaSLufhiKsWmt7DQL
4A+NRAFvI2z4j53HeYt0n6PVzdmSrBDCfVo2xJhagGcsHch96dCS7jijOkiuUwAD
Ut/JjJgeWr4OPHq13xTNSvabaryi4T+R92Vxz61OisXb8NY38Oab3blGolowI3pn
7QMdAmdkcHxtpXSiaImy/Vg1n8no8w==
=U99F
-----END PGP SIGNATURE-----

--Sig_/kdMFl4KSax_HIQweljFzoTI--

