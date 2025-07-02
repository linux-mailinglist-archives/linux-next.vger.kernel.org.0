Return-Path: <linux-next+bounces-7306-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDDAF0CC8
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 09:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896F17A555B
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 07:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8AB228CA9;
	Wed,  2 Jul 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NW+O2ndk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724241DF977;
	Wed,  2 Jul 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442064; cv=none; b=kFVgChSI2J4whUzzeeW3tTbpyezKJu+VFPF3YQv81zUT/AgBX87RluFdo14fiOAGUlhmZdAZ+ojT0+4tIwpBz4Y2wb1aCfeJx0zwoo1WtDeBLGtqovg8Igo0dCTeOU4skjhMJuDaG6Aqi1O+VL2qv6RNXHRkRePiW/2C7FZH4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442064; c=relaxed/simple;
	bh=Q+tJOgDXSyHv7cn+GwyRvugVT/KDOb3xDLGrdh76eAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EpNwZtMJzckTA3T2owL+3eFLdFfe8UxenPI576te29TQH3f+Qk6WHA2k7aQjGCNTjqbVnJr2jqnxilyLWJbzFrEEKCjYIgiCWwKmWIgKYJvem4YmjgNsHsyDgmmyLZmYbsODM7w9lJ6c9K+HBEYHT/BuE1JOYTrPT0pZCiK+znA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NW+O2ndk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751442041;
	bh=10rrKV1mRpMK7w0xooZ94xMtgBGMsUxVJ0NQ3XuotQo=;
	h=Date:From:To:Cc:Subject:From;
	b=NW+O2ndkZ7jJgB93qVbYFfhLetrAe4r0v13Jrx0oQb/5ast4qCjSezlcA3Cs4JA+n
	 QVG2TLcQiUECnX5Ybn/qJesvi0PdUB4opnJtzzQAC6mxUk4kSQQ34Dozos2C3LyU5u
	 DzJG7rq7ivutuxYF4rMKnMWnL5XwL6VlU/juW+u3hUIi+CuTpHHgaT5dSFz77NZK4b
	 XGPeFIPCGU1vEV0dbpdaKB+J+og8aeNu4lWekIp4vF2P6wR4Zr15ixCq1BmlaygUru
	 s0lSn9VgDT7DuWAFJszr2PjlY9RuYGz1/AGW6tp8sYbtBBsdJxZ5u7d0jSyQcPxc7N
	 JagkolXNCif4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXBdj10Bmz4wcZ;
	Wed,  2 Jul 2025 17:40:40 +1000 (AEST)
Date: Wed, 2 Jul 2025 17:40:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bmc tree
Message-ID: <20250702174054.383aef05@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l+oVLjgMHyk/mGIsyq_c_GI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l+oVLjgMHyk/mGIsyq_c_GI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the aspeed tree as different commits
(but the same patches):

  05a8cfc12f1c ("ARM: dts: aspeed: system1: Add GPIO line name")
  24c5110ce866 ("ARM: dts: aspeed: system1: Reduce sgpio speed")
  2f0f9cc149f5 ("dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC")
  322dbe88fe88 ("ARM: dts: aspeed: system1: Remove VRs max8952")
  373d9b5989e0 ("ARM: dts: aspeed: catalina: Enable MCTP support for NIC ma=
nage
ment")
  3969aadf4be9 ("ARM: dts: aspeed: system1: Update LED gpio name")
  4de4329d8a76 ("ARM: dts: aspeed: system1: Disable gpio pull down")
  6b357c149ec5 ("dt-bindings: ipmi: Add binding for IPMB device")
  6e8b400dddd1 ("ARM: dts: aspeed: catalina: Add IO Mezz board thermal sens=
or nodes")
  7c59fb16bfee ("ARM: dts: aspeed: Rework APB nodes")
  8c2d9fc03293 ("ARM: dts: aspeed: catalina: Add second source fan controll=
er support")
  8f58b439c451 ("ARM: dts: aspeed: catalina: Remove INA238 and INA230 nodes=
")
  90e9de1d0921 ("ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BM=
C")
  94706cdd3ead ("ARM: dts: aspeed: bletchley: remove unused ethernet-phy no=
de")
  94776ee4e1ec ("ARM: dts: aspeed: Align GPIO hog name with bindings")
  a2c2d4c41785 ("ARM: dts: aspeed: catalina: Add Front IO board remote ther=
mal sensor")
  a7d6d2d622d7 ("ARM: dts: aspeed: Remove swift machine")
  aadc4c3ddd1e ("ARM: dts: aspeed: catalina: Update CBC FRU EEPROM I2C bus =
and address")
  c8c33f37a6a6 ("ARM: dts: aspeed: system1: Mark GPIO line high/low")
  d276bb9fb5b6 ("ARM: dts: aspeed: catalina: Add MP5990 power sensor node")
  df89538262c5 ("ARM: dts: aspeed: catalina: Enable multi-master on additio=
nal I2C buses")
  ebd7b3c42ffa ("ARM: dts: aspeed: catalina: Add fan controller support")
  f06ff444bf79 ("ARM: dts: aspeed: system1: Add IPMB device")
  f2919835b87e ("ARM: dts: aspeed: catalina: Add second source HSC node sup=
port")

--=20
Cheers,
Stephen Rothwell

--Sig_/l+oVLjgMHyk/mGIsyq_c_GI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhk4oYACgkQAVBC80lX
0Gzyswf+JT8SgeqbGbjI/0JPSQ+6qj6LglhAEc4b8OS7soDOCPZZKEVSjidkU7GU
3FnEE9VcEEvaW1guDUxabAnF8QYi6s8WOJprLrjcpqoF9/hg8TcwIFFP7UsZRt00
DxM+f/R97eh6lZMgGEAWWGJBr3TxXyYSbPFxDDBHjLXYpdU+NIgdvzk2w0RLJxD2
FP7iwNWkTCa2XPBlzoX6cmWvtIo5eI7wHk0isi0iLY4YOxu3wWddbmAqcQG7jd7v
W7Scm5uBPItov/WINioBmh3TmfqWAx8uk4cT1SQtW76dpZNyz58hwpzk6iwXctge
b6D9MF2CwUSCU3moX9Q4vxQZvuwJKw==
=isJn
-----END PGP SIGNATURE-----

--Sig_/l+oVLjgMHyk/mGIsyq_c_GI--

