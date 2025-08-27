Return-Path: <linux-next+bounces-8109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A3B37767
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 03:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0642A86C4
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 01:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B8F18C011;
	Wed, 27 Aug 2025 01:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jro9YX6s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC5030CD95;
	Wed, 27 Aug 2025 01:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259336; cv=none; b=bMAn084TDSSulqdXLnypOIzmTTuAy//E2YP7KX2uKS+Dd0FEIMMV5JRqqd592W2cHIXBjAanIaxP2TupXWI4sye0EjTh7hpYrNXVZSoUGbBYdSVd49nV+WyaP37V5jVowJFlV1Y+gGC3pqSevFbE0JQlJwwTdum8wrQWbhl2v/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259336; c=relaxed/simple;
	bh=qnlKKaamUeoRoz2OJgjJs5utkiKXfgmyhDoMoZ2YugY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rWol4zXgCcpAmDSbu/u/DmKO75xi9WJdlY42S+GUTEbmFGlMWz1ys4l/n2a3nBHXpeeVofGVYof/E/pXHvPucBbNT1eufQxqAoe1Dl04biv+4x7EVcPz7Yd4Emq4Ml5ip+t1YEPkyUX0un18a8P36bmxyCOSzSA981C1mglfhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Jro9YX6s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756259322;
	bh=61fL/d39tArqt/pcNRPKv8V7lTpgbfr0rRa2oFylJaI=;
	h=Date:From:To:Cc:Subject:From;
	b=Jro9YX6sXR402bt4RY63F76Ybsj4lcaH3KlRRl6ejHPC6c3hlBV0ZaG1XsnCZ9PUP
	 khAS1VPaXihDSxf1V3nkkJIuDEheyH3QPzFEM+qMDKFOUe1IFwZZC1sh+5kabS4tTh
	 O7eVD5qnR+Cog+n9SAoW1Wxzaa5d9nukW9upY5U8yYX6kXHpy1RS6mqbz8Zihacmi8
	 AcC9wB8X44AojTJgKYtT4z1vuqwODXv9wIoR6/47WFBnewt4ym2WmBa9FPEY1AwoAq
	 dC56sauZmoDfGS33SalnkUkMbXeR08yamV9WMIEip/PMFoEnowWQiW26ngAIEI0hTg
	 lxymYA6T9d9Rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cBS9k0VVjz4wfs;
	Wed, 27 Aug 2025 11:48:42 +1000 (AEST)
Date: Wed, 27 Aug 2025 11:48:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nick Li <nick.li@foursemi.com>
Subject: linux-next: manual merge of the devicetree tree with the sound-asoc
 tree
Message-ID: <20250827114841.6df8a5f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iCUj11r7wOksOO6i7EM/8f/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iCUj11r7wOksOO6i7EM/8f/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  243167e96939 ("dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semico=
nductor Co.,Ltd")

from the sound-asoc tree and commit:

  77a03a290243 ("dt-bindings: vendor-prefixes: Add undocumented vendor pref=
ixes")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 58f3b07f4254,0f5273123650..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -556,8 -568,8 +572,10 @@@ patternProperties
      description: FocalTech Systems Co.,Ltd
    "^forlinx,.*":
      description: Baoding Forlinx Embedded Technology Co., Ltd.
 +  "^foursemi,.*":
 +    description: Shanghai FourSemi Semiconductor Co.,Ltd.
+   "^foxlink,.*":
+     description: Foxlink Group
    "^freebox,.*":
      description: Freebox SAS
    "^freecom,.*":

--Sig_/iCUj11r7wOksOO6i7EM/8f/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiuY/kACgkQAVBC80lX
0GwiRQf4i2zCY81xyswPmM55gliUYrEHwyEAqQHlrIgyqcBgH2Qm5cJ6QD72Jg3X
qZ0Es4oHqgCA6DlQxZeJDLLXmdJqATmR6gxT+vhYMSG8yletJd7JUE1Li9P5zVBL
DiA8Aj+YASxjQNqJhVAZ9fVcFWuTQB7JvgepD8EDUc/Zj3f+7HnB2xM5OuAVTvl/
c3WdKA1muN0wa825S/8i+QiFacP9VNNFNIn1nAP5hPZwKrBltO++NJXD/DL/MF+A
MTG4pn0gZ2s+XIpJ++slmUZo4xvJUxZmZVpClDhS9IMvwDr64U1Z2yA5bUV5MzeK
R/1iV67IrgXwmPWFXSS3ybS+kXQC
=1xpm
-----END PGP SIGNATURE-----

--Sig_/iCUj11r7wOksOO6i7EM/8f/--

