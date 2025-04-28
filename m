Return-Path: <linux-next+bounces-6410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E718A9EAEA
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5CE179ED5
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 08:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30AF25E471;
	Mon, 28 Apr 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UH92gE26"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0A253F02;
	Mon, 28 Apr 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829506; cv=none; b=U+o9/z+GFW+xVeGfpW8W6gc4xweKb507DsgNL7rH8g5UQurFq6UAwgNLNe6VLYe0quTWX7++6lIqgpnYd/Gs8goiQKpodDGExaxUhiGBZG+u3PdAWWNfyCVtkpX4y6gtExDAx6qa/YmEV53dLyVaNy8wvNnvH20AKtFdeq5Ga8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829506; c=relaxed/simple;
	bh=T1CqvJ1bqV0CsLeslskTg8ylge4lzLdILPvoFVmXlmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n1akph1ZzcfgvDcSttnGGPX0VMXS0Ob0V5uIjfXJomT01cNVV/ybs2DfxlHS7/CppBH53/vPe5o/GQis0na7pkLKMg6I8pFNhRUp5grF0EsDp87u6pn/2T2wK/QNn8vpNPOxTkqIRP8kS2mKZdLFsI2F0SUQ58CtDLuqWm+i+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UH92gE26; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745829501;
	bh=7ekObu0vcatDYa+40ZeGkLU5xmQgqCAvyvzbtuJ+8bE=;
	h=Date:From:To:Cc:Subject:From;
	b=UH92gE26TshpDBfPIfhbnD1+6zw59FfbLHuJwCc2iyOGAyQernFgJMJE5nIxPc6GB
	 SfuQSPevvZGXJzefCug1/hAwe3B46NfUmbtKa5Hkal6Vz/JvBba9+x/OIwLLO9sHAD
	 CkgKqXMtGtMciN602leQOrOzjwjGqjTpJQrNALkD1XM7zgXP2QhGu6KI8GEFe4alj4
	 /S6wTDMgGYqoGdbMmDvFdywamOjAiFCxyrKu6ihVmzmyrvhwL7NqGJOzHA4DGJINrS
	 aEIi/uSscC/Scj9RmPLfyPuKnJW26EesLWhEfwRWIhGlDjoRaPCp7O4AQgMjgSMCTp
	 H1kItI9G1g00w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmH0F0mFLz4wcy;
	Mon, 28 Apr 2025 18:38:21 +1000 (AEST)
Date: Mon, 28 Apr 2025 18:38:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Rob Herring
 <robh@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pwm tree with the devicetree tree
Message-ID: <20250428183820.5f0ccfb5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L713ZtHE0//Q67HueB2Dd4f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L713ZtHE0//Q67HueB2Dd4f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pwm tree got a conflict in:

  MAINTAINERS

between commit:

  2b18eda58c86 ("dt-bindings: interrupt-controller: via,vt8500-intc: Conver=
t to YAML")

from the devicetree tree and commit:

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
index b5c2ce4cb560,26ef29a0c9bf..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3453,7 -3428,7 +3453,8 @@@ M:	Krzysztof Kozlowski <krzk@kernel.org
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
  F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc=
.yaml
+ F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_/L713ZtHE0//Q67HueB2Dd4f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPPnwACgkQAVBC80lX
0Gzpnwf+LaDdn8sVhTred7zhPGh7MCsp02wMIg0zuyRNeHgdFai+Rf3Idj8EJGKO
ro5Wnj3x+VKKdBvgokTMP8MhJghyllUstRQUSw6PCh5lfIYPNm4kpxY9dCDU/oCS
WbJsaNy7IqeG2PBSQOaMmlqNVhm7GJ9sqdpyeP2lTB2VY/hzDsZOgUgSTSO8tRuC
IQ7BNDUGK0UMhORqS2sh8tarhqHoEOotYisIOuNxBiQcwUwvwbenyUG48MO0Rwru
8je9SsJ8jQ1QxQd6wJivD4AYGqHzh4Uj1anmQeKMsNWpZ6e1lYupE43a2vovAue+
r37TGrWI48oEd2C3PkZIHf3lx7DW8w==
=pJRX
-----END PGP SIGNATURE-----

--Sig_/L713ZtHE0//Q67HueB2Dd4f--

