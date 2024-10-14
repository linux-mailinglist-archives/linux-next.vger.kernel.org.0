Return-Path: <linux-next+bounces-4251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DB99BE23
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 05:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C615B1C2153C
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 03:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3395336D;
	Mon, 14 Oct 2024 03:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i52m3GTZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F910231C98;
	Mon, 14 Oct 2024 03:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728876290; cv=none; b=raGXzGcRmlKNgJ4vJOeaReNFqaHmUYiYfaTUXfFXBmWF7O6HP0XJjrOj7RumNWOwxW1Tg9MxQY9ejOjLLuEOy5jFbZi0w2cB5F4PV3EDYX9/M8T7VrKCgKB9f9P8PIPq235aq9cz3DNvnEOu0Q5N/Lt3QwvpElBVazD4VCRkUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728876290; c=relaxed/simple;
	bh=SpZs6RGQvSt5WghDGfcfG12JtrsnPkdcdCxle8192UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R0K2paBXfY42i5HfZP0E9vwO8UPFrtpue6Q68cf0LWlZ7P5CludmF4KAkzjR/k2u6qbvjS7qmivo45z2RwVraMTFrkgvtjNYrLZWtIn1rw6ZYw5YXVoOWxSDS8aeVp3aAgncj0wPFfBcdexBDY8HgPkrbRhIE6vDfm4zcfT4+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i52m3GTZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728876281;
	bh=vsCrLNHWS9aX1Ot8mwWPJBHzbluUUToFirZ71fWGFDg=;
	h=Date:From:To:Cc:Subject:From;
	b=i52m3GTZPdS/NbEffenH7z35LD1OSo/ryvAKSA1lY6+S5x2uIEx86jNor6ePLYO3m
	 5muO1kuCKmK8MBqypRqVo0LDSIuSc+KrlOpZmUyXcTKbiSpHEkU7yotF4USrTpLVTf
	 6Gy/lnI4KFJO2dLJZOEgvTRmpGqwtH8bWuQYDR1Oyp0VVV1dRNbRHEWJgbeyBc+JiI
	 sgRNsmziLITOjjvMLLL4sQVAHay+qlEusidxQmNUf9oKI4iuyiOkTWL91UYef0YQzi
	 wKagNBz0MEFdFib2NkXdc5F4O6uEEQzZTmaucZTqXgzNRgBiZrpUwcTlFkYBF7CGBI
	 fYVP7OkknGkMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRjJl5vVQz4x8H;
	Mon, 14 Oct 2024 14:24:39 +1100 (AEDT)
Date: Mon, 14 Oct 2024 14:24:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20241014142439.40e63852@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KeC9M0Dl/+gIMMc_bQsZZ3e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KeC9M0Dl/+gIMMc_bQsZZ3e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  5c30cfa295cc ("drm/i915/dmc: Convert DMC code to intel_display")

from the drm-intel tree and commit:

  a4de6beb83fc ("drm/xe/display: Separate the d3cold and non-d3cold runtime=
 PM handling")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index 957ae763531d,5c6b74c36b60..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -344,7 -340,10 +344,10 @@@ static void __xe_display_pm_suspend(str
 =20
  	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 =20
 -	intel_dmc_suspend(xe);
 +	intel_dmc_suspend(display);
+=20
+ 	if (runtime && has_display(xe))
+ 		intel_hpd_poll_enable(xe);
  }
 =20
  void xe_display_pm_suspend(struct xe_device *xe)
@@@ -453,13 -452,14 +458,15 @@@ static void __xe_display_pm_resume(stru
  		intel_display_driver_resume(xe);
  		drm_kms_helper_poll_enable(&xe->drm);
  		intel_display_driver_enable_user_access(xe);
- 		intel_hpd_poll_disable(xe);
  	}
 =20
+ 	if (has_display(xe))
+ 		intel_hpd_poll_disable(xe);
+=20
  	intel_opregion_resume(display);
 =20
 -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 +	if (!runtime)
 +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 =20
  	intel_power_domains_enable(xe);
  }

--Sig_/KeC9M0Dl/+gIMMc_bQsZZ3e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcMjvcACgkQAVBC80lX
0Gx46Af+O9T6L4SVn7ON3qDiCfRFb6/nMexq1bbs25/rxn+9aeMGziGRRdHIDoin
tfaQkvCHaPvxrifyu+aBGY6mTQDdnVrR2XAjj3wnsG++F4qwDj08yT6aGQ3pAVLM
zRuf4l8fsXXPjeAypXBDtuXfNqo9t5V4u2fhpogvPUUq+k0ymtOuKxUNb8U6VTvs
nhIpJ2JOJGkZrmbg6FkaU5FCUa8YimhGWSw4cntEdAAaRKyI183ufpQfuN5F1oGw
LeJmpNpGqGr8Uh3qfHrMMMcUhnrgcYpKCnYt/CUsJNYX5X3hD+y2Uf9PlHiu47td
IwzjSOeX2R8QF4UmedcbPp34prsSug==
=kQCa
-----END PGP SIGNATURE-----

--Sig_/KeC9M0Dl/+gIMMc_bQsZZ3e--

