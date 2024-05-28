Return-Path: <linux-next+bounces-2396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FD8D113F
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 03:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2BB1F2150E
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 01:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88B4EEC5;
	Tue, 28 May 2024 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q/oDgmuc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EBEAEB;
	Tue, 28 May 2024 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858071; cv=none; b=P6Nz5bgi62NzWpAbIXqh5NhdzfN3iX+TJ1Eq5E6c2Xbdh5X/36TEfR3ej4VU6nPKf4+rXt3ZB+EloOU+IigDjcwTsm1x/sW7yEn9KWmDxy3ocLXGeiMDBN7EhDFUzcHaMXZg/8B3oH+HYASFixeHsCXWEJzwOrTTrLvpXKXd6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858071; c=relaxed/simple;
	bh=/MkQrM/eQKLO9xuDVh6gN9EadPTbBgQEOU2aVQoPRqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYPIauncsLu/7O7oo9gvPgUko1teoj3Rc1if4KMnVP017fyNnGfuRNnYmdJ0K6N7Z0bG1k6avNVguMWZ3aaJq3XNKOoAL2LR4Ma657jz2+3ObPqfDrChTjVJ/dNA6g13ZeKoHAQpz1F81XkXweMvg1uZdtqW7uvdSFVB3YDew8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q/oDgmuc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716858068;
	bh=yDBIwrtzuNuwq/Qf8L4HwUWAPrAwM59cLPBrPL4jRLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q/oDgmucz+cbR1WtknFYudBFadVPHYsMFQd3aPjnxphV1RnsyiN9Gj8pv2KgVnCuj
	 x/d57aZLT8EXs5RTxj5GnO5+hEylQKNT3Eml8JH3zmB+Y0Wx4Db1IlkJqSYC7zldkJ
	 zit3Y2QJ1adVFXNiIuxtdHZO2ZS5dHrEiIth69p3/BecomRUtH0Gmi1EJtD4tQwnIz
	 Oj6mTRcnxiDb0rh0Biv38iy8Y11Bd4+4Ot36dJsKpNNK3LHqhhuuLQAHS4VpPcYKgv
	 PJx3jJNPfkG7mzfUogfHVvSTaiKuVSkywvuBl7fR2OGcpjLPNdUAChJMZg+S+ACHsr
	 JxkjVZKkLKDkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpDjG69M9z4wyw;
	Tue, 28 May 2024 11:01:06 +1000 (AEST)
Date: Tue, 28 May 2024 11:01:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, Likun Gao
 <Likun.Gao@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20240528110106.5881d1b5@canb.auug.org.au>
In-Reply-To: <20240522104128.37c646af@canb.auug.org.au>
References: <20240522104128.37c646af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xlx.N38ihM7FbNRsO3KBhnK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xlx.N38ihM7FbNRsO3KBhnK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 May 2024 10:41:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the i2c-host tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c: In functi=
on 'smu_v14_0_2_i2c_control_init':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: e=
rror: 'I2C_CLASS_SPD' undeclared (first use in this function); did you mean=
 'I2C_CLASS_HWMON'?
>  1565 |                 control->class =3D I2C_CLASS_SPD;
>       |                                  ^~~~~~~~~~~~~
>       |                                  I2C_CLASS_HWMON
>=20
> Caused by commit
>=20
>   49b33f4b3a9e ("i2c: Remove I2C_CLASS_SPD")
>=20
> interacting with commit
>=20
>   3e55845c3983 ("drm/amd/swsmu: add smu v14_0_2 support")
>=20
> from Linus' tree (in the current merge window).
>=20
> I have used the i2c-host tree from next-20240521 for today.

This is now a failure after the merge of the i2c tree :-(

I have used the i2c tree from next-20240523 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Xlx.N38ihM7FbNRsO3KBhnK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVLNIACgkQAVBC80lX
0Gxgqgf+NaIARQEIm343J4zwOEf9oypQ1n8rh7E7dknTsNvjcWTfEQesBmIQcoca
VDyUBXAtQ87JYD43czuOsiEbvldlcK/ZpE7m03Rf7DA00Tk1MxFmXneM7ZSZR/0X
MiiL8tJrPp4wYJtBI01hMKTGn9KDONrYnJeyGEgdbEdkLvozihO+icKO1anlR+iQ
twzj3bqMSeaFSHNttEOWXDcxSysPjVbqo25BLsWEUjDH/w06d/JjeDwSOb+7IULp
7gIkDeh85mNJ5DX7hgHX4SZuhQfcGy+92qW8swzcBDNmeXb//DAVqFvOej16BPcv
LACDSab5QuJt/D0dVJslBH8KfdB4Gw==
=zkMF
-----END PGP SIGNATURE-----

--Sig_/Xlx.N38ihM7FbNRsO3KBhnK--

