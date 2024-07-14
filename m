Return-Path: <linux-next+bounces-2990-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BD930C14
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 01:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 393D11C20C92
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F54273F9;
	Sun, 14 Jul 2024 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J6qSNOv8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904615C0;
	Sun, 14 Jul 2024 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998135; cv=none; b=K07SguC1+Ri1sVIuzTTCV/erTnWU4FeMG7MY1ITz9B9sVrY8YPfU8UgwQvs9KhVpSSdTcK7/jPWs8mxtkgiDy0ZFPUWmxzEd/xYtE2vxYj3T77I2ERORUVTYNyIGVD1JfoBhOYT3w2mAr4zzcn/+0pH8hzcXqroWpacEZoQ4+ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998135; c=relaxed/simple;
	bh=4oxoZBqSeJLbnP+jfHcKjyelilmGgtsLDRKZ2ykklDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H79S5noVx5ocwccNLPn+BD2zuzbhZNqn7kWdNuxAYKufm1djVk3jBgcWEYI+sZ9s3vp3sV0xqZWwV2tiIFHtT2gLgFfOPVaaQAwr6wef6qsUEB2QrFGRlADkCChAhmKai+hjW3VO6+RrTh+Knpm/GftfTpbbJlixpUtdY8NYPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J6qSNOv8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720998131;
	bh=BNPl9Tm4jDF6f9rKk18fzIBf3KQ7iCYeyQfTpgvsz8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J6qSNOv8RAfXGCpBM1rtGbD27BNf/suhclwsAvUve/u8sD4ZTZ+6+dUpV5zgUgLL2
	 AGaX5WW5YdcERK6Q2Ce6o0YE8ar6UZK+20HlU+HpA+MU7nIZ01O1WOvb2gpWc5iSxD
	 sXTZkFOeuPhBSk8V72pI9tz8nvAw83famVB8hw8ejYiN+P6CrB5PTv2cNJvBm5VU/a
	 bKz6sUdggzrIdesTCCRa/SKEq8G/Lc+BtscrZAzfGvjURYZFl2sZ0bEzcic73+xB0d
	 dpUu2UqMiJHOb0VuVANjn1dz1Jba8u7xI0LkXD/KjGIzn/V5PDquNNyzr4hZFm/XZp
	 o4fOiZvxPALdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgnv5d4pz4x12;
	Mon, 15 Jul 2024 09:02:11 +1000 (AEST)
Date: Mon, 15 Jul 2024 09:02:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Roman Li <roman.li@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715090211.736a9b4d@canb.auug.org.au>
In-Reply-To: <20240501151929.219916ee@canb.auug.org.au>
References: <20240501151929.219916ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aGoR9.QStVhwAN_BATWChi1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aGoR9.QStVhwAN_BATWChi1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 May 2024 15:19:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:581: warning: Function =
parameter or struct member 'idle_workqueue' not described in 'amdgpu_displa=
y_manager'
>=20
> Introduced by commit
>=20
>   afca033f10d3 ("drm/amd/display: Add periodic detection for IPS")

I am now seeing this warning after the merge of the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aGoR9.QStVhwAN_BATWChi1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWPMACgkQAVBC80lX
0Gz1cggAiNx8YXEdah8JnorbyqQW1zOJ2GMhgJ9gsrIb7TQUrbQXSS6pZlr3wRLD
hyHpYM38ViLli2ACZVpzM6/DRZb1cQlR6oVX9XK2M8tYEvrPYLaBIp1Kptx1p1uj
KHpILe6D+hooy+DlAyiAYJvrjneFrFDw8scZ3SIU1fJSd93CFRiz/nD1TWj3zhpH
pYQQIAjhCOM7tDwxeHa2r9GMRScerAjo5kQwFHFdwUHHhiQ/4xAI/O7NcNFNguKn
UvYOmgGNo4lQKhDnH+fwGeFaEhLqhP+Qd8zdkQOmVA+pBU6wKrPDt/niSswUUj3R
MYxOhhInb62ut0Sc2PCHxm27lwsEeA==
=AeM/
-----END PGP SIGNATURE-----

--Sig_/aGoR9.QStVhwAN_BATWChi1--

