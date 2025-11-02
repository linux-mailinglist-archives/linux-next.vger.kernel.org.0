Return-Path: <linux-next+bounces-8794-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E2C29A07
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 00:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 997EC3472E8
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 23:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7078A23E229;
	Sun,  2 Nov 2025 23:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mfG+CMex"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFB29CE1;
	Sun,  2 Nov 2025 23:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762125758; cv=none; b=USmZKos04EeRk5kPpDOVWXl/Pvgu4Wee7mAnfZK0LIAbBqI5XQ+5I9VUaXumLF4zff8mx+6c9JMUphRts9i0aGKJLs5Q/WtBCtywxEkvkHj5eFCbZlbYX7Mj3wPvhOxgMXj54ZibHn2so3SX7Bw9QLw3I7U9lVVmzTOKFJvyuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762125758; c=relaxed/simple;
	bh=8dpOvcBUkhSg9A4vZgLpQsfmxP6rErxd/Y6BEDqff8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QadPa0OqvcO/Q5ptJjt/W/M7tQI2+RG1AQVY1gtP3in5IdYa3jkK5glc5z9K4R878GDHLsqzkCct4OYHPOykxvWQ4V/ibHsK2uhVso/WQhfZ2SOuEAvOmchQ6cB7iQMpZJ+8JH3dYN2kZFCmSYpwjH5QLk5G1m6zBP3u8D5i2gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mfG+CMex; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762125754;
	bh=2rNjtOI2mww09uharcAW9DKM4SCrFQrcePKn6Adh+n0=;
	h=Date:From:To:Cc:Subject:From;
	b=mfG+CMexHVEfMn3XGPzUyXvEjUu1LqUoNtF+InvzBVCkEMXKMEarUI88/zOD5lxlG
	 qem25g7hWN2y8mHmJmlqw0ePJKNVOkCJSu5KFVi/kKlAg05LK9Ia5HQmZhQV5dsOEX
	 fAlytqfzGSAjxvov8UQT5Tw80nJKtSbG6rM0bmDLf1I31a0bUw+8SVVjQAKfsnV+tM
	 nbr+bkqHUj1pe6FULUN5iXqFed0eoA9+OlfWhWynMF7rN4SASamgjDdyKhLKmb66Gx
	 FfCAmpvXU9+hFXO6xv9cT2pZwOSZ422NbaWBN98KO/uWDMgXSMv71dp0N4LFSd0LIa
	 nF+ICqKnc7Qwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09jj6TLhz4w93;
	Mon, 03 Nov 2025 10:22:33 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:22:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc
 tree
Message-ID: <20251103102233.7c6adc9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fUz4vqoMbt2t_KNm2IayWRr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fUz4vqoMbt2t_KNm2IayWRr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_bw.c

between commit:

  f6e8dc9edf96 ("drm: include drm_print.h where needed")

from the drm-misc tree and commit:

  ac930bab1c89 ("drm/i915/bw: Untangle dbuf bw from the sagv/mem bw stuff")

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

diff --cc drivers/gpu/drm/i915/display/intel_bw.c
index b3e4cc9985e9,3033c53e61d1..000000000000
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@@ -3,9 -3,6 +3,8 @@@
   * Copyright =C2=A9 2019 Intel Corporation
   */
 =20
- #include <drm/drm_atomic_state_helper.h>
 +#include <drm/drm_print.h>
 +
  #include "soc/intel_dram.h"
 =20
  #include "i915_drv.h"

--Sig_/fUz4vqoMbt2t_KNm2IayWRr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH57kACgkQAVBC80lX
0GzFmQf+J56RnPQxGAMIrZg2X4PAPoS7F6DlQhHOjBxn07eOrXCTErRQqEeN+Rlp
6iFvL9UdMmiVi5qBo3riK92kx2sfLZdVXq0zs2TZbARlW/SDt0AaslUZEHz408t/
7EVXxdxvOIkPr1D/lANCVsjvhk21L7EeTlbT61EFF8ccsOQArMR4F/pNM4uxhm6P
zLRCNQR5Jpz9UOk6MrTtUKNiFD0SYGaHTgf+6sVDBZMGz1s5XpcuA5K6GyhaPSEZ
/tvnHyfc9oBFrCFUqrC4MJZ0UlP54j9Mn6Z+jOEXqjg9ZgtHbCmT4AdNSahMo9Xv
UNWjtDWGl6tnpMs/QW0yZzPXUFV2cQ==
=ynOq
-----END PGP SIGNATURE-----

--Sig_/fUz4vqoMbt2t_KNm2IayWRr--

