Return-Path: <linux-next+bounces-2177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF88BC5B4
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 04:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26CA51C21049
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 02:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C383E470;
	Mon,  6 May 2024 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kywDGneH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A616FB2;
	Mon,  6 May 2024 02:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714961886; cv=none; b=LY2jekOZ5yKgL2MwGaK23wCp5uVg3CgSwBXAIj0mrHLdWcUZLWeQFz/YIbnonqZVeeOYPMcP4Zq5Zk5FrDDLS0Exn7BqDtKpTmXYgQ49Wa8O56GfT2dIDRGJlrSv2rwLZSzU8VIF/JKJVb0imRa6iYOx+rZxKIHlvFSwGpvd484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714961886; c=relaxed/simple;
	bh=nE+x1INBsPIPydzJG46KPYgWt7zuZ3SYxltjN2xCESo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EunqPf1iPfXRqaWwvKJgDDRIBXSXw2j5CGpt3zraXfketTMHB+NYvmLYTAmbfHK0N+Q3ir5+sM3BtM8QXPQEW0lLoruAn7OSM8nlCr4IGUFRvIARnodxxRTQ0mbYSyNY/Gs/OgHEMQVgB6kGNMpNFDCN18mBKonNgZIVDTQ2Xng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kywDGneH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714961881;
	bh=soFSD916NRLT6/m2clSFEXil9meuREHqNYpgRHAYDh4=;
	h=Date:From:To:Cc:Subject:From;
	b=kywDGneH6DxElX/YlYI2lslELIDY3H1jOiGgsRvvLkFfKNGGgy6fVDZA7paVXffDQ
	 68pSP7Onlq64BJ57ZjgKKWbIjeC+xvFjsJBFYHf6g7USYssLvMBtDpDDKbplkoJ7Bv
	 hHwwpEqE8Sux3K3PGelvJjrIs0K5+BH7nBzUu4SgDinGEgqFNP4kCjorFiThqs9Nrd
	 E+MIXDnMiGnnnhBAkyLIMfynX/kDW6+xnhhgpsGnLf4FiRxMMlCPc0+n0Uufg1QRJh
	 DnFy1yaH7x2/Htg1847HpB5kU/dlQCFF+Bak7toYjAqpPrQpYlsY2F5hM6SKaKKniH
	 s9VZ3LRYmtxzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXlS77221z4x0x;
	Mon,  6 May 2024 12:17:59 +1000 (AEST)
Date: Mon, 6 May 2024 12:17:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Auld <matthew.auld@intel.com>, Nirmoy
 Das <nirmoy.das@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240506121759.5b6c6a7c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Wi8_X7WNQwmePZdKHLY9jd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_device.h

between commit:

  c01c6066e6fa ("drm/xe/device: implement transient flush")

from the drm-intel tree and commits:

  fb74b205cdd2 ("drm/xe: Introduce a simple wedged state")
  8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU=
 hang")
  6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")

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

diff --cc drivers/gpu/drm/xe/xe_device.h
index 7524a71c0d84,82317580f4bf..000000000000
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@@ -167,6 -167,11 +167,13 @@@ void xe_device_snapshot_print(struct xe
  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 =20
 +void xe_device_td_flush(struct xe_device *xe);
 +
+ static inline bool xe_device_wedged(struct xe_device *xe)
+ {
+ 	return atomic_read(&xe->wedged.flag);
+ }
+=20
+ void xe_device_declare_wedged(struct xe_device *xe);
+=20
  #endif

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4PdcACgkQAVBC80lX
0Gw7Gwf+MQ1FKfb1l4Fje3jDfpRrK+62r1mwZXibfC3BqZQ6M4oFZ+ME7KEeKcn8
bh4F87u44sK00j/pdLqHB8V4JnZlIfEBRVGSCd9cMLLfjXLi/fd1Yu9RlL5izbWf
d2U9Is+FKq5AoZwAMatw2LTdb0EgH6xQ01nNJnMvDCu9g8BztuAcuuZimEbNRzgt
5DX1LkSQdbgfylYR1TWr3o3kD76jsmyOa/Znctsty2ejdNzQLFAxO/+YZp6ZP6xC
1qIQft83W3bq+SzZJ5UT9ckohvBxvr8cvpCs/PiqZOlnHzq61c7KcphP5l1OCOID
78urM3wwUWGJI/gVfNpXlw1lc2zbkA==
=rp0r
-----END PGP SIGNATURE-----

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd--

