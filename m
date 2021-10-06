Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9891B42361E
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 04:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhJFDAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 23:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhJFDAX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 23:00:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88021C061749;
        Tue,  5 Oct 2021 19:58:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPK042dBhz4xb9;
        Wed,  6 Oct 2021 13:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633489109;
        bh=Jhl/SqDpiORQIg2zjUrrmWuNtkrEsx2SUDSBTkRA0To=;
        h=Date:From:To:Cc:Subject:From;
        b=WomiCRxTlOlBu6Jk4wQbHEoHyYmCSpquuPwmbyengSSezLrmTbUrnGpv/1mu8/VO5
         3XbPdoOhwhOiaNnr599j6sJT2kS3pjfqqRWPywH+/1OspLcrtRt39uqYW9Ht7IPnhu
         ueihiO4efrmqfl3HZd52FIGg+tqOf8GJv3nLAUJRFajlw0Q5FcuR7ere5RSwMfrcy+
         b1GL216iny3/KowdjuXhX3AQ/xqkFBUra2wkfZbD9WQDDBVzLofO7SpEck2uwX86Q+
         xWVLv6Qv9SAZabVQFNjZ7+4tiyR2V1pFAOFh/02gSgKK+tXf9OTmc27oRxRhZC+od4
         dW4gpz7vOdvFw==
Date:   Wed, 6 Oct 2021 13:58:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20211006135826.3e1783f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nOys+dUYfJ=8h=In4aYRsY9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nOys+dUYfJ=8h=In4aYRsY9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (native perf)
failed like this:

In file included from util/intel-pt-decoder/../../../arch/x86/lib/insn.c:16,
                 from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn_get=
_emulate_prefix':
tools/include/../include/asm-generic/unaligned.h:10:15: error: packed attri=
bute is unnecessary [-Werror=3Dpacked]
   10 |  const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr=
); \
      |               ^
tools/include/../include/asm-generic/unaligned.h:19:28: note: in expansion =
of macro '__get_unaligned_t'
   19 | #define get_unaligned(ptr) __get_unaligned_t(typeof(*(ptr)), (ptr))
      |                            ^~~~~~~~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:44:11: note: in expansio=
n of macro 'get_unaligned'
   44 |  ({ t r =3D get_unaligned((t *)(insn)->next_byte + n); leXX_to_cpu(=
t, r); })
      |           ^~~~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:50:61: note: in expansio=
n of macro '__peek_nbyte_next'
   50 |  ({ if (unlikely(!validate_next(t, insn, n))) goto err_out; __peek_=
nbyte_next(t, insn, n); })
      |                                                             ^~~~~~~=
~~~~~~~~~~
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:91:7: note: in expansion=
 of macro 'peek_nbyte_next'
   91 |   if (peek_nbyte_next(insn_byte_t, insn, i) !=3D prefix[i])
      |       ^~~~~~~~~~~~~~~

and many similar ...

Caused by commit

  a1be25a30cf6 ("x86/insn: Use get_unaligned() instead of memcpy()")

"native" here is ppc64le.  gcc (Debian 10.3.0-11) 10.3.0

I have used the tip tree from next-20211005 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nOys+dUYfJ=8h=In4aYRsY9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdENIACgkQAVBC80lX
0GzYCAf9GRBsvJCUV9XYwU9vfucbJvFHENWK90WRIu36M8SeIYBJ/FfHgMMiHcum
vy2YPH6fWoay+czR4NKq8Td3GIHVdbS9MKTqJm8NGCGPi9h8rY2GoDPOcXRSaQpQ
t90GAPVJz+uDEPvLlMUnNT7f0mWqKCZmJIBSuClpE4YR/OTzgnXpgjCb2EmxE4Ja
k3I+vmXsLxfCSy/ywMqCe7J0xt6E9hqyIXtM8otlPsb+8/LMsyTy4/lzzuiUSyMF
zbt5j7GlUw1GoRiXIhZBCF+zHo8GN1cU3STGA52G8LbcNwV/cjwSGmKK9ilO/8M3
qvIru19mQ5FxOJobxgQl1i1688As6w==
=GKUY
-----END PGP SIGNATURE-----

--Sig_/nOys+dUYfJ=8h=In4aYRsY9--
