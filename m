Return-Path: <linux-next+bounces-3182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE894413C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9A84B2A5D4
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A9813667E;
	Thu,  1 Aug 2024 01:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sa8qnex8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29DB28370;
	Thu,  1 Aug 2024 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722475616; cv=none; b=KjmsR0ojRfw3SheojcRMO2dG84joG7HWGeJOGn68uF2hdD65rnddQkMvGtPaky1MifafHP4p71lCexlTreDOq0yB5/f4sPLjH9WzBDda4rv1I2beWbiwX9KlMBZmabcMhTQuO6K5GMn+T0CZhYlrlCPkBZGm4j/mnqmMDlvgyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722475616; c=relaxed/simple;
	bh=dJULF9u1UbKIHK6/B73pmGXfgRNh02RSUeuIW6GysmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XybpVjFdeoHTUFgkL7pOqV0NIcNZ3kE7vNACI6/ar89OtFxcyiSwRYDjxdEQ2OCE9LFbwL04zdY6zG6JLTXHKnJBjaycBg2UsRD6RfLkmTHkDJVsEK6Q88ZyjrJniMTfyMmGX84L7sVmfh+OksSVhyY3FkipfxOxp1y9nLI9biE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sa8qnex8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722475612;
	bh=3+b6rMgl+NJQI1+PnuBqTbcxPeciIVa3QXZNYf8AnZ0=;
	h=Date:From:To:Cc:Subject:From;
	b=sa8qnex8b4os+/wv/WnaY6ccwkRy0JeS+wUuVvDsw2i0iZaNoUhNUBnFCjqOHy/5T
	 jW8tFLw0/sm2PHjT94Q5dWyH9E26u1FT60FxnIZKt+9njvD6IO10PuSBEgnWThxad7
	 e9qrfr31h3en0lH8yqjFYvoHoW650ZojNyM+uDwHQvTO6Yq+L8JV0DeC/L3Lq8SyLT
	 FBFOJCuW7zBXU7+dOOJzjixfJF7/v1hGtof2gHk5ELo2D5Ya3KUij5n/cAMmEv+zs8
	 oRRI/kLcCcZw8lb5a+I+cEJVWJE0WsIC+t+QJJS/CjB6k1KEaFwB/eWi2sCu8e8zBd
	 aWjGTwu4665eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZBBz2Hh6z4x0C;
	Thu,  1 Aug 2024 11:26:51 +1000 (AEST)
Date: Thu, 1 Aug 2024 11:26:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-misc tree
Message-ID: <20240801112650.30b8d53d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vNhWEgUKXHB297s8XXMWJXk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vNhWEgUKXHB297s8XXMWJXk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_vm.c

between commit:

  4c44f89c5dae ("drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within b=
ulk sublist moves")

from the drm-misc tree and commit:

  a2387e69493d ("drm/xe: Take a ref to xe file when user creates a VM")

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

diff --cc drivers/gpu/drm/xe/xe_vm.c
index c3bdb6362fe9,f225107bdd65..000000000000
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@@ -1604,7 -1670,10 +1673,11 @@@ static void vm_destroy_work_func(struc
  		XE_WARN_ON(vm->pt_root[id]);
 =20
  	trace_xe_vm_free(vm);
 +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
+=20
+ 	if (vm->xef)
+ 		xe_file_put(vm->xef);
+=20
  	kfree(vm);
  }
 =20

--Sig_/vNhWEgUKXHB297s8XXMWJXk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq5FoACgkQAVBC80lX
0Gw7+Af/a263s5qrAfruejH6cvM7gSin/ndV6J8n0743hIUeZVlD7jHXySuhyg3b
4VjsiOhWqa9yjZUX9oqIyTKulPGJoUO3BUlcHahP+kflJTbaLfQ1G4wf0/tJ7a1R
AiLmLY/8QAOB0Wimml3/+KDzQiUfirkWC8QeaaaV/cg2kVNN5EqI8MYln/tWJuhI
IaxNGQkxZiDQQHzMGQYX7xMnk9sLN71xYlKv25U4KVQY4TTm2loBnheWAsHDemVx
SUJYb2P5FZZq3wJI7xNdCYn4eO29zxi+6/foLGqKqIxjqDidl3LcPIpk4hKe2DFf
OVGxbtFQg/rjybSBuz+5rKnGIRw2wQ==
=5M9J
-----END PGP SIGNATURE-----

--Sig_/vNhWEgUKXHB297s8XXMWJXk--

