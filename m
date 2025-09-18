Return-Path: <linux-next+bounces-8375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C633B854AE
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 16:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDFAA188CAB1
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 14:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFA82EAD0C;
	Thu, 18 Sep 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW98UyB/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAF243371;
	Thu, 18 Sep 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206377; cv=none; b=SeJ6OwpG5KWTosH8AE0vdDnVojOBbsm6/8z56iGps9QunOyctVm2TjW22+FuYy80+pcT4FN1NrLA6soUCCKiO16imujp+TSTME9k7wblUxtcgSt7t76sGrRLoJiTGiA1KwxGG9Jbn0QvXndcE44+VXobWthMXwRv5w5oLi/WI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206377; c=relaxed/simple;
	bh=SMyzm76tiQ8BqmDZG2FEYdDn7KBVTDOQfJrw/HuX1NI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eaopz0ZvuYu08iwHSPXfkTEYOYZeNFpW+2bQzYzVKyyAWBeKg1ySO0lh3OW2JsG6rZ19dNgw/etJ7TA5n5hyLjNkZKhisEwWEEe3qSjZitn8Vu+HYAkda3QaMCuEHE9Bxw72VqVRHZ8mUs+P4c4p2o6myC2d+SooCVOLd28aay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tW98UyB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CA4C4CEE7;
	Thu, 18 Sep 2025 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758206376;
	bh=SMyzm76tiQ8BqmDZG2FEYdDn7KBVTDOQfJrw/HuX1NI=;
	h=Date:From:To:Cc:Subject:From;
	b=tW98UyB/0pljmlETazG+X5dcE2QegCu0IQ3rpgTmL4xLoLscadQgo2c2qO80MiNBW
	 pOe4SuhrI0aBdzjZN66HrrysXHiuX3CIKP2CJ+T27xFxGyZAc6+4jCfXV/2TB+gXsX
	 VXs+6MInPYCU42U9uC177cOYWENFl69XMVPF5D7b0BJrkiUmv1oKxJRMDoE8j4BG6F
	 ePACVzvH+Yj6wItI2pBlDL7UhxKSbsi9NAVPBX21mHZHD75jkAl4SFBGfiPKxx+bBU
	 ATuQbCYonN4Eg28cXN7h+/EtxgPD1eCOCu3um6vmF2MHD+TzjXPerbc3arjqojEo9T
	 9cAuM7V496jFw==
Date: Thu, 18 Sep 2025 15:39:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marie Zhussupova <marievic@google.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: linux-next: manual merge of the kunit-next tree with the drm-xe tree
Message-ID: <aMwZpOFYiX1YaSB9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2CnQSSac/4IQ7tER"
Content-Disposition: inline


--2CnQSSac/4IQ7tER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  drivers/gpu/drm/xe/tests/xe_pci.c

between commit:

  5bb5258e357eb ("drm/xe/tests: Add pre-GMDID IP descriptors to param gener=
ators")

=66rom the drm-xe tree and commit:

  b9a214b5f6aa5 ("kunit: Pass parameterized test context to generate_params=
()")

=66rom the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/tests/xe_pci.c
index aa29ac759d5db,f707e0a542959..0000000000000
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@@ -251,16 -44,9 +251,16 @@@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe
   *
   * Return: pointer to the next parameter or NULL if no more parameters
   */
- const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
+ const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *=
prev, char *desc)
  {
- 	const void *next =3D pre_gmdid_graphics_ip_gen_params(prev, desc);
++	const void *next =3D pre_gmdid_graphics_ip_gen_params(test, prev, desc);
 +
 +	if (next)
 +		return next;
 +	if (is_insidevar(prev, pre_gmdid_graphics_ips))
 +		prev =3D NULL;
 +
- 	return graphics_ip_gen_params(prev, desc);
+ 	return graphics_ip_gen_params(test, prev, desc);
  }
  EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
 =20
@@@ -275,16 -61,9 +275,16 @@@
   *
   * Return: pointer to the next parameter or NULL if no more parameters
   */
- const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
+ const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *pre=
v, char *desc)
  {
- 	const void *next =3D pre_gmdid_media_ip_gen_params(prev, desc);
++	const void *next =3D pre_gmdid_media_ip_gen_params(test, prev, desc);
 +
 +	if (next)
 +		return next;
 +	if (is_insidevar(prev, pre_gmdid_media_ips))
 +		prev =3D NULL;
 +
- 	return media_ip_gen_params(prev, desc);
+ 	return media_ip_gen_params(test, prev, desc);
  }
  EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 =20

--2CnQSSac/4IQ7tER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMGaMACgkQJNaLcl1U
h9D28Qf/SJFycOMxLn6sb7og4ZvB+yr8E2v7sAnCEEMXRDv1nV3mZjKw3u+V6MCU
qzt/XnfynVxoFnhVASLqZvWtbpimq7cqufT/I6oxwuk27kKr4If54SnNY+mJ/DXq
lEvp4Gmcxc9D1BGMuYyChs5mE0rlfohjNDM85qE7124imhwx9Tbs7lHeFCrlOj45
VUAp6HgvvYyAPF5wAXJ3TPf7kZT8fIPsMGGfvzD9Gie4ksjxCp4QP9khDgsqD23o
tE7jVKwRfs00oy6U0Z/uX62xe13yV6tkRLu4sM6EcK3QaKPLNLzF+2uFNXeVv+9P
rpTJzOyMMvPS+AA+nQhJY4V0XWmeUw==
=+x7X
-----END PGP SIGNATURE-----

--2CnQSSac/4IQ7tER--

