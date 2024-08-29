Return-Path: <linux-next+bounces-3492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB69638EB
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 05:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F391F23E03
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 03:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47820381D5;
	Thu, 29 Aug 2024 03:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dz46H/nF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7270C481B1;
	Thu, 29 Aug 2024 03:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724903209; cv=none; b=IziG4R9stsc+r0YapuI438yux4Z8QzXiha3jxQffFtt+0cl7Ohltsd8IxqwDNGZTm5aLftjlg5RI9wyWVfKmCCevkX9+yaI3vu8QTDz1cRJ4BcRtAibUW9mOk+PM0EmiJqR/OsIpRzPdYWrOwbLgYptNG8h6KEF+kk8mPwy32L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724903209; c=relaxed/simple;
	bh=8coHe4tWKmWd6KiL93fDuNTrzXjGfDja0Fu3WG9a6AY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N1n5i5g5J21EGB+BJc2xCR6ujlcjjkRRqK/sWPV6/Rfcj3pUe+WK8ExWJM4uDAmVc9Fz+sfE2ZcgJ+iAWkG4qVcTpXyvKKfaxw0dimtpO95STrYZ6Q4oKdg1EbwjjQdkxMpnsRP5CMjhPb25KBYoo2FdU0nds0LOeW7RMt6O/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dz46H/nF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724903201;
	bh=YkNIh8pmguQ+pL3J+DT+WdJ5jztxp5xvsfFYQSUAA8s=;
	h=Date:From:To:Cc:Subject:From;
	b=dz46H/nFFrIQl6ECXV7SPRSlhktGTNa2HXQ7EM45UhLcYEDfr4YwN9uDWHA1/13S/
	 v1JjlEFWRignypUc8SLnLKrcNOgRZ+xWUOj4cROoRNSqmC9Ds30u7x5T84qPOS7A3d
	 odzU2ldQBNmlbVIVuvQnZ3LFyI4g7KOVfQ2Z/Akk+OjKm/LHjEhDqHc+dD6Pmxz8+9
	 Yv9qTB6/c1aPM3DaTfFUdTkXBBACLnlsl3jDNZxDH0WW/URQep9EUtgo8KSRZZvABg
	 7uIiUnVFcKMnEHZualezPRPm2d1hyePDPdu1M9Vp1etuqlqIz0VMnyLOhZuhnnuSvz
	 zOUdmpoPEU2xg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvRzM59rRz4wyR;
	Thu, 29 Aug 2024 13:46:39 +1000 (AEST)
Date: Thu, 29 Aug 2024 13:46:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20240829134638.7f9f1bf5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WOIHjkppi+5a8RAku601sb6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WOIHjkppi+5a8RAku601sb6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/display/intel_dp_mst.c:2118:6: error: redefinition of =
'intel_dp_mst_verify_dpcd_state'
 2118 | bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp_mst.c:2048:6: note: previous definiti=
on of 'intel_dp_mst_verify_dpcd_state' with type 'bool(struct intel_dp *)' =
{aka '_Bool(struct intel_dp *)'}
 2048 | bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  594cf78dc36f ("drm/i915/dp_mst: Fix MST state after a sink reset")

interacting with my merge of the drm tree and commit

  a2ccc33b88e2 ("drm/i915/dp_mst: Fix MST state after a sink reset")

from the drm-intel-fixes tree.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2024 11:24:26 +1000
Subject: [PATCH] fix up for "drm/i915/dp_mst: Fix MST state after a sink re=
set"

interacting with "Merge branch 'drm-next' of
https://gitlab.freedesktop.org/drm/kernel.git" from linux-next and
"drm/i915/dp_mst: Fix MST state after a sink reset" from drm-intel-fixes.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 40 ---------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/=
i915/display/intel_dp_mst.c
index 639190ee6ff9..696b6ee52014 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -2102,43 +2102,3 @@ void intel_dp_mst_prepare_probe(struct intel_dp *int=
el_dp)
=20
 	intel_mst_set_probed_link_params(intel_dp, link_rate, lane_count);
 }
-
-/*
- * intel_dp_mst_verify_dpcd_state - verify the MST SW enabled state wrt. t=
he DPCD
- * @intel_dp: DP port object
- *
- * Verify if @intel_dp's MST enabled SW state matches the corresponding DP=
CD
- * state. A long HPD pulse - not long enough to be detected as a disconnec=
ted
- * state - could've reset the DPCD state, which requires tearing
- * down/recreating the MST topology.
- *
- * Returns %true if the SW MST enabled and DPCD states match, %false
- * otherwise.
- */
-bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
-{
-	struct intel_display *display =3D to_intel_display(intel_dp);
-	struct intel_connector *connector =3D intel_dp->attached_connector;
-	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
-	struct intel_encoder *encoder =3D &dig_port->base;
-	int ret;
-	u8 val;
-
-	if (!intel_dp->is_mst)
-		return true;
-
-	ret =3D drm_dp_dpcd_readb(intel_dp->mst_mgr.aux, DP_MSTM_CTRL, &val);
-
-	/* Adjust the expected register value for SST + SideBand. */
-	if (ret < 0 || val !=3D (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC)) {
-		drm_dbg_kms(display->drm,
-			    "[CONNECTOR:%d:%s][ENCODER:%d:%s] MST mode got reset, removing topo=
logy (ret=3D%d, ctrl=3D0x%02x)\n",
-			    connector->base.base.id, connector->base.name,
-			    encoder->base.base.id, encoder->base.name,
-			    ret, val);
-
-		return false;
-	}
-
-	return true;
-}
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/WOIHjkppi+5a8RAku601sb6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbP7x4ACgkQAVBC80lX
0Gyc3Qf6A3438OWDi6RFB8pKamL2K6zFpTJn9cMKyeu+48r4l2obwL7q5erbv2k8
IB913X06Z+1BdaXVsczGWTICLcjJFk5V0ZXx/B74K+l8JFjgKpBSWEIlCwEwEa29
UXonpxqo/W91KlzDJj7HfH5eoVtJC4HbKX6VCsAOvq4hkJiVUNf7Y5e1yjA7qx5u
BNW6yETUxKIm/z0PmJbc2MZg8u2DQA+OYUvpeELlCanOSN4vdwQpauX17+LO5ru2
DsYgPkRoi1x/SK6VtmsbUTq2TV4pDNn+qP+qh7bBZKai+guBsdcN5kbywxh+wGLI
1m157ZOiVLFEM23zP60XmdW7u5fhbg==
=0TRq
-----END PGP SIGNATURE-----

--Sig_/WOIHjkppi+5a8RAku601sb6--

