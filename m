Return-Path: <linux-next+bounces-6544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395DAABF24
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 11:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 746317A93CF
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D7A26C3AA;
	Tue,  6 May 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i45QV/yi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2DE265623;
	Tue,  6 May 2025 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523240; cv=none; b=FLi5Ey57hQCtJ4xs7QV+N1xg1INjwKYUFODOQ2ptdMIcSfkkhHUXxXrbDvlCCnoaI3Cp7DbzN5VKAXsrM/g3ye87NZKv5EZ1aQsRdYpoaPLC8wwgHUgFJTm/e42IAIqJGLup6C6x3yogG1ViObnHqTwS35ie+/Y7cPVXHhl1//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523240; c=relaxed/simple;
	bh=NvFgrquRYf9s0Cg4/Qd6LIPKf+wlzazck8hWYqBR6Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g+1FgvJwpt4A7sC5IFXLX5zQzaL/AMa5dOthp8TAdou7oXXvylHKGTOd+9MAlWTu4zoWu1pzJNJq6TO3bvshHopvngarE5Ab1OyrI1mka/jKLRcwGrRf8eNLQtv5/qGCzCyvibJDYzj3LgxsSSpSWKDzWTD41u/tVqkzz6EtBHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i45QV/yi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746523235;
	bh=DDOfsMTVyYafVx2LO40AWLweTQwcUUQYwjA7zBjksPM=;
	h=Date:From:To:Cc:Subject:From;
	b=i45QV/yidhW2Q1aK81ee5+Ls8GAYnU3Qas1uM15RqTb3w3gH3EAuzOxefYnvrQls+
	 TP9Vr7H2uVCxkiWfvmw+I163SipVYV+tg0xMU9IJJhJH4e9FZEkz8hObRdA44zJj1S
	 rgfBPKjNqX1Zl/5wUFrqxb7xjGWSeM5qu9kEOgCvdAoiFLllza+J71u1DiJntaFpc4
	 7boKEjsHn/dfmPFlQ5xXrpfbnxWSsE+JQo3Oicr+Et50S2SmCfAlUvenzaTFl92422
	 Z0TDMEbtZrsG3w0gn7IdMcfwluBmU0eFhgxkA29hXjyS6GJNI0lUJi+8tFaDIazxsP
	 1xteZ8i+Wr2wQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsCYG0Rzvz4wcy;
	Tue,  6 May 2025 19:20:33 +1000 (AEST)
Date: Tue, 6 May 2025 19:20:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the renesas tree
Message-ID: <20250506192033.77338015@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FwH1kEGMyerPvK=d2UH75p2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FwH1kEGMyerPvK=d2UH75p2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the renesas tree, today's linux-next build (arm64 defconfig)
produced these warnings:

arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_=
bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
  also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:463=
.9-478.3
arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_=
bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
  also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:463=
.9-478.3
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg=
): Failed prerequisite 'spi_bus_bridge'

Introduced by commit

  c29748ccad88 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/FwH1kEGMyerPvK=d2UH75p2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZ1GEACgkQAVBC80lX
0Gy3Kwf9H0fQbh9ILRF2X9p8aEg5VYTWVRWy0yK6Y1bSnmnAVCgfdDu3FjrTJGZ0
Hv41ZTDYlpOZuP92WQb4mhb+lRCl3RK4gi+f5sh1yXyut+NYDCWfeLiHzX3x5Lnp
zq9sygammpyyTF6beyXXeTGldaDVJOS71HTy5w54BJEK1vgi183a9vkzcxSUDlsw
bv0EB7cz+BPBBtnV8lhv2R/zhAAu5iuIdyAq7wKYHrZrhTwAKMpT+HrhlX/QTY6e
zPrWgQl8xVAgwkDPs70i1beJyVDu4xcnN6pOhShrvqAwKE7fX2XsWEFRMC9vq2xt
M5cOBQLRWJkvyEeX0CKTMB2iP2h21A==
=Xi2m
-----END PGP SIGNATURE-----

--Sig_/FwH1kEGMyerPvK=d2UH75p2--

