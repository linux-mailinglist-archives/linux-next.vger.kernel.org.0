Return-Path: <linux-next+bounces-4132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEA993D8B
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 05:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5350D1F2390F
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 03:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DAD20B20;
	Tue,  8 Oct 2024 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZYgGJVoc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B51DFD1;
	Tue,  8 Oct 2024 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728358328; cv=none; b=odid/5vgUVvok1SQewQpCBxJ2CnCoXUaeDalmo1zTE0QYyuz7D9uuejyHVUpxsaeYLYfoHLbDcNM2bdC9zZCDp0JQ05eYyQTl1xUHyK7AyCqOqjFN1ggCrAKqjlylO/h+LJCHz14RKj+2tTP4S/sNA9Q7L8eiJtxKD+l8Mfzayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728358328; c=relaxed/simple;
	bh=FN10PuVDaVlGrGnxjoWDkn1qjkRGHM7dYMWr7KGEh54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qVld6QNz7HYH7Sr3Id1sv+37J8bE8A+oF9/CJmQbGH+OX28u7woyaXRqhKz4Va3mQQmhMM2WV1/Gi1kHMpy6IwKcebBkM1iGF/pLIbO+D4DxwJtqHULtaDYPWhu5RHIt+vqkYYPkljtkSG5X0KV0n8Oj7ZCI7wh6eeoBU1/9bU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZYgGJVoc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728358320;
	bh=i03PF6w3CmS7llHF+GNcSOf/R8cqhDofQwzNz9sR7gY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZYgGJVoc6MTtDC7KQgrgFkBfhE3rh0SIyXcfb2AZ4AXVmRPd6BpF32mixCmo1KoL3
	 CQq01QnvjGuTF+djg7QBF0ZyXOgOlP22ina90/dwHRfA4CNQPuQUGCMaxEdbGY3Sbk
	 ONSCqQtI4rjQFu6nYnypggSqS2fcDfnOTIKIxcw4VDtEgGUdZwKjzRO5Ih5X9cWwgb
	 OD+H+kO0fjDfThVw4XtEBOpSRW2+guu0VfCKagleEVNzNLDv6KcqTGcd0jLMbWHZOf
	 gO3B1QFiDyGWAHGSnJx8C+5Nty1epKnKYnz3LhwBobk3uLus4xU26C/n3H37/6U5zO
	 86ehmAvRdaiBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN1m001SQz4wc3;
	Tue,  8 Oct 2024 14:31:59 +1100 (AEDT)
Date: Tue, 8 Oct 2024 14:31:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Avri Altman <avri.altman@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20241008143159.35e26d8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wl2d6V4dLjtPexrsNrkDHpC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wl2d6V4dLjtPexrsNrkDHpC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mmc/core/block.c:53:10: fatal error: asm/unaligned.h: No such file =
or directory
   53 | #include <asm/unaligned.h>
      |          ^~~~~~~~~~~~~~~~~

Caused by commit

  251377c52fde ("mmc: core: Adjust ACMD22 to SDUC")

interatcing with commit

  5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")

from Linus' tree (in v6.12-rc2).

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Oct 2024 14:25:34 +1100
Subject: [PATCH] fix up for "mmc: core: Adjust ACMD22 to SDUC"

interacting with "move asm/unaligned.h to linux/unaligned.h" from
Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mmc/core/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 66de5ccbb432..9752ecac6c5b 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -50,7 +50,7 @@
 #include <linux/mmc/sd.h>
=20
 #include <linux/uaccess.h>
-#include <asm/unaligned.h>
+#include <linux/unaligned.h>
=20
 #include "queue.h"
 #include "block.h"
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell


--Sig_/wl2d6V4dLjtPexrsNrkDHpC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEp68ACgkQAVBC80lX
0GwmAgf/Vwe49gdSq9ydIlJT9A/dNEG7ebN9B4Vb7oFFRGS3sDXd9a80n2r5wEi2
u6ndnx4NEU1/GBobF/rd9pIzS51Q00P8kbhVkcJ6NKkyXpJ/9y8LQZ/h4Jlia7CV
jiPUYugDUeigynuuK968nVLhJDrAnEPLVlnc/+zBTDD50VzboCxtGTUj8kwYHpUp
F9tl9ZNyMyRCPdN48UZyPNFO6oINpNnjkZNIxsFpo6E887gGcY9iKVHvYRnGhANI
LMIIrih4dk42OEZDdMH45HrDxMJgLPesqo35GMnAyyuUtn/u0qCLs4zrY4Kip84o
oCyoT7BmdxcGmX3AEnHvoaJqPXDrng==
=RIKX
-----END PGP SIGNATURE-----

--Sig_/wl2d6V4dLjtPexrsNrkDHpC--

