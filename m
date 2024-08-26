Return-Path: <linux-next+bounces-3412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8895E62E
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 03:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD03E28133D
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 01:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EE22F24;
	Mon, 26 Aug 2024 01:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P1Qm8nvh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36909524C;
	Mon, 26 Aug 2024 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724634631; cv=none; b=LquNtstcorklx1tK0ebxs0/RYPQ1KBePH2dIwDbTdi3DeaYAPizzIbpQFHF89CNUjMWlJzxvs1DG93bN+50cNRH4mkumcZpWyHxOsQIBicSA7Q+o2LorcYlQrTuLoCSYIE9cpau+S9ZQM9iZpoYsO3gnMeulHLR5uX1U8vTkDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724634631; c=relaxed/simple;
	bh=F9wmJ437n6OxX3nt7lvGOYp2FtyyDLvqvs7e4VMYLpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GF8p+oE/NUgE9E/8NSSu6QmOMpAffmMWzBuVSc9PHEvR4vZN+gSJ6Wpci38/RABuuPcsItCMboCKcQYOmlp3XXK1eupKHhJ1oPT+PJS6XW9x1Sne2BFyUxELghJQ2yNCempC0kt1XQuv80sTGHoP5q3Imz5g4xuwWHiQbWWT8G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P1Qm8nvh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724634625;
	bh=QPycLkrrFOAkAi5mF/lXserKCpvEqlB8+bfiPzXrEIo=;
	h=Date:From:To:Cc:Subject:From;
	b=P1Qm8nvhiItIUMUpNsrie5KbAuPdm4v1Emffpnx97OTN/YDo7CB7Himblb1LFVVj5
	 0ZQSEIF1gB4hulqww1dV+ReHM3O6g2Vpi6hkzYWCS+M4vgNNYqg/4aXOHJ5k+NHdtG
	 VcdzPqwtk7zeY3DP3mVX57Uhy7VF8FiaaIkPymZyliNp532sDeMnUUV7pFC3B9WOJ+
	 s2YMNXS4yytd7jsA9cUzdwlS9W97GisPD3DkuaL4flcK2O1WlXlyZ2626r1SY+ksuA
	 soUUlzlO7wUje2NqaeZ2msiXHLMB5wbLxW9toTOLE6/qvB97AGj3lTrMSY9LZrtf/7
	 Z1xg+RzJJ80OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsXfS0JNQz4x6l;
	Mon, 26 Aug 2024 11:10:24 +1000 (AEST)
Date: Mon, 26 Aug 2024 11:10:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Leo Li <sunpeng.li@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20240826111022.41db1e95@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CkZ0Ik11NSa4ZMtNQ7xe8Kh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CkZ0Ik11NSa4ZMtNQ7xe8Kh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commits:

  537ef0f88897 ("drm/amd/display: use new vblank enable policy for DCN35+")
  e45b6716de4b ("drm/amd/display: use a more lax vblank enable policy for D=
CN35+")
  58a261bfc967 ("drm/amd/display: use a more lax vblank enable policy for o=
lder ASICs")

from the drm-misc tree and commit:

  7fb363c57522 ("drm/amd/display: Let drm_crtc_vblank_on/off manage interru=
pts")

from the amdgpu tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 34872eb4fc84,7d999e352df3..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -8229,66 -8248,12 +8242,35 @@@ static int amdgpu_dm_encoder_init(struc
 =20
  static void manage_dm_interrupts(struct amdgpu_device *adev,
  				 struct amdgpu_crtc *acrtc,
 -				 bool enable)
 +				 struct dm_crtc_state *acrtc_state)
  {
- 	/*
- 	 * We have no guarantee that the frontend index maps to the same
- 	 * backend index - some even map to more than one.
- 	 *
- 	 * TODO: Use a different interrupt or check DC itself for the mapping.
- 	 */
- 	int irq_type =3D
- 		amdgpu_display_crtc_idx_to_irq_type(
- 			adev,
- 			acrtc->crtc_id);
 -	if (enable)
 -		drm_crtc_vblank_on(&acrtc->base);
 -	else
 +	struct drm_vblank_crtc_config config =3D {0};
 +	struct dc_crtc_timing *timing;
 +	int offdelay;
 +
 +	if (acrtc_state) {
 +		if (amdgpu_ip_version(adev, DCE_HWIP, 0) <
 +		    IP_VERSION(3, 5, 0) ||
 +		    acrtc_state->stream->link->psr_settings.psr_version <
 +		    DC_PSR_VERSION_UNSUPPORTED) {
 +			timing =3D &acrtc_state->stream->timing;
 +
 +			/* at least 2 frames */
 +			offdelay =3D DIV64_U64_ROUND_UP((u64)20 *
 +						      timing->v_total *
 +						      timing->h_total,
 +						      timing->pix_clk_100hz);
 +
 +			config.offdelay_ms =3D offdelay ?: 30;
 +		} else {
 +			config.disable_immediate =3D true;
 +		}
 +
 +		drm_crtc_vblank_on_config(&acrtc->base,
 +					  &config);
-=20
- 		amdgpu_irq_get(
- 			adev,
- 			&adev->pageflip_irq,
- 			irq_type);
- #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
- 		amdgpu_irq_get(
- 			adev,
- 			&adev->vline0_irq,
- 			irq_type);
- #endif
 +	} else {
- #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
- 		amdgpu_irq_put(
- 			adev,
- 			&adev->vline0_irq,
- 			irq_type);
- #endif
- 		amdgpu_irq_put(
- 			adev,
- 			&adev->pageflip_irq,
- 			irq_type);
  		drm_crtc_vblank_off(&acrtc->base);
 +	}
  }
 =20
  static void dm_update_pflip_irq_state(struct amdgpu_device *adev,

--Sig_/CkZ0Ik11NSa4ZMtNQ7xe8Kh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbL1f4ACgkQAVBC80lX
0Gx8JggAmwErH3gvAScu0SVb4ul2G63cxNpofpaZL6y/Dd+azzrQanpXXlbYEaei
W7rpsREl1zM0yWA3A7rExSYwz4QMb5StqHoTmY98Pb+3denPm0U64Tnk/aweVGSr
BQT93MBgZtqj0zqcWmGq0bY1wEJ5um1Q9/pMaUplySslikLdHSqjQ+VZE9MbJO36
LbJYkrAL1hwYXeROf2+Xr8yEJwFNOSy5tCOd9VhKCSiUdCP5WmTbljsugSZvQpYz
8rs2vzSq43azJfibPcGuiQLV8nAstDnx1F48NTeazfiK1FgCkqQMtQAs1oxYN0ni
0f0mEvqNQBPVNbw6wuWKtKxGqRpnOg==
=IACy
-----END PGP SIGNATURE-----

--Sig_/CkZ0Ik11NSa4ZMtNQ7xe8Kh--

