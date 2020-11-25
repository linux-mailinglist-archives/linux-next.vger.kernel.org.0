Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869DD2C3D2B
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 11:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgKYKFq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 05:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgKYKFq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 05:05:46 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBE8C0613D4;
        Wed, 25 Nov 2020 02:05:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CgxNP5HyXz9s0b;
        Wed, 25 Nov 2020 21:05:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606298742;
        bh=EVH3mvODQBqZq0M7jN0aoZNwnA4Y1ST/tLME2rUzbjY=;
        h=Date:From:To:Cc:Subject:From;
        b=cgFO6ucHhD7LpJE2rXWCrP9vnTxyQteYukTYmHRYh4E89eXYsAx0zUMXnwK8VBxGs
         8V1irPhpnAuwIsB95NeUFxuaVe9s+JC9HHvzorMsKq+d8CLKcpMogyIg8GllKPL5jE
         zISzeXjc85cT8F6H93Qxjf/PSm77KRv9cQg/3k+J3lgtlcBHFmq4CcIQOs0V6D3J9v
         knolAfjqHF9NO/s2JXFhQ6BL+dLSgABG/shYE4MMGnZ0P/xyoes635ABxIfHQiCMe/
         RihKR8S44erf9hllnQcsiuyDrTSGVb6EMnyaJmR8BKO6BjI90F+D3fSW26yWHX7TYS
         CrTRe8nTrauVA==
Date:   Wed, 25 Nov 2020 21:05:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Message-ID: <20201125210538.03e789ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IsZIQ40k0k86dmu.cJPSN2c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IsZIQ40k0k86dmu.cJPSN2c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/Kconfig

between commit:

  5a3a47bf8367 ("orphans: Hoist '--orphan-handling' into Kconfig")

from the kspp tree and commits:

  84d8b3661cc9 ("arm, arm64: move free_unused_memmap() to generic mm")
  46b9b00649f6 ("arch, mm: restore dependency of __kernel_map_pages() on DE=
BUG_PAGEALLOC")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/Kconfig
index 313b2bc0c475,9ebdab3d0ca2..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -1062,15 -1035,12 +1069,21 @@@ config HAVE_STATIC_CALL_INLIN
  	bool
  	depends on HAVE_STATIC_CALL
 =20
 +config ARCH_WANT_LD_ORPHAN_WARN
 +	bool
 +	help
 +	  An arch should select this symbol once all linker sections are explici=
tly
 +	  included, size-asserted, or discarded in the linker scripts. This is
 +	  important because we never want expected sections to be placed heurist=
ically
 +	  by the linker, since the locations of such sections can change between=
 linker
 +	  versions.
 +
+ config HAVE_ARCH_PFN_VALID
+ 	bool
+=20
+ config ARCH_SUPPORTS_DEBUG_PAGEALLOC
+ 	bool
+=20
  source "kernel/gcov/Kconfig"
 =20
  source "scripts/gcc-plugins/Kconfig"

--Sig_/IsZIQ40k0k86dmu.cJPSN2c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl++LHIACgkQAVBC80lX
0GzOjAf/YApd6y7QuCyD0ivXjmyVqGgAJUNoFg7qjtxPEmfVfFC1bTjnt5g2wlyQ
bHHSZ48gRrooMYhHldbfJh1GNZuPtGcRYgTELmnn5KBw40wIDWCi0XHy9WoC5R17
PdpxcyzLKHjRX39Z+K+oJV7xdn/k7m6EvJ6AyBnlQBjHI3dAxqsk+w2Vo3NWMWzo
H/1oTBPUYlTr2jBl6Sp/UO09kWQeZlFKFGvNzE3e3pJhqvhcA+TFPZyPUmaje2YS
SyfIDxloduDsdQGY2Hh4oz2WKe/sAoFOJ+MPOnQ7foYb1rfOJs49Chi/5o12QtF/
93jpLRQ469u28Mjsrdwt+T4dXBiEog==
=6aOT
-----END PGP SIGNATURE-----

--Sig_/IsZIQ40k0k86dmu.cJPSN2c--
