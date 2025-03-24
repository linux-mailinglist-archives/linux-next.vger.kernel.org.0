Return-Path: <linux-next+bounces-5939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E4A6D33A
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 04:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163843AC5A5
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 03:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD1F1F5FD;
	Mon, 24 Mar 2025 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hM6PkbTU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DDD134D4;
	Mon, 24 Mar 2025 03:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742785575; cv=none; b=LVmqpDi3NLuXfZUYGS70/UK0yJ3B8GTaRXuUMKqeEeLH9V/gcr7zmhaI8d4A0XS/WlWd178VZ9uAcL28v9pU+oxFnXjNxN7tDAvHbJAubXPJmHdXAEpLw9oGs2cysJ0Jv96Q5ZpR1QI3WSJbCDnuAf41ETBvHQa2s/uSeNjm5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742785575; c=relaxed/simple;
	bh=VjAArbcein7n6jkxA8kkItfJAVHkEUWAu1U00aP4eCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R96lvGJjE5Ja6krqXGr6CP5IFI6KU0WhZv3gUzqZAoOm19GyqBIogq6DdWgNazJjsWm3/yhvQeQMiOkY9ZAKqnL5av+NIDwW07MIt0sYeVSw3ADqmOI3gh1Q7W2wLDF7WyWNwLeH5djQU50XAKyEWbCoiJZ3uMTlOp2SGI8wDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hM6PkbTU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742785567;
	bh=PDcit8P670kcmY2ktuwUGkkvaDYFCfnPTpn5lWSchjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=hM6PkbTUO9UQVE5Ii9MmQgHfOe/UqN1aoJCBq32qVpe5nHjnUBWbVP9C+hIeqTPFz
	 dkHYcIxpDnH1Jb86JesSjRoPKaZ/H7InudTD0Y4Wm6OmkFfCjsAVhjB6514o5V7PFr
	 zvVQQKE+OxjK5l6b5vvG732vACnM40tVQVNSH7l/5Ry6TmtJtg9OovsEbM6slTpUgq
	 +tojH5XHGcqvo7rF5K6VfqUo1oJij4Ol27YVRdkXmRhz5KE1mr7fpeRgoIK2nMGIZj
	 53V2YGFyBjbAhY8N1YiShl9e8w7z8018ojLHHfH81FWRy7vNkBhBBHMBdf7AQwMCsa
	 FG65ALZNZpnbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLdH24pSHz4wc4;
	Mon, 24 Mar 2025 14:06:06 +1100 (AEDT)
Date: Mon, 24 Mar 2025 14:06:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Tomasz Rusinowicz
 <tomasz.rusinowicz@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250324140606.7b87b0a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y4rNmdJV7kst=r8jX9Qxs3f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y4rNmdJV7kst=r8jX9Qxs3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_bo.h

between commit:

  50af7cab7520 ("drm/xe: Fix exporting xe buffers multiple times")

from Linus' tree and commit:

  00c8efc3180f ("drm/xe: Add a shrinker for xe bos")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_bo.h
index 43bf6f140d40,bda3fdd408da..000000000000
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@@ -341,6 -391,21 +391,20 @@@ static inline unsigned int xe_sg_segmen
  	return round_down(max / 2, PAGE_SIZE);
  }
 =20
+ /**
+  * struct xe_bo_shrink_flags - flags governing the shrink behaviour.
+  * @purge: Only purging allowed. Don't shrink if bo not purgeable.
+  * @writeback: Attempt to immediately move content to swap.
+  */
+ struct xe_bo_shrink_flags {
+ 	u32 purge : 1;
+ 	u32 writeback : 1;
+ };
+=20
+ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object=
 *bo,
+ 		  const struct xe_bo_shrink_flags flags,
+ 		  unsigned long *scanned);
+=20
 -#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
  /**
   * xe_bo_is_mem_type - Whether the bo currently resides in the given
   * TTM memory type

--Sig_/y4rNmdJV7kst=r8jX9Qxs3f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfgzB4ACgkQAVBC80lX
0GzWjwf/bSrWDiwsCQOcVwYqZOEZwlgGSQiLzZlhQHa/w4wfQ52F+dI2yGGrB16v
ROfYg0icwyqz3Mpb72yrT0/TSIBz1RPDgAd2iZkexA/d+TCyuzKbsgGnKUwMCu91
CsNHQ2NJFwnOhP5dylVqgrq9JcfHSUp3MCst5VmhAYpNEhoKiO+K7VEcQcxRKNRq
aeG4xyeBmdNUK9gs6TT11+tV49nKxNjjuPkW3M+4l1Ws7BfAqhUhAtzYh5ZvJ/E2
uHKCGuY5Z6Mr68JpoggLcwArqp9+wIx/x53HboCUYxGDA6THWzte0zs0zReM38ff
TLmYkjDQchaRbr2+iVuFifu9C1x8LA==
=RhGm
-----END PGP SIGNATURE-----

--Sig_/y4rNmdJV7kst=r8jX9Qxs3f--

