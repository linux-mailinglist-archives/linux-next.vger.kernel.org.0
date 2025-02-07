Return-Path: <linux-next+bounces-5388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F47A2B6F5
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 01:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A64188869E
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 00:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F8636D;
	Fri,  7 Feb 2025 00:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rWWg5DZx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A6634;
	Fri,  7 Feb 2025 00:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738887157; cv=none; b=EtZZUf7UZNUSMjSXr6k3png7rgoMGW5GcpNpfxUYVuZQPhS7ff0K/k2p0dGQG8xi9HYmlbg4g+m+mUeoFZs/i2BkMcui6HVm2kkklk0h9c4zo2KZS1mPSV3MhEuggiMFygFectFO1XOp23ccojm8aYUUfFPuwJTbcfNaQyIMjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738887157; c=relaxed/simple;
	bh=5HgEx8auY79rj9vlTAZRSa/TgAOS1e/wHs14rM+rt7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ayi/qjNQx/m7P7VI3syuN3Rga+CEsm6i34CD6urWvIrFJadi1dU0CGHq3GVyLLVOknj+8/HnAKQjqDUX79Pe1KIb3GTmCQWx27n4Bw4X8DUHRJVAD8INpZBzEXnwDT9AyeNoSmRmUoAI7fGCRW2YXGdH0EyigUMfnXJrQyNQprI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rWWg5DZx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738887140;
	bh=Bacfc9g4mK2N5F8ADgamDK4z6BaKuislD2vRGNhIeVs=;
	h=Date:From:To:Cc:Subject:From;
	b=rWWg5DZxc/Ad2xR5t/K1x86gXsNRCKchPL2pcHDT8K/Aj3RRZOZ74fihi0SGbMszT
	 BrpVFXrRoN7wyoet1J7oQg2pK/Spmth6xQCJABzA/U6JWmGX7uA/6IBLAH83b9pE29
	 WeVmAOQN9gEYpTGD4rRZOlp/qe3j8kYBHziZ1CJffKDhKP4Pn+CItrQnndpX/qtJKO
	 +5apEMUhkzjsjncuKjHOcDEJMlpEaefTXpiATQTyCE/u8UG4Jbr7mDPpNoP4CLayQI
	 GAQeOMX7I17ev1+AVStGlRRkCbOYO/ZoBWxg+SPZVQ+n3MJrnGrg/fasLStV2DTid/
	 9u0j8UKKYKbmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpvYG6zY7z4wbR;
	Fri,  7 Feb 2025 11:12:18 +1100 (AEDT)
Date: Fri, 7 Feb 2025 11:12:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Imre Deak <imre.deak@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc
 tree
Message-ID: <20250207111227.106a4468@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n0Mfrb3zlQJGaS5NfzRtVUu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  66df9debcb29 ("drm/connector: make mode_valid_ctx take a const struct drm=
_display_mode")

from the drm-misc tree and commit:

  d49b485d1be3 ("drm/i915/dp_mst: Use intel_connector vs. drm_connector poi=
nter in intel_dp_mst.c")

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
index aecaaf1d0fe2,2324ca8f6096..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1422,8 -1454,8 +1454,8 @@@ static int mst_connector_get_modes(stru
  }
 =20
  static int
- mst_connector_mode_valid_ctx(struct drm_connector *connector,
+ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 -			     struct drm_display_mode *mode,
 +			     const struct drm_display_mode *mode,
  			     struct drm_modeset_acquire_ctx *ctx,
  			     enum drm_mode_status *status)
  {

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmelT+sACgkQAVBC80lX
0Gx0Ewf/UGAeioMhhe79R0ggXFXY6vOyVUjXDM/68BsBElZERgqFHQeVPuB140/V
DXKJOeUVgHX+t2lxqoBdWirPB5JfS35pjZs0BqxVL/c3y03IbaCaE2UyouJAEXoB
40BPD+VZYmNRENsi5aGL/S8PYdTAnri/D3dzLSkY87G/TuZtuOQOKEDxc9XHIMUs
gLUF4llz6IsbR12E/Ldnfgz5z+Ghbs+tGVmCg7j1srcnWMcVwnDVPUDfQ/KFMUSP
2CzJmYAF7/d7676+lzk7phuNUWejFlYxf9avbmRkGOv4zaPug0VCgT8rhTAFmJkl
l6yANLEp9yd4nxpprdUrOoiuwbiVYw==
=/0Ww
-----END PGP SIGNATURE-----

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu--

