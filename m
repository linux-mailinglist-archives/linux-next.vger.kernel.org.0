Return-Path: <linux-next+bounces-6634-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E234FAB0C91
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 10:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B055DA00FD8
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1F7270ECD;
	Fri,  9 May 2025 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fhPRxT2C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EF26A1DA;
	Fri,  9 May 2025 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777944; cv=none; b=QO5dOV4BjxHm8HBVs8bXCcdWGoKNv+7OAaQE5ISRlgGJEArpM8PNIRTF7dSkOWg/a24z4K5/uTzbNUDL2HhD8jMppNRiioMKgLz+amOxGfoQuS1LOdRaqeA4NsGyrJ8hLBUsSLx0PTZx9bmShX/SYKtv1lva1+Zn+cmhf/ZxNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777944; c=relaxed/simple;
	bh=WHM+7QSkADPwouihR3kxeKC2Rp2Nl+hApzRG6PEQ5zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KfTfkKr+OflTsg4cVJKMV/4LlhlCOZ6XHA/q11W0SEuq4Ovso5QpNg5C9+GUJwVhwYlH9Su8IQIl/R2bOadp7IXIaHy3Yn3UxNaVUtmWOTEf31YkDNjMIWWuuVLBbmf/7t6Si9xep8a7e7oPFEp76XurUS/PrCRYjA+xQfC1KIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fhPRxT2C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746777936;
	bh=SCv+knZHxvT6YM0mguSr1nEuEIMHrbnm24UlJJbmTSk=;
	h=Date:From:To:Cc:Subject:From;
	b=fhPRxT2CTkZxpODVfwdGhRQDLS6WmrssavqbVAA7I10g9fL8F9hH9OwYaB422Nm1T
	 swRz8DkylHZYB5kYQVZW0KGgEAbnjHjysl9tStWssZFfExtMtqBthFa7m18gS3YZmx
	 4fQ2MgSUvxnToyacIimd6G2yW8RQRJMJLtWXkjKXHwahXFT1rGf4bcPsOJiULFiNDt
	 T8Std+iMo3gL9bAnK6cs8gec93NwJ+R58x6FfF1rNMe/2q8yazWJ8glqgeIwpRj1gT
	 oqZB0l0d2nNlQ96mRXcdR62prc5ZJy+csu7oNYZBGAUc1454SO1VxsmmknezDRxpL0
	 Y6ASQmV6SbCfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zv1lN2PSkz4x3q;
	Fri,  9 May 2025 18:05:36 +1000 (AEST)
Date: Fri, 9 May 2025 18:05:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Rob Herring
 <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pwm tree with the i2c-host,
 devicetree trees
Message-ID: <20250509180535.01c4c249@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//yHdG6MxoZi2TSwhkKipw6o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//yHdG6MxoZi2TSwhkKipw6o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pwm tree got a conflict in:

  MAINTAINERS

between commits:

  785eb0bca34b ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
  2b18eda58c86 ("dt-bindings: interrupt-controller: via,vt8500-intc: Conver=
t to YAML")
  47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in mai=
ntainers entry")

from the i2c-host, devicetree and dt-krzk trees and commit:

  b6b5683e9692 ("dt-bindings: pwm: vt8500-pwm: Convert to YAML")

from the pwm tree.

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
index a7e1980b6b15,26ef29a0c9bf..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3469,9 -3427,8 +3469,10 @@@ M:	Alexey Charkov <alchark@gmail.com
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc=
.yaml
+ F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_//yHdG6MxoZi2TSwhkKipw6o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdt08ACgkQAVBC80lX
0GxA9gf+Nm/F0OxKAVgwnfwQIlbBNUeN46TNSdvUcJBc/U3UDObB3jyOFao9AAad
Kojxcmkh8fOhARGIOfckSpsvfVEA3IlZ3O6PxBnZA47l4GdCVfsyw5fHPfG4v70W
5MNuCfga6W6OmGHWbp/IU1Qj4Yq/Chz4M9bgIb4HbnEO4fs915Ljm/WPE5gXwFWZ
5auk/SrSNgfAImSF5jxseO1Cd8Vc9uCeDt37Vtx/adfmRTiffCfe33d+oo/R5aQz
SAiy9JJMmB6V7t7Xnh65zfe4E0RFAy7vSbcNyu6PQBvCEuqapzldJXXhYyGduzqM
p8/6Bq6vd7j9j4gIpOx6yUdUU3i6Rg==
=9ZAs
-----END PGP SIGNATURE-----

--Sig_//yHdG6MxoZi2TSwhkKipw6o--

