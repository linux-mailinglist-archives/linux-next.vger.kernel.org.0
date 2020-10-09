Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1B8288152
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 06:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgJIE2y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 00:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbgJIE2x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 00:28:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C77CC0613D2;
        Thu,  8 Oct 2020 21:28:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6w7M2Lrhz9sRk;
        Fri,  9 Oct 2020 15:28:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602217728;
        bh=2Xg2v30A+wUoQbYA2psCGm28W1qa14kbfkT/zV+rz0I=;
        h=Date:From:To:Cc:Subject:From;
        b=E+bKGryPGAXmECCxQLY4lwH0BdzDmPuJS3yvg3B+lRie6e+btkaYGeLkoeucToOBy
         H1JsXeFePr7opGMey4wX4/opTCHL+mibhM37TW7s1Uw5t4+oO6UT5cktGzH0Xn3k2i
         637WaXDO4EK895sR9ZyjH3E01ogdl8SiY+iwHugjQZtB27RfKpeJA6LglHKMnMbjK7
         dTH+0mTdT0Zltq+XE2nqhvsL9XpHW3vlR9j4rTHlFneAczPUAh7JSXI7huzTce6J8+
         B83JHXihbATcwVbHKllhTDlytH9zxfokHzUX328fu0PEwX5Quw4CKLf/tZywtLe8Ck
         P3FECmvQ939NQ==
Date:   Fri, 9 Oct 2020 15:28:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20201009152846.072e6bbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D8pWvJ1NJO5SiQ1GCGu+IE4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D8pWvJ1NJO5SiQ1GCGu+IE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (perf) failed
like this:

In file included from tools/include/linux/build_bug.h:5,
                 from tools/include/linux/kernel.h:8,
                 from util/intel-pt-decoder/intel-pt-insn-decoder.c:7:
util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn_get=
_emulate_prefix':
tools/include/linux/compiler.h:37:38: error: nested extern declaration of '=
__compiletime_assert_0' [-Werror=3Dnested-externs]
   37 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^~~~~~~~~~~~~~~~~~~~~
tools/include/linux/compiler.h:16:15: note: in definition of macro '__compi=
letime_assert'
   16 |   extern void prefix ## suffix(void) __compiletime_error(msg); \
      |               ^~~~~~
tools/include/linux/compiler.h:37:2: note: in expansion of macro '_compilet=
ime_assert'
   37 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
tools/include/linux/build_bug.h:39:37: note: in expansion of macro 'compile=
time_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
tools/include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_B=
UG_ON_MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:27:3: note: in expansion=
 of macro 'BUILD_BUG'
   27 |   BUILD_BUG(); break;     \
      |   ^~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:40:41: note: in expansio=
n of macro 'leXX_to_cpu'
   40 |  ({ t r =3D *(t*)((insn)->next_byte + n); leXX_to_cpu(t, r); })
      |                                         ^~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:46:61: note: in expansio=
n of macro '__peek_nbyte_next'
   46 |  ({ if (unlikely(!validate_next(t, insn, n))) goto err_out; __peek_=
nbyte_next(t, insn, n); })
      |                                                             ^~~~~~~=
~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:86:7: note: in expansion=
 of macro 'peek_nbyte_next'
   86 |   if (peek_nbyte_next(insn_byte_t, insn, i) !=3D prefix[i])
      |       ^~~~~~~~~~~~~~~

Caused by commit

  2a522b53c470 ("x86/insn: Support big endian cross-compiles")

I have reverted commits

a23b701ae9b3 objtool: Rework header include paths
1b4998c364bc objtool: Fix x86 orc generation on big endian cross compiles
317664a7fcc9 objtool: Fix reloc generation on big endian cross compiles
2a522b53c470 x86/insn: Support big endian cross-compiles
2486baae2cf6 objtool: Allow nested externs to enable BUILD_BUG()

for today.

This is a PowerPC LE native build of tools/perf.

--=20
Cheers,
Stephen Rothwell

--Sig_/D8pWvJ1NJO5SiQ1GCGu+IE4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9/5v4ACgkQAVBC80lX
0GwuHgf/bNF770bTmccxD7Bb7XHLgwE9t50XM5TA1Rh3qyoosyt4D2I1EfyJQhuJ
Nq3uOMRMQyqWyYu53sbHZhyb4rMFdcZzrG0iewDFHLKw7pZ/BCxzsO1GGaJC4h6v
QKOF5IQJOX+Lj3Iu55+rSXycSmfJpur5ECa6BaNfWGZVfrXf8Zba14eloWScmNvb
UknSJtNK4ftW6tEpy/EeKUPvCIMlMO9yJ9ho6kwNTT4znRTBs7ltdu4KbMUSHZB6
+VJwRPQ+0ParZW0QGwjjHkdBgO/sSBCx9Mj1P9pw9lCj2cVtepIyaggYevkJnMhG
fe8i5FbZbYA/4r2T3kTc07S2WqLHCA==
=QJTb
-----END PGP SIGNATURE-----

--Sig_/D8pWvJ1NJO5SiQ1GCGu+IE4--
