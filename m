Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C9D25A494
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 06:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIBEbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 00:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgIBEbI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 00:31:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45887C061244;
        Tue,  1 Sep 2020 21:31:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh9x26YwLz9sVM;
        Wed,  2 Sep 2020 14:31:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599021064;
        bh=LYXE/eRHSYQwf1yYG1qPpZSA6Bga2Hru1cXsS3OFbrA=;
        h=Date:From:To:Cc:Subject:From;
        b=U0dn4rqn/9o/qT8zpjzh1Cx0eeDJ/58nxLhM4zRtOs93q8RuTGZX46OPtJL7jvfe6
         sLV+qw0X9l4bvBJHZR9G3U0xitBNVx3uxbqeuCaZJQEx8Fgtt5aOaDfpKnmDfqoH/U
         0AYbQo7xmDgHiYvAcv9dQxFws0Gvf2/SOvbzC5N5EutEn6CpxX43OS76s1zIFqtlZA
         856n2Z0xbz16XvUX4sRWB72nqTb+DmiaYZBxx6QvSgsp/HMnGTA3NoLrCUIhYbzAJ9
         aT/pQ1/7Sgkl8Dr3lHWY24AOP5+8dpqkhxeBs7++aM5FhaNVPeKJS4ECASmc4wuvye
         kiipVNEMYwy9g==
Date:   Wed, 2 Sep 2020 14:31:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     SeongJae Park <sjpark@amazon.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the jc_docs tree
Message-ID: <20200902143101.4ea59943@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SHXcAPSjBpQylasw0XSay3G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SHXcAPSjBpQylasw0XSay3G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  Documentation/memory-barriers.txt

between commit:

  537f3a7cf48e ("docs/memory-barriers.txt: Fix references for DMA*.txt file=
s")

from the jc_docs tree and commit:

  6f6705147bab ("docs: fix references for DMA*.txt files")

from the rcu tree.

I fixed it up (they are preety much the same - I used the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SHXcAPSjBpQylasw0XSay3G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9PIAUACgkQAVBC80lX
0GyYDwf9HL0CcBNj2gvncc6m0Td7K6AuLEUlshix/SsSejxwRVv/YPnuQ/qfMPi9
u8XEQFalv9tr10J0XElsRP+x3+58aDRv3yzO70j6m2cKhGEgtABX8Q/wf1wtJVEv
VxzazvAnbyuR1eLthvDi3WncwGbgFFygUcN6meto24JyW7s5R6DsxonSSBImI0rR
8jECC50nwg2da4aWHHgVSjDyYEtw6G6HC/dReLt4VUYDp2Cwa1ZI7dXfHJJeD7Vt
xfthCT5RJQAmIbys4CJr//SvBM+JkUCOqgQVpT/SeNZW7ivuBkhRlny1nfwCKLpT
DdWwL98ZwYCggVPIh+E4u7S9DHnj9Q==
=ouqH
-----END PGP SIGNATURE-----

--Sig_/SHXcAPSjBpQylasw0XSay3G--
