Return-Path: <linux-next+bounces-8680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D461ABFA11E
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83211892D1B
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 05:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5122D5A01;
	Wed, 22 Oct 2025 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YTnIjTHa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A4241665;
	Wed, 22 Oct 2025 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111391; cv=none; b=pwu9NTDtCAc10rElRMU24xs+WMK+hjG/KiQ0bToKKkZgzE1HEWHbePEA/s7Ig7WFIwm/HxYBnOkXHCB5gEOLDrqszmC23PyZW+c7/BLJGPEPpYEhKtCu5bM8QxRlX7+Gt1lsXfC4g+LLk/4t/T+lto62tGpbAB2XizdGMu10GZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111391; c=relaxed/simple;
	bh=awQGtd41A8uGDvsJsAbBEhEhtFv/LAvHYcUY4XbCr5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q1Id3fUYY8pF0l+Q5hqF2eq5HhLbZdJQTPJFTT9O35skUckImsCzrkvVZM8wyygsuVpYn1wmvyKWLjLsgD1TI0wqE82xKWAGzoD7ze0ut8Vl+PppKL+iKI3FNX2mRqg8bpj5Lc8u1RiT/uYqgg7GELlQi2kYwOotY2V4ZBg21zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YTnIjTHa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761111386;
	bh=uefk+q4eodMdyY7iF4SMmw+2quBAIhe7eskFDEaoCNc=;
	h=Date:From:To:Cc:Subject:From;
	b=YTnIjTHa0nluyLJrVBLmwjT7cpC7X9WpqtV/LSB8ujDMcobE/V6AkA7/7FABezwDG
	 xIffGRtZrjaQ1p8rN5j/1lQMZ0BEsT6LyZ6fGvC5/mE+7BE/pEThuRCOXeci+R3lgV
	 iQb8g9khoTgFUFIL8d9lxCwGADSL/enlNVGoWf7rNip5yP/9hR4N3gKHJm5+ZWDmNA
	 PA9sEsqKsi8VkL9P/uOYWHrDnvPHQheFncOkQI7bOSOFvqsvXZmIhC+1hiKuHTCNP1
	 8o4XJlxm+Jqfw1Lp0J2i8dnnBaTRDuASxo6JpTtczx8MMg2HIlQKzh/hPuFLucENoX
	 EWr3FTiXKSoKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cryZf3t1sz4wCV;
	Wed, 22 Oct 2025 16:36:26 +1100 (AEDT)
Date: Wed, 22 Oct 2025 16:36:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: add Mark Brown as a maintainer
Message-ID: <20251022163625.5df7542a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//e+U.nePsFFNmhLVI+DBgmH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//e+U.nePsFFNmhLVI+DBgmH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Mark has been kindly helping fill in when I have been unavailable over
the past several years.  Has has also put his hand up to take over
linux-next maintenance when I finally decide to stop (which may be some
time yet ;-) ).

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2bc6c6a214e..52f9d98091ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14420,6 +14420,7 @@ F:	tools/memory-model/
=20
 LINUX-NEXT TREE
 M:	Stephen Rothwell <sfr@canb.auug.org.au>
+M:	Mark Brown <broonie@kernel.org>
 L:	linux-next@vger.kernel.org
 S:	Supported
 B:	mailto:linux-next@vger.kernel.org and the appropriate development tree
--=20
2.51.0

--=20
Cheers,
Stephen Rothwell

--Sig_//e+U.nePsFFNmhLVI+DBgmH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4bVkACgkQAVBC80lX
0Gywgwf6AhXGEGZ3XKbsO0jC+TvXALeXBSrYG6Z5AL1F6Pz9FIbchLUU6mGe+niY
f7qudv1tnlidUWpBy1D5olsd0kCloFuPfEN+vdp1EgE914/LwVNrHVNO1+oVimsw
htlc6ZP4HGmbSMkO1HUBUXOmZc16yiInCZsepjAaBcpn18y5bmOPGBxxBtpoSf9P
rDPo9dQoxomH9Ek94aUvor2b5Gqn9Xed3iLA8NB7uw9GQthIjSSrCUcXt3bNAJ7r
d7YCmdKwYpMucmonpiGN7cz8wQHsdPlF6O1YZF8Ov5gugay91dQdM9xJ2oSzRIXa
A0LrXA0L2aoZwdiVsyNSt4BbRputtA==
=bKyI
-----END PGP SIGNATURE-----

--Sig_//e+U.nePsFFNmhLVI+DBgmH--

