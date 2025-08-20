Return-Path: <linux-next+bounces-8024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D6B2D184
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 03:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802A03AD298
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 01:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B409421019C;
	Wed, 20 Aug 2025 01:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qy7gN1Rn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D5286A1;
	Wed, 20 Aug 2025 01:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755653845; cv=none; b=mbyf6vjIUs+Y5J6zTe4F1Jxm23+uB9lSnPEcZEZH1a5Rn8W2U6wePKvVH2X95YVXtcpMJoABfk5nlZj2aF355IUcZZ8y9RJpD2eNVUGypx1jVhGEF76J9ablxGoBHKNcIo+4mxdqutCkMJoQLFfCpWz5TWwtFxv5jP1XYjNkorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755653845; c=relaxed/simple;
	bh=3l4AP6P6W7OPXFwMyEvTL+p2EFVDIgZx0+8ievLaaMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sPewquXNyLEPLD+Be/6Z/orGr6eAqV6cSHYJEWIowgaqy9VYH642ZUhe3rIFeSYRjk4SEspo8xD6hDyHNP0gAYfyN+pMTSM8QWkdGy+Hpqcdaid+kmkAXI5UQnJZkldwM4Uo6+Y+TMgJilxvtLK54VBIKMVx421gRaZaUe28xFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qy7gN1Rn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755653840;
	bh=e3ZdJN5i39kNXj8YoePBj3K0UUTsdY/fW4tO1Z88j40=;
	h=Date:From:To:Cc:Subject:From;
	b=Qy7gN1RnV7srLB0MQrsfkcT/EGp+Yuugi/PeR1z7bjbSbyr/fShnxeQY8makxpCjY
	 10hTVd9sC8gVVVr4XRqHOsO87nfau5dwfo+8M+NJElGc4ApXQUSZo/KfN+xi/9of58
	 pVokcXCMfYoQPmcZN9U5FWtt6vZIQcaiKos7Sq0qNORZLfeAOB129rNz79YaPdbZfI
	 /eeFm0fdtLiUE8Ek7/wzvHZ48OXVCX9j9ANLYjqBIMMlKlIieP5YSLgRg8xoQhvorj
	 RPXKzzHjnGrJKj5rYsO4+du/vVWOGm5hvKN3ad3hDcRQ2+Ad31sJJb1p54QMmMfBrM
	 GMdC81ZHp7mrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c68Fr4fSbz4w2K;
	Wed, 20 Aug 2025 11:37:20 +1000 (AEST)
Date: Wed, 20 Aug 2025 11:37:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Liao Yuanhong <liaoyuanhong@vivo.com>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: linux-next: manual merge of the input tree with Linus' tree
Message-ID: <20250820113720.25631f7f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mDAmEmg6WSH.YxSEqrGq6tk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mDAmEmg6WSH.YxSEqrGq6tk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  include/linux/sprintf.h

between commit:

  0dec7201788b ("sprintf.h requires stdarg.h")

from Linus' tree (v6.16) and commit:

  be06b53d3af0 ("lib/vsprintf: include stdarg.h from sprintf.h to provide v=
a_list")

from the input tree.

This only happens because the input tree is still based on v6.16-rc1.

I fixed it up (I applied the following merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Aug 2025 11:31:19 +1000
Subject: [PATCH] input: remove second addition of <linux/stdarg.h>

Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/sprintf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index 8cb32b777d0b..e57a6d6fbd93 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -5,7 +5,6 @@
 #include <linux/compiler_attributes.h>
 #include <linux/stdarg.h>
 #include <linux/types.h>
-#include <linux/stdarg.h>
=20
 int num_to_str(char *buf, int size, unsigned long long num, unsigned int w=
idth);
=20
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/mDAmEmg6WSH.YxSEqrGq6tk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilJtAACgkQAVBC80lX
0Gz9mwgAgThqKBwxHdNjKleF6d+Mz3+7htjrWjlXxnHkaWWowkiSERkixSximbPV
1MYFjAEuCanguPQTTP+la6qKLIvT8npBP8JYtivND+3LKs7BFAKlAMBDASid5pVn
itOUtC/45abf5+Thaif+OeRGJimS/J/N+3HP0HmxRk/w0tOyYPyVBohmjWI8R/gA
guhouqJF3tMi2C3yXDAQn/PinIxe82MwleBJ/9HDgtPxz1Ya5+mMsDisLrxlruwO
SSiDaVkAQBkQPN5Q1oJ0GBbpjqT9C7VpwTKZ9U6K5BYwe6cqsgoFDIeoQCmkCC2W
0gLkJ3cVk4k4WLaqDVoHa4i8o4w9RQ==
=GKKT
-----END PGP SIGNATURE-----

--Sig_/mDAmEmg6WSH.YxSEqrGq6tk--

