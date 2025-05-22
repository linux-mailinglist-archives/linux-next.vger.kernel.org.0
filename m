Return-Path: <linux-next+bounces-6898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D39AC0267
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 04:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98EA5170864
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 02:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FC9101F2;
	Thu, 22 May 2025 02:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QXUmmB2X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7307405A;
	Thu, 22 May 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880252; cv=none; b=FNgYcbNKpcG3FjxyCgIhiAanClzH3z5EXNg2HMF4aMyGKqOwZvNuML7s27Gk2e+P1sHPaZQmaoXaaXJTPROkS4QvyD23l5JYrgK7Sjn08fLYdontr+0ARh5whEEWSJ1ZkG6oJkOCAZRulD1OhoEh1lNLDgFECCAruAS8IaaG5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880252; c=relaxed/simple;
	bh=6HdDLuN69jRgrnD6X3PhDtFnyX7WEPxz9kgdJWxvpxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fmyUkgMOuCTLxcKfNZDTzeWgrsgojA+dOndOAokSsp0phVUgYVpEe9cd69OLOb0Z4Scb3QxS5yQe2hzSFRDvGDMtdTn9UPBducyazKqlRlaDc4TpOZTFRp0crxZSOYZ3DcP4p5BfWnk/KvbH5QETcw3h2CPvVQTD/b2cWhcvbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QXUmmB2X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747880247;
	bh=lVRHaQ6XE1w3gYaKM7tq0RnLKSJmxtnmat2fqFD1SWA=;
	h=Date:From:To:Cc:Subject:From;
	b=QXUmmB2XWeQ6P8EIdCcMbkSiVZ65Pfh7kiFRbPOA53D8pIfjvdGMD8o4m5+6++L61
	 mXLuH+5S9f/x10JsGOMlOpR/qsZ2Pf7WvFEsHZR5SRS9nEcujc064YYK7g2bqGh20X
	 WfzfQ3NJzJoNrm/nfqY5MdPYafmGzQLcYh2wy68X0V0kWlgshSOmczsqI3nlW72HY1
	 FGKuy96tEpl6DdtoZTY+ZLElGvc3yi/0u/+6t4GKl4Aov4/kW0uv6aNDtBhioHvvHU
	 xOd9RYAiEG5AFsD1IlbDeHClB6EZcoz8CUQpMlin3l6BrvV804S6XIq9ykITj+Qaa5
	 rZz5XOD4R4l8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2sPg3vFqz4xD9;
	Thu, 22 May 2025 12:17:27 +1000 (AEST)
Date: Thu, 22 May 2025 12:17:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi@smida.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the i2c-host tree with the arm-soc tree
Message-ID: <20250522121726.0a4350fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gABvDSz61vTa7_NFTstHl5E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gABvDSz61vTa7_NFTstHl5E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c-host tree got a conflict in:

  MAINTAINERS

between commit:

  47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in mai=
ntainers entry")

from the arm-soc tree and commit:

  3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")

from the i2c-host tree.

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
index 3ca100bf2c02,bc13b87e85c0..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3435,8 -3434,7 +3435,8 @@@ M:	Alexey Charkov <alchark@gmail.com
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
- F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+ F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_/gABvDSz61vTa7_NFTstHl5E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmguiTYACgkQAVBC80lX
0GxcSQf5AVj6pKtp7El2+p8J6aena1evSsaeXwc8DmwmSczjfyF+yY1VNvOUgZBb
MBoDs18CxrWjsRRGKew9V3LLyDNey5CgJVeRkGfN+C2bezzTmwU5McJeOCzEXL/1
U92o/Zo+h1G8ZuWkhXlEX64js68XJa6Mn4lcwhCJ6h/svsrVQWMT1qBUuZgpcK5U
sBQL2HODi5ubMCp9SCMxw/2ZYuk49bvSG0YtG68yUzeYj67/ClBpzcDqEMiR2xkK
VPBHfP5hEOMdFIDIHcMhjbSveDuvQ8fO4ygeOz17V16tCyupsLuNylnhwDdmbP/u
hwqC+uA1KwCCe35Bb/btPagwet2ieQ==
=2A8b
-----END PGP SIGNATURE-----

--Sig_/gABvDSz61vTa7_NFTstHl5E--

