Return-Path: <linux-next+bounces-9098-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593CC72216
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D9B2829DAA
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 04:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A96277CBF;
	Thu, 20 Nov 2025 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DpFB4DpQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0E285CAD;
	Thu, 20 Nov 2025 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763611478; cv=none; b=aVOWI6hNc07MQUzTtvSbc1LvZB6odeoUm3FiHTnHIrIewR8hSmrHrUI9hLIOgLGGVA4+/laMwkcV6w951DvIxjWT19AekoLoExpCBCAaHMyFeH+KUMeQx5RvZ5XqdowcQuhn/LxHnZKSMELAyFryc8FyORCI5sw3eGVMIyL1r5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763611478; c=relaxed/simple;
	bh=SMRvVBbBw8H2lDfIoQco/5ztDyZqUEGAT+POJ+k68tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eK5UtRGLWsHj7GHtM3jzi5fh7xXZLobCG80SSZ/MKSXASOinpUd07dauhEuyT6tq25cp+P4dP2aDForgKFOeNfzaieBHW2vppZVJi4XA+Shn1Y0dV6aCiEOz1MC73BxnV2Prfo8x9ETImWo/dp9s+VgPHiIv3JiHGoFU2Gd61fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DpFB4DpQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763611463;
	bh=y+bXov5vb/mVxkXb6pkspNJdtyMIk4C4FuUB49jswI4=;
	h=Date:From:To:Cc:Subject:From;
	b=DpFB4DpQkle6I3mqRI4NDukOViybG23xI/tAyE7Y0h+KUidlvilC7dypiyr0q9xuV
	 fznB90UUkTR/t9iMCIp5Pg5f/N5UJm/gnVZOuU4jAtoMXoPDKeGmFArHdvEVsF4kDR
	 Tf8qYku89V+ZMfddiwNp6+CgCBBHGUMb0ybL4mW7ZJKxkGzjb8NKaE6RyuYTX8zAp7
	 xf+kCQ4Z/X3bZeZ3eqjqLUZ1p7xyq8E+T7TDYsHOzkeVgP9QhxMBuG1HYt5qQLiTxH
	 ESSoJmvVBfRjuU1CJ4vfx0ZdftoRL+hkCzOqM0HIP128WyU3RRjzmxcOVsheLM54Xq
	 1OwDw1J2+XBPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBl8z4HpHz4wCp;
	Thu, 20 Nov 2025 15:04:19 +1100 (AEDT)
Date: Thu, 20 Nov 2025 15:04:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: linux-next: manual merge of the tip tree with the amlogic tree
Message-ID: <20251120150418.591b5da9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xx8RbmQ/zFvoFy.nbkikvny";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xx8RbmQ/zFvoFy.nbkikvny
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi

between commit:

  fe85b8876768 ("arm64: dts: amlogic: s6: add ao secure node")

from the amlogic tree and commit:

  4b6111d677c7 ("arm64: dts: amlogic: Add gpio_intc node for Amlogic S6 SoC=
s")

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

diff --cc arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index da3e607aea85,f91368bc2c48..000000000000
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@@ -200,13 -190,15 +200,23 @@@
  				};
  			};
 =20
+ 			gpio_intc: interrupt-controller@4080 {
+ 				compatible =3D "amlogic,s6-gpio-intc",
+ 					     "amlogic,meson-gpio-intc";
+ 				reg =3D <0x0 0x4080 0x0 0x20>;
+ 				interrupt-controller;
+ 				#interrupt-cells =3D <2>;
+ 				amlogic,channel-interrupts =3D
+ 					<10 11 12 13 14 15 16 17 18 19 20 21>;
+ 			};
++
 +			ao-secure@10220 {
 +				compatible =3D "amlogic,s6-ao-secure",
 +					     "amlogic,meson-gx-ao-secure",
 +					     "syscon";
 +				reg =3D <0x0 0x10220 0x0 0x140>;
 +				amlogic,has-chip-id;
 +			};
  		};
  	};
  };

--Sig_/Xx8RbmQ/zFvoFy.nbkikvny
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkek0IACgkQAVBC80lX
0GyiWgf/SgJy56w7TA3kGKASiUBuL2aQweG0ecHfD7ZSC7+O0CLpHmYMrvgEzRuo
nR9/rVdkJ2WuH85bW9aFimg3fRsHLZlqiQY6+2FZ7O+jx/3F8KndwgAFGSh5gJ0r
dwzp7VhC4KCckgiehHygdxkZsx8mylh0beRVZCObB6zQBbmMrWzh03y9uLbWdMXL
KP5VJ/OP2ZeK54yU5Y4bXQb2/DPH0zSZFKA230kkQnLnkCZfohVHe0fKSqV2Dfqg
yj4LhP+5Id2R7XVspN8MhgAUcI99JjkgPsM8zrML31yx1QeTgUststi+VjymZvCs
CSJ1TIGOOyeVE5clwlYrexQi4W9MQw==
=4Ezj
-----END PGP SIGNATURE-----

--Sig_/Xx8RbmQ/zFvoFy.nbkikvny--

