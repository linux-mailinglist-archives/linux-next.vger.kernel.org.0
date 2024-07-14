Return-Path: <linux-next+bounces-2991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2CC930C18
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 01:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A5E0B21287
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA992273F9;
	Sun, 14 Jul 2024 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aEKawx+X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12515C0;
	Sun, 14 Jul 2024 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998289; cv=none; b=l5fFPHUm2GghaZOJ9mpi6C96Sdqg1G5J42bQ6dVHAVOfSwJyK4N+ahCwk38m8U+JglV6s3MQDcJJQ8xQBz1ZYAMg8B3Z/NSSnFrWyINPY4ZLn8Aq0+dWmYq42hGkyzAI2rpBiUsUrKaUak2VqJ6srT5YxtCuwNgKSOyGCHxSZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998289; c=relaxed/simple;
	bh=VBf3YlD5FtQEh+ufZu70C0BEB4Q6rwOgrVrKN6CBCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPJ0tHWgi2tKKwbRxI6HQwX2Vi7bkdMgApDKRwM/DJZwGpO/7t509jsIDMO/sKJfqsWesqKxwwJLi7l0StkeV4GjmKhE6OIPIQQFrJt4CrJfaJ74VO0p8rXMEVWFqKOM6QPeXz3x8t1XafC39BVtSlohaLeZy2WMusrAfbxmIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aEKawx+X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720998285;
	bh=HAwEYN6qfVQNDGGhKZJ7pBrjOWBgv7AvJr6wBOJcNiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aEKawx+XMaDY8G+MOt5j0Uv2XAk/Mb5co60vzlaiNn4poan2/3ShQhWFfjBu0eqE5
	 cVIiiT7u1g5u0RKMTOIhRTLozxUrrogLNoyaNDcfA9EeMSnyKnM/AkRtucxECWxvo4
	 I7VX9Nmiqdru33NstsCXFwc3v3nfZbR2DAi72ncxW3qU0c+2Lo7upgt1cOb6kmgngs
	 zAD2O8PM65oXRoDZ0fIu83PTN2TIo19c6GIay5X63KJi8LmqRtrgOH/X54blJQ1vTL
	 f/MNFjxEaUHOX8rxurGmpvgVHcIKpwdPIQ1EZEj9HJFyREYz2GhDSyfDXdpSwpJ+Hg
	 W/BJ9RYJSx9Cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgrs58jlz4x04;
	Mon, 15 Jul 2024 09:04:45 +1000 (AEST)
Date: Mon, 15 Jul 2024 09:04:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Adam Nelson <adnelson@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715090445.7e9387ec@canb.auug.org.au>
In-Reply-To: <20240514171153.73fed88f@canb.auug.org.au>
References: <20240514171153.73fed88f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/veV4SwJIoDj8GmM2y/KQdyA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/veV4SwJIoDj8GmM2y/KQdyA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 May 2024 17:11:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:580: warning: Function parame=
ter or struct member 'program_3dlut_size' not described in 'mpc_funcs'
>=20
> Introduced by commit
>=20
>   9de99fa8c1ea ("drm/amd/display: Fix 3dlut size for Fastloading on DCN40=
1")

I am now seeing this warning after the merge of the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/veV4SwJIoDj8GmM2y/KQdyA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWY0ACgkQAVBC80lX
0GwoZAgAjz2ItD81pQrZ78ZiaXeEQYfStgZ7S/0Qdn0/l/h7yXqPho9FuRPq734z
mlibM3tcMdrs3zG41I2tI83WJOVGCFZhZBmiCovLRwKwVi2ItGIj93PG3f3khnCm
rEFhfK2MxN6anDWAVUF92WDRZrKnelJU3YeQLMSw0Gw9OYaGtKEBCmitwfhLWPbS
LYCfzcPYC/yDRZLocMx2mYx/Zq1LPhV14DjRh3GX249mt6Sx0ijAKg5kl6zSQJn2
4181Fjjbg5hW971byyTg8mU23jGjv3nkmZ59NqjTA3cLNRupUD+qbgIeTq7HhWOU
xx9qFYbzlm/gDspBAmSTvfDXdTmR1A==
=/2gZ
-----END PGP SIGNATURE-----

--Sig_/veV4SwJIoDj8GmM2y/KQdyA--

