Return-Path: <linux-next+bounces-9066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C88C672C1
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 04:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6716A34DF0E
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 03:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEC125B31B;
	Tue, 18 Nov 2025 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F4I4OqjV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA769749C;
	Tue, 18 Nov 2025 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763437130; cv=none; b=AkJUaPui4j9L8WIU0hi83s2/neLV0x5z5ROBiTiLu0SgiddEOWTNFGWzFzPWZbSwaisxYkZQxYZIbnkKHyjOZBtl94P6oAKISvhFUmEO/IrSilfiQOb1XCX1oU/Dkc9riakNzuJqGVg91ADc8XLbwLhO8hhys5zXMPvq7Vnad1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763437130; c=relaxed/simple;
	bh=ZCtUVt7HWOQNhd+lcaiayspuLPXlHlUUkSGAiOIn2Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oIacvz4H6asyoOTMJT9SUZ8Y+sOjTwO6LhtvYm+ZgdyfpIEElvGTRhaKET45Iv70ZPaqKRnuMybeeI6AZaur17DgejtbcKjb53Hn5/f5xuFxwPea479/VddiqaDdfYKl555k74hrSfDrUWv5cTHXSbmNuStcXccgsb9eY67P4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F4I4OqjV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763437124;
	bh=12oQ75dWmggy+AhLFXmRu5heD1Zv9ofDm/1ggenZfEU=;
	h=Date:From:To:Cc:Subject:From;
	b=F4I4OqjVD4ogqjSgm4NI9/tEThPOFoQ0hZd5qWnrmvwY2TCMb3BjsfhFwsDo1c7mK
	 4vXVo8pXw/d9NV3q9nBsFcm/706xEOeB5uFV5L+bStO00F27QF2TeEDZgcdg/uMjJq
	 kvDHC8g80nss5znvy9pxi4qgKl24Of+A7ujYuaLO6m3pOsmkPyJrJM5KriTOuQqZCV
	 8rxK8FagmFRtsw3/cQJB/rcpYqfLDEiEnhrrFg8r/mbOWYL0NNTrFazw8uVotsEQxH
	 O/3FEXn4ESwyefiI6WHUNn1BfhYr3eXeTTDKg8Olpu5jg+sViPLMkrew3lmMC1TLOH
	 us9bptPLgDW6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d9VhN4YkCz4wBG;
	Tue, 18 Nov 2025 14:38:44 +1100 (AEDT)
Date: Tue, 18 Nov 2025 14:38:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20251118143843.0046d6dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yoMIH+ep=BuZdRSp4bEtRrO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yoMIH+ep=BuZdRSp4bEtRrO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (arm64
defconfig) produced these warnings:

scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7986a-bananap=
i-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-bananapi-bpi-r=
3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi-r3-sd.dtb=
o mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-cn15.dtbo m=
t7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-emmc.dtbo =
mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dtbo mt8395-=
radxa-nio-12l-8-hd-panel.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am62x-phyboa=
rd-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-electra-gpi=
o-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyboard-elect=
ra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.dtbo k3-am=
6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtbo k3-am6xx=
-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j721e-evm-g=
esi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo

Exposed by commit

  d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a base .dtb")

--=20
Cheers,
Stephen Rothwell

--Sig_/yoMIH+ep=BuZdRSp4bEtRrO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkb6kMACgkQAVBC80lX
0Gywawf+NMkaziQVh52pGiy6B68CvLdGhdpkq1sAFuJFjgC9zz+YT+xHX00NQTMd
6hZ7FxREAjP6VX00Jb90V7rLcMqO6y6SZNhS6mhYfVmpIw7uAfSK3fVSpk0zIAbp
XwS+bOWAXdcg0NZlsjnFVuJMSQtelAYqmOqGHR5NFyiKnsHhM0p1+4/UdirEe3ME
dgQdMivcMharv1m/jk5arW43iFiNjEOyu87YywMJXtN/uTnIyLImSbgvwbs8z8GK
QQqule7+N5CL8TRTaTEJL9fEGM22AmdnUCuGrGoB4UKaeeSo/kwx8GT5sjW+bhJw
8GwP0Z/B/Jj2YjlU1nu72xxRG3QMYQ==
=0nAq
-----END PGP SIGNATURE-----

--Sig_/yoMIH+ep=BuZdRSp4bEtRrO--

