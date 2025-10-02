Return-Path: <linux-next+bounces-8537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E4BB3D9C
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 14:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F8A01C72E7
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 12:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0922DC359;
	Thu,  2 Oct 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y490URen"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABB211472;
	Thu,  2 Oct 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759406877; cv=none; b=gy9kYdRM65w89spMtGvq65j6oqZc26gEjXEtWdYvRTmD79X/n8xRSJT8kmQDZcMxk8fdbwda3A6jEOAG/id1SzFZCcn+qJAPghUQ1GdgEP8kU7/KfHAjue3XJIvUc0Tev9CMLJBw0+okwnyHGus5jXbP5XfPV1s2XyVA3E0XV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759406877; c=relaxed/simple;
	bh=NLpMV/eax8dpgIsqSrgBnV/TD6rd7SE4F1q9XOgIlZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgA3E1r8XsneGsPP/RsHhGssC/VlT53lkBHED4Cfd2Ui7zV+jiEqkHGKfE4+YOLwcrb45jfBJPj0y7hibDrnXct28X+fq803EGMkRDjWeRuB5pljKUrFwdLMzuWz4I42J7V7RY8tA95xZxmTwAnSL4CVIAQelGRVbSWuvbiflS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y490URen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5300BC4CEF4;
	Thu,  2 Oct 2025 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759406876;
	bh=NLpMV/eax8dpgIsqSrgBnV/TD6rd7SE4F1q9XOgIlZM=;
	h=Date:From:To:Cc:Subject:From;
	b=Y490URenI8gRVb5PAyXEY0UVz4M4M0pY7K6xKZ2VKn4aTSqiF0/fzJqQHwefiCE+v
	 99d5qzUghvcWhTzSRbHPtZnlUQI7J3/TKe8h57yI+JBId+3nuT5ECT6BWhFHIDRLDo
	 Y6T0R7TdKU7axSwdtchuFsuwCS8z6RIos7uUvSP46HOdRm5gGCp2dLgtQGOHrqNE3v
	 dVzpIzln4wH2jcROjdmP2XxTnAbVcec/VdK7PzPxi1eKBGmCS4ushLxXuc8E6tONiw
	 KPqVimGm6+PNfab9y7hkNtBnlv5KCsFj99ij0BZCJmsX+lpA6aDqB6lSB2Y+J8WAB8
	 8leWCWXeBnNSg==
Date: Thu, 2 Oct 2025 13:07:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Wig Cheng <onlywig@gmail.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aN5rGLMlO0tVf9YT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u7cYVcmGlRX3y38I"
Content-Disposition: inline


--u7cYVcmGlRX3y38I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  4ed46073274a5 ("dt-bindings: vendor-prefixes: Add undocumented vendor pre=
fixes")

=66rom the origin tree and commit:

  09b26dce32f0d ("dt-bindings: vendor-prefixes: Add Mayqueen name")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7aa17199ea434,49a5117d2bbb0..0000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -965,8 -935,8 +967,10 @@@ patternProperties
      description: Maxim Integrated Products
    "^maxlinear,.*":
      description: MaxLinear Inc.
 +  "^maxtor,.*":
 +    description: Maxtor Corporation
+   "^mayqueen,.*":
+     description: Mayqueen Technologies Ltd.
    "^mbvl,.*":
      description: Mobiveil Inc.
    "^mcube,.*":

--u7cYVcmGlRX3y38I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeaxcACgkQJNaLcl1U
h9DDLAf/Qu2Vk2FvEuNcHBW+ogKWHrA4UUKRNqgob5XEBJXzcwwkqGrCJTEhbUMD
Ixo3728p7lVBmDPm3A2UsD5QePz9VnDBR1Rtk6uNQ0kKifO9DchJ1JM+kaLaZVU8
ssHF4j5d/t+SuwiUR9diaph8tiB6unc91hgm5zwVjnVGyI/TcTjC7vmpH/Nr9rGM
81ckegG3MZcMvoJUyNqXOXJMP+qQyohzZvR+PRy+2r5+Tu3SOs9A2PRsE6hENr7D
XZlmV5MVh7r5pEzFnxKrxvWW46DkhEaO7p4jjUwyqtJYGkyfGii2LGq7/pJzHapY
trzQlAf+MmNrqccanv9EXTxh3tO9UQ==
=mu3o
-----END PGP SIGNATURE-----

--u7cYVcmGlRX3y38I--

