Return-Path: <linux-next+bounces-3327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8BD952797
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 03:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 715141F21F72
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 01:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8252D1C6BE;
	Thu, 15 Aug 2024 01:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WS0lNQpV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5E58AD0;
	Thu, 15 Aug 2024 01:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723685845; cv=none; b=kfuZbefpVoyemWIXTqITx+BgpZVXyjsQZLa7346et8TuPxe+qazEB94ME8yoNcYQH9DZe6tx739ZaySOqWhEE7aTl1ZAW1vk7GvqVLcfvRMBYyTqEtgFELEq32XmWis0+p4S7HSb8gx5ogncouHnfvAcgIwFw9uXk7YMk/Xwn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723685845; c=relaxed/simple;
	bh=1WyJZt0sTuLy5TCCe6GljVyOanG00ggXYQEfbfcAcBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZigUKSSRiSqSwzIef75Qjg1G62fQRfOMeNaUT7hXLVXSATymE1RXCog7u7u8QKMnM25Ajqk0/8n58pIJmgQuXNWtfeexDf8k4MDqVsYjx0UAdsvDXKW5rkWZOi1iTWaXWbxloyg+CI6MpAtgog28GxxUNz6XeqInm0xb6j13WPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WS0lNQpV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723685840;
	bh=Iqpxovj7PB0EvtI0YGVxLgYHKaxYHdLqVH/H4Kykwmo=;
	h=Date:From:To:Cc:Subject:From;
	b=WS0lNQpVo3bX/JQEllwA6kB8ERNqbj3NTTd0F/jNdeTHpfZ4EtN/BwRJZkPjTe7xO
	 ebE3ULO6mEArRtb5C1AnDiOFcxxK9H1gwNrdNGFZrJ6c5yLfmM3zSmGgtaJGgO5NNF
	 gkb8ybUs/kpOoRIfi/9ryNrPWq911WLEgUwE0MaQ3fLHy3WRr/FxPCyQxuCEjYiUlr
	 MFhOdcCG/DMgHsoq8YayLtPZ/ino3j5Z+LppldbDzfIkpACZw6/nqi021etiaHtkTo
	 bHQDsvrg53QfpDEHy4OjbYWj62Xz1jL/oXABVGyEwt2LfAuEdURLGf5vP0cP+kMcca
	 52Jmc1EfwikjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WknmZ4z5Qz4wnx;
	Thu, 15 Aug 2024 11:37:18 +1000 (AEST)
Date: Thu, 15 Aug 2024 11:37:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240815113717.1c81c44c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5wpLM/KelcHtD=jYJFI9fGn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5wpLM/KelcHtD=jYJFI9fGn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  769b081c18b9 ("drm/i915/opregion: convert to struct intel_display")

from the drm-intel tree and commit:

  1eda95cba9df ("drm/xe: Rename enable_display module param")

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
index 0e4adde84cb2,56a940b39412..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -127,9 -126,8 +127,9 @@@ int xe_display_init_nommio(struct xe_de
  static void xe_display_fini_noirq(void *arg)
  {
  	struct xe_device *xe =3D arg;
 +	struct intel_display *display =3D &xe->display;
 =20
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	intel_display_driver_remove_noirq(xe);
@@@ -138,10 -135,9 +138,10 @@@
 =20
  int xe_display_init_noirq(struct xe_device *xe)
  {
 +	struct intel_display *display =3D &xe->display;
  	int err;
 =20
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return 0;
 =20
  	intel_display_driver_early_probe(xe);
@@@ -252,9 -246,7 +252,9 @@@ void xe_display_irq_handler(struct xe_d
 =20
  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
  {
 +	struct intel_display *display =3D &xe->display;
 +
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	if (gu_misc_iir & GU_MISC_GSE)
@@@ -289,9 -296,8 +289,9 @@@ static bool suspend_to_idle(void
 =20
  void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
  {
 +	struct intel_display *display =3D &xe->display;
  	bool s2idle =3D suspend_to_idle();
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	/*
@@@ -341,9 -347,7 +341,9 @@@ void xe_display_pm_resume_early(struct=20
 =20
  void xe_display_pm_resume(struct xe_device *xe, bool runtime)
  {
 +	struct intel_display *display =3D &xe->display;
 +
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	intel_dmc_resume(xe);

--Sig_/5wpLM/KelcHtD=jYJFI9fGn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9W80ACgkQAVBC80lX
0Gwu+wf+KA7E3N8TtTf07r0R92Zt1KrviWbgyWuZZEXV1kAuNoDZfczaxue4HDkB
XNr+Vs2oER5b4MLA221DW/HzhjSV72ApxvsIbfsMb2EfQsbjBCTGbQOiN94RjaPp
ARJ7iSorlsk7GWfUnbmFyrRoRW/6ZDnK4rIzHUS1QzP3TUVl2IJfpzFt+HPGkuR4
AKIzY3bzj3yxbcKGMAtjbW5I1GDbWNm9V8n6YNO98yLZ7sDkmgKUacV6lyhnTVzu
0seJlLSvPofLeHjCwMH11WzhxWLLbM1outKnJluwIhPiCWwNrqkuYGQ+WO4PiwbW
A6J9tmw2izPa07CcNXVCfDUKBnBOxQ==
=Xf7C
-----END PGP SIGNATURE-----

--Sig_/5wpLM/KelcHtD=jYJFI9fGn--

