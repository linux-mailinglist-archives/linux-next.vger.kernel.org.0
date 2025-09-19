Return-Path: <linux-next+bounces-8388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6311B89892
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 14:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A19FC1C81477
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFCB1C84CB;
	Fri, 19 Sep 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9FoSdEL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9619DF4F;
	Fri, 19 Sep 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286157; cv=none; b=rjhdSIa1pv51GhH+kXtbjWsioluElEHinCcR0XBLb07BbhD7ftoYm85IGjPrMWqGMFwi7/jrSFqEXDUb+s7gzLAlsJ2Hsn0kvqU4x2R0fd1UZEvZJ4JUN+Z7EV1T7evNXPSeEexRtpwcf0KCDtL83CID1sO6Ja7K1OhH69G8KyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286157; c=relaxed/simple;
	bh=Wcw8Bb2b3IjL/UXk7OwnQYyJjak98CCq8c9JgNaQWQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVsiLW8bAR6ctwSWDjI4OghlxN8u/CDhp1VK2r3AJYFTYB6m2l0dM1k80aggHb23p0ST7PFTMKKhaqt38ioo/XHCDXgJOzcjZtpti95FUpLE6lJdgb/FvjeA8ERcc2sTupvq1RkRoABTQv0sevjFWCMLiYaPp4ctL/edeQZy/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9FoSdEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA4AC4CEF0;
	Fri, 19 Sep 2025 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758286156;
	bh=Wcw8Bb2b3IjL/UXk7OwnQYyJjak98CCq8c9JgNaQWQs=;
	h=Date:From:To:Cc:Subject:From;
	b=p9FoSdEL858OQfD2jmlJLzgqg8//7frsjpR/+deN3sCZBH5JuU7mQhSss10KN+1qJ
	 6aDx7GZY+WvH8rfkuX/hjpAWHcFXDyqdNmvry9qzF10cN9AaHELp/R24ps+zDZnMIB
	 Q3aT9cH9PeXUsvtfvmdGWAo4VCO8d2zSZojvIt76vFhnWq3L/SVdStwUxyB1F/ls7R
	 hlfL/JBnAgzL12sjqxaFzsO6R7Sc9N6w2vW6uYf5ih5XNT5BtmcPGB+8roL8Cgc1K2
	 j7vbNZmY2K1uDkVCJA3+Z+maV7KVKFqib26eU4MIJum1zUJ53f2oVzFL3XB8Irp4vN
	 E4knqz2okszRA==
Date: Fri, 19 Sep 2025 13:49:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aM1RSLYqXYokkdh-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8DxXwZX3I24XrWE"
Content-Disposition: inline


--w8DxXwZX3I24XrWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  26caeae9fb482 ("drm/xe/guc: Set RCS/CCS yield policy")

=66rom the drm-fixes tree and commit:

  88434448438e4 ("drm/xe/guc: Set RCS/CCS yield policy")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_guc_submit.c
index e377ba3a39b3a,53024eb5670b7..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c

--w8DxXwZX3I24XrWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNUUcACgkQJNaLcl1U
h9BM2Qf/U7YnuJhXQhR2sDmePIszXt2KXkYvR7GoAjglwqb900EqC69yd5p0Odt6
aTNYg/ii/akcvz73WbeVCSgQuoHgYrO2mCrk7cSifcRoh3e7MHEiOMq3Y/yKOt5O
jqGVhuddYxNEA0hKg+CHLz1xPWx3ofkTL2PNxZjJHfQg3eIdsnhxFg8qyiZ7YSrN
uvldaYCv9MhEN1Au6I/CCCYONQkTwEEtj+/IOfy1js4nG2RL0RKT6lYLtddJefhn
OS6ttgt82joRi/36sRo2eB+EUVpW+AZEjsLJtQGFtCvODucZdKXMhr/URrXREcKl
dnkotfeE2IiUJXY7V/Ogt0ci5PFaQA==
=O46n
-----END PGP SIGNATURE-----

--w8DxXwZX3I24XrWE--

