Return-Path: <linux-next+bounces-9412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CABCC068E
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27F4330161DB
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBAA7080E;
	Tue, 16 Dec 2025 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C3aYReYP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7E22097;
	Tue, 16 Dec 2025 01:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846968; cv=none; b=t2j+lQ5fVYKTbmY26NC9lUsNq1pXHXIBrANtsB4S4GFxQtfC2n7pW4NmDKIQLlCPWO9sHZ1StP9bha7kDCQAVw6MXEjr5LskZ4Cr91oay7zBdhBYfas0S/WniEwkkKGTt25o/T646zBB3EHi9YA+GV7xNBlpSYtfxxaNfghqivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846968; c=relaxed/simple;
	bh=Vp7XXmixiZXMpc9+RNAen+ATjZYQg9zI2Xx6EJ9VBKE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clpHHiAmH8S3XdBFIFhD5ezGt/vjvGhbvgpPrrv4Wd8cjxthXJbhjDAvpwB2y5+K0MpUbP7PKfnKo5bAC59aaJ8MZ8EW8Ub9zDfTMDF5AwcMJ+L6n9FP81oauDVAolD0m/c1dVDesf/FtLB2YIz5kxRrQ3aEada6301E761LKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C3aYReYP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765846965;
	bh=/Sy+gtLj0TiAjOvmvmxbJ+rmLnpJnWi6VJqy87UaseA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C3aYReYPZ/XGhvkJiXDxT753Z5R+qnTSRIKFnvCsPDXX2strVHJZ+prsvNPThdF55
	 UyefavEh8kQbsnYI12uakFkKj/1x+gxHF24X86E956Wl2rRsXAiPOHpm/gLT7HDV3C
	 SQULilokTdInSd7Y8J2omihLcJHls1HJ2JsS+mc//HZHwvTucbBzKLc4hyGB0aclp/
	 oCVAw8UHGEoSU4aMZZeVIgiukGbJnVhFTwbJ+4PHEDwY46aVdZexvEuLUouVes3hem
	 B/bfRPEi8pMWgE6i44m0dV5C/AL4bhlIUyu03p1Ok7PIUaU0g0kvVmx0skd9T/jZFi
	 IBvnj2ZkAQh/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdvS6h6Xz4wCm;
	Tue, 16 Dec 2025 12:02:44 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:02:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, YiPeng Chai
 <YiPeng.Chai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20251216120244.2a23c5bf@canb.auug.org.au>
In-Reply-To: <20251106150723.72ef9e86@canb.auug.org.au>
References: <20251106150723.72ef9e86@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5mnKSAoAD_YyxEqhd1u3BUf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5mnKSAoAD_YyxEqhd1u3BUf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Nov 2025 15:07:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> WARNING: drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_IP_=
BLOCK_TYPE_RAS' not described in enum 'amd_ip_block_type'
>=20
> Introduced by commit
>=20
>   7169e706c82d ("drm/amdgpu: Add ras module ip block to amdgpu discovery")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/5mnKSAoAD_YyxEqhd1u3BUf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAr7QACgkQAVBC80lX
0Gy3gQf/b2Ks2+g/RZ4OTsLZrcrA/2PHbMYuaTpr1Ksl67QJPTrzMIezog6Gw+bi
ZgqVjqXXGvtzHFby4RphsnxHECABh6WKEZ8eBv00VM42gSHLikpRGCUrlMws6GP2
km6EQClm2OaUt48U0n2aIfIpYTYbKodySpZRflb82AgQUwdpkvS3vP4OU/ekmYTk
AV/UYjRu9Aeog7Iq854Hqe4qWlAVL0X7fV9i2fUnun5MbHECY3oZ5rCHKV7btW4H
vdI6kdeZv2NTiZB2DJXprfxRBiweFT0xLQrlu2ofAc/orZrOjw4CizHz5IGAIh9V
N72UTg/GVldfIoSgOfDtysLmCo5ZxQ==
=CZBh
-----END PGP SIGNATURE-----

--Sig_/5mnKSAoAD_YyxEqhd1u3BUf--

