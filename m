Return-Path: <linux-next+bounces-4380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F89ABC0B
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 05:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800351C223BF
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 03:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D843F9C5;
	Wed, 23 Oct 2024 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g2F1/KSG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98C4436E;
	Wed, 23 Oct 2024 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653340; cv=none; b=vCdnPkco9CudOxOeSoEVqQFpbFcbbt1qnWQW2w6g3bp20lfhhMdRJiQNRou9yvjw7aWjgCNG73nNyyZezfsUKtqIeqTFFWvpqaIylXF82RodEVHFrtbul4Ra5/jYE425ngNFAN67Pc9iAaSeKt2w3sayAe+9gZaV9+I1OAoEoLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653340; c=relaxed/simple;
	bh=ManXIesgcg7VNNie4F2zlDGn2YFmnjfBHG85LlY6q7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=caWrF0cwxyObG238o1l96grQ9J/SzEjcGKJIjytJG6E5gT1d8zImWrVVPCc+ayeAlRBySumi+db+jRbyYCiGwmEipSQSDjYyd79QRJGaDM2YJsMbN8Vqihaf9bKA8lPf2TISoXfW6u7Nv7S71T5urLop7NvutRQvB8+fIfyw87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g2F1/KSG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729653334;
	bh=6EwBVo1Z2m9jhXIgkOmDXXRlqeaMYTyU8qsCeYsrew0=;
	h=Date:From:To:Cc:Subject:From;
	b=g2F1/KSGdVwzLvG0WdKdSFtI8Kp40gVhWxIoWRATASVXEzxP2hfasokoRz+kXnY4N
	 ylz+1DgAVnzIasCrczkenqEgF86hwIEPtQsUJ47txToblvKwnKqnQjG6MS01yvO0yr
	 keln4t83NQmOeEy2tgb48/IRyHwidfBmJdP+42MK630q3fKO+o2sRi5lz7i54YqxZ8
	 9Q31tcD4yvwqrY8qaelioV5JdCvIZ2MLXL9br7v4uQGpS0O+7KEmhtd3g3G3S+bXNE
	 9cjZlSAujiwqTzTarLrA0WX5Jy9YEkJVlf5/fz2oQEpE9nXLXwZ+DaDTtxMQ7URTPn
	 QdgS8kMN8odug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYDh55j3rz4w2M;
	Wed, 23 Oct 2024 14:15:33 +1100 (AEDT)
Date: Wed, 23 Oct 2024 14:15:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Subject: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <20241023141534.380b0585@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Li+HcsR_3JsvV24F_M2Ms5w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Li+HcsR_3JsvV24F_M2Ms5w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

between commit:

  16fde3e07677 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix X1E80100=
 resets entries")

from the phy tree and commit:

  26fb23ce35e2 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the=
 X1E80100 QMP PCIe PHY Gen4 x8")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.=
yaml
index 380a9222a51d,680ec3113c2b..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@@ -169,9 -172,8 +170,10 @@@ allOf
                - qcom,sc8280xp-qmp-gen3x1-pcie-phy
                - qcom,sc8280xp-qmp-gen3x2-pcie-phy
                - qcom,sc8280xp-qmp-gen3x4-pcie-phy
 +              - qcom,x1e80100-qmp-gen3x2-pcie-phy
 +              - qcom,x1e80100-qmp-gen4x2-pcie-phy
                - qcom,x1e80100-qmp-gen4x4-pcie-phy
+               - qcom,x1e80100-qmp-gen4x8-pcie-phy
      then:
        properties:
          clocks:
@@@ -201,7 -203,7 +203,8 @@@
                - qcom,sm8550-qmp-gen4x2-pcie-phy
                - qcom,sm8650-qmp-gen4x2-pcie-phy
                - qcom,x1e80100-qmp-gen4x2-pcie-phy
 +              - qcom,x1e80100-qmp-gen4x4-pcie-phy
+               - qcom,x1e80100-qmp-gen4x8-pcie-phy
      then:
        properties:
          resets:

--Sig_/Li+HcsR_3JsvV24F_M2Ms5w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYalYACgkQAVBC80lX
0GxdOAf+Ip+UglD0j7vks+BNZXZ5qG4F6lGpcwd0UYZ8mBZ3R0jWY4G9Gy/4Opuu
gJ250UW0J9NhZ0/ELCmJFdoV+zlEnX6xA3IlXhXwv08w6IHMD5AzbpTFnMa1kXoF
crzz+P4oJ71TVnzVjL3CwiQh36vn5GiO9Zsdfj0p5XCbNJeWs32rA2Wd4k4VjNAN
+tE63voRMKU7SAUZ5pFfshr4i5EUKBBmh38KUN3wUERPPAPI4t9eOIVTdinnJH6W
P5x7/0fouQzd/V/sRTLjstA4BQ/WqIIwxJ4h06R4G01mEiTZA16q5xDy2Wg1xLg+
KOhh8JyVxi/YNrBXRX/nQ2pswfbOiw==
=1m2W
-----END PGP SIGNATURE-----

--Sig_/Li+HcsR_3JsvV24F_M2Ms5w--

