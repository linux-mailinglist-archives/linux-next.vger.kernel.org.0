Return-Path: <linux-next+bounces-8412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B7B8FB2A
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730253AC596
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C086F283FE4;
	Mon, 22 Sep 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7h9OUzg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1F277C9A;
	Mon, 22 Sep 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532108; cv=none; b=f9ekTV9yjsy9RNswsKruvjAes0mtNy3ZM5QCBjZOReMaLy4NHGnYW3q1AuumVYIxEMrmJIatydPde7dASpx0n0IYIGclGQm0W+fFOAb4viL8ycEa3APZsUJM0dMfMfAzd21NwxdJuRtdVy2JZ34so2UDv+ASLGhW3MxtFkTSRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532108; c=relaxed/simple;
	bh=VWhkZl142UUqNixw+n+fJJ23fQhG1ZmO9uqRP3QW3qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9ZqJKDfUv1UPlDqNprUxt5yUHak8mWNlhtsIS2XAkSdKUHijWHndWFwfN01cn5P1F1mRrPM5nl69JPWwS3EPDi/QGIsScsL6qvABjaJ0xaRkBg7yahnu5h0Wh2EFZiwYh25mH0PPet/XcIhO3+uFqy2m43MJrACgd9wJOwg6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7h9OUzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5905AC4CEF0;
	Mon, 22 Sep 2025 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758532108;
	bh=VWhkZl142UUqNixw+n+fJJ23fQhG1ZmO9uqRP3QW3qk=;
	h=Date:From:To:Cc:Subject:From;
	b=b7h9OUzgSfMLcCPy7EmPl7FmHP5l/w3vznGRRzuKxnyO5wNh/Hu8X5TgTOD/62kxU
	 o/CiJOmHqmIfj2GCNp5R+W6OCC+NDm/qRV7sHZULDYnvNpkiYhUJef3P6fWzHXh/Tc
	 dVdhf8nTYyBqopKBzNdqZVgKuB2NeAypXsca6vEIVntQk1S8YPpB+3q1hto+vpGBIo
	 bRG9SO+w7nHV7PNylQkslI4+9PCWLorbsfxmfg2rccFQnDyYGh0dRMH22vuWyQB4BV
	 mD7vGBP7phPxblW6qqC0kt1egB/X0zjn4MvZNjk1MUSTfyUKL/0n4inNchLYBmqBJU
	 KxfCVh818fkNw==
Date: Mon, 22 Sep 2025 10:08:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: linux-next: manual merge of the rockchip tree with the arm-soc tree
Message-ID: <aNERgQG1mxMRBRE6@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YwoeRW1tUoxtkvkc"
Content-Disposition: inline


--YwoeRW1tUoxtkvkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rockchip tree got a conflict in:

  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts

between commit:

  07c53a9e97071 ("arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX")

=66rom the arm-soc tree and commit:

  dcc6785caffad ("arm64: dts: rockchip: fix second M.2 slot on ROCK 5T")

=66rom the rockchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index c1763835f53d4,a0c2b575f588f..0000000000000
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts

--YwoeRW1tUoxtkvkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjREgcACgkQJNaLcl1U
h9Axsgf/Y+3olWzqn+0vmwlspUZRswVg7OJZ9EqAWfQU2SjNEJUycR5YV/4TyfQI
woEOVyN4cxyYaV29fHZgCMmdbMo7q7l184xcM1/4LYdKfmvUV2DlIRx+GjYQodZF
1e1rE1pkfyIbQNNJbkuteyUVs8icsmy5JW+zjBNsNjMQAtPRE5dSu7ZgKhLcCcgm
iPcZJHiRne4zFHkvmHfoxXyyQWlFoN2XmVma9VFoFUGUNalG4DroTzwStyEmIH9t
t+V/9t/4VC2CleIP08WpdP3jjQBVAHRVZZfhaYhU+u7yh2LI4xQHlo9k7J5cLJUt
AK+FCWHVfQ9TCtP6vhAfP6jh2Y9OOg==
=xLzk
-----END PGP SIGNATURE-----

--YwoeRW1tUoxtkvkc--

