Return-Path: <linux-next+bounces-6762-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E216AB623C
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CB9860953
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 05:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0681E04BD;
	Wed, 14 May 2025 05:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mnO46xr3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07B3EA98;
	Wed, 14 May 2025 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200209; cv=none; b=YuXAIflqtVunlkrSaZDYx4QDpsulot8q0jVLetIZV1mLuLQgavx6DZpY8F/lMI2szOiIPeG9NOa1ezlpWn0w1k3LrM9ljFEd8wotwivNLLxvy8kqRTgmkjDodN3T3RTSifol9oru8ggdNgXzfyu0r9Jzhzpefgnk2RuJ1sPmbmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200209; c=relaxed/simple;
	bh=PjZkzPb6qnl12zHf3pahrAM5KdkGBNztYJzBS7MQ4GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dqiUuSBRedXlkli2kbQkg1vxx6S5GbPhLGqyIVhiluixQ7K0+zPzA0Go1sqw0Baj+/j7fT8kuDUiJa0MAY4Oyx8/4SoBly5P9f58o4YiY14lRab7SdbTyQUkgbItq+LnLNZuSzqV9RFlUaEiCWryPco4rjCNZ4vTH+3pvf3TE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mnO46xr3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747200200;
	bh=i+7zWi9EvsmtyiPZJIl0RxaxjOBp9ccf2cSnG0886H8=;
	h=Date:From:To:Cc:Subject:From;
	b=mnO46xr3GFylUW55UzbiZA5fx1x6dRWQoyNZxHRr8i9poHYi02Kv6ilAmxCPP20a6
	 49po66PlQtkCW/9Z1sCFkVJsjL7C6MkiXWg7QGa960x3p+Z8N9ImcAk9DVu5xBvd8h
	 b0m/Wn3kaT3fGFIFZq1MKeNqH6I+43laB+QSlmVD54oM9gHnbKzCGo0JYeYTF9qahJ
	 zbKdVvAsT7xLcmbV19gShdciD2wxU/uLHoYmvNAmj+SaDGeW4x3UrascrC8HJe+XAX
	 Y7Db6dsfOrfYcsWeJbxyaFR2i7hwCn8n7qG11MZxGbBne0ouU+n10Loinr+BQYtNa/
	 n3stZRf25EO+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zy1vq4xsQz4x8f;
	Wed, 14 May 2025 15:23:19 +1000 (AEST)
Date: Wed, 14 May 2025 15:23:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Raju Rangoju <Raju.Rangoju@amd.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20250514152318.52714b39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G7FAMtDx3rupFH52VPU.BBt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G7FAMtDx3rupFH52VPU.BBt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/net/ethernet/amd/xgbe/xgbe-dev.c:18:
drivers/net/ethernet/amd/xgbe/xgbe-smn.h:15:10: fatal error: asm/amd_nb.h: =
No such file or directory
   15 | #include <asm/amd_nb.h>
      |          ^~~~~~~~~~~~~~

Caused by commit

  bcbb65559532 ("x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/a=
md/nb.h>")

interacting with commit

  e49479f30ef9 ("amd-xgbe: add support for new XPCS routines")

from the net-next tree.

I have applied the following merge resolution for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 May 2025 14:49:31 +1000
Subject: [PATCH] fix up for "x86/platform/amd: Move the <asm/amd_nb.h> head=
er
 to <asm/amd/nb.h>"

interacting with "amd-xgbe: add support for new XPCS routines" from the
net-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/amd/xgbe/xgbe-smn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-smn.h b/drivers/net/etherne=
t/amd/xgbe/xgbe-smn.h
index 3fd03d39c18a..c6ae127ced03 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-smn.h
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-smn.h
@@ -12,7 +12,7 @@
=20
 #ifdef CONFIG_AMD_NB
=20
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
=20
 #else
=20
--=20
2.47.2

--=20
Cheers,
Stephen Rothwell

--Sig_/G7FAMtDx3rupFH52VPU.BBt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkKMYACgkQAVBC80lX
0GzBUQf/S64XRZpKD5EbVXfNAbmm9ocGmqdb6XJB0l6y7NS3Rc2i7DJj8Vof9qJt
ZwHBK75oUf+iLmXOQLxdsSvy5xTARlK6qjt/qeWRSQm+Lwxy2Ed4Sh02bLnwkrVr
bpRcfguGBFBN4ZWzUdeFKGBj3JtdPKxboGXWxqJc9pjsHUxWnzE7sVdnW5JbGTvD
k62B76HgGe4dYcUGfo11BXMpTFwF9NVFD04I5TP4rko4UNQvYKFq7HovHPcogvii
zz9l66nNNID9Kd6VBou5pA1UOiF2IG5zxrmOkaqjG5UXB1yGK9RfGqISavF5mUDT
t9yiwRxSJ+Nmw61krY3WOikpCthuRw==
=SMPZ
-----END PGP SIGNATURE-----

--Sig_/G7FAMtDx3rupFH52VPU.BBt--

