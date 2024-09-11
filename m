Return-Path: <linux-next+bounces-3740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37D974972
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610722886EE
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 05:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0843A12E7F;
	Wed, 11 Sep 2024 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zpr0stnZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4493558BC;
	Wed, 11 Sep 2024 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031287; cv=none; b=iCqPl+Mc3K8VacjakB/ilNsen8wGIxKEzix3M9vA53pHydSEm7c3uFKEVyPND5f+3HTypGx7Lp2MV8v7iGAA2RcLscZJA/IY68jkL1qRAO4QH3k+eOJLYE5l6Y4t3etQ5hIC9gSWcwZROa4mVtbcxuv2FHxCRYO5x3zpGG8WSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031287; c=relaxed/simple;
	bh=BhEAb4jE1c2scU4OAhq+h+cFzaXCua2QqJ+pvGXIbiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kVmrtLE9U716AUAc/XgmrNxq5mUekczkgUMTPvzCULUziqJ8j+n3RbrHNb6BbAKTjo0OiwowgH/bgAjkgkcKsLX+twAraZKjheeqBk+KoixSyE4UzeELwqVpPtqdRaLrpeZo8wCQIju6bAKc/Y27c26dsV9fUNuG4GlhU8Yd/nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zpr0stnZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726031283;
	bh=8rcLscc9tA0eZ27BxfL8t3y0wTGjCEqPB+hy345rlCU=;
	h=Date:From:To:Cc:Subject:From;
	b=Zpr0stnZB+7n57NJ9aSVXWUqX8xWonYmr6I3qECkgkHdx8kpzRybwOVoMHd9xihFp
	 fUa4Z8LJwrS//vJ3Ojy1TOHc2iR4oF4dTIT+JvVmXfPniD+Lf7ApFGY/k7h+bzF/3L
	 tGMbiITNHyrSE6U026gFXC7ALDSyXCB5Bmb4m+Ti6Kh1/7JiKApzDQNufGx61cYYKz
	 3G+GKQfaFvT2eDNCG7dT8JIvnkaKTMyMGUwPzQtrCr9bUTQ6zj55pEPQ/6XtAnDB1x
	 iIHOGh1FjT8O7u9SaEcT3vMBZELkNL/NBaDbQbZWP0H+XOP4/BScuC2yu/N1TiXg4m
	 7RPZ8jRKRCQUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3T9G5gHJz4x2d;
	Wed, 11 Sep 2024 15:08:02 +1000 (AEST)
Date: Wed, 11 Sep 2024 15:08:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Simon Horman <horms@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the input tree
Message-ID: <20240911150802.378ccf42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sEIYNsLSchh/AnKsmKO2eoh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sEIYNsLSchh/AnKsmKO2eoh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/power/wakeup-source.txt

between commit:

  45d6486d2a5a ("dt-bindings: input: touchscreen: convert ads7846.txt to ya=
ml")

from the input tree and commit:

  bb763d7890f6 ("dt-bindings: wakeup-source: update reference to m8921-keyp=
ad.yaml")

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

diff --cc Documentation/devicetree/bindings/power/wakeup-source.txt
index 9a4f8310eb67,128b55be67b7..000000000000
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@@ -25,8 -25,8 +25,8 @@@ List of legacy properties and respectiv
  2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
  3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-ke=
ypad.txt
  				Documentation/devicetree/bindings/mfd/tc3589x.txt
 -				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
 +				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
- 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8=
xxx-keypad.txt
+ 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8=
921-keypad.yaml
  5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung,=
s3c6410-keypad.yaml
  6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidia,=
tegra20-kbc.txt
 =20

--Sig_/sEIYNsLSchh/AnKsmKO2eoh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhJbIACgkQAVBC80lX
0Gz5SQf/Q006kSX82caFGUpU5GTJ4nSHuaF/0OI+9BjaQn/7bPnsYOBiVeA7xxwJ
AdMGPA0mdK7F3MMy3om+9Ym76PW18i3uaccayp92/it2m5MLa5EHV366sXkEWQiH
XjglAoU0jfe7M/gR86izziSdXiH/3DPI/dia/Lcsdc7dcFTdriip/EmFWVG3Bq28
FO4Z4f4iXx+cR3uUfKCHYbvpNQ/bh8n4X6uiBPuShBYj8bpVjQFNmPtURxg2Fd/v
P4ugZLMk4ioHTmIwXzvk97Ugat9hTSd93saypY698M8C71rwEsoe097uicnc1JEj
12F0ZAkLuYXGZwzkZ6SupFX1zdPABg==
=GH5j
-----END PGP SIGNATURE-----

--Sig_/sEIYNsLSchh/AnKsmKO2eoh--

