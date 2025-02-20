Return-Path: <linux-next+bounces-5511-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7FA3CEB4
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 02:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D303A99A9
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 01:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CDB1922FB;
	Thu, 20 Feb 2025 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H7lalOPn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E02AD16;
	Thu, 20 Feb 2025 01:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740014920; cv=none; b=CXYiV6FzvBdFU6G/vQKLSi5+4ld3nljEbUmxBOAeJoR6sQpv089iKelNt20/MpxceGOlQUG+xvx/JJT7NJ+iukmqREArH5lPTwPO/P8wMin4WQUqfhSirt4ybCbRW8CiiPaPnI/Tgp1D8GKG86BC+x7tymcE2Qxbgqi63QbPYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740014920; c=relaxed/simple;
	bh=TxwQblYIrtsHX+cs7fiBg5nYEFzMEzY04MyorO352eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DbIAlKrmAJwjYEWDsHyjxBOKWBAn9+IBiFXvvP38iyluc6riWaO9RNwB1mObsKiIQqw4TvmE9g4EC4P9h+WK+4+ut/9jj0Z02tCVjbMCbNMXLyp5c8PTLTspH+KFTqJ0CypCjuSCbWs762N4CulO14q3ThpJA1D7l9+F4Fmy/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H7lalOPn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740014913;
	bh=ymPGS3K8PtvdLHv0pCnuqbZVNZlMes3BilfU1Lqnccg=;
	h=Date:From:To:Cc:Subject:From;
	b=H7lalOPnBxLeghgNDfRCx7wufj2Hm2+MxWZnjIyJx1vGO1zreqwO06W3zPqH4ApD0
	 9MUyNRiEUH4ZHGW1lMoRnIIUaWD8a4bCdJzCP7/s+VwSWIocCkoXhX6fBtxTIcOy7Y
	 kAqQqIO0jWBkw+kZl2HvaU0heD4UQJ6kb1++TeXOSdu3BdnrPae7cdp4EmIweCD4GY
	 XaIGTA4vr4Kq+RETGLBnab4MghnwsVq5r8hkYHnc2QcG3A1+c1VT/mPVWOLEvPO2Rq
	 cE2BJae+CSx65tamtt8dADkqq6JvOqeOlLINWI22Qp8tZW6xrB0Pz7xG0PsqGWHhQi
	 HRUWdaFj9AxpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YywdD5sjpz4wyk;
	Thu, 20 Feb 2025 12:28:32 +1100 (AEDT)
Date: Thu, 20 Feb 2025 12:28:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Harry Wentland <harry.wentland@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Roman Li <roman.li@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20250220122832.0d9d9eb9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/efS0uCbL9qU9bEaGXfn_NVJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  b255ce4388e0 ("drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_=
valid()")

from the drm tree and commit:

  cbf4890c6f28 ("drm/amd/display: Don't treat wb connector as physical in c=
reate_validate_stream_for_sink")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ea40696c955,8672c0c3c5db..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -7476,9 -7536,11 +7536,12 @@@ enum drm_mode_status amdgpu_dm_connecto
  {
  	int result =3D MODE_ERROR;
  	struct dc_sink *dc_sink;
 +	struct drm_display_mode *test_mode;
  	/* TODO: Unhardcode stream count */
  	struct dc_stream_state *stream;
+ 	/* we always have an amdgpu_dm_connector here since we got
+ 	 * here via the amdgpu_dm_connector_helper_funcs
+ 	 */
  	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(connec=
tor);
 =20
  	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) ||
@@@ -7501,16 -7563,11 +7564,16 @@@
  		goto fail;
  	}
 =20
 -	drm_mode_set_crtcinfo(mode, 0);
 +	test_mode =3D drm_mode_duplicate(connector->dev, mode);
 +	if (!test_mode)
 +		goto fail;
 =20
 -	stream =3D create_validate_stream_for_sink(connector, mode,
 +	drm_mode_set_crtcinfo(test_mode, 0);
 +
- 	stream =3D create_validate_stream_for_sink(aconnector, test_mode,
++	stream =3D create_validate_stream_for_sink(connector, test_mode,
  						 to_dm_connector_state(connector->state),
  						 NULL);
 +	drm_mode_destroy(connector->dev, test_mode);
  	if (stream) {
  		dc_stream_release(stream);
  		result =3D MODE_OK;

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2hUAACgkQAVBC80lX
0GwDxwf9GOEhJAsOiyeHp+Bg89a6OutNo2Kq/Eks3y4IxmsoDxmJ5Fw4HcF4GG1H
h18UUvF1iCxozICVtzIHxQxt8L+QBp3fvqSEb3yW5sa2X4Gs4vs8I9retJOC7Thq
1iWSfc+JHTL9N/Tw9uqkLeDyd9fwuIWsiqyhtRAymqLd06nhHPo8MMzY1mivSet8
pF2PZ1WSjkn2NkA8U4Otl+XnAh6H8ebvFkHL4er5qRIv5lIxWUvnqpI3vg/stxPt
ikSxvejUHM5ZUBy0eS2dE6KxEGUutNXubDVQj5j8bwEZG4RZ7SIeuIZsHKHmLsYf
JEZD3iqDZ0bOKdrCtulxiC83iZVGng==
=sycq
-----END PGP SIGNATURE-----

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ--

