Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296CA29A392
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 05:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410303AbgJ0EOV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 00:14:21 -0400
Received: from ozlabs.org ([203.11.71.1]:38317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409144AbgJ0EOV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 00:14:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKyyK6cPvz9sSf;
        Tue, 27 Oct 2020 15:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603772058;
        bh=rsrwykZOm6mK2oNlLyZNUlllqMRFmVln36Mi00ayYEU=;
        h=Date:From:To:Cc:Subject:From;
        b=DT5410Jt+hmUPVWQ3hjE2gnzniPLfY09LbthC9VJjjLZS1BJPGMOPLLf323rmdzEN
         sWHmqL+829EgsKsYe/2LGsWc/46L9ePj+bADrkcaz25HpAO/fQQHeHSn1yz3ZcUoqf
         ts1wnBZeHlDgrwlj7FHXXhCDKgpob6UV2MmeCXJdWlqxjh7C8GyJXUR6hczh+my+F8
         PSUm69QB4B6yrb34HuqBrTD+lBjvtZ+dIaInxmoXqLeXwkED6dYk6AHgZxkdsaopG+
         Od25on3dwCreiLMTaVsoEATUG5327G6p4s+i0lj2kmE7OQq0JouryZdu88qzoW4LNU
         940jFgCHsLUXg==
Date:   Tue, 27 Oct 2020 15:14:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20201027151414.2018d5fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QoF3YFnjo6+B0lit25a/DUH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QoF3YFnjo6+B0lit25a/DUH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (sparc_defconfig)
failed like this:

arch/sparc/lib/memset.S: Assembler messages:
arch/sparc/lib/memset.S:149: Error: Unknown opcode: `ext(12b, 13b,21f)'

Caused by commit

  0e0bbae08a6e ("sparc32: switch __bzero() away from range exception table =
entries")

merging badly with commit

  7780918b3648 ("sparc32: fix a user-triggerable oops in clear_user()")

from the sparc tree.

The sparc tree commit above appears as commit

  80537bbf19d6 ("sparc32: fix a user-triggerable oops in clear_user()")

in the vfs tree as well.  The patch adds one line which is later removed
by commit

  0e0bbae08a6e ("sparc32: switch __bzero() away from range exception table =
entries")

in the vfs tree, but the git merge puts the line back again :-(

I have added the following fix to the vfs tree merge

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 27 Oct 2020 15:05:28 +1100
Subject: [PATCH] fix up for merge of arch/sparc/lib/memset.S

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/lib/memset.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/lib/memset.S b/arch/sparc/lib/memset.S
index 522f45a952a0..eaff68213fdf 100644
--- a/arch/sparc/lib/memset.S
+++ b/arch/sparc/lib/memset.S
@@ -146,7 +146,6 @@ __bzero:
 	ZERO_LAST_BLOCKS(%o0, 0x48, %g2)
 	ZERO_LAST_BLOCKS(%o0, 0x08, %g2)
 13:
-	EXT(12b, 13b, 21f)
 	be	8f
 	 andcc	%o1, 4, %g0
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/QoF3YFnjo6+B0lit25a/DUH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XnpYACgkQAVBC80lX
0GwlDggAoQj7uYZQaJ/tHfcYI1weowF4kSPPbGOEEWNwYTuJGeF7mkdZaor+Gaza
h7ns0yQVFEAElx0QV488clX/qDRmIfdVPkSkiS4Y1HQaPGBvyZ9hB+DUIAH1bFrZ
TZjc1gg+2/b+I+27MkaeJPBn3TKxDJSIEs5cDRMfVxAM2Ljeb25cF3FWn0LZGhe+
8QZ4Y3q4BJv95YFVwVDZQoadHTG6Pp+UAcQD2egwRFQHEesn4LAwFYv1LqSuxIv9
MkMiN/fz7S+abtCCR/lN8IbSDmog97tnjZBxLBuSbF+Jj/lcweuC6kSn0/wp13Rz
1/WQDiH3cOPr7KPZpT+IqBwV7gJReA==
=oYP/
-----END PGP SIGNATURE-----

--Sig_/QoF3YFnjo6+B0lit25a/DUH--
