Return-Path: <linux-next+bounces-8303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC1B5837D
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 19:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97F521AA03EA
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 17:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC12E1745;
	Mon, 15 Sep 2025 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/gtIuKE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4692C0323;
	Mon, 15 Sep 2025 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956898; cv=none; b=Kjq0Q9GcNgArxuqqAORcSPpx9Zh52t18xg6NWHn2s372P0iaPgeMQAJCCdoO3EuMPR8LRble5U6YWBlll/q34mFZBz857+ij85IeMkteOd3fgB6A34fdeVvL6HFVDAh/Eeu1GYnvyuXOkGKCl6uyNyyc4izwzCvUmrsctVZYVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956898; c=relaxed/simple;
	bh=OqqT4okXFmBULfhECZUIPVXBSE5Upo1Q+LGtZwyNmCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGMQOSbFXbfFBlH7dBVaiTD/orqh2JNDkkm0ltl9QdhriuaIql85/HBtCMdHMU6lFHDJ9M31d/iLmrRc1u+JAmT9zSykS8WT136YyLyx5/E69Xm6TkQxGwagyEWYXaI7DV5wCBRV8kUDYQjQephj4M7/TQvxbWMgcJjUwG57GgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/gtIuKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F1BC4CEF1;
	Mon, 15 Sep 2025 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956897;
	bh=OqqT4okXFmBULfhECZUIPVXBSE5Upo1Q+LGtZwyNmCU=;
	h=Date:From:To:Cc:Subject:From;
	b=j/gtIuKELjFUPN5FK/7zPMsUGaTIiExeYWNKYJJJrzo7MbmNLUXsi0ed9pfQTTaWG
	 wfU4Xvuu03AY376SPNFtnrisDJCJ/IqiC8FR/AUf29mX5dvrrxIwXuGVBWD7KDcmxi
	 o+KijjxJRHKbhx52si1cGhEZh1kTthghS3JELohtwpqdhWrtMvaNAxtEfEZDQMImKb
	 JHp3tJU+QTaA29gn8AjQRQiBw6M39RImlOVEs52jbeaNsPiuEKuSoswEUGaXmcv286
	 Kq7QXas0G4+cbOCVh0e22qjk3nk/z/D+LY6vMEYXFvTATCMFBmKy8xilEBH7zjvDg4
	 DoYtE96s70E8g==
Date: Mon, 15 Sep 2025 18:21:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rockchip tree with the arm-soc tree
Message-ID: <aMhLHaSlc0O59qRi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3l0LF7sbDuTv96lr"
Content-Disposition: inline


--3l0LF7sbDuTv96lr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rockchip tree got a conflict in:

  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts

between commit:

  090be83a07923 ("Merge branch 'soc/dt' into for-next")

=66rom the arm-soc tree and commit:

  3f20580e1daba ("Merge branch 'v6.18-armsoc/dts64' into for-next")

=66rom the rockchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index c1763835f53d4,e907e279bc98a..0000000000000
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts

--3l0LF7sbDuTv96lr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjISxwACgkQJNaLcl1U
h9C+wgf/Q4wCtfiH2PY+fkT/AAUcZVozNSvC7uTimpw5YX8fsIvyVGV1pWCqpLTQ
qcgOn6dLITDfE1XdRXWZ9RgH/pT/iVwZS6ml0oJaRYSeAQjDWkD3riKrIhOgBXF2
UkvN4IYCJMlh/c12ZsSean2pLl7NEoVKvhZniLDmsaEKas06aSgjB1VNufok+qFI
HfwyBhilQTL4ZOjnC/djRe5f8lEP2/ungUqeQPFt5F6KnAM+B9o7QhW0sH3OOhhs
zwwMRdkdDtLpUhV/hPWbWK/WgrwT6AXjRp+waZMuRf0Zwd9siMylDCEWwRklY+bQ
ZyY59wxkxzPCJ0Tm9xfemVHICMzjVQ==
=BSC+
-----END PGP SIGNATURE-----

--3l0LF7sbDuTv96lr--

