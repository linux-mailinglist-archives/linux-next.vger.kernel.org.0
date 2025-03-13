Return-Path: <linux-next+bounces-5784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49703A5EA14
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 04:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D32E1898B56
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 03:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD0942AA9;
	Thu, 13 Mar 2025 03:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OxjSIy1M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2327468;
	Thu, 13 Mar 2025 03:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741835583; cv=none; b=puyQZUHNk65JcaVXyDYmnvrdHynP6sZKE6X5MeRRKO5pln070GG1Tv3sN53ecwH1zrePTaA7coS1tCrsANQ1yEuf5hiv8kFn4904Sv8pRGwl1oMkXKMzrUpBRGijbBlCn8ABkvqDDw0g1nKos6GF98h3EcfiZXKkdAzRY91hIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741835583; c=relaxed/simple;
	bh=9rDegvgEk6XpNnqqtMo5IqY/zy/Wkr4CTQx+RbYCi9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q6qbNcUBkOrpAVbzlLSX+I9/bu0i67csWgEZJ5wxlPqxf4sYXO7tZLx09oHWquk4ZwRZwnl0UkandhvAn2jAReJwJVHvtA0Vt/GW0Kloz7AbaKogiOMhfKR0wXtXHbHaSl0i4QSEnLzv9RZoLgfTVz57U3d+pF0isCMbv+z7fqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OxjSIy1M; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741835575;
	bh=umnF84Dfi3Nfa6Na8lFbRSU0J6LQFik/70/YubuMr4o=;
	h=Date:From:To:Cc:Subject:From;
	b=OxjSIy1MmXeePd5sIIGR9eQJJUTQlK/MMC5GIO6h0rJhjI70fgqpdTyrsd49sPv2T
	 CP0Y0D8uyHSh9gmldX3iJ/ZLYZ83WogH2T9YW66rLHntyCFtt7lOZ/v8otlgI0ADBj
	 4UgDJC/Rj9qGvofmzdffJNFJ91CsTf9veDNH21dr9eIp0jDOJ/qtM3uvBsj5dtyjzW
	 smV3RruxnjLUh/IwCE3MljFWhqn4DMc1gCnx9pi4ivYr8FwWIpRoMPGM8L3LNWrl6c
	 SsFl4xfSWJ2LHMlxdHgQ0jZW2aUnB/C1SZjiu/3JJOtCTX+T30bhe6vqDLsm8Ul0gK
	 gVZt2aCTGj7fA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCsxy6lWZz4wgp;
	Thu, 13 Mar 2025 14:12:54 +1100 (AEDT)
Date: Thu, 13 Mar 2025 14:12:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Nam Cao <namcao@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20250313141253.0c5a7520@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pZeEYs9fPa13vl4Du59hHnf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pZeEYs9fPa13vl4Du59hHnf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/i915_pmu.c

between commit:

  87b593d79864 ("drm/i915/pmu: Drop custom hotplug code")

from the drm tree and commit:

  82ad584eed8b ("drm/i915/pmu: Switch to use hrtimer_setup()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pmu.c
index 69a109d02116,0ce87f188d11..000000000000
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@@ -1155,8 -1264,8 +1155,7 @@@ void i915_pmu_register(struct drm_i915_
  	int ret =3D -ENOMEM;
 =20
  	spin_lock_init(&pmu->lock);
- 	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
- 	pmu->timer.function =3D i915_sample;
+ 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
 -	pmu->cpuhp.cpu =3D -1;
  	init_rc6(pmu);
 =20
  	if (IS_DGFX(i915)) {

--Sig_/pZeEYs9fPa13vl4Du59hHnf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfSTTUACgkQAVBC80lX
0GwYpQf/SKAOOH/Oph01KSqzkDqHAGb9+XkiZ+ZoEEa+RaxaUjuAfbE3V5i7e+2k
h89+AoELiv+kwMCrx6wAMqVCyikB1578QZah4eN1BR9mZZQ7oLpywlNQ6duTH7Ad
EdeP4E5Se/GBbgTVcDR6bfhpc94wlLtmWe2JTq03eAJpg/X7siYFyoLP9icK+xh6
Son0p1Q7lSdZMFfqqRl0YW25QFfejrCFOM1TaBhEPQvuKEmUOV89wO4tCck9o6ai
NQaXs6KeJYk+uUnvpk8Mbm+q98lPLR3PsXfG5uBL8aNEyS7mbQhZd/I3qub0CnYr
+M6+juEg9pFXSPs5QH2T+uGeDPBMoQ==
=WiEi
-----END PGP SIGNATURE-----

--Sig_/pZeEYs9fPa13vl4Du59hHnf--

