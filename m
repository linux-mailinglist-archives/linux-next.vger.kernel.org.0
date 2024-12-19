Return-Path: <linux-next+bounces-5000-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B959F74E0
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 07:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79D918938BD
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 06:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C02175D3A;
	Thu, 19 Dec 2024 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O5oVJOyx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3ED1FAC26;
	Thu, 19 Dec 2024 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734590020; cv=none; b=eVtGSdov/0dgkin275fRrpqmGTtuZdK1XLvV0x+z2q140kdAXGaX6IjdMyUsOMmj+iVwR9NzApPKP0S2BsvZ6VUHK2mHykwUfgL6vg2gqxVd1l8MAiqmOHBpE5yfY9VGolU+eTK7J8I0aJxuwXQLQ1a7yMcdc3i4UKJ7+KULJhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734590020; c=relaxed/simple;
	bh=mmzZy/0QGfERXAHzFXM5qQTtRnJyi7bXRi1C2LvLBZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsn2BFkCON9z4gsfXbmWs1ralBWhbuFFQRZLTjlTiXJNy1zmu3Xef23aQnHOGpKMsmMAaKeZ0ZPWIKJTyysrLNmQNHj9Z+ShlxhKl1M1PX/8+1TCpgqa6J3eRHub5WEjarHIbbYSDJ1wq8PIlT0Ry+ZmWBmVbPENlB4ZKi04ke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O5oVJOyx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734590011;
	bh=OFEfeqD+SmrOdv8FjDfs5v+URXHUjpRJvs2tFefRvGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O5oVJOyxnGcxBbpNydqNCg8XSS+0D6IwGfmNhUyG3tZ4WmolqBZl/UCQlI6NV/CrG
	 MiUtnMeNvFpkET/UsDXgZ+Z0HQNC9KfXl8tOvv3TeduoD7HQryh8o4hvptoBTzn6vS
	 0iEt00x3fPijjqj0hrtm/2YUoVvYEVk04O2j5yYEzF+asWTLOwKw+N+HFNRIFPxw26
	 r3TwWn6UnrABU+VI09gKtOHOI2M+HjOTHD0pV63wBFNFzJFH0UqUGqLgVMdLSIcRtx
	 h0bQaJLFmorPTFGPZ9Arf5cREXhcTOybGQiHkP+CLx7YikIgIeOoRUd+VVx06kaOlq
	 Gyeu3ml/n/8Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDLNB2Trmz4x7H;
	Thu, 19 Dec 2024 17:33:30 +1100 (AEDT)
Date: Thu, 19 Dec 2024 17:33:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Shengjiu
 Wang <shengjiu.wang@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20241219173334.25970764@canb.auug.org.au>
In-Reply-To: <20241216130934.0d1ef471@canb.auug.org.au>
References: <20241216130934.0d1ef471@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f/4fYM.Btn.hz+3KirDrrB1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f/4fYM.Btn.hz+3KirDrrB1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Dec 2024 13:09:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> WARNING: modpost: module snd-compress uses symbol dma_buf_get from namesp=
ace DMA_BUF, but does not import it.
> WARNING: modpost: module snd-compress uses symbol dma_buf_put from namesp=
ace DMA_BUF, but does not import it.
> WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespa=
ce DMA_BUF, but does not import it.
>=20
> Exposed by commit
>=20
>   24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
>=20
> Presumably introduced by commit
>=20
>   04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
>=20
> From Linus' tree.

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/f/4fYM.Btn.hz+3KirDrrB1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjvj4ACgkQAVBC80lX
0GymZgf/TeEq1NO7urjQnuPGNzZJ7kF1IR1gajE9U+6hypORrPrUfgc+3mti30Gr
WfyyXThNLauPHYzIGLwen06HYlb0lNXRYVpRz+YxGzYZjoP1oOIi/aor6sBkI/7H
YHKMkhM6I7FVq69Le658Q9Y+F27ZOVEBg/WYbsCGLxlVrUx5DxhbY8377tnWCLvm
kSm5WxSV5bbK010Epp5xoZZDCYOV5louhYvzZ2EQ3u134uMoxaGemFJB3dfklKuG
NiLLNXq8tYRpsPP0RlCA5cfjn5CYenVAgbQ8EqIMayeKGlYlu1hi5wCG7qRRxK65
MQEssoij2cB9i6weIcjhGMuIuTDbXg==
=lL00
-----END PGP SIGNATURE-----

--Sig_/f/4fYM.Btn.hz+3KirDrrB1--

