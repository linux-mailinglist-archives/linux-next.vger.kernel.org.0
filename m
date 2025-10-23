Return-Path: <linux-next+bounces-8692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC104BFF4D3
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 08:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD4184E1969
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 06:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FB8278779;
	Thu, 23 Oct 2025 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z5KnDsGy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F0027603A
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199758; cv=none; b=OUV67dMAU5uwMfcokrenJ3g1NkXXTUJDIUx+04nJCxlpw+VyIolLrg/Xx+PK+df4mQ0DkvxZ9/dX9XJWDe2v8Q7VN0xlBnFr2Lvk8iCM6HfOMup/PxvP0j/3Lb1dOZJyKQsKCrCDCAFdc/DilTopvtdOuKALi9SKeyCKF7QLkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199758; c=relaxed/simple;
	bh=6DWcxa3Fk6kyEVM84D3o5xuwcS0X4vu1fpxKfa7WNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBuJgvZ2mlykGhMV9YAJVzQkYzySoSDhT+ZnRnS3xSX+34tKBS7RbUOfirT9EPjOybBhM8AbpnqTJ6Ww6oNhbmag1MrWVJIoBWN7n8ZQ2m4jhtgcqT0KjpKYWckkAg+6SF15I/yy+QFNoEhbD2qpVwndJP79CoJyaOS/sP/5giE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z5KnDsGy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761199752;
	bh=1wXffLfgIhUvJRJbQgaKhWdMJRfdXLUbo+zZz01PuJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z5KnDsGy+95a7nCMI4pHgIQW44gqYVLcxp09CZq4nSNoZu1c1wrSmlbAm0M+q4jK/
	 p40GDjkamPiEg3ggxpn4z2wybnYf28lUUd4dPWXEzRCCSwt//YoX6i2LHGubQeW9M6
	 JgTTVno3nOUBRXqSY307gzVFyRNym4LV8tJJpT9Uz3rd8VS66F6cu7zkawIzo8tEZz
	 68eYqYk2y4DjuiJC7Tx7MB8ceYr5orZzo3WNKBnSFkF6pqDKXSUflMMGM9Ut9LKg59
	 65fZAKzrQmtXDh5wlBq2/LOk8Q/OcvpsPvZJz9BxqMFTYMtRetxlvzvTyz+mYT20zx
	 vSYNbz5ILVJ+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4csbG00zdCz4wM5;
	Thu, 23 Oct 2025 17:09:12 +1100 (AEDT)
Date: Thu, 23 Oct 2025 17:09:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org
Subject: Re: [REGRESSION] next/master: (build) cannot jump from this goto
 statement to its label in drivers/opp/o...
Message-ID: <20251023170911.0df27b1d@canb.auug.org.au>
In-Reply-To: <176119914391.5792.9020817346274859760@15dd6324cc71>
References: <176119914391.5792.9020817346274859760@15dd6324cc71>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t6qvvKV6QCzv7pnBW3d0XQM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t6qvvKV6QCzv7pnBW3d0XQM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Cc'ing the OPP maintainer]

On Thu, 23 Oct 2025 05:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
>
> Hello,
>=20
> New build issue found on next/master:
>=20
> ---
>  cannot jump from this goto statement to its label in drivers/opp/of.o (d=
rivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
> ---
>=20
> - dashboard: https://d.kernelci.org/i/maestro:992b985637471b20dfed6cb78dc=
938315a3ba8b6
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> - commit HEAD:  efb26a23ed5f5dc3554886ab398f559dcb1de96b
> - tags: next-20251023
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to i=
ts label
>  1545 |                 goto register_em;
>       |                 ^
> drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable =
with __attribute__((cleanup))
>  1548 |         struct device_node *np __free(device_node) =3D of_node_ge=
t(dev->of_node);
>       |                             ^
> drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to i=
ts label
>  1539 |                 goto failed;
>       |                 ^
> drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable =
with __attribute__((cleanup))
>  1548 |         struct device_node *np __free(device_node) =3D of_node_ge=
t(dev->of_node);
>       |                             ^
> drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to i=
ts label
>  1533 |                 goto failed;
>       |                 ^
> drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable =
with __attribute__((cleanup))
>  1548 |         struct device_node *np __free(device_node) =3D of_node_ge=
t(dev->of_node);
>       |                             ^
> 3 errors generated.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Builds where the incident occurred:
>=20
> ## defconfig+CONFIG_ARM64_64K_PAGES=3Dy on (arm64):
> - compiler: clang-17
> - config: https://files.kernelci.org/kbuild-clang-17-arm64-mainline-64K_P=
AGES-68f9a84f9533132a189903f3/.config
> - dashboard: https://d.kernelci.org/build/maestro:68f9a84f9533132a189903f3
>=20
> ## multi_v5_defconfig on (arm):
> - compiler: clang-17
> - config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-multi_v=
5-68f9a85f9533132a18990405/.config
> - dashboard: https://d.kernelci.org/build/maestro:68f9a85f9533132a18990405
>=20
>=20
> #kernelci issue maestro:992b985637471b20dfed6cb78dc938315a3ba8b6
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org

--=20
Cheers,
Stephen Rothwell

--Sig_/t6qvvKV6QCzv7pnBW3d0XQM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj5xocACgkQAVBC80lX
0Gxe3Af/cozP7Cha9IlLHRLec9WUa7yFW3kHCLQFDkj4C7ajQ+c3sw5zC2lPssj3
3pvqcSTN0yw3IQTZsh+HlgDF1+hg5BilqyZ3h6sJT7yxeLLFlZzEhqhThbDzCSKF
K3lImy/zRv+ixzHzag6jausdE8u5Cd1lAVbPsc5b/Uj5J0YBpiQtDQGV0laa2/5i
eG36krxBI60rRIkqmIWHWZ2Y5uivsNhEQpVaf/qRWX/hPM/U56EzFenV+hRH/sik
icroP+McO+GGnauhMuBZzGSDOHGEOwHCvqb4VcNz5PsuQ+XrBgTDdvIgTq+jW9pL
Iq7cu5iyVeKzoO6Dm7uNFgTnKqiW2g==
=8z85
-----END PGP SIGNATURE-----

--Sig_/t6qvvKV6QCzv7pnBW3d0XQM--

