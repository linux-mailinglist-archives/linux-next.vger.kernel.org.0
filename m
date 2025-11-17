Return-Path: <linux-next+bounces-9032-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D4C62136
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 03:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A8C3B38B1
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 02:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE27F1F2C45;
	Mon, 17 Nov 2025 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m5WpoOfd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A048F4A;
	Mon, 17 Nov 2025 02:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345809; cv=none; b=d4PoDl7O2yl+IhK39a2R9S+7AfwpYtgcnX13flocxdGEg902wj1MsxQUU0SAZx14MaAvCUpSsepi+sfz7d5fU9lRKJgMidmqUz6Xx8FE1NWhCBewTfgF9SJoltu8T4/W7ggILKSAy6UXQ70I1eBO2mb1YeRYOuQzehHn8oreYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345809; c=relaxed/simple;
	bh=NkzpN2vzZYc0bWOhmyhYdtS3Aq6RWvNDz3xZIgCMH9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWZV5M3cCKDIffuCRd4RQd/qY4lVFA6azyPf1nNZ7eRBZTQVEBkkvH3fKkPgdcLsL5jZE4kph/j5Gsh6gIiND0fZYZe3o3tBHu9yJo5Af/t9lrmvZ94ZiiqnFuWVMPKS5Fgsj+YE7xK1quioQKQHBFsdtnMXzJ0Ffqr6IJFm73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m5WpoOfd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763345802;
	bh=30bl53/fvXc/VmTspWHyBYluHTR/TlyRrJd0ng1yvj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m5WpoOfdkw+qnKzH4qulwhRcrtnyaUengErlI6jiPO+riO2YigfgN3Gcpgh0QpnyN
	 A3yj4HYHImvRv06gGhFYzRN6RSoFi5QxBM6rPSFoQRhCWJpNxK2mystd5dVQ4YfCa6
	 HRNCUI2QCgbeHiylY2vBiw8ysnPwlsVrP1Bbz+NeDZu2BILsn/IvBu/rrKZrjfnHOA
	 0T7D1blmSMwSwqmxmbZhkSZVAywb56Z3kpMB9clDnLLVBB+uAdH+CXeYihxI6BR2Gr
	 Mc5iZ4wfjvDK4MvFAGbUzkk3o2IoVBGa59m0oU3EKiAVCvmUMGPEbVtwa6ewKw6Igz
	 s7W3DGh+bcZpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8rw966NFz4w1l;
	Mon, 17 Nov 2025 13:16:41 +1100 (AEDT)
Date: Mon, 17 Nov 2025 13:16:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner  <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251117131640.16a7a939@canb.auug.org.au>
In-Reply-To: <612b7e64af3872fde837740404888a03a2c7b6a0.camel@kernel.org>
References: <20251117084326.42c935b0@canb.auug.org.au>
	<612b7e64af3872fde837740404888a03a2c7b6a0.camel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LOzvUZ+8Hn6mUT3Hqtvp4Lg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LOzvUZ+8Hn6mUT3Hqtvp4Lg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 16 Nov 2025 17:23:15 -0500 Jeff Layton <jlayton@kernel.org> wrote:
>
> Thanks Stephen. This patch should fix it.
>=20
> Christian, you can either fold this into 1602bad16d7d, or I can send it
> separately. Let me know which you prefer.
>=20
> Thanks,
>=20
> ----------------8<----------------------
>=20
> vfs: add needed headers for new struct delegation definition
>=20
> The definition of struct delegation uses stdint.h integer types. Add the
> necessary headers to ensure that always works.
>=20
> Fixes: 1602bad16d7d ("vfs: expose delegation support to userland")
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/uapi/linux/fcntl.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 008fac15e573..5e277fd955aa 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -4,6 +4,11 @@
> =20
>  #include <asm/fcntl.h>
>  #include <linux/openat2.h>
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +#endif
> =20
>  #define F_SETLEASE	(F_LINUX_SPECIFIC_BASE + 0)
>  #define F_GETLEASE	(F_LINUX_SPECIFIC_BASE + 1)

I had to restart linux-next today, so I used the patch instead of
the old version of the vfs-brauner tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LOzvUZ+8Hn6mUT3Hqtvp4Lg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkahYgACgkQAVBC80lX
0Gxo/gf+IQON0m7xmt163uIGeIdNfHttMcnW0Z427BMCOjv/dCzTBo++Fd1Aa5gg
QcUOMXlnfiEsPWRTOgoT3dMEFOSqPVZZ8yXJ91HSwsvYTcuNaMd1DxJURz9DaFvS
7Xp5zXZ+HGkHGS9Inn3QKPsCT4BhsMcy+Onv+Tv83CVVhjBhFbNdOW6RdqtcIBec
8KYKd0Ja0EzuDKKHNLpa+MTGflrWeg3U02YII6/cf4X2EphU+4fBH707dnBCmBLp
xH3kdxCwGzZkCAne3NO8QQBk90gkKmWXOwKXT7SiPnqSN/mpJewzDe7bVFf2m1qI
eSKcJy2pcI6usY1FW6NCNKNGuNgvuQ==
=nOyp
-----END PGP SIGNATURE-----

--Sig_/LOzvUZ+8Hn6mUT3Hqtvp4Lg--

