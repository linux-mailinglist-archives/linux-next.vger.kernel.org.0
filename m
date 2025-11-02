Return-Path: <linux-next+bounces-8792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D84C299BC
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 00:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC8E3ACC05
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 23:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3047319992C;
	Sun,  2 Nov 2025 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yt8NQl0B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53AE24DCFD;
	Sun,  2 Nov 2025 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762125236; cv=none; b=emy+68LODXzfwryz+FLVZsW9bT20poEzmppwHNlWgzHXlL5ADiSmzZ9c8stAduDhjropJGAhz8fAfkPKwKRUmciW4pC9Y/FCbFd1mjap/NozYi9xhJXbPzkWbl8iHfrpiGYneaHb9nrpJ+TNe/0/HBzhc7IPCcj8Ot56KFFrmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762125236; c=relaxed/simple;
	bh=ME4LvPnxhDyFfIKP9x/XGoGmUz2ZHvdsiI8gRxGXlAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RDH5CpvTdqjIQL2Fdj5lk+QKvDpr1qWLS17PsmhfUURhbklCOdymB7GAw0isuXFVQi3RarMoiZUFQRnoTzf0SApE92CVRN5T4Z5ajyFS3uCD7n8JlPbcHEuHQh/wlSeiKphHHjxwRRWbUnoqATfnw6yUBrNB2BaAhTn6E18JeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yt8NQl0B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762125231;
	bh=UrApUplrhg650aeZjiGycPOh3SlW4EIV3RN/nqafq1E=;
	h=Date:From:To:Cc:Subject:From;
	b=Yt8NQl0BCT6YyP6Ob7vUHE3jJT/zHLqfXClfbB4WesXkBOO2tzgl/AeTUbFcXcaNW
	 vF5WawPsb2+39n/qKKELR7EYcSFRWEms+6RtK/xJBKPMOA14yRqojVY31ePzLGRfgv
	 MeKs5Ap0F2EVAAzfqroqW1QCzhTLVC+lUADd8HUXYQQH2ux90jT4/BcuH95b6ibifO
	 p2V2Uoq/fTS6ZmR6Hfiz7xJRWO+BxlsHqujChOZKQORAdZ8Y3frMI9Z9/JXwpLHA6S
	 53LH2sLMw75+SssbBnKvt4mOLPZQhZMah5YnryLgw22t6L3YUaZFJQM3lEIIL3Mths
	 Do70td8lTNP+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09Wf1QQXz4w0p;
	Mon, 03 Nov 2025 10:13:49 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:13:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc
 tree
Message-ID: <20251103101349.5af777a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z21a/cOLsFpemMoUDjgkfrw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z21a/cOLsFpemMoUDjgkfrw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_rc6.c

between commit:

  f6e8dc9edf96 ("drm: include drm_print.h where needed")

from the drm-misc tree and commits:

  8c2833ff1df3 ("drm/i915: add vlv_clock_get_czclk()")
  5615e78e813e ("drm/i915: split out vlv_clock.[ch]")

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

diff --cc drivers/gpu/drm/i915/gt/intel_rc6.c
index 13721c9081b6,932f9f1b06b2..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@@ -6,8 -6,7 +6,9 @@@
  #include <linux/pm_runtime.h>
  #include <linux/string_helpers.h>
 =20
 +#include <drm/drm_print.h>
 +
+ #include "display/vlv_clock.h"
  #include "gem/i915_gem_region.h"
  #include "i915_drv.h"
  #include "i915_reg.h"

--Sig_/z21a/cOLsFpemMoUDjgkfrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH5a0ACgkQAVBC80lX
0GwATAf+IaMAVNnjxQs9NAYsjoodKNpiqtMya/5O4WpRBOXablOVAi64oRQ1fViR
SJJx3BBzT+wgoQOiiw8Cbt9yYumCNVAfNGfpUEBXxPbkXr4S9gioxVI88eMhn4Ob
OjJrzUCbQFAz3yORvpZ5g/opYgkFdVQRxHtw0QgS5QOxFcIvWzWD3vFOAnuj1yL2
Vui1+OAVM+dqVa4V2+A9ITd+KeArkOr9J220hDlx8wU7efheCh8deoHJ9nndlCl2
lGmq92cRH0CAfjXsxq0IDnTz58//cobXBUWj2Peaxxnd52o7rfWbn9EgN/khgCHK
EKJZs8U03LQ1G+FidjQVmPmbvWqXwQ==
=BAmB
-----END PGP SIGNATURE-----

--Sig_/z21a/cOLsFpemMoUDjgkfrw--

