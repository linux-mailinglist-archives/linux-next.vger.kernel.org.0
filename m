Return-Path: <linux-next+bounces-8386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F57B89853
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 14:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7271CC0F1B
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 12:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9195E2376F2;
	Fri, 19 Sep 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtjANoUg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F52356C6;
	Fri, 19 Sep 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285926; cv=none; b=SrY+2jxN8AqQsMvIr8+poQNX3PFSbTVW8NPj3n76vzf/t/dE9x410wBCu64FOBQfQxbopVE7vwjTWReHvW3R+uvY6gp8iCdP24T42+iQuSNgQXp0VdMHtrMC0JgVA7JkVhWrUIFkzqYYG7ETZtoj0ZFRYOFkZhCg9oFFyP1vbRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285926; c=relaxed/simple;
	bh=YO/PpUN1H9lGCId6mv1uFegodo8YwlKrwL4f6jJ7I4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZhV1MXUKGMcvVFzdkysS6+sKR8iM8MUTMVs9H6cbx9H7OikKZmZYuDwZH3wxDtEb8LTc8FF/9WeEbRT36FqhLIox4SATalf235lrkJ6R8jmingXYuL4IDSlK8MHPpQx0olcNuxA40rVG+WrMbbFInDWsjWM3I0ZSj5PDjXvkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtjANoUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C30C4CEF0;
	Fri, 19 Sep 2025 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758285925;
	bh=YO/PpUN1H9lGCId6mv1uFegodo8YwlKrwL4f6jJ7I4g=;
	h=Date:From:To:Cc:Subject:From;
	b=QtjANoUgWKd2AUI3kKQ9lu1wPHPjrYd0IKiD2sxDBumQNclkcwCcCG7l1qOd2zMlY
	 7WCK0U8FoReSlX5tpc1Vbq5pays1s7sPfopSwPTBRE2h/q/TTf0Mv4WJ12o+4CndOK
	 hWV1Zj8P/fDzqsZru6HNzejjZItUKkmsjNVxBxiZfB0mSDCzrUzeDb0wm+vlTI/52d
	 YVwGMtdJuUHm9h9bDCEGEVKP2GyALcOH0YvXQYuRro3flpvVN5pAlBsR8Weyt/BH2M
	 u0wEfc0OTz4huxEc6tFGIIAxVbj8cC83iR7EbWvKDywxVtTHa+NEg2SdBUs06DeE/d
	 jB2HzzIT1UG/A==
Date: Fri, 19 Sep 2025 13:45:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aM1QX4eEaSRQX6Dl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcZx3cHxvDMD4Pma"
Content-Disposition: inline


--ZcZx3cHxvDMD4Pma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")

=66rom the drm-fixes tree and commit:

  fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
index b7f8fcfed8d86,c5151c86a98ae..0000000000000
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@@ -308,19 -290,15 +290,15 @@@ int xe_device_sysfs_init(struct xe_devi
  			return ret;
  	}
 =20
- 	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
- 		ret =3D sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
+ 	if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
+ 		ret =3D devm_device_add_group(dev, &auto_link_downgrade_attr_group);
  		if (ret)
 -			return ret;
 +			goto cleanup;
 =20
- 		ret =3D late_bind_create_files(dev);
+ 		ret =3D devm_device_add_group(dev, &late_bind_attr_group);
  		if (ret)
 -			return ret;
 +			goto cleanup;
  	}
 =20
- 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
-=20
- cleanup:
- 	xe_device_sysfs_fini(xe);
- 	return ret;
+ 	return 0;
  }

--ZcZx3cHxvDMD4Pma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNUF4ACgkQJNaLcl1U
h9Cbvwf/ehYsDsj+lqJUPJnYu4QYQoPrMKO3HTREiByZRp9P/dWFgJPRRtHuG0el
nWoOnNrSYmPgHnjSE76GUro5pG+UjUqwZ3Uz5Uey/aYFqYswjE2vP6DVxe3N2NoD
hTuhme5II1XxM2dn0nLlaA2helIANuqS0Yx+UaduHqxfNedsqrtlvJqrFohkUYb7
KPXPUm6yQdAP8apC4pbl4UV3avE6ftfQha7HZRSAM3KnjOWerZdlUonublE0BVti
u3sHwl1w7I8gFqlT7m17tdkiXrpSXY9K5Yec6+yo6RRxwl71W+K0VEkyDCOJFpj/
V5YjVnltLzTi1YYUqs/osg3Un19ORg==
=IMY4
-----END PGP SIGNATURE-----

--ZcZx3cHxvDMD4Pma--

