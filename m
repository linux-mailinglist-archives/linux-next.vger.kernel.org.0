Return-Path: <linux-next+bounces-9687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B8D317E9
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 14:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20A163009699
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B064D221F39;
	Fri, 16 Jan 2026 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw/ECDG6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA81A3172;
	Fri, 16 Jan 2026 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568674; cv=none; b=ZhPwTN+Mkm2EbL5pRfkGfq3CHGxgKO6RtNI9f3l5pA+WWae6YuiY1/G5yNnVVV4t3RL7SbBHprHyAxfXJhseYDpO2nSTPy3jje2IWYRlsby2uIcv1kLm7LAYMuOMgLVjgyQfyk3X8p8teMWFvbsfA06/DLlCiMvtCxlBa8VInt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568674; c=relaxed/simple;
	bh=T4Toa9lrXd7vxiZnz7WXZmH05Quqm9Z6aZx6P6QJGKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYXdfn/Trcfe5viUYECVrBWZgxWHfi3d51v9oyLoJjG28iPM6DsVRW/0HJtbUJUeBzAPWNeDwGleOQqvojiBdORQM32JS9MY5FDtr3sSvZBaz23ZgghKvEOYFB30lr9KyPYPY5IY6f9jDZhHQTqOOGCLvUydT1epyLEydwVtT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw/ECDG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A30C116C6;
	Fri, 16 Jan 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568674;
	bh=T4Toa9lrXd7vxiZnz7WXZmH05Quqm9Z6aZx6P6QJGKw=;
	h=Date:From:To:Cc:Subject:From;
	b=Qw/ECDG6+Q3dyhnrcEu3A6zEV+GLPIki8MSby4pROiaBdXNWbYT3Ug2zMfVlC9PYj
	 543LArP0q9Frus316EWDL+TVtoxQj4GAWP0ZRiAgXiItfIwMmiDH8ewQ18JzSgNBDh
	 qP79cxf1sSWXVbQ28VV/QZQNYiim9Cffnq5PFJTR1M48lEpzpCn3WaSRWX/kR4/1yK
	 hQvd3l4cD6aLOjlIuriUXALZKdPTN0sbgQ68DYdathiUL5901Lu2z1YsJMQCohJ+1s
	 eYhLSvXB58LncX5Pof0CUJodm0iBssX1MZ49QKcUh+URHjeIE4pzFU75q0qBEusAV4
	 U/ubg/hRk9xZw==
Date: Fri, 16 Jan 2026 13:04:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Robert Richter <rrichter@amd.com>
Subject: linux-next: manual merge of the cxl tree with the cxl-fixes tree
Message-ID: <aWo3Xj3WU6Rqav5m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ux1idL7SBXiNbo6d"
Content-Disposition: inline


--Ux1idL7SBXiNbo6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cxl tree got a conflict in:

  drivers/cxl/core/region.c

between commit:

  8441c7d3bd6c5 ("cxl: Check for invalid addresses returned from translatio=
n functions on errors")

=66rom the cxl-fixes tree and commit:

  7af987b3f875c ("cxl/region: Translate DPA->HPA in unaligned MOD3 regions")

=66rom the cxl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/cxl/core/region.c
index 5bd1213737fa2,8ed66bedb407e..0000000000000
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@@ -3116,9 -3247,11 +3247,11 @@@ u64 cxl_dpa_to_hpa(struct cxl_region *c
  		   u64 dpa)
  {
  	struct cxl_root_decoder *cxlrd =3D to_cxl_root_decoder(cxlr->dev.parent);
+ 	struct cxl_decoder *cxld =3D &cxlrd->cxlsd.cxld;
  	struct cxl_region_params *p =3D &cxlr->params;
  	struct cxl_endpoint_decoder *cxled =3D NULL;
 -	u64 dpa_offset, hpa_offset, hpa;
 +	u64 base, dpa_offset, hpa_offset, hpa;
+ 	bool unaligned =3D false;
  	u16 eig =3D 0;
  	u8 eiw =3D 0;
  	int pos;
@@@ -3132,21 -3265,32 +3265,38 @@@
  	if (!cxled)
  		return ULLONG_MAX;
 =20
- 	pos =3D cxled->pos;
- 	ways_to_eiw(p->interleave_ways, &eiw);
- 	granularity_to_eig(p->interleave_granularity, &eig);
-=20
 -	dpa_offset =3D dpa - cxl_dpa_resource_start(cxled);
 +	base =3D cxl_dpa_resource_start(cxled);
 +	if (base =3D=3D RESOURCE_SIZE_MAX)
 +		return ULLONG_MAX;
 +
 +	dpa_offset =3D dpa - base;
+=20
+ 	/* Unaligned calc for MOD3 interleaves not hbiw * 256MB aligned */
+ 	unaligned =3D region_is_unaligned_mod3(cxlr);
+ 	if (unaligned) {
+ 		hpa =3D unaligned_dpa_to_hpa(cxld, p, cxled->pos, dpa_offset);
+ 		if (hpa =3D=3D ULLONG_MAX)
+ 			return ULLONG_MAX;
+=20
+ 		goto skip_aligned;
+ 	}
+ 	/*
+ 	 * Aligned calc for all power-of-2 interleaves and for MOD3
+ 	 * interleaves that are aligned at hbiw * 256MB
+ 	 */
+ 	pos =3D cxled->pos;
+ 	ways_to_eiw(p->interleave_ways, &eiw);
+ 	granularity_to_eig(p->interleave_granularity, &eig);
+=20
  	hpa_offset =3D cxl_calculate_hpa_offset(dpa_offset, pos, eiw, eig);
 +	if (hpa_offset =3D=3D ULLONG_MAX)
 +		return ULLONG_MAX;
 =20
  	/* Apply the hpa_offset to the region base address */
- 	hpa =3D hpa_offset + p->res->start + p->cache_size;
+ 	hpa =3D hpa_offset + p->res->start;
+=20
+ skip_aligned:
+ 	hpa +=3D p->cache_size;
 =20
  	/* Root decoder translation overrides typical modulo decode */
  	if (cxlrd->ops.hpa_to_spa)
@@@ -3197,15 -3379,16 +3389,19 @@@ static int region_offset_to_dpa_result(
  	 * CXL HPA is assumed to equal SPA.
  	 */
  	if (cxlrd->ops.spa_to_hpa) {
 -		hpa =3D cxlrd->ops.spa_to_hpa(cxlrd, p->res->start + offset);
 -		hpa_offset =3D hpa - p->res->start;
 -	} else {
 -		hpa_offset =3D offset;
 +		hpa_offset =3D cxlrd->ops.spa_to_hpa(cxlrd, p->res->start + offset);
 +		if (hpa_offset =3D=3D ULLONG_MAX) {
 +			dev_dbg(&cxlr->dev, "HPA not found for %pr offset %#llx\n",
 +				p->res, offset);
 +			return -ENXIO;
 +		}
 +		hpa_offset -=3D p->res->start;
  	}
 =20
+ 	if (region_is_unaligned_mod3(cxlr))
+ 		return unaligned_region_offset_to_dpa_result(cxlr, offset,
+ 							     result);
+=20
  	pos =3D cxl_calculate_position(hpa_offset, eiw, eig);
  	if (pos < 0 || pos >=3D p->nr_targets) {
  		dev_dbg(&cxlr->dev, "Invalid position %d for %d targets\n",

--Ux1idL7SBXiNbo6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqN10ACgkQJNaLcl1U
h9CSOwf/a/zhwIjv3aDlRTd6RpeyEvf1+/BeanzhRIPb0qukhpcfGLFBc7SBsuuB
vJ5Exb4qsPTlI5RbgpUvN70/fZHYZc5i3EHv5BbdCboA6Y/lp2DGxTcGEbyYUl4U
m0ys8f/m4SI/Wx9o+kq0KwKS7Sm9eIMKgyAXJEwu53pPzddLYh/2aSLZFeG5Q0/S
bwSw7edvcVHsK54tJsRF/HM5FaGQwP46HYiltGORfDbbPjKWhP/0u1Y24SZrhD+T
AYsaX/iMNH7nSqElbyRnNGXrYJpkIrvQJMEyl7iOq5S9Z3E8gvkBRz1EFCgIdMgG
2rYh78J3vFrVAC8OI61rg7NS9YJvOQ==
=wVlR
-----END PGP SIGNATURE-----

--Ux1idL7SBXiNbo6d--

