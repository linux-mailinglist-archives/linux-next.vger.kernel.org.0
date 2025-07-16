Return-Path: <linux-next+bounces-7564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D779B06C96
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 06:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABE8179D8B
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 04:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292C0273807;
	Wed, 16 Jul 2025 04:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XQP/a4Jw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634D7261E;
	Wed, 16 Jul 2025 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639521; cv=none; b=iRwbTQDWnQvbkEwUlfaOTU9XyBMJSAs7q2tKWmkeOawZ6ZL79l0/vSltXWB87jro7IPju/RB5w95TW73pPhJdhOQfiYL/Np7UemItVmKNCXXFjv9XTu/JKbmSyR1J3w4Sx8HTRqxiUIBcJbNrvhiNWF31o51maGYZwcbV7JiLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639521; c=relaxed/simple;
	bh=uCOUcDkhRZ13qIpW8bJDPkpyeqUocbXEgTh6JAY0s6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YVsmMNYkJhiI4KywnOPUKZ/LaYvO48hQOMzrjGOkYXf5PIaxA35JbikR12KivISye23H77NXxc7Qu2FZEBAfnJ2/IMxeW2CFGNlvECvJkgRVdCNkriINrXwWKzSZzpjx9zI2+VKfoJ2kH4k7qYw4vSc8WZN6mqtiUj1fCNr/xW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XQP/a4Jw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752639400;
	bh=S7mK2SBkhQMa5+gvlYeddVua2aIHqvsHbgJZfEWR6dI=;
	h=Date:From:To:Cc:Subject:From;
	b=XQP/a4Jwa5OQi0scktFHKYXE2tJMQNklweWuH8Du+Mn1hontLRAF7k0JJ5mpYgi+W
	 fUCHG94BkOfHJLUQovuma6vZsBtfJR2qtqls7raqWs/kStlrE+L7gnxxkQ4vyH6zSY
	 Jrvw2BQ2uVZkk1eAhk6hUwtd6zIvsMHe6ukFOJin9eOab9xs0pH8k9a47pMvw2v/XF
	 Rgc3LrkJlc4zrBMrjDboj0JzEPBSJCoy7XMGS5t4lLVaioqO/+1mo5wb3GPalV8a1K
	 LLqe8947E9jewDbQtzlcEPrpELMNy+hrhMQ2Du6vrayOnH9kBbgQu+eH7DdSkj0uL8
	 vl71nY7ePvItg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhjRq5CDqz4wbY;
	Wed, 16 Jul 2025 14:16:39 +1000 (AEST)
Date: Wed, 16 Jul 2025 14:18:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Message-ID: <20250716141832.5542b414@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jvGgs7I7tXJ4eKmy4eV7tUi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/display/drm_dp_helper.c

between commit:

  d34d6feaf4a7 ("drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS =
to TRAINING_PATTERN_SET")

from the drm-intel-fixes tree and commit:

  b87ed522b364 ("drm/dp: Add an EDID quirk for the DPCD register access pro=
be")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/display/drm_dp_helper.c
index ea78c6c8ca7a,1c3920297906..000000000000
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@@ -712,20 -741,8 +741,8 @@@ ssize_t drm_dp_dpcd_read(struct drm_dp_
  {
  	int ret;
 =20
- 	/*
- 	 * HP ZR24w corrupts the first DPCD access after entering power save
- 	 * mode. Eg. on a read, the entire buffer will be filled with the same
- 	 * byte. Do a throw away read to avoid corrupting anything we care
- 	 * about. Afterwards things will work correctly until the monitor
- 	 * gets woken up and subsequently re-enters power save mode.
- 	 *
- 	 * The user pressing any button on the monitor is enough to wake it
- 	 * up, so there is no particularly good place to do the workaround.
- 	 * We just have to do it before any DPCD access and hope that the
- 	 * monitor doesn't power down exactly after the throw away read.
- 	 */
- 	if (!aux->is_remote) {
+ 	if (dpcd_access_needs_probe(aux)) {
 -		ret =3D drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 +		ret =3D drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
  		if (ret < 0)
  			return ret;
  	}

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3KBgACgkQAVBC80lX
0GyZMQf/aZIurtBVrIzuWKnDL8tM/37HjkjT5m6LzYhQSfEq+SwMpu/aAYEYeEcg
BnS95XPcGd7eHZnM8xg2HJ8WFVJCI1k/RzW4CmQO1qt322b/zqMIVZA8hickQpQ+
RgRk829fRZV0iR9NgJzmXcCVE3J6i6OisGHjwJxcHdIdKX4bCrcSCPhiy/z3mHDk
FhCa+Sq2PvQDXABNMvsYjpttezXWzQz6w7p0ekI95ccmyQHU5cFg4pL5/ddtu2J1
xV1jJ+lpeYUxn8UD5GNYc2WX+uGR9J9vX3TJH7hoW+aHp0M3EqWCeDHU238V0KHC
0psWZSHBraB+kLdJfke193RM3Vb3vQ==
=2xqe
-----END PGP SIGNATURE-----

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi--

