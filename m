Return-Path: <linux-next+bounces-7651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721CBB0BDD6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 09:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CBAD3BE899
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 07:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65689283FE8;
	Mon, 21 Jul 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TH1A6/Ui"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07842283FF8;
	Mon, 21 Jul 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083484; cv=none; b=qUrcdrjPLlVzRRcZSYhHkod0XyYpuOwUjZqHdjieOlUHxhsXECq0BGmTDbGXTYDLndyCBThRHoAxvO3SQjA4bylhz/MZ7PMTYKiWYdH+H4UU9IX0xD2M7hVqoBvRYID93jL6aFgNQIo88+iPQjm+JMMstYjUgOChf5smo8cSkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083484; c=relaxed/simple;
	bh=bt0+EbWZOK5Wn072ur1LpkJHELDecRXvRC1W0F8qXco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jh0Be+egKLXaf71VNS2Fl1H7e6BuI0KTPsJNHdDUtmVDwIC/9JFN90v1vm48kFXPPxHAQdKJ+bbZao/GRgWveWFV0xHw6g6KSUXi8/cLWIJmS6q+zr26xnZrwJt+Ecsx3GTrM5efXF/GUBmBQogPYQg8ltiswfmTJwi/ahWaE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TH1A6/Ui; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753083324;
	bh=0MkOJWk9HiseEndt7uOPyDYIQ7A8Ow6qXqBDTuziVmk=;
	h=Date:From:To:Cc:Subject:From;
	b=TH1A6/UiP+yPdVlyseyX2Z/cO42eiX1Js2wMX0yl3A21yOBH0f8vMzAJhaSnC/gYf
	 EJHWfKpjIsZEXg7iVyPYZDEzFLWd2z4d+kLoXUpn+vc1MHjZunrs2gNMFt/Tfk3bZs
	 pokzw4tdDlR74zm5Tfne/27E5vrwAcrWv6ZYJ6SOTVxXfDpzT9t9kKTtDJx+pHxIog
	 hlgojv7hdTVJlo/4VEWfDN8HQ9xADnlYJpcOdRar6tKBBp8or87VutXJZNR02XYpLR
	 PVJDm5+wTYK6Acq703DiHpOLjqB18IYhxQN0qXaFGXH5iPT5XQQ4vSs2kqlUgBHL0l
	 9+/xvrAr2mbiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blscq5z7vz4wyh;
	Mon, 21 Jul 2025 17:35:23 +1000 (AEST)
Date: Mon, 21 Jul 2025 17:37:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, George Abraham P
 <george.abraham.p@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: build failure after merge of all the trees
Message-ID: <20250721173754.42865913@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zBoZgKnJFuP4hhRhpX1HCff";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zBoZgKnJFuP4hhRhpX1HCff
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging all the trees, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_util=
s.c:4:
include/linux/sprintf.h:11:54: error: unknown type name 'va_list'
   11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
      |                                                      ^~~~~~~
include/linux/sprintf.h:1:1: note: 'va_list' is defined in header '<stdarg.=
h>'; this is probably fixable by adding '#include <stdarg.h>'
  +++ |+#include <stdarg.h>
    1 | /* SPDX-License-Identifier: GPL-2.0 */
include/linux/sprintf.h:13:71: error: unknown type name 'va_list'
   13 | __printf(3, 0) int vsnprintf(char *buf, size_t size, const char *fm=
t, va_list args);
      |                                                                    =
   ^~~~~~~
include/linux/sprintf.h:13:71: note: 'va_list' is defined in header '<stdar=
g.h>'; this is probably fixable by adding '#include <stdarg.h>'
include/linux/sprintf.h:15:72: error: unknown type name 'va_list'
   15 | __printf(3, 0) int vscnprintf(char *buf, size_t size, const char *f=
mt, va_list args);
      |                                                                    =
    ^~~~~~~
include/linux/sprintf.h:15:72: note: 'va_list' is defined in header '<stdar=
g.h>'; this is probably fixable by adding '#include <stdarg.h>'
include/linux/sprintf.h:17:70: error: unknown type name 'va_list'
   17 | __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt=
, va_list args);
      |                                                                    =
  ^~~~~~~
include/linux/sprintf.h:17:70: note: 'va_list' is defined in header '<stdar=
g.h>'; this is probably fixable by adding '#include <stdarg.h>'
include/linux/sprintf.h:18:73: error: unknown type name 'va_list'
   18 | __printf(2, 0) const char *kvasprintf_const(gfp_t gfp, const char *=
fmt, va_list args);
      |                                                                    =
     ^~~~~~~
include/linux/sprintf.h:18:73: note: 'va_list' is defined in header '<stdar=
g.h>'; this is probably fixable by adding '#include <stdarg.h>'
include/linux/sprintf.h:21:55: error: unknown type name 'va_list'
   21 | __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
      |                                                       ^~~~~~~
include/linux/sprintf.h:21:55: note: 'va_list' is defined in header '<stdar=
g.h>'; this is probably fixable by adding '#include <stdarg.h>'

I don't know what root caused this, but I have applied the following
patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Jul 2025 16:15:57 +1000
Subject: [PATCH] sprintf.h requires stdarg.h

In file included from drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_util=
s.c:4:
include/linux/sprintf.h:11:54: error: unknown type name 'va_list'
   11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
      |                                                      ^~~~~~~
include/linux/sprintf.h:1:1: note: 'va_list' is defined in header '<stdarg.=
h>'; this is probably fixable by adding '#include <stdarg.h>'

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/sprintf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index 521bb2cd2648..f06f7b785091 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -4,6 +4,7 @@
=20
 #include <linux/compiler_attributes.h>
 #include <linux/types.h>
+#include <linux/stdarg.h>
=20
 int num_to_str(char *buf, int size, unsigned long long num, unsigned int w=
idth);
=20
--=20
2.50.1

Is there any good reason not to do this?

I guess this patch should have

Fixes: 39ced19b9e60 ("lib/vsprintf: split out sprintf() and friends")

but that is not the immediate cause.  This has been exposed by the
inclusion of a new file
(drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_utils.c in commit
7c68005a4610 ("crypto: qat - relocate power management debugfs helper
APIs").  Maybe every other use of sprintf.h also has (explicitly or
implicitly) an include of stdarg.h - possibly via kernel.h.

--=20
Cheers,
Stephen Rothwell

--Sig_/zBoZgKnJFuP4hhRhpX1HCff
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh97lIACgkQAVBC80lX
0GyJkQf+LbwlkszRqp0qm2CRXodvogkaPzASGUlvkTZSVQ3GKyJHtz/vki2CSef0
1HMtOqLtcdqWc5rdpVTavVCLV4+Mxq3tb9zAljREpGbr0tLNzeIgJH9yBBxVlEvA
RS6HqrjE6fai3ud9BzQtpoa1OX04Mp7EMqZRAbAYHacMqxJT8Im2I1iTEXUicbpe
5ngkBJMhebQ5Crae4Zi9blm3YJ8xLwmk2O7wSr8VcFml1aHcgeteIU4xDVWtnk9/
fdD7TvyiHpqiWpyi/b40frPym1OCZ0L2oPOIv8Hlr75wy+rKn/ku0BFa/lD7cSRt
ys8hGpL7jBTAt3xU7QFjVHTg/cQnpQ==
=mYqE
-----END PGP SIGNATURE-----

--Sig_/zBoZgKnJFuP4hhRhpX1HCff--

