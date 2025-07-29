Return-Path: <linux-next+bounces-7760-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A7EB155DF
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA3616C48D
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A160F27816B;
	Tue, 29 Jul 2025 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PjDkBChr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8842C111A8;
	Tue, 29 Jul 2025 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831281; cv=none; b=ec3O/nuZUepTyLudjv9YYmIXOgzRwPSh3mN2mE1qU+hz2VZipTxgQkfa4OEWDdijalqMeGgh6LXpd9XlIm8nzgWYnC2P9f0EmW/fn7APMC6BJhMuqUB2COee+BtSkOKv57ke/g53P1aWfVgObokVP5uFEtTEIn3BzPFszf595ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831281; c=relaxed/simple;
	bh=4q/ctHPDc+JUlxtdQ+w2LMxH74RHELm1Y4rGpvfoVvM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGA+XzolVKaassJOylOyg/G5S4omIn1b+Msu5Cx6vfoLO3J4H4XpyZbSNTKtY5Rwu/SNWaGQvw44scUsJco6uf+12vhPbkg6Pfrek8HaeYqwVkaK6iq39pXGoVcJytSZq4ypB0wHzhspyLj8EfwQLc2JVLGRMh32Jfvv94j8FWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PjDkBChr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753831062;
	bh=g+wqqBr//Ejw8+yRcgKFpbIa0Ch9PxhKUQTYkC2V2IU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PjDkBChr8mR+Cttka4jefw7w62zrz7MUj9yWMANLGnwV6hs1wbE/1ci2RzL3EnT+K
	 J6hXrv8TXM6oI0MxvD3WWVkhjDOuCR3N/AOFy9kb/Vy4r2j2GiaJx+iuS035ObgI7U
	 CYfYc7BerjwnK/TtNDcplJaAqVmoU1sJfIBkDseOqHSIoHT1xIGOeDlrBNoTuYCDzn
	 Cp9zaoo8AYfUHhZ//YGD/7S1TFQKO8x82iBYUepdxFDzSSfa2yke87ofFc8O/dpH7J
	 HLJb0vHnmDNTy6hiIaBQ93rsIXgDoIXWdP4DhL6YSRWE4mnR1pbuJuPyfYV4Efmbh7
	 RgsmTV+gtqbtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsB8P63Ftz4wb0;
	Wed, 30 Jul 2025 09:17:41 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:21:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Raju Rangoju <Raju.Rangoju@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250730092113.0c9cc43f@canb.auug.org.au>
In-Reply-To: <20250722114246.2c683a44@canb.auug.org.au>
References: <20250722114246.2c683a44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IeIBYXYcuqeFqkvlsjBZ79Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IeIBYXYcuqeFqkvlsjBZ79Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Jul 2025 11:42:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/net/ethernet/amd/xgbe/xgbe-ptp.c
>=20
> between commit:
>=20
>   fbd47be098b5 ("amd-xgbe: add hardware PTP timestamping support")
>=20
> from the net-next tree and commit:
>=20
>   e78f70bad29c ("time/timecounter: Fix the lie that struct cyclecounter i=
s const")
>=20
> from the tip tree.
>=20
> I fixed it up (the former removed the function updated by the latter) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the net-next tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IeIBYXYcuqeFqkvlsjBZ79Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJV2oACgkQAVBC80lX
0GykFggAhcQKtzGOGIRQOVB392aAfVTUu+HZISqd9Hj8HcVoZH3CmQ2o75BJKqlt
is0w+hmBvJJiq6ZrK08xC/K3yeNMG1CLSQe1IKjdi7xEcMpnqyutgWKPVQXR3i7K
wmc0ygj26RmJloeh4lKLSjCB387fW7wEBPL8cnUSXwJBIC+u6f/qnN/Z/O5t2ut6
fgF/EjfshNOg2LW4NnWWcb0R75fpTlPgAgEUb0xAQl+PI/h5QAYgAvTHdZWxl9Mq
0rU3tYjHnr/TD53QDT/i+W8w22n45aVkyUiddSLZNMUF6eLt0zMpVrDhwVKPo5Ok
sWwbeCNHivIqwuk3A8CJeBsGVTra4w==
=fLtq
-----END PGP SIGNATURE-----

--Sig_/IeIBYXYcuqeFqkvlsjBZ79Y--

