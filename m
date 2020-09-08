Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F05260E85
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 11:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgIHJSE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 05:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgIHJSC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 05:18:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECF6C061573;
        Tue,  8 Sep 2020 02:18:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bm01K6s9tz9sSJ;
        Tue,  8 Sep 2020 19:17:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599556678;
        bh=AGqEGVdDSR1eqYULm9R1gdR20ZUjvSYppBbyTkjhNuQ=;
        h=Date:From:To:Cc:Subject:From;
        b=UAB5Nn6ZKRMMT/n2ydNQyNCrC093HVGctdYGM0sf2FIl90qVSjopjx2Udls3bbuES
         dMo+xlN7jhLrWI7kAgjIp83gL5kBcp20GqrNx4bU0oppTra/cQUnnBQdphqiBa5epk
         Mzl6Q4ZnZpyRXaa3Bc0nmWBP3U20J1+1Ozaizxd0eGm3WOmyxNczrleWcfIk8Go9hL
         deSdsO5hhI/AyZnMp128M8fhRfoazAk84KZOocxaFNwiUeaM4f6JttwTVLbUmNoVnc
         rXd+UGwri/p1BDdrfPyIMAAiyGy0neHNQNhvZ323T9oNvVWpomUN0Wn54oqTrLfqJ5
         zlVC66dADcDzw==
Date:   Tue, 8 Sep 2020 19:17:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20200908191757.3ff97cc4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G.7l04rUbkLX=soO+HJtrp_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G.7l04rUbkLX=soO+HJtrp_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  .clang-format

between commit:

  4e4bb894467c ("clang-format: Update with the latest for_each macro list")

from Linus' tree and commits:

  7008a2f408a3 ("memblock: implement for_each_reserved_mem_region() using _=
_next_mem_region()")
  203287621da3 ("memblock: use separate iterators for memory and reserved r=
egions")

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

diff --cc .clang-format
index badfc1ba440a,a118fdde25c1..000000000000
--- a/.clang-format
+++ b/.clang-format
@@@ -269,8 -267,7 +271,9 @@@ ForEachMacros
    - 'for_each_process_thread'
    - 'for_each_property_of_node'
    - 'for_each_registered_fb'
 +  - 'for_each_requested_gpio'
 +  - 'for_each_requested_gpio_in_range'
+   - 'for_each_reserved_mem_range'
    - 'for_each_reserved_mem_region'
    - 'for_each_rtd_codec_dais'
    - 'for_each_rtd_codec_dais_rollback'

--Sig_/G.7l04rUbkLX=soO+HJtrp_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XTEUACgkQAVBC80lX
0GzHKwf/SuC435HV4tJqICQxuHms12++D0vU4hzcc8tNzYT58BP4bNI97a3gnEjh
XW+z6RMGEkmgURJmPo0XHmXIajuRCGyVagZlZ1Y4csT7oQvTWvvabDBnZGVpHDIl
a9qpaMUA4AEOgrUqJjPJTDsnIyHipx8WmoKftL9xYsfls3IHmZvB/d46UmcP2eq+
8q9aNNLtl958L3D3N2pdSo1SWu1x0yNyb4yN7uIMDrVuuCinYiNOt475Qyo0WQgN
YRsHPiZTUESVcu50u6J6EPSq5oM5rFoxI+4oDkxqPxa6ui259X+Pt5vfAl2nuqV6
DeXjlJWF0WybzhHrUvn+jYTHycSZSg==
=zZ9E
-----END PGP SIGNATURE-----

--Sig_/G.7l04rUbkLX=soO+HJtrp_--
