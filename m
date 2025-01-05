Return-Path: <linux-next+bounces-5021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D858A01BA7
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 20:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 160D83A3153
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 19:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0DB1D47CE;
	Sun,  5 Jan 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WVTBzaaw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28C61CEEBB;
	Sun,  5 Jan 2025 19:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106353; cv=none; b=aCgbMn5D9wVOJNmhDiQT0S/nSYIsjCehfOmXeBOy6U+8yZGabDdHlLLh66IkqszR6oO+4/pG6xnoqy+uXjUC+E22dYVrL3DibZFAT/zQ3iu/TtsbLpTjcnqjuuCUd29XhmzdsxE6f04SJpttkwAD6Tqxnv/0J1ndIl1jwwyzfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106353; c=relaxed/simple;
	bh=oQyLMvCifwZHzkGYPey1wtQRobMUEFMoBUC9vgTi7xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yam5vYZgqJl/CGOJhk22VttN7I2XuXaz2oPxug/rjxejivibRuvpiUfuOFACCBRRqcv0scrt4rq/72wgMOXiR/hmxGoDObeVpnBZE9X6C1hBJRuhqUFIGnGnJ/Ulm1b1rLf1VSBq7KYiyUc+3WcIw/LH9XNDBi2ozBmMESDOQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WVTBzaaw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736106342;
	bh=GppwX+IHXFHaqfPKCpB6LTKVcRzU0AxcU/6ZO0ZH7po=;
	h=Date:From:To:Cc:Subject:From;
	b=WVTBzaaw6hMKAyyG8fuoBOVTh1rnOk/VzFHEuvw/ZvcAwivmvEpnMWBp15BPvTmVA
	 NcUrAnn2hLlQre9/UZIiDzZAS0qA56Wbd8CF50ENzqsyFukbJZ0Hpip8sz4cAQCWZ9
	 Z1cjbNvBI8IxgZ/30FlSsFb2sJrq9fLTMKz1ImMpbMRTsijrcy3HQ1nFwYGyimQZH5
	 YxJAjfEXdXCdMGyqcxbMlXOeoG5rF9uritn8/dsX6gTKf3Hrd6S2oDRIUbWJzm6vGb
	 0RvaN9rlqhu1xGfUfXQaiU6wSedpPIJCvYTEzcCS2N0wy4EIHs8k0aXRGLHKNTSxfx
	 kPaM19n+gVLjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YR78Q1ydcz4wxx;
	Mon,  6 Jan 2025 06:45:42 +1100 (AEDT)
Date: Mon, 6 Jan 2025 06:45:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20250106064548.0a2b62c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pBZTjRjCmMa+xWLIEOhUV7y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pBZTjRjCmMa+xWLIEOhUV7y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3d0d8c8989d3 ("arm64: dts: qcom: qcs8300: Add watchdog node")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/pBZTjRjCmMa+xWLIEOhUV7y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd64WwACgkQAVBC80lX
0GznQQf/SCLJ1r+Ryw8vyob9eDNp82+rL+OXAT9KvmSQ4MqITAsKTbbnZPCRLBlR
IWWoL+dPZDj1hQIwzQ/iGhDvVJKqAn424rR8kBhRn4HIwOgIQi86IdS87oqycnkq
jNEkycQFJjULN6SFfD5GTBTgsEfXL5kdmRQ55sxhBLvQf/imvbzCaJkdEshucOXd
CVOU73DUQt2+SenegvK54QPygdmjh5QBZK5Geje9v6raY5SqYARs6V2xRhhAAYDP
2OG66pyNiz5fu878Ptx7aWs3fJN1K/tuL2gQOM8d1Dy/05vZstf/1H1Vp9zl7pg5
skL2O6h2xPdHESQaw+bpyEyAAHPPhg==
=p0OQ
-----END PGP SIGNATURE-----

--Sig_/pBZTjRjCmMa+xWLIEOhUV7y--

