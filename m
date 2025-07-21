Return-Path: <linux-next+bounces-7671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF794B0CCF4
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 23:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E0683BEBD9
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 21:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE060242D60;
	Mon, 21 Jul 2025 21:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KgV2Mm6j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE8242D78;
	Mon, 21 Jul 2025 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753134854; cv=none; b=fUG+OIKuh1y23hvYGaVqwED5+wPWWx5yp4VMWKaM5dOs1CwG31X2rgjqqjyucyuBvxxyTjwBhcuCNcv7Kb+kazwzLLF5R8YCT0I7kD+XDoi44ZFwZIz8V+W0SYJUM0QIpFcqhorMaJSbh7dgoqW8LgrCiqLNPYK6kWAp2rjbFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753134854; c=relaxed/simple;
	bh=KaNWaYpQW5xYRIKlhLMsCldLDfMRaMl9olKzBFH8Wk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P7RGccTroaudrtBfT+Zo12SH9HgIsrrE6NdvHD+QOwUDHvmc/qHQ/XNJHHGBSvg81IutP3kVcFh/+JLBPRCoKzpsCQQk8Q0KkDtP6jg7l3/dq7Fjh5OIVHfahzOsSeykU/CeRXVilJcH7UQnkvw0W3kIhKhhoXzSxJPrzNVeA8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KgV2Mm6j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753134694;
	bh=xRkLrxj9CAis4SaRdIqakBC0UlEsrUwuIMAurv93rvs=;
	h=Date:From:To:Cc:Subject:From;
	b=KgV2Mm6jedF//kEdyP7AT7ZwstBYwGZuiTkIwzAEx12wqFGm72Fbg5WkrRedEpRys
	 jBU+m3jU7HEyS4lHMMMatUS9OJDz7grWPvFf2b5BVd+k97xoMXb4AW6Mt0bD9bQpz0
	 9hutctAQe3st0nQVuXxG7D7harmpp6fAPo84WRrAgQDAsNmvq8ww8eCZc5/cmYQs4g
	 qtu3ltvhM7BHxSavqi1dPht5PrEtz4yZEokPvvwHBWeXywLigmdO1+Rll1eGgi/HBs
	 /nyQILwVOe51zHymn013+DFp/JyVjHOIz16cLNNVOHu74MuLl4tqmRTXORYOU9brIn
	 9FueHAwfVt28g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmDck3G8mz4x5K;
	Tue, 22 Jul 2025 07:51:34 +1000 (AEST)
Date: Tue, 22 Jul 2025 07:54:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clk-imx tree
Message-ID: <20250722075409.5b012ddf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lv01vNGXb5/5jZvWXJK=w.G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Lv01vNGXb5/5jZvWXJK=w.G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b2be1327a6ed ("clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_d=
ev_data")

This is commit

  aacc875a448d ("clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_d=
ev_data")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Lv01vNGXb5/5jZvWXJK=w.G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+twEACgkQAVBC80lX
0GzWpwf/dydAmhdn1D/bKQS7tRElObmGyS2IWyAELDzliUSibyZuhJFtDALLYvOY
p8j9mZsvkUKPLdUvzaklfZb2ZYGI0X4M6rPNh7YZOYvfSUxrIB0oSwr1KLihB67K
J5X02aujRbQVas4k/MQvI4md/efNX2QP+XO2ZubNQVPXeUeEY3bBRoZ5LUwZSfsd
P4zKzlnJQ+XYJfayV0q6ms1CHIfOA0zQG+oyg9uuJTb38A8UfRjAqJ3eBixsMn5D
0M38jBZL9hgClNn0uVozr3iekVT/9bmdkjqJM/DL6B/VYQQ72emP/YxTCq/A4cna
hSUMMkEedyHHgpdw8Kww9RJWGz+fJw==
=X9bb
-----END PGP SIGNATURE-----

--Sig_/Lv01vNGXb5/5jZvWXJK=w.G--

