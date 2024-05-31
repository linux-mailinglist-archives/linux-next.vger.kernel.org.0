Return-Path: <linux-next+bounces-2431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BB8D58F3
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 05:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E311F25213
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 03:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705A03C099;
	Fri, 31 May 2024 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SZIjdOfC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A2110F;
	Fri, 31 May 2024 03:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717125523; cv=none; b=WzMUMWwh3BLpji0iZxFfYswmahYr7eHGSUp4JF+KcUWQqQyvWcQBDy0+6yY3FtXcMz1K+iaDpNFYvsJ+Uw88NRUT0I3JRRVqKdhgvIuCZC11jIvkTlRv+uS2rg8Erm29UWvZIlk2B8SNYVigw3eEKlEvZ058ZfzjYAwS+MJ11fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717125523; c=relaxed/simple;
	bh=gBqp7HhN/JoulcrxexqGsmz0cWGKY1FFSEFBl7EAZgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MX/OeebxYbbtNnxBe8OxJnzsNKvc6ySoNCUHK4rNiUViC7FuTu4/x1c5LpgCYmW2jzqvST7//Y3Hn0AFvB/2eW7jRYzq8KOJ96dI/cyTubdcqcpStlTKt0j+d+2emiBRSZjZZzAgPfGFOTdPl8YiEU50BTrw8TEtQ4g/nDZT9nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SZIjdOfC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717125517;
	bh=HoknV+HtmRIe4maEIT/mUg+T3WCjYAKX1WcJIResCkI=;
	h=Date:From:To:Cc:Subject:From;
	b=SZIjdOfC52y7Veu0faQjgCHrLMm+a554Dqoz9ubJmiRbJAJwJLBOx59lFZcaoFXlM
	 yZR127grNOsV+7tYCBGbvLYhCuSmP5OcXLUilOGpIxzkufC7S78ljqweN3m02rDCXZ
	 eJ1R/hRmEZGHSX12ghdQZ/xpG2EdUutzmNcmWbHQB3ntput760mBv0TcE8TpgI4505
	 CUpeW1/V88su1c2QqYrGWEVh1kWWXaSrjZAE2cpTlMgSBiWo9cUzAFmz+2FkWPER9Y
	 W50U7fCjTBrsl8v7VSMbU/S4SWWpe1VnaNnQKkgek0mC/nB2IlkABZxrJRJM0yQ7ZG
	 +ImgOgKCQnxWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr7cX4whrz4x1C;
	Fri, 31 May 2024 13:18:36 +1000 (AEST)
Date: Fri, 31 May 2024 13:18:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240531131835.62339471@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bXRMegfrycV3ynjtQdNKckB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bXRMegfrycV3ynjtQdNKckB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  ca5d5ecbb90d ("drm/xe/bmg: Enable the display support")

from the drm-intel tree and commit:

  37ea1aee18e7 ("drm/xe: Drop undesired prefix from the platform name")

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

diff --cc drivers/gpu/drm/xe/xe_pci.c
index d6859108cc69,e84da0cbb8e9..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -341,8 -342,7 +342,8 @@@ static const struct xe_device_desc lnl_
 =20
  static const struct xe_device_desc bmg_desc __maybe_unused =3D {
  	DGFX_FEATURES,
- 	PLATFORM(XE_BATTLEMAGE),
+ 	PLATFORM(BATTLEMAGE),
 +	.has_display =3D true,
  	.require_force_probe =3D true,
  };
 =20

--Sig_/bXRMegfrycV3ynjtQdNKckB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZQYsACgkQAVBC80lX
0GzPTQf+IHecx1bRuM2FRMQ/x7SCWU0rbUfIaxxepptlCtkjqZlefXFiZZbXIjV2
/jdPOyFw6ofc9tQYsopslFO/WyyNwKGVviZHRyLpsKrO2tKEFGbf18Qxt1EXOcCT
EISBxgrBQ5MR+3O1DBpUZje2NZNmsyvuwlI5TrD+HMISP5aEZUEpeLGHmtVluKC5
4Er3mdZKUQ8wYlnHGv1Wpv91BNMUIuOnInXHbNecj2UBiADsoZIYZdmfy6ocsyO9
sMpbYcEpkY7tu/d9RRUxyGhBwDI/0PkzEda9M3AbOqxbgRkuF2fg/6wDcXkOZDQh
jo14k4blD6F43eB+JLPOhzb/moEseA==
=59lo
-----END PGP SIGNATURE-----

--Sig_/bXRMegfrycV3ynjtQdNKckB--

