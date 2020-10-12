Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9928B08A
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 10:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgJLIsZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 04:48:25 -0400
Received: from ozlabs.org ([203.11.71.1]:49475 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgJLIsY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 04:48:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8slV0YsDz9sSG;
        Mon, 12 Oct 2020 19:48:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602492502;
        bh=H4vsbFQ4YopxQ5AsbArAUhsvvaJoJSd4wrTnXiDX+Dg=;
        h=Date:From:To:Cc:Subject:From;
        b=idDJClWniaUMPHw5AnhT7ektZyNKqkFQ25ytkDHwk80+kyixNeC/kDCglrDI18a0Y
         7fLfKHhmAG2X54fdzhgkqjqJgeo+0a4zSkh6SpFKX2REE6eK4zklTxFfEEaja6iTCZ
         BrN5nMhJUxf6Wm1CQiP28/+VMYyJHtnE1Ywt6eP2+HWu6nrZl/E3sacGSBtRMIsVvi
         A5Bm8GPQ2KnDcCZ0BxMOiKCoAGb4+rDQ9IbvsFtIPx0W9DsQCl1aCMcYiTehGCNcxX
         fDHkEO4FIqU7Ff+ylI5gVFVRehkNF1KUWqpU/w+wtcnF+889RisUat+i0eU7TzD9qd
         TfHAEiGUPJfDA==
Date:   Mon, 12 Oct 2020 19:48:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the counters
 tree
Message-ID: <20201012194821.4eeaffab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iC91Bsy9=Gzl=cvGn4n4xPL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iC91Bsy9=Gzl=cvGn4n4xPL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Makefile

between commit:

  37a0dbf631f6 ("counters: Introduce counter_atomic* counters")

from the counters tree and commit:

  ed7f5253e189 ("mm/page_alloc.c: fix freeing non-compound pages")

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

diff --cc lib/Makefile
index 95b357bb5f3c,1c7577b2e86a..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -99,7 -101,7 +101,8 @@@ obj-$(CONFIG_TEST_BLACKHOLE_DEV) +=3D tes
  obj-$(CONFIG_TEST_MEMINIT) +=3D test_meminit.o
  obj-$(CONFIG_TEST_LOCKUP) +=3D test_lockup.o
  obj-$(CONFIG_TEST_HMM) +=3D test_hmm.o
 +obj-$(CONFIG_TEST_COUNTERS) +=3D test_counters.o
+ obj-$(CONFIG_TEST_FREE_PAGES) +=3D test_free_pages.o
 =20
  #
  # CFLAGS for compiling floating point code inside the kernel. x86/Makefil=
e turns

--Sig_/iC91Bsy9=Gzl=cvGn4n4xPL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+EGFUACgkQAVBC80lX
0Gwt8Af/WjLVWjWjtWIcwDqatfmMEEktFsFnycAftFOI8JW681tHJlRHZ7XGVGDG
sUV9yKCzwr8E6pLD/3lug15jkjUhPCuskpw7zhliwERqJBDa6YfgLefs9nPcW4ED
Vmb8Epq2uniEbcaOVNib5z/M587i/zdeDMUJmICYb9B81mCbOTD9QosFTtE6KnMG
wh3J/yPzFnqtDhVHWgmfs3wEbxkliq8Ok2tUAYinLC/SH2jRSjyb7tirChiUVgEj
d7LGeCD3Wwogr5YkhDwryjyIJ8AzpwZJq6xM+6CCw7nWNY91mvrcDM+SGsucO1es
np9gIX5MfXKIgscCi/MtniVmgOZ3cQ==
=UmWN
-----END PGP SIGNATURE-----

--Sig_/iC91Bsy9=Gzl=cvGn4n4xPL--
