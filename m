Return-Path: <linux-next+bounces-6626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D773AB09A5
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 07:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CA01BA608D
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 05:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C7C267B71;
	Fri,  9 May 2025 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E3GXmkKz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44C267B12;
	Fri,  9 May 2025 05:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768006; cv=none; b=bEoYtytn4QH8/v6OKaRN5BOu4zXBWuX4jWR0PvY4zp75Maa7sVK6z64MEqmvmFCTDqy2FY7jHKHzH7rchQzL0+DXbnfHzcpha7q02f50zL6V3DcpTiRpj8280Wrt7/fnutKBFcVoeC94dkD5JbdxhYS18P7CVkT3rrd7Z/LnRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768006; c=relaxed/simple;
	bh=Xbnu54DPIjRk/SzN42QEjVM389K6WYuBSSq/3sK1Pbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rR0Amm6AlRZUl+WYr3Po7eqArRmSHxxTRQdnOAw/lS8J5zH/QMv3khd6msxZjH7yvlxXj82V/2+/YIVzs23WuIyI/+oNbG6LLOhJU6jr6kLS7e1qp59X9dQJAIB62tBLz24bBNqaCenjTYM5hzflE4X7KY0NZPCrULIrb/KOrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E3GXmkKz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746767995;
	bh=pM7RMNppVZacEmBkwce5pZ7tzaaJcHbphBWHk19HROw=;
	h=Date:From:To:Cc:Subject:From;
	b=E3GXmkKzm6vQHeOycs3olA4aFMxG6QMHl7tXjlzuN0e9SZ2hAC3dGWfkr1LqQ8KmD
	 xX2TPxHTnX23T+mP1luUAUb9JSGbRR5QM0Ni9+SdNCV7qv1u95ZD/6FGZ17BfRvxuX
	 MatdCf5m3RLgXtDJcZunQJ4Ofe6NA2AJe+OdhijzU1xH08y8E8VP+KPrmDrqB2G5rR
	 XVXL4Rhk/jMfBpY7JHrfvGmxf2M/YNp81ldjeFdzkLaneinNfcQXluW8FV5KPqqGKI
	 qg6pmHFtUysBM8ZQ47uX919c9oJFkKDgRjmq5+SsaWt3yTzo82bORma8Qyp+IvzfMG
	 xE0ZRrnG4ULcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zty4C1gggz4x0L;
	Fri,  9 May 2025 15:19:55 +1000 (AEST)
Date: Fri, 9 May 2025 15:19:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the i2c-host
 tree
Message-ID: <20250509151954.2f209531@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iij2n58Ha.Ge++aJTI+=3DC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iij2n58Ha.Ge++aJTI+=3DC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  MAINTAINERS

between commit:

  785eb0bca34b ("dt-bindings: i2c: i2c-wmt: Convert to YAML")

from the i2c-host tree and commit:

  2b18eda58c86 ("dt-bindings: interrupt-controller: via,vt8500-intc: Conver=
t to YAML")

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

diff --cc MAINTAINERS
index b4277e45ad4e,63e804277519..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3443,7 -3427,8 +3443,8 @@@ M:	Alexey Charkov <alchark@gmail.com
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
+ F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc=
.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_/iij2n58Ha.Ge++aJTI+=3DC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdkHoACgkQAVBC80lX
0Gw0MAf+O+H77xvzbP2N16yQotXicFQyW16MaeYH9LOrPe0HtjQLEqDsJR5aBo3j
wVwm8MtLS5aQg7bPjJSE9E+rBFuZksvt+lOezXxU031rdQCxh/BZ8s/SyYQcY+I2
NtMwvEUE2UnPyPAvw0iXWoAYWOxfria0Ocf+g3A3Cd692jWRtjM8OFKjtWhuSCnS
s77hmFROVmxGBeZYc3Vka+7t3DiKBq7oVu0TGPGw1iKhVNrmQeEARgPTa3Fll3FL
FgYSi1vPXOj5EzyW+jRau1rgL2UqB0ZsOH7KLDKq45I/QW1JKXqwWu9cVCICiT43
8OUbDCtAgh+nXmI50hWLsEERY5Lzow==
=9/7X
-----END PGP SIGNATURE-----

--Sig_/iij2n58Ha.Ge++aJTI+=3DC--

