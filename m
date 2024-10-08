Return-Path: <linux-next+bounces-4152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0CD99583C
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 22:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E5A1C213E7
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 20:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40891DF99B;
	Tue,  8 Oct 2024 20:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H/7Rb7GO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D272905;
	Tue,  8 Oct 2024 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418548; cv=none; b=tIFKrN2yRUC34tWK/NypggGUKeTDExJ6nk1d64CwRNbhFoGCnuyK7TZQS1EzBL5fK4ch2r0GyMifVLBiETutoXDuAWjBMphkhjzhdG9yIwNhM0k+cvLg7tdLZaCdiAYx7mPKBAmGdeW0xHhz72CE6pzWfzyxa6v0TD2SSlwuZs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418548; c=relaxed/simple;
	bh=n2FBiFxmYSaN3U3i8P5zvn41rNXwwG1yy49owTMKNu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p2CJYcCe+LGsyvxeY+Zo9m6rUcNLgkXdkFVzPzrHnwjx3+xZp4JPFcQbKu1nfL1IbSjZQF0khZjSECN53qXYf1/BAB3aWfu88sZ3Q5Wd50enFy4EIZemcrfjNtvjmD2lVC9ryRyzqnkfL4mbaxVd4g7dMQ30lHnKG8mt65ja2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H/7Rb7GO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728418544;
	bh=YsvkAocHjBpsnJ3/Y80ZYcmUzu3NBL669eqeSD4DIqM=;
	h=Date:From:To:Cc:Subject:From;
	b=H/7Rb7GOXxAvVVcRS6zKw7CgkzJggEjXXyvvow3VsffcSusyH4xKSGiWrJ5cPETI0
	 dxAot5JASofbiyCJNEUUWEEhuilmLimV5k3NO1J/hZ5AeKcZFVKLGGcasESCqjAkpq
	 IlG/EH9XqIghxwv2ohuHDPfJT5Jq6sWLWvVB/ZopxP8Gk14ZifZTv88JCfPEaXNecM
	 2LnRjKcBdTXRbZx0Oz9v5tFFosF9yMjhvop3T6DHsxu2e5vROgY0HSe0T4RXfYxUpi
	 8hRNTuqJYNXRHWh+Saqkavp0e3Kwnd0gQ+2gK0KUxcI6eQMc7JV1TjV12oPoQOg1ab
	 NbS9LbMHmCgsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNS273rDZz4wc1;
	Wed,  9 Oct 2024 07:15:43 +1100 (AEDT)
Date: Wed, 9 Oct 2024 07:15:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, Daolong Zhu
 <jg_daolongzhu@mediatek.corp-partner.google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mediatek tree
Message-ID: <20241009071543.5230cf79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DYzTh.EFi+lZ2+DK_NFAGfh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DYzTh.EFi+lZ2+DK_NFAGfh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  65b99309a9c1 ("arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-dela=
y-ns")
  025869564bf8 ("arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-del=
ay-ns")
  3d3bc7cb46e8 ("arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-de=
lay-ns")
  5bbddfd0470f ("arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-de=
lay-ns")
(The above also has an empty Reviewed-by tag)
  ca80f75083f6 ("arm64: dts: mt8183: set DMIC one-wire mode on Damu")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/DYzTh.EFi+lZ2+DK_NFAGfh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcFku8ACgkQAVBC80lX
0GyPXwf/YOaodA/VD1cUSr8xB4Qg5ybeE/oKl5XWdWxwRQFZ+rcbETUr4KS4FgNe
mLL4nYQvLeq8eYIpZ1xuqoBShtIkMdp9TJO93cKuEPFOrCPCJfxetlPZF64F+FmP
DebhJWn3Nzonr0BG5S3NcyEDdX8ZJ6R/HhaZ9FGiWNHQoa374QDJcuRNV8PyJbpc
BlwbWAx0gWEkuCzd5tY6JQXEGKCS/pytsEETltAbZrniY1o2/Kf8XgDro28n7lvO
6dGiFAS5pMT9SPezyidhSjvmQD3L1djigZa62Yvjz0vBjw+VqTwY0koiqqYE3QZD
XfS7+zSdd0lwVaZvtEjJU7EKSN0LYQ==
=Y1hk
-----END PGP SIGNATURE-----

--Sig_/DYzTh.EFi+lZ2+DK_NFAGfh--

