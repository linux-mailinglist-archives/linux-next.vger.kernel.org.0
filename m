Return-Path: <linux-next+bounces-7282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E1AEEC9A
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 04:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7769F17F225
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 02:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CBD1DB154;
	Tue,  1 Jul 2025 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lUUnx8lU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDB165F16;
	Tue,  1 Jul 2025 02:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338631; cv=none; b=fj50d3vPOEmqmRrNJUMB2rNavxd8TZZ3aR4iQUD9yE8x4oxE10o09o4SHSluyZzy0ecf6O9YTpLKvDdnXlWJ9VZwiWtfDUZFyDh1P1C6PDGzer0PujkX1MIwbHBUSIeNJYW67uwgCEuEAeF1W0t0gv2jGt5l0erqMPqC73DHsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338631; c=relaxed/simple;
	bh=FK5trhHTookCX4pe+8dxrTW680SIj64rnfJp1ujjDBU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsLiqvXcb/B5238FSHBDR/yQjqPJA1WGLjU/A+BDXalXtfY2GgQsIWei0vrH/2U/8hY0RXo/wWoug96aaT99IyO3rm9V+2+gOFjVFWI8/Z005AA5EGz0h8YDqFYPO76+TTaz+TB4CPWKfz6w66k8D9byeWYiBbycSjUqYLF1D7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lUUnx8lU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751338626;
	bh=MVTkN7/J0c+9dQrkOSPWftCW3TSNeubg8mqKHXjVHfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lUUnx8lU4RmHD8r9FqrF2CxcaUmYQ065lbBnNjmZ5P01ZqExNUaHIDLDGWSRYcYUe
	 RpJiedQ4kARx13+uDlMINDB5Pj7br+xPAhu7Qu2Ef7xA31aFUCV1YE2zGFpem8lQ4m
	 LnrvNYxY6uClZnSru5K12ZY4aW41NK6UvOJ+3rH+BNQyv/q40w7vnWF2sTl+PEQ0GB
	 0LsctpYkvlgG7aEVhxcwGiRyjuGzyLHQ+OG58aVNVENs98OoBzBjwgSHBhtKoQf5ed
	 Z8WYBFQO7qQFDsCEzl2ng4Quvu+bIDu6LmvLN5BSVIEEGO1LidkTlZ9D6OXvAEfU7p
	 e/hPWAzBE1e9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSNy186Zz4wvb;
	Tue,  1 Jul 2025 12:57:06 +1000 (AEST)
Date: Tue, 1 Jul 2025 12:57:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701125705.5d5fb3f0@canb.auug.org.au>
In-Reply-To: <20250701125443.5ba945e2@canb.auug.org.au>
References: <20250701125443.5ba945e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=YUQ=d1Wd9WUo0uc8G0JV96";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2025 12:54:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>=20
> between commit:
>=20
>   ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")
>=20
> from Linus' tree and commit:
>=20
>   d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emit(=
)")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I used the latter version of the conflicting section.
--=20
Cheers,
Stephen Rothwell

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjToEACgkQAVBC80lX
0GyBKQf40+SClgVhEt8CgG9eiqkriaGoXHUZxe+c55LvQo3eKxkJKFPvB9r8pwYf
givB8lYk5o0eUO4NBpxJ8D4ROumvXHrAuapvSzaYDbXyuCA8oHH7l42yNxFpnqjG
fLlWBSRMN6POpXOJpIaNU7JfYK42OEf1sS4iQswQ/G1l9ZJafn0CdSrDb/gwhyUw
MYsbQvDSfuOGu+pkbnDWKC75muTCcoJFXddVdYHE58qTtPLShMJuXErSTzfCl5Ac
UZR2W+veCv9LpfRWBauEoqzhEzT3rz/VZZq7OhhkfEfaJc1EhOarNXGuF+yVYTp+
Ob9+Qf8omsBYKyTcXsLI3oyac6Sb
=U09u
-----END PGP SIGNATURE-----

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96--

