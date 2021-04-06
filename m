Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF333550C4
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 12:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbhDFKYI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 06:24:08 -0400
Received: from ozlabs.org ([203.11.71.1]:53635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242822AbhDFKYH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 06:24:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF3XZ0gSDz9sRf;
        Tue,  6 Apr 2021 20:23:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617704638;
        bh=wDsHwub8QgSBJxgvRRqiViNJPtiJvq37Agg04BcbE98=;
        h=Date:From:To:Cc:Subject:From;
        b=XGCxaZoLwmBJYuQ1RgOZzLuwL74Mv+ZsfQnOG7IaMNjq61EAXJiGQr1vUvCWUJ1ZJ
         C5Mbj3JbhrS0rlbMCZ1+9qbq3uRHLeXPxT+BDaWHv/fAf+noHZJfj67jH3nfJR71Os
         hgry8+RJpqcU2Q8IGpGWUe6K5rzSxB/Yfk2omsfUvsaNMM/XmifnJNWVuyld7vzBq/
         jZtCsjvvE32GErPwcsKitFNawuBsZZHvznnBGlZ/dEi2M/teNtJajRaNJz5u0UuOb9
         JWJ8G2Vs9xyvkorx97WqzCqWjLVnnuaQuGVUwPrG+zdt6IQEudc7/4j5A65vAgS+De
         UQyxoVjta/4rw==
Date:   Tue, 6 Apr 2021 20:23:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Uriel Guajardo <urielguajardo@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kunit-next tree
Message-ID: <20210406202357.6e4bfeac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=T_ib+94GGfTFOoIkRfFNpU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=T_ib+94GGfTFOoIkRfFNpU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from lib/kunit/test.c:10:
include/kunit/test-bug.h:22:28: warning: '__kunit_fail_current_test' define=
d but not used [-Wunused-function]
   22 | static __printf(3, 4) void __kunit_fail_current_test(const char *fi=
le, int line,
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  359a376081d4 ("kunit: support failure from dynamic analysis tools")

--=20
Cheers,
Stephen Rothwell

--Sig_/=T_ib+94GGfTFOoIkRfFNpU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsNr0ACgkQAVBC80lX
0GzCyQf+JWPthkccXmFRVH2yCZ34mmdkAXjTND2FEkYofOpV+vkqoIr/O/bI73tT
AAD3fKs6nRenf2qkeC8OM+4Ur2f8cE/P6UdAANdnBFU+tEI8YimR0zgXdgCY0RFY
dw8XBGMQMzWerOx51d1wBGEGxRUqSVhC4xXEbGDjFh8Nez8saTQPu9jrIvO7CFnm
hFF36TLT9xw8KfhHhalrCGvs/cUpM/z6JV6dYqx96kNk3T+CbrHmLpP0Fz3v1f36
fetmaJoIDVv2LVkvrDjYCSPiULL8nhOpHfakd9gpBZDrG51uV37ZqFzBRd9vI4Fs
ZNC86RlbcdkxVXDMthN7fSWpDrRNQQ==
=qU0Q
-----END PGP SIGNATURE-----

--Sig_/=T_ib+94GGfTFOoIkRfFNpU--
