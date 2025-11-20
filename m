Return-Path: <linux-next+bounces-9099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E90C72222
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E34CB4E3D44
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 04:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439CB296BA5;
	Thu, 20 Nov 2025 04:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X/SHo4uP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D732D1905;
	Thu, 20 Nov 2025 04:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763611722; cv=none; b=dZ1GdILPOIKnBXCJ5KhQUjND9m5s/NyG3kxR4B7TssPk8OpsL3EHTp499T3vSX8dVfVDSc9WC9kpxvvDsUkRZMdEBXR1gxVh/z7DDAGEjg+WEaMiecBrsu+EzN8MKAlZGI9eolOBy8SYDbWA1447e8cl8hhA55z/fHwCOG91yCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763611722; c=relaxed/simple;
	bh=vUm7Z5xGJ4sf70/sgLuPXWfTZQyiyisL7aOopmPqHag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PP/opGFEnLv6BtJGojZpQnH0yrVXCgQiKa+ePFGf5VFi1pihgRnRrLBfDfK85kUCFx9w9rRqlF1Fe+ldQjvy/ZChSjKqEnqkzmC3pUcftYHH7SlYviJP3u1ygX6UDoeODKpV3qGEcQNJuR+MSIO4L/XMu6aXCflpggCDYuBjUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X/SHo4uP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763611718;
	bh=rIRHM2K4J3lqi6g8639o3SQNcGySvbqWqHL5y3AqYE4=;
	h=Date:From:To:Cc:Subject:From;
	b=X/SHo4uPXmH8rYAiGJ6CbbBXOZ3265lNLnylDCYzAIEUT9XBJHVYGYfT2dco4sgAR
	 dVfTvzUMBx5mc/hfD8BeH+UbS47E81lUifcMvgC3J6140wV947nW7hPnxoveZutilj
	 IssXNUmPmR1z5CpgB5pJvqg0t42O1NNXm15Guost6+ud62/h6N8imusy9wH4TiFB6f
	 sB9WZRbWBlBIkLfPnX1wCA9oS6IHz9uS+n3T75nRO5SteAXxriOIFQ2hasIdOxlxjx
	 0B+v0m7UDUKyyPcleHLfA28IZl0MbxLiYGx4O6mNfRdRF7QjLFMMwmg3kXL+dUH601
	 ojv54WkxYiU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBlFx6f5Pz4wCp;
	Thu, 20 Nov 2025 15:08:37 +1100 (AEDT)
Date: Thu, 20 Nov 2025 15:08:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: linux-next: manual merge of the tip tree with the amlogic tree
Message-ID: <20251120150837.49a76ba4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dXxxDrcw5Br5QuYgwU_d+su";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dXxxDrcw5Br5QuYgwU_d+su
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi

between commit:

  e490b52477b8 ("arm64: dts: amlogic: s7d: add ao secure node")

from the amlogic tree and commit:

  1d787348123b ("arm64: dts: amlogic: Add gpio_intc node for Amlogic S7D So=
Cs")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index e60167af0390,5ef16820b574..000000000000
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@@ -195,13 -185,15 +195,23 @@@
  				};
  			};
 =20
+ 			gpio_intc: interrupt-controller@4080 {
+ 				compatible =3D "amlogic,s7d-gpio-intc",
+ 					     "amlogic,meson-gpio-intc";
+ 				reg =3D <0x0 0x4080 0x0 0x20>;
+ 				interrupt-controller;
+ 				#interrupt-cells =3D <2>;
+ 				amlogic,channel-interrupts =3D
+ 					<10 11 12 13 14 15 16 17 18 19 20 21>;
+ 			};
++
 +			ao-secure@10220 {
 +				compatible =3D "amlogic,s7d-ao-secure",
 +					     "amlogic,meson-gx-ao-secure",
 +					     "syscon";
 +				reg =3D <0x0 0x10220 0x0 0x140>;
 +				amlogic,has-chip-id;
 +			};
  		};
  	};
  };

--Sig_/dXxxDrcw5Br5QuYgwU_d+su
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkelEUACgkQAVBC80lX
0Gyerwf/ZR9idZHeFEZyFt7YKXb7Rk9NSdheL7TQnOn/9q/LPTmG6mNhL4bbPqJ3
nzvNxnJZPP18WqyVtA49TJH40CXO1oM7OJo8Znvk7bCFzpm4PJASpFJZyhisuP4B
QlMifBGUdXERdMSiCtgzhDZYEe3D038D94JJiZj8ogD/D8WCrCRdAbghgrpWS32J
JMZKnf5PeOyhc9luouF/jDUJwY6YisdaFVc+C8yrKPt5192z2oBiaro209w3BhCs
+s6q/RaYqJ3JbidyxuGSBGQUV9JCayhqSQyzYS2XCbG1ekAJYXjbMgVddKBGff7l
XJsMyXpfl5B3Dxy8Z2kYN1HVhSUmBQ==
=w8Rq
-----END PGP SIGNATURE-----

--Sig_/dXxxDrcw5Br5QuYgwU_d+su--

