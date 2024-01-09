Return-Path: <linux-next+bounces-681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09B827BF0
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 01:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C5F1C23123
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 00:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FDC17C3;
	Tue,  9 Jan 2024 00:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c/m8U+Qr"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516815A7;
	Tue,  9 Jan 2024 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1704759778;
	bh=UtD5+zFpbHH54Dk7I6pNkcSPwd78+kcXsfGz/v1610Y=;
	h=Date:From:To:Cc:Subject:From;
	b=c/m8U+QrcYOeM7GEMXjqCemYRferAtFYm52YUD8hLa56m7nwVs/t0LUQrx8+SLO/I
	 4/P16UIjmKDPZuJiuKc0SPQ26MD0gVEluTcAmKRWbt/EghK5CPLAIbTp0/nKO9mSjl
	 3tqPCpv0vM48FRLDXM7jKWjRROfQKieiKO62YHmWPFNHg3K7NM8eY0GM7Fn/MIJpE4
	 OX/5s9KvkpQKxtGm7qCu37vzxkW5/CNXI8cP46ed6aWEbBKkgXbrdmuByB0BE9QQA+
	 rRWisSyMz+jmPNBg+EVvPftMrLJyWcw239dBUpK75oHg+HY7ToD4zq23jxGH9anAP3
	 sv2WdgrSesdiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8BTr1tG5z4wnx;
	Tue,  9 Jan 2024 11:22:55 +1100 (AEDT)
Date: Tue, 9 Jan 2024 11:22:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Imre Deak <imre.deak@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20240109112254.405d3a1a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F6i/J4=GGUHLZ+nz4EgeNZT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F6i/J4=GGUHLZ+nz4EgeNZT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp.c

between commit:

  fc93835bb0d7 ("drm: Add HPD state to drm_connector_oob_hotplug_event()")

from Linus' tree and commit:

  cd572b3bb27e ("drm/i915: Disable hotplug detection works during driver in=
it/shutdown")

from the drm-intel tree.

I fixed it up (maybe, see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_dp.c
index 7d2b8ce48fda,93f9985ef75c..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@@ -6040,21 -6062,11 +6059,21 @@@ static void intel_dp_oob_hotplug_event(
  {
  	struct intel_encoder *encoder =3D intel_attached_encoder(to_intel_connec=
tor(connector));
  	struct drm_i915_private *i915 =3D to_i915(connector->dev);
 +	bool hpd_high =3D hpd_state =3D=3D connector_status_connected;
 +	unsigned int hpd_pin =3D encoder->hpd_pin;
 +	bool need_work =3D false;
 =20
  	spin_lock_irq(&i915->irq_lock);
 -	i915->display.hotplug.event_bits |=3D BIT(encoder->hpd_pin);
 +	if (hpd_high !=3D test_bit(hpd_pin, &i915->display.hotplug.oob_hotplug_l=
ast_state)) {
 +		i915->display.hotplug.event_bits |=3D BIT(hpd_pin);
 +
 +		__assign_bit(hpd_pin, &i915->display.hotplug.oob_hotplug_last_state, hp=
d_high);
 +		need_work =3D true;
 +	}
  	spin_unlock_irq(&i915->irq_lock);
 -	intel_hpd_schedule_detection(i915);
 +
 +	if (need_work)
- 		queue_delayed_work(i915->unordered_wq, &i915->display.hotplug.hotplug_w=
ork, 0);
++		intel_hpd_schedule_detection(i915);
  }
 =20
  static const struct drm_connector_funcs intel_dp_connector_funcs =3D {

--Sig_/F6i/J4=GGUHLZ+nz4EgeNZT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWckd4ACgkQAVBC80lX
0GzYLwf+Isd77XQw1RHb/jBROdv03anaJyjS77VZaazYNSZGn6V1/e79k5G8W35/
0LurPYJsdakjsCBzyRECIXsoO+o6hjWKPcDgeqjYPWHUfD39AHJyTNSja10o1Aio
Q1p2RafGPIqBpFZ3KYzJFVTCXdqFGgecMTFyoXSmGzgPgIOJDgnp9FLNXYwpUDFD
qRxmUe4XmV5/Ja56EoHDsxFk1dcgzLTO9FXPhjl4+mNlgd+W58ertRmrwOzD+jyy
bFMaWPS8sa9seWATnWhRzrW3FrSiy/ffhh+qbpl3rmf4mOifEoe3UhQyBqiFV2mu
V8nW3SCX9uhlE+mqYrVJ5B9M5LmO6w==
=kBR4
-----END PGP SIGNATURE-----

--Sig_/F6i/J4=GGUHLZ+nz4EgeNZT--

