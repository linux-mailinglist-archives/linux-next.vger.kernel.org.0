Return-Path: <linux-next+bounces-8542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD61BB475F
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013903B0B69
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3C3246760;
	Thu,  2 Oct 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWQJDLbm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD32417FB;
	Thu,  2 Oct 2025 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421684; cv=none; b=RGap31DKpdHyW2dSbVmxVKNjINzrqWRXqatrIITmGc6bhSUIWBI+yCyG8QoGU4dHtJXiy8ugCCR+IyfUs80Sct4tYSAqpIQ+rSbmqRPYerGv+M1G0PLDRAfF10pbXDJIHGyOL+jG4xpO/FJsfdtsSbPaNqaC3pwmkPslb0pyZvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421684; c=relaxed/simple;
	bh=qYK9tIlRdM4ftIEjUodiuu8y/vbcNvvDnzhbabm8v1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTMYF40CKwnkm6oz21qQfHIv/lbiDY3ULkw8BdqNw3XJqezclmttzpTvIynSurUmT6iftjcmSkxMbG+15iofLLswPOr62FlNpajY13cZOIozySf/Ws7zRCZ+8DTrS745iiSbYc3iMLwPvscPq2ZfOyNi/lJ+w0UrupomOvkFGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWQJDLbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9BDC4CEF4;
	Thu,  2 Oct 2025 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759421683;
	bh=qYK9tIlRdM4ftIEjUodiuu8y/vbcNvvDnzhbabm8v1g=;
	h=Date:From:To:Cc:Subject:From;
	b=cWQJDLbmavDJre+NaTqCVXEEGNCSXibM+xor439mhET4AOjy+T/NQ2KDaXYQduA2I
	 HdQ2JHcrIB4eSs/lIybbB9SpCi1K0hSqZpVSnGXvNqGJvMi4UE7Oh0JJQoEcSzzwks
	 TROi5H3ONpNWvhMlWasZJoZpWmc/KjuhcK+vlg+H+Q2SLbeJwYIzmR/KqTX4GALMWf
	 w59JToZWk1ktKWoS6rs6ceIrKn6kewMIQ69WJ3J9ck1ZZSfPuPfIHku2H/LM+owz88
	 ONeKjQcvoeEpbYBJik0xdeXBRkF3UhG/a1shBtrDClYVCs1aazphAQiFZzhn3cnDTK
	 jZ9W7iehAzG2w==
Date: Thu, 2 Oct 2025 17:14:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei Liu <wei.liu@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with the fbdev tree
Message-ID: <aN6k79cY8mKSrKQq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6Tp12HfwbG15J4B"
Content-Disposition: inline


--u6Tp12HfwbG15J4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  drivers/video/fbdev/Kconfig

between commit:

  9e84636785c5e ("fbdev: hyperv_fb: Deprecate this in favor of Hyper-V DRM =
driver")

=66rom the fbdev tree and commit:

  94b04355e6397 ("Drivers: hv: Add CONFIG_HYPERV_VMBUS option")

=66rom the hyperv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/video/fbdev/Kconfig
index a7500251f41ac,72c63eaeb983a..0000000000000
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@@ -1771,8 -1773,8 +1771,8 @@@ config FB_BROADSHEE
  	  a bridge adapter.
 =20
  config FB_HYPERV
 -	tristate "Microsoft Hyper-V Synthetic Video support"
 +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
- 	depends on FB && HYPERV
+ 	depends on FB && HYPERV_VMBUS
  	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
  	select FB_IOMEM_HELPERS_DEFERRED
  	help

--u6Tp12HfwbG15J4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjepO4ACgkQJNaLcl1U
h9BWfgf9Fty7eVKVXKZ1RqiQ8VJ0WUrkya43vIdWQBEsSc7hF8R7NckWhvfYTNoA
C94+/5tcRzQd4lGKMgiHlpYUa86GUdYeb1qjqIhRDB5EoCowjaUWMlU31bVSmrFG
0gbEBvHUZpfRI2blKVQbnP4q7+11NZqu6/xIsnyuR3d7ngob5Sgn+VvZfJaqz22e
M/E5kGT+A+UXHljESSUvXG2OTPOT4t40a6On0E0HvTF1J+wtB31Mo43EqzCk82mb
zgfsvO6IGF0VfINsyvvhUEIzKBnz4Mc5e5R/kbE4UhSVeWY5VNfe5UOCYGvUH8v0
aw8DsFcYUq7AneVKO411ANsWKqZZgA==
=e1xn
-----END PGP SIGNATURE-----

--u6Tp12HfwbG15J4B--

