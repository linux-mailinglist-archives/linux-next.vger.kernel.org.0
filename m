Return-Path: <linux-next+bounces-7699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE8B0E75D
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1934854792F
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 23:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A3228A40D;
	Tue, 22 Jul 2025 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QYnS1p8l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA038FA6;
	Tue, 22 Jul 2025 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753228447; cv=none; b=hE0jEbMz5BVifRPrweZckGAWIE7N4ODzWLYsVBunQSG2f28vYxlqVCFGjZn2H4m6xLSqRLzWLG4BhZyGtsCWxLSfvZ0H6KCnHFEyFBLbu2rt/PiJk2HFLpepfIfkU8ROl/aaO0TzOMvaPYmTfcF3C3/5zEqkhFkS7nxPWlFV18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753228447; c=relaxed/simple;
	bh=MSZXW0HsqSxUACW1p4X0ck3Hx4UXvzouhiopTB8YwKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NyLJspMNaVkJzwCYNVpd+WsR2bgaejiXZwnGYyvnIjPFu4e8LqiwOlTmMzXnwjisZhflCfgi6zsMZVL9ljUIv3EnasCSBV/XZwdRjQvFZzJfk8+D+VsUwn2CgbJsCEvQgCHVtUDtAWjsG/+dUC1HJP7rNyrWn/RoYJDYi+VfG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QYnS1p8l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753228279;
	bh=Kf8pNViSHD5rkHGaX8+81GayKFAihbKTrbLTqW/u/TA=;
	h=Date:From:To:Cc:Subject:From;
	b=QYnS1p8lQqeDmJXl85V0K2aLjMYi9wxkzNbXTBU9ZuoSWKkEco1NuH3v89SM2U0sk
	 tVFhAzc/sZd6WIxrAF34R0KupgFS6JEFS66CHyLv2xsmuF73U7pFGuH14+YfLALZ+g
	 zCSt0QUgBYL3u/XU6dqnmH9oY2UnbY3r6tBgi3Aaaday1beNNyMYT70EcmF/61lVmo
	 VRp/LYwHnoEs+ntcHnW004U8UCd16mV4W6mNeGkK4i6gXTvqykpE/rBVMCoPNvxS/n
	 NU89wPK7tKXXTmg2n62MIZu4kI1VIJEjatE8ueISwFRrSUQuak8MXNvWJDqbaJHdXs
	 RdRAMGgSkIhLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmvDR0kN3z4wbY;
	Wed, 23 Jul 2025 09:51:18 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:54:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rockchip tree
Message-ID: <20250723095401.05a9633f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qdBrnNZEmUs5nT5iOP0BaPq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  60d89a256079 ("arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R=
5S")

This is commit

  912b1f2a796e ("arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R=
5S")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAJJkACgkQAVBC80lX
0Gz/WQf/fuMNFoXZkH3OJ/qd4uB8G1fWwIEpn329uCNZxlCSy9xv3FCDQDFph8jo
g8JkFhYWSzyW/1V6yWu1028b2IfwqUAE29Q4COT7CPuJ1MVkAsOP5arTquwZ+D6K
FcB5wc8lCR0bx2uUS6mFGDP2fzb4IFdeEwSBScnDYqscXux3G42TRoWSA4G1R0CG
2kZOwA6gFllQ9dDMwL46KBIYE1U8uVkdzA+rT3wZTeikmRyC0IYtHaM5I3D2QnFf
hqs1S+tnegZsa6KJOAOfDfByUZB7aU0SpFq8KkOndDXbfYAukTJEc2/RuJUsxpfn
26xxBwuLGCNXl+jrj1LKBy9zn4nVpg==
=+BVV
-----END PGP SIGNATURE-----

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq--

