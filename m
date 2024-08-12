Return-Path: <linux-next+bounces-3283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D494E3FA
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 02:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92FA6281DDF
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 00:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A473F3FF1;
	Mon, 12 Aug 2024 00:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YysNNPhV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857A3C0B;
	Mon, 12 Aug 2024 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723423362; cv=none; b=asLRN9lOkeSIhS7093PKtYEFSfVk1zS5uVnNR0yAbQQOaHj43KMPX9Niq2s3PnJSHd/kKOolFUcFFxE3Yve58Qj6BeMiQBFJ7eLljVlKjFayTfWNL6b7jhGlowky6ULxXMgqfLXSP6VcYvz+M5hCWaT6XEWmqb+CxXtcIjm1gUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723423362; c=relaxed/simple;
	bh=uSBKCVsGn7X4JvvuBZ/PkqJxqwMm0MixGyeT4UxHTsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RT+pc5AoGylzwhdgSZhh6qamDIOCugMfI5FdLAd5Z72xGh/Fz60gEMhfLhFIYi9rBFvGcoZcXT9Jt4PN1gjfv8evo1QlJUq9LVRc7K+MICcbHDS/yVzTU5A2No+seUQ2E0vd88ngFFvyDNRilNt5iGC7Gx3KePq+FnMkreBCWYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YysNNPhV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723423356;
	bh=o9Yl88GRdYa0Tf8CKT8WYG+PaxWDkRwNzOvj36oLkdI=;
	h=Date:From:To:Cc:Subject:From;
	b=YysNNPhVEnpC+gePl8N+oZCgNFkz3QC8+iDp4EUUti+ZsM/TjxNdowowjUvte3r/y
	 5EpFYIZusSeiJ1Ap115/Nvyuot3Nl29O0gr94CXjeOEd8/DMUE0UbDAVCMMIhQv6Yj
	 GKG9/nxWB/wBxTgHouGWvNtqTwryUq6anoiafgaEFjNjYV4B5kaE/NfgeMF5CehIGi
	 gmc+70fl7TfWeTTTX0XIbSJzSA5HFLybL21XYAnlB8FiGk1H6smM3HrGy8qBta12Mu
	 GR55V6upAnTwUmNoIuSoWsUgim21FQoLi52TqsD3QyZTmoskfEChQHCU7E0SfAVi6z
	 HW8EbGi6+HC5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Whwhq70JWz4x2g;
	Mon, 12 Aug 2024 10:42:35 +1000 (AEST)
Date: Mon, 12 Aug 2024 10:42:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Bhoomika K <bhoomikak@vayavyalabs.com>, Pavitrakumar M
 <pavitrakumarm@vayavyalabs.com>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20240812104235.6eefb365@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CAn7uTIb=+uwYmIQa8YeFrK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CAn7uTIb=+uwYmIQa8YeFrK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/crypto/dwc-spacc/spacc_manager.c:5: error: "MIN" redefined [-Werror]
    5 | #define MIN(x, y) (((x) < (y)) ? (x) : (y))
      |=20
In file included from include/linux/kernel.h:28,
                 from include/linux/interrupt.h:6,
                 from drivers/crypto/dwc-spacc/spacc_core.h:7,
                 from drivers/crypto/dwc-spacc/spacc_manager.c:3:
include/linux/minmax.h:329: note: this is the location of the previous defi=
nition
  329 | #define MIN(a,b) __cmp(min,a,b)
      |=20
cc1: all warnings being treated as errors

Caused by commit

  c8981d9230d8 ("crypto: spacc - Add SPAcc Skcipher support")

interacting with commit

  1a251f52cfdc ("minmax: make generic MIN() and MAX() macros available ever=
ywhere")

from Linus' tree (in v6.11-rc2).

I applied the following merge fix patch.  I added the include of
minmax.h just in case it was not included implicitly for some other
build config.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 Aug 2024 10:36:30 +1000
Subject: [PATCH] fixup for "crypto: spacc - Add SPAcc Skcipher support"

interacting with commit

  1a251f52cfdc ("minmax: make generic MIN() and MAX() macros available ever=
ywhere")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/dwc-spacc/spacc_manager.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dwc-=
spacc/spacc_manager.c
index 3b26b27a998f..67c4360334e2 100644
--- a/drivers/crypto/dwc-spacc/spacc_manager.c
+++ b/drivers/crypto/dwc-spacc/spacc_manager.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
=20
+#include <linux/minmax.h>
 #include "spacc_core.h"
=20
-#define MIN(x, y) (((x) < (y)) ? (x) : (y))
-
 /* prevent reading past the end of the buffer */
 static void read_from_buf(unsigned char *dst, unsigned char *src,
 			  int off, int n, int max)
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/CAn7uTIb=+uwYmIQa8YeFrK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5WnsACgkQAVBC80lX
0GzB1wf/c//maN1MbBz4zLjJ82Cn94IF8ZQKMXSUNNJuAn/FEvm0Fujg3StoYWJv
bx3tphyZmHne1wMI070gUn41hDwo5yCaMLF5tkQeglhHxdSGkAlV3gUC38GDa8lg
qeJkWRWqpIAUZABfsN6auAusVAPikeIdR/wDK+qZpCUWJU/OvE1zIj6L4H4VjsCu
eor1mW+fNB6Sgd7idPHLbgU8gP5j4TRQUDQdPGYFLa6gfqbNO1oGXx+N/Te7ehs7
sp7ZnmD4sYA1HJqksk4RVg8TptDEqqq3rx50su+iOb+cce4pv0loAJo3jdOiuZch
hwkiJ2qcWJGtDy6BbbLxk+cvv6d9+A==
=9nOS
-----END PGP SIGNATURE-----

--Sig_/CAn7uTIb=+uwYmIQa8YeFrK--

