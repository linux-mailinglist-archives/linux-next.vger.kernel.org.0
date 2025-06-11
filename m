Return-Path: <linux-next+bounces-7132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F9AD48D3
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 04:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA173A66AF
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 02:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F48913D539;
	Wed, 11 Jun 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d6/hfQze"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7513CA97;
	Wed, 11 Jun 2025 02:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608575; cv=none; b=jvxbl+lWH7VnLP2Z2BALf+ZLuCYoXpkbYflj6agzEoh7BBnOCdxNPTyL7L9q0FuereQpywGab9DbqxBTATQTA3CaQwnpMmv3uAx0dKwP9MWBw14DmwvBQLek+6kmY0p9rKaAQeEUxAOBB/oanlrxvjM+Xqn+tBlg1JUYoYxlEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608575; c=relaxed/simple;
	bh=4/xi1WH0V/dSUbIa0AQ7R2NNrAZCgNU0NjolVoDz8Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSSY6KpJr6uzHquZrXEmZ/atJ2pFTcyhDTXlqjrwMLQHKmVUlZDnfqi7qt61Tcp5PvocKgvOZpX456MF8XGrNmKFIV8ncYPCKzZ3Kd6vNivW3z/QZfgkWGWY3JJM5Rj8Hid0vLwlPfiOAEq4kYozuHmuO4m1a8O/V3Cyo1lonkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d6/hfQze; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749608569;
	bh=LxD5HQJOJ7DxFFENLP6r2586LhCQdCVtdN/m1q6Pzmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d6/hfQzeeCnw6q+/7oW9h0f3PtRwGWa1DZDOmYojFKMNUiRoq/Q8YQc3LPl5sok5I
	 ReEYxu3+PuIaodFnrXrATnCmOGjNl3K4XFo88ZNKaU4rDQ00DyU5nerD9vExGk6vfp
	 3ijCBLvNx2kNTIdpLCHdfxA4diTGdVWPKL9pPGNO4MsWGer6JAhBy1qvk2ODsMQGSH
	 9CySwn5vuX323k3JRFCT5ZUOBErCOfF+YmV8DBPuW/ltUfUpC3fMdyPTol0wWozA2Y
	 zu1U+ZZcI0ov4AVt/V84GE/d9NDP8X1BggmFLT2prRgcCDUtEiBSSBgCqT7bIMkPnw
	 bmAKlW4QyfAYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH8Zd2Vwfz4wvb;
	Wed, 11 Jun 2025 12:22:49 +1000 (AEST)
Date: Wed, 11 Jun 2025 12:22:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Gabriel Dalimonte
 <gabriel.dalimonte@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20250611122248.67996245@canb.auug.org.au>
In-Reply-To: <20250611120801.48566070@canb.auug.org.au>
References: <20250611120801.48566070@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9DUQGyY1RqU=7u0EUYh6I+w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jun 2025 12:08:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/vc4/vc4_hdmi.c
>=20
> between commit:
>=20
>   c0317ad44f45 ("drm/vc4: fix infinite EPROBE_DEFER loop")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   d9f9bae6752f ("drm/bridge: allow limiting I2S formats")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (the former removes code updated by the latter, so I just
> removed the code) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Actually, the code was moved, not removed, so it needs the below merge
fix up.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vc4/vc4_hdmi.c
index 163d092bd973,4797ed1c21f4..000000000000
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@@ -2285,12 -2291,6 +2285,12 @@@ static int vc4_hdmi_audio_init(struct v
  		return ret;
  	}
 =20
 +	ret =3D drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
- 					    &vc4_hdmi_audio_funcs, 8, false,
++					    &vc4_hdmi_audio_funcs, 8, 0, false,
 +					    -1);
 +	if (ret)
 +		return ret;
 +
  	dai_link->cpus		=3D &vc4_hdmi->audio.cpu;
  	dai_link->codecs	=3D &vc4_hdmi->audio.codec;
  	dai_link->platforms	=3D &vc4_hdmi->audio.platform;

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhI6HgACgkQAVBC80lX
0GwF+wf/bAJ+afUr5JN1mtlUDnctvxXxxlSAZF6J8WJ8pb0zZ1YvfbkfC7w4NObX
bQy0hejCIOhhBT4X+nujtWD4NjzcsmPrUhuEc19T7aqz9loDn4HH2Pz9/WXFtjMA
5jWgS8xu+LrCo1IMfM7qzI0kyZ/DFCfxIyIIq+mjmaeWe3+DD6sEr7yn5bientRI
ezbSmYcrPpfL2932+MezuIFO7DKox6nvjnjOy2zz8B20sz3t3nd1oHkCYJi+vmiB
GRTPM28NQDhFPlRbOVy1woZYS6nS4jZxfgABF5VsUr7vkQRqgXgohZNNWPvbY7TT
T21wsPAj5kgZLRMLYrA5X87Ll6gQEQ==
=PpFa
-----END PGP SIGNATURE-----

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w--

