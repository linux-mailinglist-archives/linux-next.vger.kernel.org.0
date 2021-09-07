Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FA2403165
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 01:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240690AbhIGXIc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 19:08:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347536AbhIGXIb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Sep 2021 19:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631056043;
        bh=XVo6xpENuD6dmn0WJoe2yb4P18DghCaRXFxdjCks7U4=;
        h=Date:From:To:Cc:Subject:From;
        b=ARdhhYkH+haYbnWLbjEKTT5x8jQBsjLbu/dsB51WRhOZ9lWaakDCP4JN0ic4uffta
         VJY/aONqC69vBIZlCbnsB1beP62MAeiKni+olL3PjWrhnqAD7Z8qzmvW/4IRg3HUKR
         uE8KBvMvaDe8yY0Z8yaKp1nVGDA9EA4DQk/rsjDXiyHBX3szxMs1wQEV7yygXTUSAM
         W3i9OWrxLhgqTx2v93v+1ntt2f4hslajjTTPM41JbeKlTWNaDNpiakbW+AqQ62H5xQ
         AuUQSSrJXKvhXngve1OeYSH3DKm+Vs+YBmhKMnK1117d0tKcGpA5sKM13Ct9rCJ346
         Ubt4QjHzSI2qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H41BK3JVhz9t54;
        Wed,  8 Sep 2021 09:07:21 +1000 (AEST)
Date:   Wed, 8 Sep 2021 09:07:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20210908090720.0748b861@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PMX9wECH8ThNTXGuo86an/r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PMX9wECH8ThNTXGuo86an/r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (mips
allmodconfig) failed like this:

In file included from /kisskb/src/include/linux/compiler_types.h:65:0,
                 from <command-line>:0:
include/linux/compiler_attributes.h:29:29: error: "__GCC4_has_attribute___n=
o_sanitize_coverage__" is not defined [-Werror=3Dundef]
 # define __has_attribute(x) __GCC4_has_attribute_##x
                             ^
include/linux/compiler-gcc.h:125:29: note: in expansion of macro '__has_att=
ribute'
 #if defined(CONFIG_KCOV) && __has_attribute(__no_sanitize_coverage__)
                             ^
cc1: all warnings being treated as errors

Caused by commit

  540540d06e9d ("kcov: add __no_sanitize_coverage to fix noinstr for all ar=
chitectures")

This ia a gcc 4.9 build, so presumably this?

diff -ru a/include/linux/compiler_attributes.h b/include/linux/compiler_att=
ributes.h
--- a/include/linux/compiler_attributes.h	2021-09-08 09:03:35.169225661 +10=
00
+++ b/include/linux/compiler_attributes.h	2021-09-08 09:05:47.790907780 +10=
00
@@ -36,6 +36,7 @@
 # define __GCC4_has_attribute___no_profile_instrument_function__ 0
 # define __GCC4_has_attribute___nonstring__           0
 # define __GCC4_has_attribute___no_sanitize_address__ 1
+# define __GCC4_has_attribute___no_sanitize_coverage__	0
 # define __GCC4_has_attribute___no_sanitize_undefined__ 1
 # define __GCC4_has_attribute___fallthrough__         0
 #endif

--=20
Cheers,
Stephen Rothwell

--Sig_/PMX9wECH8ThNTXGuo86an/r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE38KgACgkQAVBC80lX
0GyO5gf+ImLfhQQJv9/bNGZrKSWwuix3UXeToczkl9cZ2IsxhS8XVjmWeZY9nXYk
LQouQ9eziyn6pF0t1rPW0PyBYkydYhRujoj8YOIIouGflrTd5zhz3dKUNXwQWhVp
Avse/4oVMJmF32j3tq3PxEYFGoe4usRYAc9PvcVS/H93QZyuy4U7LktlITaaWCck
EzoMrqRC4J1sN6PtIadoKfkQmDBopUejx7EQoTU6A4ZtiY8KYoi0eMjpQzt6cI3z
T5rE1ZbHtkga6S1glhk2h0r3Ygq34tzxOAQe5x6i78t+xp8c1+xl8P0De6mHJOAQ
npfBzuUP1mGcqFP2HnPj2PS7prla4w==
=f5vo
-----END PGP SIGNATURE-----

--Sig_/PMX9wECH8ThNTXGuo86an/r--
