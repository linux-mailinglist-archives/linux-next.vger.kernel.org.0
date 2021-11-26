Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6650345E6AA
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 04:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344676AbhKZD5S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 22:57:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:59689 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbhKZDzS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 22:55:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0gmM2r4Nz4xYy;
        Fri, 26 Nov 2021 14:52:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637898724;
        bh=47qKiGYE6zndYn68WhxQuoc8lafdkCvM4pGkn6aL7Ls=;
        h=Date:From:To:Cc:Subject:From;
        b=c1Xr3Tu1RHI8wZTi3hzWetFGHbss31fXVvUBKMML0qAks+b8HFuBOnoRf6QQqqp8+
         e+jXAvosJqAWHXBCPD3TWS2l6xGfyk0a+TL3981hoMUYZn7VEieWiwPMCR5mwYKQzm
         dnVcWHIbZbVBAiYTGt3167NdgSSpN4BtnHl4RosNzead/NaLguSrrSPR8fECudYukC
         4hIdP0+MxYKqMEvGbeDk3UrKHTN6kl9ClVLq/+b8BpGRJTRdEbX7MXVIHpNFmCcSGL
         dAWEDyPzfXWyIidFSvA2/rlka3aFbVb8gSCmkjWlWwK34PaK+KalWqcBDIkIcsqhE2
         oRkUwCxkI1vSQ==
Date:   Fri, 26 Nov 2021 14:52:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20211126145201.5aefa68c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a0+rjBAQWuUJJVMiJ3sua0D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a0+rjBAQWuUJJVMiJ3sua0D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (sparc defconfig)
failed like this:

In file included from arch/sparc/include/asm/futex_32.h:4:0,
                 from arch/sparc/include/asm/futex.h:7,
                 from kernel/futex/futex.h:12,
                 from kernel/futex/core.c:41:
kernel/futex/core.c: In function 'futex_cmpxchg_value_locked':
include/asm-generic/futex.h:17:2: error: implicit declaration of function '=
futex_atomic_cmpxchg_inatomic_local_generic'; did you mean 'futex_atomic_cm=
pxchg_inatomic_local'? [-Werror=3Dimplicit-function-declaration]
  futex_atomic_cmpxchg_inatomic_local_generic(uval, uaddr, oldval, newval)
  ^
include/asm-generic/futex.h:17:2: note: in definition of macro 'futex_atomi=
c_cmpxchg_inatomic'
  futex_atomic_cmpxchg_inatomic_local_generic(uval, uaddr, oldval, newval)
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  3f2bedabb62c ("futex: Ensure futex_atomic_cmpxchg_inatomic() is present")

Gcc version (if it matters):
sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130

I have reverted that commit for today (and the following one).

--=20
Cheers,
Stephen Rothwell

--Sig_/a0+rjBAQWuUJJVMiJ3sua0D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGgWeEACgkQAVBC80lX
0Gzxqgf9FxdG5ADDn6Sp+m7BVc3GzP1C3wdx9+IuiHqmgycDxKCgMrttb/5XOYYp
Oe9mODrl57OjOeKIli8LvdOdnQi2M6SRQT1Wr+1XfzSHbgTj5wmXaZO21s3yweEx
4j+btMAC4pZ1eo8AlZNY9q13xu+006DwgKav0REoQB9gqBtIjgW37VcnVzRsY0tm
8+w6neGG6j3jCB4FedrhAGRCncH6OX4HTTl2Wu72lI9GSQmi/n4tG0tO8JVy6Z9E
owj5xiF6BC9nNG/j2V8+6HsLp+oafNpCiTJu7zA1Zd8+YA8Sb/J95tjOJL15k5gh
n/AoJdpjwgILM3VqMv4cqEHyToIjlA==
=zwFi
-----END PGP SIGNATURE-----

--Sig_/a0+rjBAQWuUJJVMiJ3sua0D--
