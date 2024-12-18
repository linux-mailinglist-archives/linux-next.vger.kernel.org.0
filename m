Return-Path: <linux-next+bounces-4987-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF79F5BE4
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 01:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6947188C8CD
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 00:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EFB8BF8;
	Wed, 18 Dec 2024 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QjmBqDwF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899162572;
	Wed, 18 Dec 2024 00:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734483108; cv=none; b=ibResJH3m2xZHTn9Wq0aCjfNZWSTvCkLX3tdgF5dSey/iAp4aUpBGvD+UTD7yo8sguEQ/JmAgNuOR3ENQQi8mGPBNMifiHfM4SGBH2zSbHbCn4ZYcH5WE9fNgm5qfRkHoWMSLHEjeOFLk6Sub465jHTIDJlyRg1ExwdEWq/nfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734483108; c=relaxed/simple;
	bh=73ZecMrNX47BrLfmukv/W/rcNC2G8V5OgeZGxLxGWpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kV1aOR8dVT3VOlKYDrHdhoP4yrSMtsVdCWwjeQe1kUJPnXeB5M4m87ENrXgpfMTMob/Iw+tOm4Dp37dxfCaAUoRkYTJiIlSzzbhmOUbITeYsYOe0CVu33e8KHoMBaKta8UeikgmwwDMg//QQhZCKaW2YbRE/I0HyLqBuOJ1scWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QjmBqDwF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734483090;
	bh=1vpT2P+faVorP8ST2y/5c7i1Ua3G3TaAidqfaRre4Ks=;
	h=Date:From:To:Cc:Subject:From;
	b=QjmBqDwFF8r7Z4o9kxOEh+ttBKAyRMdPlDY/5kx4vLw2G7jff/5X/61j5tB3XKUDf
	 OOSj10SxWK7CUWysSfYEaTCXv3gjCnZyCOcwUSAiq5NB9YKRbr76dcFZoP90ru3j3L
	 bppiRjWGWk0cPnK1J3sNHfUSseycS72Q6X+Ti/2AN6zy5alt6QxFsmLwx+MkGyDyaG
	 403gmq4x7c7SUcuHfUQitPe6PFbfr1HJ1QuF60md+LzS2zyC8KCRzwGBVMi4PSY9pQ
	 4zA8QUXcfR9UkDRlr0Q+UvBnXtXo50ZBueoIX81LolLaPh6MnVvsFCEgCsZzyB+/ct
	 L075q1NuFWKgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCZr105Hdz4wcw;
	Wed, 18 Dec 2024 11:51:28 +1100 (AEDT)
Date: Wed, 18 Dec 2024 11:51:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>, Jani
 Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc
 tree
Message-ID: <20241218115132.6e15b328@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/obtdIcF33TJJKbeG=JRDl0c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/obtdIcF33TJJKbeG=JRDl0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[Thanks, Imre for the heads up and help with the conflict resolution]

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  6fe7b1d10cbd ("drm/i915/dp_mst: Expose a connector to kernel users after =
it's properly initialized")

from the drm-misc tree and commits:

  529798bd786a ("drm/i915/mst: convert to struct intel_display")
  d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization in intel_dp_=
add_mst_connector()")
  fdb65ede8a45 ("drm/i915/mst: unify MST connector function naming to mst_c=
onnector_*")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index 56ca571e534c,326ff20a5a49..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1715,9 -1704,7 +1704,9 @@@ mst_topology_add_connector(struct drm_d
  	if (!intel_connector)
  		return NULL;
 =20
 +	connector =3D &intel_connector->base;
 +
- 	intel_connector->get_hw_state =3D intel_dp_mst_get_hw_state;
+ 	intel_connector->get_hw_state =3D mst_connector_get_hw_state;
  	intel_connector->sync_state =3D intel_dp_connector_sync_state;
  	intel_connector->mst_port =3D intel_dp;
  	intel_connector->port =3D port;
@@@ -1725,22 -1712,33 +1714,22 @@@
 =20
  	intel_dp_init_modeset_retry_work(intel_connector);
 =20
- 	ret =3D drm_connector_dynamic_init(&dev_priv->drm, connector, &intel_dp_=
mst_connector_funcs,
 -	/*
 -	 * TODO: The following drm_connector specific initialization belongs
 -	 * to DRM core, however it happens atm too late in
 -	 * drm_connector_init(). That function will also expose the connector
 -	 * to in-kernel users, so it can't be called until the connector is
 -	 * sufficiently initialized; init the device pointer used by the
 -	 * following DSC setup, until a fix moving this to DRM core.
 -	 */
 -	intel_connector->base.dev =3D mgr->dev;
 -
 -	intel_connector->dp.dsc_decompression_aux =3D drm_dp_mst_dsc_aux_for_por=
t(port);
 -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 -	intel_connector->dp.dsc_hblank_expansion_quirk =3D
 -		detect_dsc_hblank_expansion_quirk(intel_connector);
 -
 -	connector =3D &intel_connector->base;
 -	ret =3D drm_connector_init(display->drm, connector, &mst_connector_funcs,
 -				 DRM_MODE_CONNECTOR_DisplayPort);
++	ret =3D drm_connector_dynamic_init(display->drm, connector, &mst_connect=
or_funcs,
 +					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
  	if (ret) {
  		drm_dp_mst_put_port_malloc(port);
  		intel_connector_free(intel_connector);
  		return NULL;
  	}
 =20
 +	intel_connector->dp.dsc_decompression_aux =3D drm_dp_mst_dsc_aux_for_por=
t(port);
 +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 +	intel_connector->dp.dsc_hblank_expansion_quirk =3D
 +		detect_dsc_hblank_expansion_quirk(intel_connector);
 +
- 	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs=
);
+ 	drm_connector_helper_add(connector, &mst_connector_helper_funcs);
 =20
- 	for_each_pipe(dev_priv, pipe) {
+ 	for_each_pipe(display, pipe) {
  		struct drm_encoder *enc =3D
  			&intel_dp->mst_encoders[pipe]->base.base;
 =20

--Sig_/obtdIcF33TJJKbeG=JRDl0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdiHJQACgkQAVBC80lX
0GxBWwgAlUoIUXQ+BnMilG1IzyakMU861jRdJej/F85ZPKIFPAu2gd7Rd8pKQ/xl
mexyXs2KVhmRlQkdWh6s9puWet6tgx8jAR9QdKt99SgnEXMzQ+gbJsLYw+wB5055
5XvmWOkuzkLZC4elTtqUERVIElN+My8jSCISCdrZGpLB5LO6GtxiWanoKbxF+Kp1
8Hk0mXIXsShjYF/JVe8hvFlrLhJngvod4FIZLBaA/tsAz+5HMf0IcrFEoa2s3E5L
rP4S7LpyG+d9bc2p+BY8/7iEzVu1FEejEhKb8gG/874CjoAe4G2P6kODhVqLPSmK
UAfAas98XmTXZ49iNSQKFy/LkHd9bQ==
=zGYY
-----END PGP SIGNATURE-----

--Sig_/obtdIcF33TJJKbeG=JRDl0c--

