Return-Path: <linux-next+bounces-2860-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2892B07C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16AA1C20F02
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EF42067;
	Tue,  9 Jul 2024 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RJzYl8gj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C53C2F;
	Tue,  9 Jul 2024 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507585; cv=none; b=TfhO6bOWE07xirYyfWdZBxWE1mEFlD6WMuW9HiU9MOKZX9yhyvB4bsIJGubIomLQXa+18/oDxqGDXDk7MUwUECcYO3Wh90ajnuA7q/7Ay/LXaNhFkF2+lfbuCNCBmydWuuq1CJ3sQfHFbAKiedFuF6mWTwzMQH7poQMHxUu4low=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507585; c=relaxed/simple;
	bh=hwjZesNqxA8vpT3kojRgi/0QSxP7W7RTHcx70wlPskc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GgppnnVhujp44+Aqk/ux6oDFvN59iDf1GgVpK30dyPHIZGNJyywsZBgqO9/Kui0qvM0LSOjzza57RPkByyOrB+EMZzMLPVEdzIH6lZVNaoEWsRmvsulsDoc6rv+RWbYd2rhKs57yOw6n+1tRVJ3VPlFxKlOe8VwLRL6PDFk7uII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RJzYl8gj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720507580;
	bh=3hworMVjR6f0tB1jDTxSaIfUrTmFX6wFgyQD4fLD+To=;
	h=Date:From:To:Cc:Subject:From;
	b=RJzYl8gj6921zQzWywYcpZHhTo/GiOvqtnvpQUgK7LtyVMk2ximzKXL1s4H/rGu4m
	 XaG7QQglHGPcfU7usDjNwDECbnVTDYSe7RqEktmeLgb6RhGMgMXYD57ewYnwDDqLkf
	 TmIpvhDT+PLXMHC1YLDJigqVTffNnVnuHfKteCAf7monO2talGOxOi2JQ7pBdsAU+q
	 Xlu94f0aLZsc0Uj4qXFj0gxRNzPwp72/c6154PXcs4h/7B/lm8k8hb4Y4UuxuTTyjl
	 0Rif2QrkPB88jOhflZglTov/4U4okPzJgNuhBu6EhA5dCk8inKNWoNtIzDikZj9kdF
	 Y1ZGZOxwL3Naw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJBNC470Pz4w2M;
	Tue,  9 Jul 2024 16:46:19 +1000 (AEST)
Date: Tue, 9 Jul 2024 16:46:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul@pwsan.com>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the devicetree tree
Message-ID: <20240709164618.69cfcfad@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2DRl4Cklscdcw/Xkyc9LcFw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2DRl4Cklscdcw/Xkyc9LcFw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc and risc-v trees as
different commits (but the same patches):

  0620bce64afa ("dt-bindings: riscv: cpus: add ref to interrupt-controller")
  877097a2fab0 ("dt-bindings: interrupt-controller: convert marvell,mpic bi=
nding to YAML")
  c7ce06684bf5 ("dt-bindings: interrupt-controller: riscv,cpu-intc: convert=
 to dtschema")

--=20
Cheers,
Stephen Rothwell

--Sig_/2DRl4Cklscdcw/Xkyc9LcFw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM3LoACgkQAVBC80lX
0GwKNwf8C0TTNGeCtICkaEL7I5AWdR7ssQTG9fP8m1pLeOiumk0wskNlJW/ROFzb
/SiWmmkLWyyibTgIhWBnSFm8LXb4HeudQ+aWUiLOxF3kqDnTs+TQudNDX7u26lQ5
kIeya6dht59jXAzYaHhaNALEB96sAQ3E4/nsLGwJOBMBst3bEi9WdSZ69KdopdlH
QpZ0ZK1PCUiWzhHoBaL+uZE2qFAQjZ1HPz8T1S228U62aOJyKJkwU96BWQ7ydUnx
zpo94wBP4KcvSFPs7Eq6KwbqCXtjveCn4r2eHP4PCxWHTULhINgYsSwXDYDiT2HS
y9KXROo0MWiicnBgSUhicPzjNyWUaw==
=0ofK
-----END PGP SIGNATURE-----

--Sig_/2DRl4Cklscdcw/Xkyc9LcFw--

