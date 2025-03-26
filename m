Return-Path: <linux-next+bounces-6014-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F0A70FF5
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 05:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26697188BDC7
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 04:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17CD1632D7;
	Wed, 26 Mar 2025 04:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LSUt4L88"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAEEEBB;
	Wed, 26 Mar 2025 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742964848; cv=none; b=toIrcmzetdYcWpWF8UkdNpbH4GFgptF7KBrEs1/aBX+k6evDGB/nhnxOkngSX4/gNnhig3iTtnq5LdKvLAHGl7go+RCeqlmmGBhAKXYtFnpU3dPklFCkydwPDqUjYmicfk2Q2SkuscIN1Ai2XwNylM8WjH9TIlwg6v5pIaViJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742964848; c=relaxed/simple;
	bh=VuGoz/xwlw7kYr3ecx01YvOEM8Jthtu0J0dyHUcL6BY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIKHykfAr5GYIjq3GVy7jbNVzxq0Ln0Prkp9+ai6bdn7w0fR9MYMeXwwHrarvBsOLbnBDr7Qy5OVNZ3hqm27Pjknpa9OuTvrPAATg3NbKHtpL+n95yShE+UhC56uK0HU4yTyQ+h4jDSvEUL/lo8eDa6zJV6HNxMDVBJRd4pUKqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LSUt4L88; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742964842;
	bh=n8P2vqZQTi1XkXDVCJcE0ki1sFp8gyJvqMuQ+EhAdjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LSUt4L88En+aBeojYCqxLItxPdaV6e00pjs+TwuUB2zml5tWrv/xv2A2QqS7gyo4z
	 x399evephmevJAi3ArkpvMoUy0yCL80cRIA2xsV2OUXO8lMuKuBPTcPs1dOWSGGSKG
	 8aN441+FfaO5/Qr+rPgLju0T0Rzqqp8MuY6txFM7/J9ums+130hLcmkzRnoUgvqjf9
	 TSgte997qb0h0hDS8UGB87dcmjWbGkoYwtwRwS4L2ZMefMsGy+UwKshClHDMz8Coyj
	 wj6YW97vQ/ii5dFc1EfylWiMI7fmpOMRHoIr43J6YiEIME/amFZbpOs1UCemAhE0Hl
	 QUTP9KJuGpRcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvZd6vbvz4x21;
	Wed, 26 Mar 2025 15:54:01 +1100 (AEDT)
Date: Wed, 26 Mar 2025 15:54:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the kspp tree with the net-next
 tree
Message-ID: <20250326155401.634d8c79@canb.auug.org.au>
In-Reply-To: <20250213151927.1674562e@canb.auug.org.au>
References: <20250213151927.1674562e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dSRl7syyRB8ezowbLxeXi_h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dSRl7syyRB8ezowbLxeXi_h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 13 Feb 2025 15:19:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   lib/Makefile
>=20
> between commit:
>=20
>   b341f6fd45ab ("blackhole_dev: convert self-test to KUnit")
>=20
> from the net-next tree and commit:
>=20
>   db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
>=20
> from the kspp tree.
>=20
> I fixed it up (I used the latter version of this file and applied the
> following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 13 Feb 2025 14:50:27 +1100
> Subject: [PATCH] fix up for "lib: Move KUnit tests into tests/ subdirecto=
ry"
>=20
> interacting with commit
>=20
>   b341f6fd45ab ("blackhole_dev: convert self-test to KUnit")
>=20
> from the net-next tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  lib/tests/Makefile                    | 1 +
>  lib/{ =3D> tests}/blackhole_dev_kunit.c | 0
>  2 files changed, 1 insertion(+)
>  rename lib/{ =3D> tests}/blackhole_dev_kunit.c (100%)
>=20
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 8696d778d92f..8961fbcff7a4 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -6,6 +6,7 @@
>  CFLAGS_bitfield_kunit.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
>  obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
>  obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
> +obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) +=3D blackhole_dev_kunit.o
>  obj-$(CONFIG_CHECKSUM_KUNIT) +=3D checksum_kunit.o
>  obj-$(CONFIG_CMDLINE_KUNIT_TEST) +=3D cmdline_kunit.o
>  obj-$(CONFIG_CPUMASK_KUNIT_TEST) +=3D cpumask_kunit.o
> diff --git a/lib/blackhole_dev_kunit.c b/lib/tests/blackhole_dev_kunit.c
> similarity index 100%
> rename from lib/blackhole_dev_kunit.c
> rename to lib/tests/blackhole_dev_kunit.c
> --=20
> 2.45.2

This is now a conflict between Linus' tree and the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dSRl7syyRB8ezowbLxeXi_h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjiGkACgkQAVBC80lX
0GwuKwf7B9RhnPiIvGid2Ou93o3mJTsvXXGItsci28BgeezwHY9bAB6bWsenEdQJ
7FKesiieWAVmrrwo03Geu6uDror5qSV67TEgmjmu1NirDdOn18FIut5zDHppifEH
DGrWgMTphoZVFKIq7WfPFy06sLKxNPIYYsM7Wps7uuzb1jsPHPX72ddELvl3lsyK
fNfKLUyBC5Ifo6+urEVwfaoJaiusGpPIUMteraKvfPx1wmT/Ts/Xwmqix7zzlBDO
i1MFpyAr1kpfbLvAdQhIxILND0vDkUXxYR0hKJtuxLrduAoMxvMdFeO2qyHvk2j/
cGsRH+M7Fvq9fB7di/s54MtAGfARPg==
=SUpa
-----END PGP SIGNATURE-----

--Sig_/dSRl7syyRB8ezowbLxeXi_h--

