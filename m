Return-Path: <linux-next+bounces-8469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A5B99911
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 13:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5EE2A3351
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 11:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E462E6100;
	Wed, 24 Sep 2025 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw451M62"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E922541B;
	Wed, 24 Sep 2025 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758713053; cv=none; b=kNlk7to7gwMz5FeYKNOeXkwYimV6H8blHcCGWp9TI+4LJc4eyZvOvud7Vb2XpEXBFOQGD7HJmdoTQnJ94s+gfJG1UKH+9utv4uXerUcSujNvKfWL9RER2NUo6Ke2dZtJ5KvP9iq/BZyK+LiFM1x6C0sIevB5YJUWo96ACXSWlw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758713053; c=relaxed/simple;
	bh=l60f/RSTs+a+EhA0GxHhEjYraeSuVIk+FgKQ8Yud31E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSYtWKRXmIlzTOqet18ECydc9qKHiqlZ5Vo8qBv+GFzFQVTY+zLcxWL6JxBVeRoDff18Et2vfpSRfYqBBIaIfPN+HsOAmuB7SsINX+sOgNukogXoG9xrDBHDlKCZHz3dD93eygVfT4lVZn+7yaM7DIrDBypl7hPWveTxGePPeLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw451M62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34365C4CEE7;
	Wed, 24 Sep 2025 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758713052;
	bh=l60f/RSTs+a+EhA0GxHhEjYraeSuVIk+FgKQ8Yud31E=;
	h=Date:From:To:Cc:Subject:From;
	b=aw451M62zUz5uFAP2OeKJCYKWEpB1Ofo636npyROCuXiY44Yceh/+bLA1p1N6uE28
	 1Xgfoq1tK4csqrMEhmIBSuUMiBZJCklwJrzialVIeo7pdjHe3qSlmkP6sJKrltckBt
	 yg03m3U+mfg3f4Rhg9boiqtKe3YpiiTzaI/K1eFJ3MxgMXsNJPxnxjFCg1pqjtFA2f
	 NdtMKdBnzwQNjtdLLDwh1D5cE2x9dMDbc+IPL660Y/sY9ZvVmNF6u7vZjPfUHi0EP6
	 +mw5n8wDsDKhz+9Tm9BbL+6dZsZzT458XYwxSZTk0ykfMvJyENgyz6guh0GhGOLM8V
	 vDldMAsR/o0bg==
Date: Wed, 24 Sep 2025 13:24:06 +0200
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Chen Yufeng <chenyufeng@iie.ac.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <aNPU1h6hQ7DAC2KO@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PowpCBnIW/R5W19f"
Content-Disposition: inline


--PowpCBnIW/R5W19f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/can/spi/hi311x.c

between commit:

  6b69680847219 ("can: hi311x: fix null pointer dereference when resuming f=
rom sleep before interface was enabled")

=66rom the net tree and commit:

  27ce71e1ce818 ("net: WQ_PERCPU added to alloc_workqueue users")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/net/can/spi/hi311x.c
index 963ea8510dd9b,96f23311b4ee3..0000000000000
--- a/drivers/net/can/spi/hi311x.c
+++ b/drivers/net/can/spi/hi311x.c

--PowpCBnIW/R5W19f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjT1NEACgkQJNaLcl1U
h9BteAf+IEeLcd9W8mlFBByfFO28DbxJRcAUE+pjdH4KCXxdRh6qeGClHlaiVKhK
XmdrQy6IJ3oPS629u20ZwTC9adMvJ1SzPCNL++XlEW05tVLafBcb3/yrNYsoVgJD
51mHHfE1ZFX9greDPHw53k5qc9gThzbCnuvofJPME8/0sfZX97D4F4Fb+vsmTZEE
I3rUVhY4Z+9IhK5quhuxecuTNaFY4j4JmWZhKJew7e9oHepi2x/TvmGlJ/QzkMb2
dwT/31ZHMlGrBB7nUpaNqdMQrYDydk6aLqLL1jPQRWRqSr/iwy+pckl5u6gZT7m8
6qZByfHm6cG7V6DDD1RPLGrNtFkZxA==
=UKIT
-----END PGP SIGNATURE-----

--PowpCBnIW/R5W19f--

