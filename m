Return-Path: <linux-next+bounces-6627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0BDAB09AE
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 07:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07C11C02EAD
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 05:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DA5267B96;
	Fri,  9 May 2025 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fOQzOkeq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F07267B88;
	Fri,  9 May 2025 05:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768433; cv=none; b=eTDNeYQF5em2UHhM3kOQSf8Swtdo8boYqCyWFydH3qRpB72vtfa0uVCFaDggscOtXYHcEQJS0dTeA6hPVrKLoo0zIHM314WBm5TrmN58Lo3fB0FbGQ1wz1uehxdlPLCJn2v0G8mq4dfig8YeEChRyOEh2p3QaBQOe7TC8Enn8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768433; c=relaxed/simple;
	bh=teGjRKI8HcFvJZorUqrnedmjKly2mKr2X6AGbuiy/dM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pJ32Hy8g5nvOYFPeEBMB0jPBSNFIuMVdK7OZoRhTwKCu2KSI+Rv9MOHsDgXch0SHnVT1nFkZRP21JGkCasfiP5cGxLITpfj5+KiTQRHzkowBIrQhMWq9fsOnC2HTdpLMsNipJr3vlXBBroUpD+z1vl1GBN9EB/Z+IAy2/9T1WhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fOQzOkeq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746768428;
	bh=MWKA45N7edEvMFJbAh/uCEiCGOpyAf4itXOEksYfYZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=fOQzOkeqNvXv9yYOMJkuVopMR49v97QP02oI48f2r8NFn/MFEtXCgDJWz7zFAejT/
	 h050dvNMeypsKsTlisgFrF62Z75OEBLFrLyjD5LBAxfD6mIGd2GUHEU9AU4wz2d5Xj
	 c+Tudv7MaxLxz6zjTbzxJwqKS4e1AC9M2WmD2hXE4ogvYZv5OIyuONID8JQ5QmxG/O
	 p2x5iQhb39ytnQpf6ltVK5bgRS6fjoDX86JCpIhXf8+G8xURSU6HlS/F3lcDuii08O
	 SM9UUacJti3YC94qxt/ygPVliHCmVspa7d2Os8/qjPCc4HGtPxzgvub1SBtvs4YlXA
	 vWX0JD73lnlZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtyDX37sGz4x5k;
	Fri,  9 May 2025 15:27:08 +1000 (AEST)
Date: Fri, 9 May 2025 15:27:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the dt-krzk tree with the devicetree,
 i2c-host trees
Message-ID: <20250509152707.0dca9d80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/./DUAztZq+TtO.0T9jkm4LH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/./DUAztZq+TtO.0T9jkm4LH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dt-krzk tree got a conflict in:

  MAINTAINERS

between commits:

  2b18eda58c86 ("dt-bindings: interrupt-controller: via,vt8500-intc: Conver=
t to YAML")
  785eb0bca34b ("dt-bindings: i2c: i2c-wmt: Convert to YAML")

from the devicetree, i2c-host trees and commit:

  47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in mai=
ntainers entry")

from the dt-krzk tree.

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
index 3097f9470937,dcb10e7175b8..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3443,8 -3427,8 +3443,9 @@@ M:	Alexey Charkov <alchark@gmail.com
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
+ F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc=
.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_/./DUAztZq+TtO.0T9jkm4LH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdkisACgkQAVBC80lX
0Gwovwf9FLigwK7sjcxwUZMaQd8ssCkY9XEce//vnM87R5fiO9eIROIHu2SRlg5c
Bx8lAnlas0lV/gMTJ/yTjqMSMIRKmraziPGti5g5/p4dVK/lzjlM6RAt3FtX6ezp
bS3TvSjHcKUFroIUA48vGTK+imp9nnPrkpMy1dAPeUhNKfr1EoyoccddB6uAZYzs
daIqWm+1OP/4/ObsJztE5oVzWScxAQyY/ujqR/AZ904VlvN8LNTeVFdoo8+mXiv9
H4VzL81djUKc71IdGrPMrgPbaQQhZDDN5uWp4LuveJZekImQ6Ms1CZ3hnbMnHOt1
CQ7klRr87ARNHCUJR52NlNScJmFXVw==
=OSeB
-----END PGP SIGNATURE-----

--Sig_/./DUAztZq+TtO.0T9jkm4LH--

