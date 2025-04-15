Return-Path: <linux-next+bounces-6245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0DA893F4
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 08:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 243A2178D20
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 06:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1821990B7;
	Tue, 15 Apr 2025 06:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JA0xqlSD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35DC43146;
	Tue, 15 Apr 2025 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698636; cv=none; b=Gz8VDw4cpTI+hq0d7FixyuG9pihd3y4qaiPoMcpelBPB1h2zqSG2vdU7Y7U6QgR/RnSy+evxXlFQiiH4V3FW4JvwF6GeXjJa+4Njxe3F+DVeXpZFO40nxwRRP8xILpwqtGgD3PjSgxhOwom0ctA4HeBDAWcBARmjW+7No8axZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698636; c=relaxed/simple;
	bh=3BcBpbU52NP44OabVVxGsBGaorecBMMhtISxrLe1kzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kbMhCj4ErBXaS5VszRy32Z9XM0E/v1gNQn1s/Kh4XFyvV0rvJlTpcV8Kg38yxmgFpmJ32n7Qg2tYNf8DaSViHqVskWjboS1FwMpjKgEvJE0OUlYBDnHFh+V8m7D4AhYms12pIAFBY7revX+IxrODcczSK0cJ7yO7hvZSxYx7n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JA0xqlSD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744698630;
	bh=LloOc28DKM3ntCG/+mzTEMz6FJJgHOQPbng/AEZj4WE=;
	h=Date:From:To:Cc:Subject:From;
	b=JA0xqlSDnzUxBgir6xP/pm0zVbAPi9+oaYzRTT3hSdwSAcGTwMLWTlJKDEAkjjaxi
	 6mzhhSXgbS/uyMLKtAR4GaNQAeR6unZPfZ/zKTijdAk9HUtYUWhIZlE9oL9azFTH7r
	 01R0nDgHFO3LEAbV7UeLLA14nMA6bCOSiLESloxAjPlgcH4R2vQurx0tMCg4majFPr
	 8YLPGjfBXcCOJ++EFY0JZYCMEVJauD4WujkD5kk/WXM+QzcHHKmdAT96VFv+LPVQ0N
	 2K4m3ruDICJe1Wtcc0j+gExRpihxp1g665UjrIdFUAelXJuKWpmw0P9HqF99xMp28g
	 vCVo9diNV3igA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcDmk0X45z4xN0;
	Tue, 15 Apr 2025 16:30:30 +1000 (AEST)
Date: Tue, 15 Apr 2025 16:30:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mediatek tree
Message-ID: <20250415163029.4714116b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7=087METaHSg0rz9upp.geF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7=087METaHSg0rz9upp.geF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mediatek tree, today's linux-next build (arm64
defconfig) failed like this:

arch/arm64/boot/dts/mediatek/mt8188.dtsi:465.15-468.4: ERROR (phandle_refer=
ences): /sound: Reference to non-existent node or label "accdet"

  also defined at arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:106=
3.8-1094.3
ERROR: Input tree has errors, aborting (use -f to force output)

Caused by commit

  691712b065d3 ("arm64: dts: mediatek: mt8390-genio-common: Add jack detect=
ion with accdet")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7=087METaHSg0rz9upp.geF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf9/QUACgkQAVBC80lX
0Gyb6gf/R2IV/+ZF7lHs7AV5TEVCj97Wn4ln74Y7xM58rpfMjAYKp5OlSOV+g+Bl
zsjsTBeOG7V7kpfiWc0Th6nL7izQkiQEC9e6q4f29fQgu+MqAbEUDUzXRnFXAaav
L6Jn88SLcB3s+fgtCY7n6iUxrgdFV4hw0vGOP0bPFrmnZp3+ZKNsPjqCg1I9tAz6
exL8JncBQV8F2lk4aMMZnN/qZGDYsojOHHfPxBXQygjklVBonYGRz4N7qVe/pzFh
wNiMX8WNc/DhjyF0X4EEnTDAOjjoTcAMPSXnT4KOrqOtxMMUhCwioavQFiZ2v1x4
zDYZsS+hhQIZKFubTc7hEqCbQGzxVQ==
=qasp
-----END PGP SIGNATURE-----

--Sig_/7=087METaHSg0rz9upp.geF--

