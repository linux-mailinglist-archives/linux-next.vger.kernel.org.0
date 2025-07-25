Return-Path: <linux-next+bounces-7713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC7B115E1
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 03:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F8E4AA26F2
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 01:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C3C16CD33;
	Fri, 25 Jul 2025 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qxfEcgXs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ABC10FD;
	Fri, 25 Jul 2025 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753407028; cv=none; b=E8g4SeWzX84dGAAOglHtVtooQsIsKwtd/oJRAVb+HjdjYJk7g4r2JgbS3AXo9amVSiXhiZ2EjKgx+4dLD4XekjYTFwfEvm0otjWlhLn09Sn2BIktC/shEA+kXr69mtvObh9hZe3GLcJ8QTvJUYN1+n2tcLw28G2s+mP9MD+mEP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753407028; c=relaxed/simple;
	bh=ItkY9ybegCcHiV8VYY4hljlyO1DEZCGpCMa5S6cktfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nnjc4VLskAOrsMWjB1+e1wLhYew9AWWYKo9KdPq/6TIUkW/9QUWknEbLW9rkVqpBRlyNUxYG/v0ySZfvWgYJq8aMR3k/Oz0llrFMUzX57u7IIF7LUdD96PeuPgqy7LSNiO6PtXEDo/u7znXCZGJtJCOUuE2RGOqT1tnVpazerPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qxfEcgXs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753406844;
	bh=ojy7Z+lLR7hRwVZk2Cp+j+5hEpXq9Z226hOQ2PKKQnI=;
	h=Date:From:To:Cc:Subject:From;
	b=qxfEcgXsdFsBF0v7jGYim8I4EA0sNe/0Covn16ifBQ44k8y5KW0wHdSSrP1TXhAq7
	 mCATG/wQQWX30KfHKo/ZjVCOLX+noVrfpAlZB91XCEx8CqaaJL0SdJPf4wqYFg53hG
	 tKev5U0HRu23MfK8cMswYuP7Tl91WOU5VRxokWSycU0xABO23SvUHk2mKSwzQcBMp5
	 RoEev8xlvn8Qc3qVRKRnT8MWu8cZ6rovjNxrgEcAZRBiqoQ70WIGqSKUm3Xg1mg7zn
	 y7dSISl8XSupWHjRNC75gdftg6qy9fI3P67Gk+qp35xA/kun+QtAnbD+bpckYCzatm
	 ohL8yxw9aKzCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp9GL2CXlz4x11;
	Fri, 25 Jul 2025 11:27:22 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:30:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Sasha Finkelstein
 <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the arm-soc tree
Message-ID: <20250725113020.231954a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PPCg68xsEkplZTfNiQDEJpY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PPCg68xsEkplZTfNiQDEJpY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  MAINTAINERS

between commit:

  f8c667edaf80 ("dt-bindings: gpu: Add Apple SoC GPU")

from the arm-soc tree and commit:

  0f0a7bd04e7e ("dt-bindings: gpio: Add Apple Mac SMC GPIO block")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index ca33ecd9b449,0f84051ef044..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2331,7 -2332,7 +2332,8 @@@ F:	Documentation/devicetree/bindings/ar
  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+ F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 +F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouc=
h.yaml
  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

--Sig_/PPCg68xsEkplZTfNiQDEJpY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC3iwACgkQAVBC80lX
0Gyvdgf+IN5a6/6DPly7cbfpvieMMJOVMQZm3b3EEQDTS+HrXJElsRVzJdLpeHet
l+ehTgzmbsylb7NeyD4VgWYYlvccRy9rtRfIV5s77CacR23FP12mZSm1qlwO6H0w
VCIxD0SWK8yYoWFnfHYgxpcNmNO5iZagiwwbERYSDAKbY/+Z8arE/FPT892d3VPo
cqtXQvxKahvJmPPwEdyGrMy68XzBqhvRCdmVD9pyFKa7EPJBnmmzxUcGlLiO1vJt
tr+HxvzhlHtGXqREzgH96UCfw7sGAU+40HVo9QP1iQoyZZI6yZAxrjojlS538sjD
YGkrC1+olDSPVXF5MBLTim6aP9RKjg==
=IOB1
-----END PGP SIGNATURE-----

--Sig_/PPCg68xsEkplZTfNiQDEJpY--

