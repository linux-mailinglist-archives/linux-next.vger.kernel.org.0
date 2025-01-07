Return-Path: <linux-next+bounces-5072-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD241A03605
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 04:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA0123A521C
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 03:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7321818BBA8;
	Tue,  7 Jan 2025 03:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L/UZSexL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E121DDC39;
	Tue,  7 Jan 2025 03:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736221402; cv=none; b=brO0Yr8ZDshSFYdc76wHN2aGfvCtkVNGgSIjklEZbrr9U31bgb4866rrQP45Ng3zVQhQ/UITkjdEGWyeswBetfp+iiNjAY8s4G9mxPeCSx9wGBGpxykfyqis34yeLrLiveDMKIarnRDXsxmqIucAohXjHEyiH8kaYHCUbtMUu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736221402; c=relaxed/simple;
	bh=eUM1vh8+pR5/LSEI6GQ5mmBEBryvUEBcQjrBxBQRSgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ajsOfuncprzPek+NveGwL92NzRyFeRfHeEjM7yzUz4uyWYx+qG0N3BZ4/2Scx7ROdOs153/fq111ZDfCK944HpYn+kDzBSmOV33VHNUucCYOyc34BBh+scH0Yxs88DmO/qcoVRTOplagBbQdc8sxZZLzq1DEHQBPhJEHUobtSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L/UZSexL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736221387;
	bh=/eUl/z0mcAX33dGzlb82bnCYXgKWcWM4yt7V7pz5Agg=;
	h=Date:From:To:Cc:Subject:From;
	b=L/UZSexLZrO8a7NxyXzXm0qs/tU7Bar6RJcY1rUq5vG8wM8mCrF6k5isK/FdeGiON
	 bjKsGNz3PcYPaqb3yJh6gd4fhriOFXQjfq4tmeIVk1astfRBh4PPxS8REYzrMdxx3A
	 3w4vNf86cjyLLtvWvc7bCfq34vTZJr7HJrL25WgSfNI27udaSOIU30Jx2/GB0VFUtC
	 VYnxH0+pM/NqswKSyiilwgf1fWURyonsCdxEm3w1a8g28ZwbelGQYvww9IxnH/abFL
	 fzJH0+9HIo3aDRNmPqjrSsHoViJV9VX+4oZ5i4goy97skOiZu+EI2yptVNtLIBC8/B
	 tr1LKbejWXp2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRxhq0bmYz4x2J;
	Tue,  7 Jan 2025 14:43:06 +1100 (AEDT)
Date: Tue, 7 Jan 2025 14:43:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring
 <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jingyi Wang
 <quic_jingyw@quicinc.com>, Lijuan Gao <quic_lijuang@quicinc.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: linux-next: manual merge of the char-misc tree with the devicetree
 tree
Message-ID: <20250107144312.0cea97e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WLpwgQLVHD47M9+Ng/38j.J";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WLpwgQLVHD47M9+Ng/38j.J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml

between commit:

  38a498a28112 ("dt-bindings: nvmem: qfprom: Add compatible for QCS615")

from the devicetree tree and commit:

  f22a51b0a7cd ("dt-bindings: nvmem: qfprom: Add compatible for QCS8300")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 38e0d50f0e1c,c03da595804f..000000000000
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@@ -32,7 -34,7 +34,8 @@@ properties
            - qcom,msm8998-qfprom
            - qcom,qcm2290-qfprom
            - qcom,qcs404-qfprom
 +          - qcom,qcs615-qfprom
+           - qcom,qcs8300-qfprom
            - qcom,sc7180-qfprom
            - qcom,sc7280-qfprom
            - qcom,sc8280xp-qfprom

--Sig_/WLpwgQLVHD47M9+Ng/38j.J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8otAACgkQAVBC80lX
0GzdIAf9EeHbVT2NFqIy0iAYU3sQDB+ArNvZDbTupYF17Sj8p760LV+7/2k9NmZg
wh5NxmaYIOFdfhMIhii3ButTtidKvzuAABGR3n/Ee8lbEtx5SF1vTaXWNki9F4aU
RW6Ex00vUiA7g8rhCC4J1vuT/D2+dp3tVelngskQlGdaPYNvt/1I9yxtDNv9dQSx
x1vAAmWecNfc/1baYrTIVp7L7sOcR/KhncspkuD/oXL1QtjPdwuWdfLWIG2x/JYt
peEfTSkJyBqpP1fj1owKUJ2vFVT/k73/J8qMPFX0wuqFsVPBL3PFQIZJK5hOEPR0
u1OM5WQe0XD7uMk60+IjupsOwSs6TA==
=g2un
-----END PGP SIGNATURE-----

--Sig_/WLpwgQLVHD47M9+Ng/38j.J--

