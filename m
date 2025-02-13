Return-Path: <linux-next+bounces-5432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A835A33417
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 01:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2DA18828FB
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 00:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902424207A;
	Thu, 13 Feb 2025 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dgVq7TJx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC132F44;
	Thu, 13 Feb 2025 00:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739407129; cv=none; b=bsFIAfyJb2xljAqSZ/fdX1dBVAKifaUEoeMnIMFp8yMpffwLNjHnKkNvhAIznjaVSH4hqAUfOq9SznvcNmGJaf5+a9I8+rE2yGKn+5Y8qqSIPCQnzkKvh7I59dMOwjbagEiwJOsZtLZwvUwLm0PETMGpO06gyXsY+acnY+Eim+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739407129; c=relaxed/simple;
	bh=BF2ag0n8Z6wUuroRbdudWtCgtKiV8imyFanvUspHyLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oZP0fRaMMJ6wp+PQWEaEiTsauerwFESWCVM1zsLeApjSF9S5DwCi0B9ZcZ1IHdeyLxQ5T8Bmp/tmOs9XItW3vm+yjmensCNvli9V70tmZJoHdmfnGN1j+mBeYAaPzib4mcoWej9jgtoQcWql09yV+yNgupxd9Kj9f3rCH+nbKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dgVq7TJx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739407123;
	bh=IPzcCW/wkX/SsTcdmBGtL1c+s6DP4mP3oycSgC4PCRU=;
	h=Date:From:To:Cc:Subject:From;
	b=dgVq7TJx23Kr2OSBLtVq3jmgNEpfvmzrfZ2ck7wa31q/FTARq9VU+knQlMDesFoIZ
	 TFug3+le9aPwgqmbyt/ewH1y/m2GaZ37VrNR65DlFim/RumChKd0xuD7svzPU7mV7e
	 qd2/MywWPQjrLLLy9jhPehY/4KH6UhxGJkETuY0rUGntAAdnv1qTWbjrCb+J8Luj2B
	 mUlrQdx8I1YujYwH40yjaFLpDh0vTlj7Z9QhkzgASbe/u8b5KdbdOwLa4HXr2MpwHG
	 oKUry1eTmM4dNyNuECohfjkAYDDUdoLOEf/lvCU03uKmcaIXC0R51uX4qOLO0vlwFe
	 ZvHCT+MIt0BHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ytbry3nZWz4wgp;
	Thu, 13 Feb 2025 11:38:42 +1100 (AEDT)
Date: Thu, 13 Feb 2025 11:38:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250213113841.7645b74c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nu0_pdHUy5xh14kssKSMdWk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nu0_pdHUy5xh14kssKSMdWk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

scripts/Makefile.build:41: drivers/gpu/drm/i2c/Makefile: No such file or di=
rectory
make[7]: *** No rule to make target 'drivers/gpu/drm/i2c/Makefile'.  Stop.

Presuably caused by commit

  325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")

I have used the drm-misc tree from next-20250212 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nu0_pdHUy5xh14kssKSMdWk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetPxEACgkQAVBC80lX
0GybTwf/fZgvgmlIcAQoYIEcQr55HAwS5Q9gZHTxh/Hu6nQSfTROQVeGMD6eqPfU
XYzSwuJZ2RUSVQUVlqWw6760iwne6oZeE6W+WIV/4rdqS1x7v0ieTRjEMJeNve5c
QK2EdHjN71kostGOC628P2X8Xcr/zeQ8YxWT53CSXbNcUm7Ijo1jDa8Ta2E5X+Jk
nFzatQdslal3Nx7Uz9C7BTXdm8HWCBAB4yrvANqd8EBLXdsJ6Dp2PQg4Eaw/WcXJ
SieDLmi+BZhA9vvXBdyq9pxIkTMCOmKgCvn/19jXxwOGzgoRvlWCJgts7XIwy1o4
0i1JOR/BCbRyTxlhI71tBTSDVEh1Og==
=3Iek
-----END PGP SIGNATURE-----

--Sig_/nu0_pdHUy5xh14kssKSMdWk--

