Return-Path: <linux-next+bounces-2688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318091A8AA
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 16:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 346281F25D63
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 14:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461AC195979;
	Thu, 27 Jun 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQLPkGUN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4819596F;
	Thu, 27 Jun 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497287; cv=none; b=Bfhwix90UYDPVJI2d7eIC7fUp1rSZ06T1C+8Dd5If7nY2wkZERlNGjZ9QbT0+Rj1MxZDFN/YEsSo8wdHVeuuE3p3QkD/0LyAg2IQr98nG3N2Eoma2Bf5TT48daQWz9Ly7GbaQhEkCTV4tx/GhKfyMoPwsVq4NdP33f0WbJuXCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497287; c=relaxed/simple;
	bh=N0W3hRUzxbqfkr4dwC0kAKVwhPqc6ag9oKxw5cTJOLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9cyEgt2WW2zEb0aeS9eht+srD661Cqw7RlaSf45OXL6KAktwJ+EH8RnnEhHCUjXujfRRvR/vTD046QLZ16akpTX6ThB77nayLq5jc8MN6oj9Gd5eVKXNKE+PEBezffCAldWVy8fjogg5ejUUO4KJcK1iAAWoD6VD7YDzbawI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQLPkGUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC8DC32786;
	Thu, 27 Jun 2024 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719497287;
	bh=N0W3hRUzxbqfkr4dwC0kAKVwhPqc6ag9oKxw5cTJOLo=;
	h=Date:From:To:Cc:Subject:From;
	b=aQLPkGUNj3UFmQW8bxLmpaSM6UzN1neF/F0nVrTqp1voNMkgkEMvo91zGks15ggSj
	 mhhJnlJNpLNmNJfwGU3rhLcZiFU+Sq08TJaye3Ci7kr2mfRgEbbTIohqIeCxWtmTvA
	 IDwtAOKUqncfJHBvmFQTVt+O0IHBSmXPxQ2K+93wWa7mwamnoFzyWjzv3pQa3x5S2L
	 pa0QtwMMAqVAmkRaACOHpny42GYAcSn3fx5Iu88OsdKqacf+zs7yeR0/XJ77LpEtI5
	 0RizdwP1eNd0nOAn8GTIz0CkpVeAJTWBn/OWOvGxssCtjiBwbZKIesty7KsWgCk1zt
	 h6e/kK/DctPZQ==
Date: Thu, 27 Jun 2024 15:08:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <Zn1yQ-UFBgBO6aSB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dn7yy8pjyha1XKaJ"
Content-Disposition: inline


--dn7yy8pjyha1XKaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

/tmp/next/build/fs/namei.c: In function 'may_create_in_sticky':
/tmp/next/build/fs/namei.c:1248:13: error: unused variable 'ret' [-Werror=unused-variable]
 1248 |         int ret;
      |             ^~~
cc1: all warnings being treated as errors

Caused by commit

  509e4c1542f400 ("fs: reflow may_create_in_sticky()")

I have used the tree from 202406026 instead.

--dn7yy8pjyha1XKaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9ckIACgkQJNaLcl1U
h9BAaAf7BNr7RN1n8X/czxrDBrK1KlCS5C2Xc9rFw6SXKXUbjwW4mfJs3MB0mAC+
kjPABSuPy4eHGjV1n+VkrC8nPtUsETt1nRYU9INF6qdFTXo/2Hy1qCaxo+Ss4pKk
ymYQGNNmb61RC3RfVuq5PAhlwRWBubMyNAynVMomE0Bx+AlSof4JlyNrZ94fZtat
3U6oT1qzfW58ciiZobKJhpSw3eA6SzFUg1z7RhGRMcMzwr4MYXW7FpbE5ZocezH3
LDm45njYQTKmibLhCNAcJAZxorXVuvvOC0yCgeaAKNcVHTsjuxjw220XzmP3gOJi
Thxkx1Ucot//BEXXZdCURM6MWz/FEw==
=pU2S
-----END PGP SIGNATURE-----

--dn7yy8pjyha1XKaJ--

