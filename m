Return-Path: <linux-next+bounces-3635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FF96E80F
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 05:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CBD51F23B16
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026783EA83;
	Fri,  6 Sep 2024 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u7gtWNH6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E09D38DE9;
	Fri,  6 Sep 2024 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725592510; cv=none; b=rGV//+jqq2YbKCfm9eQ3xb4vH8e16LnfZef/TCsAmT4w3LsGNEEPHcPKW4Ww9OKGIkhF5lRC1ERVVz0qloaP5NvoAwPlmtxvu/1NmH5nWo760iGjA/ArGkmgI5Yz+o6Iab7f/ONJkxf39/LHuNKsp6qJFSJXLVR5E+qfs29nreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725592510; c=relaxed/simple;
	bh=9JHCOUyKP7KDQZ99HJ1LqsdSCadLHr1T6E1LU2uUim4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PrGf/cvnF3hRVfvsyEbWuQE76oUifZ5P5+ljJQBmWe/i1YA/WK99C+cJ/DBgvz2lP8PzU20Uu/5x8clsgcQ47APIJRFpLoZyQxMmZmlYHdj/gc4H/a24v7gCAMujL5/mkhPTzjz6YsYwVPvupOZa6ft1MrK3692xXwfk705MIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=u7gtWNH6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725592504;
	bh=QMIlXfEUeKgJL/ulsag1T3e133MiIVGIWcDrY3RH+Ws=;
	h=Date:From:To:Cc:Subject:From;
	b=u7gtWNH6Jk/fXt/kPTWPmYn46m36/+XWV5rXDbFhpEhMbFV0KzSPxHuNXkwpUUwhu
	 un11fJcv6HW/eeVsCxbhZ9nw4Z5P5ACPKqLRUtGl5nlEl/gIPR49l59sy2Y5qfPwaz
	 CCyru6g3w7liA+94R9AIYqK2tJt/FJSZXCJKfExkQc/NcA+Kur5BNxABhizveFlQMC
	 rBbMj2YqU1jUNXXsAvuIT2xOLYjsruzVbDYDpaPWbdemFPYsqpPI+GdgjrKYPphmdE
	 eG0oj0befUe6EnzQ3zImoe5e3eyJOH4kdUMAhM5wrEGH5wPszCelbv0J0+w+e9dYJf
	 TD1ksuAsByKtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0LvC2zVXz4wxx;
	Fri,  6 Sep 2024 13:15:03 +1000 (AEST)
Date: Fri, 6 Sep 2024 13:15:02 +1000
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
Message-ID: <20240906131502.7a7d1962@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F3S_2xZpz8_i.Yz3/rhYYC2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where nee=
ded")

from the drm-intel tree and commit:

  87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_=
drm.h>")

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
index 303d00b99a68,75736faf2a80..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -10,8 -10,7 +10,8 @@@
 =20
  #include <drm/drm_drv.h>
  #include <drm/drm_managed.h>
 +#include <drm/drm_probe_helper.h>
- #include <drm/xe_drm.h>
+ #include <uapi/drm/xe_drm.h>
 =20
  #include "soc/intel_dram.h"
  #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbac7YACgkQAVBC80lX
0GyngggAk/um0PJ+wiMnG/0T4jvmtqTKfZ8/LO4Yws+D4nTJ09Qnh7nUyH/3Dt0p
hfEjzoHhIakOQH7iPgzfwdPxEzszv8WfgSygAunI1g6QZJT6HHnrbZKGdkzGG3ma
TVBQpTMdDJuT4yBfflM5NCStSonCjDak2SL9lVbSi9Q0mlWTyOSF134tmcxoYZmc
OMblFMcIOt/g95Tx/1EVzli+iT2hqNc+DT7B7pVHVyqrukVUV9eXovagTF4FejDa
fUnKx0fS+Ng8h6FUKcILE/i4heCSQ7ziygsLUZ8nWzyHsjsBi4QCIYxjMz+ELZAZ
eBqeUbREtvf5vAXhIveJqeCNI1anag==
=x7jU
-----END PGP SIGNATURE-----

--Sig_/F3S_2xZpz8_i.Yz3/rhYYC2--

