Return-Path: <linux-next+bounces-9373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B3CABB2B
	for <lists+linux-next@lfdr.de>; Mon, 08 Dec 2025 01:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC453011EDB
	for <lists+linux-next@lfdr.de>; Mon,  8 Dec 2025 00:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2614B7404E;
	Mon,  8 Dec 2025 00:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hjK/jddV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB7137930;
	Mon,  8 Dec 2025 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765154397; cv=none; b=FwmRGWCCNe45qXv7LxsNw3ptx+IjAX+Sro8t7cvOg05bAHIewmG9MAnyjRMKuq1CuPsbTC7IbWRc9n41TMqgI1kBz9y1bwvQSBK/PedFe/vxJ/nzhScretn8Rx5Zc4p7wcaFa5/LK8dxAKuHsjRiG6riGOm66qa6mOqn/O0o/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765154397; c=relaxed/simple;
	bh=3a/WBsyO8gt6VtMV9N9LySD0EoTFJcltQUVbPipgVw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=juGteSLe9Chk7EQ0DKvyaax0Mlrh0WlJOcSfK6WZeho5X10dMbEvtfwMo/wnYkIFDQ3t49EDNKt0gmVir5/C54hnkMwLQq8TPGZVOCHiaO/VH0gL2EDE0ouYNe8N51XP/DoQM8xYZEUqYHpy+8S5vMAX8BQNiFJdFKkXnvXvrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hjK/jddV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765154388;
	bh=JILdEXcTR2/YROZUEkrxGC9wITTnFUbZGUk+ZA6dPFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hjK/jddVD0gbOAhz4BtO3kCNv7G7xDt0Vp6AN7ExiWym2YHzpn4I8gjG6Cwsr+7lC
	 OJL8xSXz5mscNQ89y8AN7nSJh8rELMfnqMFk0BspmLWQUoZIWZWtDYICrSGss/PFRm
	 39bCCXZRNOx/oqpdwl7DmAsoutxPEzgvIYNlvyAH1ARYLXv1s4ozKAlO46GML5WcBz
	 lFKZyu495cOWf+G0Ll7coAQ2zvP9ebTbqe1Tx40rZ9HvNikRvbL+tRTXMXlQEYIjZi
	 ZgewLQ+nB0cpyUEWl0d7eCtSZmZyLFpqGdtPeQAat610zv7Vub0tqHk9nPTuDVsRiB
	 HB9uxNkUrm0mA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dPjmf4WGwz4wDy;
	Mon, 08 Dec 2025 11:39:46 +1100 (AEDT)
Date: Mon, 8 Dec 2025 11:39:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Greg KH <greg@kroah.com>, Armin Wolf <W_Armin@gmx.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the
 drivers-x86 tree
Message-ID: <20251208113944.659f25cc@canb.auug.org.au>
In-Reply-To: <20251121142512.371a77fe@canb.auug.org.au>
References: <20251121142512.371a77fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5sKs7ZIg3o7j=Z8M0xRSr6C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5sKs7ZIg3o7j=Z8M0xRSr6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 21 Nov 2025 14:25:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the staging tree got conflicts in:
>=20
>   drivers/platform/Kconfig
>   drivers/platform/Makefile
>=20
> between commit:
>=20
>   e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate di=
rectory")
>=20
> from the drivers-x86 tree and commit:
>=20
>   aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
>=20
> from the staging tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/platform/Kconfig
> index 6bb645aed3d1,324c69c63f76..000000000000
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@@ -19,4 -19,4 +19,6 @@@ source "drivers/platform/x86/Kconfig
>  =20
>   source "drivers/platform/arm64/Kconfig"
>  =20
>  +source "drivers/platform/wmi/Kconfig"
> ++
> + source "drivers/platform/raspberrypi/Kconfig"
> diff --cc drivers/platform/Makefile
> index 533f500dfcff,b0935c602ada..000000000000
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@@ -13,4 -13,4 +13,5 @@@ obj-$(CONFIG_CHROME_PLATFORMS)	+=3D chrom
>   obj-$(CONFIG_CZNIC_PLATFORMS)	+=3D cznic/
>   obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
>   obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+=3D arm64/
>  +obj-$(CONFIG_ACPI_WMI)		+=3D wmi/
> + obj-$(CONFIG_BCM2835_VCHIQ)	+=3D raspberrypi/

This is now a conflict between the drivers-x86 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5sKs7ZIg3o7j=Z8M0xRSr6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk2HlAACgkQAVBC80lX
0Gx9bAf+KX5AAUTkEfpgX2sOg1uqZcQSDEIrtCs1DBInvbmRH9xsSLsohxTbTzCf
wBrBn2B8Tt84G1yU8FIs2IemSWbIU2Yh66nlATaK4v+Ej3QwoGECZZbktYSa5sUR
HHh+g7IseHGRJ/fgb3KCwHXff9ew2nUL1kbNB0P4oSLs3kPkME1lusCjYCnOxFsN
uSf+mQHr49GkDIi5yq3dyFhARgSPOcxtbNn2AjmlyKczbszClDT7MI66VqgqVHg0
zYVmaMUBA1noC8hlhep+4zY+xnoEK5RGQXbMBMg74hSz4uw5YmH7dk2cKG3t/18Z
bD6yOXuMa2KTotUNOLfW8aT5krvrXw==
=lg8e
-----END PGP SIGNATURE-----

--Sig_/5sKs7ZIg3o7j=Z8M0xRSr6C--

