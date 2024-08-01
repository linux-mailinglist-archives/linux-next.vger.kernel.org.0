Return-Path: <linux-next+bounces-3207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5049454FE
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 01:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC161C210BC
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 23:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC114B976;
	Thu,  1 Aug 2024 23:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l70cKGmr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A41BC40;
	Thu,  1 Aug 2024 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722556106; cv=none; b=ojhYikl0/l8ly3Z+2wxXaybZC376qq5HDwmixPRoG4w/UUjkoEtuo7jALtlLzJgCfY9M3gy5PqorajH54o0gQ3KHwaAcA7MZnEGLk9JRfGnIihl8zcdIMX5XOEXJLPryvK8vCPx8KZqU6abiXHFmQ1N1tGOhJwCZCuGF6n50qA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722556106; c=relaxed/simple;
	bh=j5jqKcRF8t6NjJVRtYDpAFXDs97QL3yn5aiJSpofQXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=grsLFqNMlBdqwHOv8mhurYleP+Ziqou1Cvj/OWHH2WyOWWuHsZwQGx+TXXf0Ddl5Hl1xRdReysg5rOndb9HDuIHhvpFqqnoUu+yuFsuO1e5CkxOjyitcBNWo1Wcp9xRdbe+self3+66leTDizoasnT64hRAmvkeadNepgK/SuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l70cKGmr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722556101;
	bh=LPQ79eAFXlVAdHqPNXR0ZytThlkkbCOC1ku6pSBJc/Y=;
	h=Date:From:To:Cc:Subject:From;
	b=l70cKGmrBIpXikNnJASiVpZ7G2Mq9X3desQjF1lzBsKKcr7uKXq507ul9l1nmQljH
	 HWHlKdUjrkq8EPR0360NAFKUo5H4EXGcjMBFFL8sY+wowihGk9R6mYH2j07enu+sIZ
	 MHyZ28wh+NBb63onwbuhfcnx0tQOoK2LjN2qIQoSfzZqj8E0RZbTYIYIsiGkD96f4a
	 sLMw8OPZYnPXb9x7QEgHlZfq416fkN5zyNX/V/HRa5ZIWrunnq7iVF7u5pPZdZHGhn
	 0O2EkC3+D2DNOgJnjy3P0wk+YpHHje2MNygi2Yvbmw1tfYpPyVdexYSXNmVrTSqY2u
	 mwp9DghgpxAog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZlys01r7z4wc1;
	Fri,  2 Aug 2024 09:48:20 +1000 (AEST)
Date: Fri, 2 Aug 2024 09:48:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Satya Priya Kakitapalli
 <quic_skakitap@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <20240802094820.29059653@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uCj1cmb.S=Ld/l5ysHfm94k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uCj1cmb.S=Ld/l5ysHfm94k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clk/qcom/camcc-sm8150.c: In function 'cam_cc_sm8150_probe':
drivers/clk/qcom/camcc-sm8150.c:2141:36: error: passing argument 1 of 'qcom=
_cc_really_probe' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
 2141 |         ret =3D qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, reg=
map);
      |                                    ^~~~
      |                                    |
      |                                    struct platform_device *
In file included from drivers/clk/qcom/camcc-sm8150.c:21:
drivers/clk/qcom/common.h:72:48: note: expected 'struct device *' but argum=
ent is of type 'struct platform_device *'
   72 | extern int qcom_cc_really_probe(struct device *dev,
      |                                 ~~~~~~~~~~~~~~~^~~
cc1: all warnings being treated as errors

Caused by commit

  ea73b7aceff6 ("clk: qcom: Add camera clock controller driver for SM8150")

I have used the qcom tree from next-20240801 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uCj1cmb.S=Ld/l5ysHfm94k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmasHsQACgkQAVBC80lX
0Gz3VQf8DOy80oYW+eiYoCKumuNLME9aEtpidbflQTu7fcnGNh3GVxZyEAkZoj2T
lfoTGFj3Yfri5cZLsRCA3en/sOxdHwxaKCMfkHI6nJyUXNE4ol6JVu66FdXeeANi
luCAH1xkyqypUFgZdB99CKLMBZ/aqc2/yWrJf+k1Fj3FiJDfxdEDuQROpgXC0XUa
nC3otQjZx7O2Z62c6bC6ydF/kySHdisUlRcWpO2/glm9HTY97XaQQyg+cknD7X2F
Rrp/chPn6pPHtZKM408hE7aqYFQfMvqf5GwgjEN/OSyOmy5cg/X7Rup9jWct0XfS
a1lBG82bNst/InoTaiagXST7N0+nbQ==
=F0WT
-----END PGP SIGNATURE-----

--Sig_/uCj1cmb.S=Ld/l5ysHfm94k--

