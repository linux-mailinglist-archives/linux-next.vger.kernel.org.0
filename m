Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB1A26BB42
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 06:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIPELp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 00:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgIPELo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 00:11:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2C6C06174A;
        Tue, 15 Sep 2020 21:11:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrmrB6m90z9sTq;
        Wed, 16 Sep 2020 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600229499;
        bh=NCnOfZS9txRkfq335KiZCBOpEvYrpQ9/fSYkc1PlLgE=;
        h=Date:From:To:Cc:Subject:From;
        b=pybg5GqzkV8AIMUVYkOX7oYETJksm0DpqZeYD9T5EAONeiXqT09UZYITjjS1NjtYP
         rwtLFxzElHOp0FgLjX9SXJ0/3DMIf5Ik04way9kqVEO7Mwuh0rHjlh0dWf9jw9fn9s
         fH5h8oUEw4MpcslQX8M+MfowDzHAgI0B0hL6qK/dvGHJQQG4GtHsskwjiei7OylIYd
         MtEJVvYKWdMQ9I9tW8pCellLiqLbHQWMm/xruUHey+Ioiyn9Z58DFPAH/oTI166PvZ
         mNNZGbrbuzdABVUfsAKRnyP+9yCROnmTzrtCv5RGqtqW8oQr8XIxxwyx7HnUsJiVKj
         bnhKe1FIeVylg==
Date:   Wed, 16 Sep 2020 14:11:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Message-ID: <20200916141130.398aa2a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vxseJ=fnbht=IjELBYlUJ7.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vxseJ=fnbht=IjELBYlUJ7.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/Kconfig

between commit:

  b7176c261cdb ("dma-contiguous: provide the ability to reserve per-numa CM=
A")

from the dma-mapping tree and commit:

  c999bd436fe9 ("mm/cma: make number of CMA areas dynamic, remove CONFIG_CM=
A_AREAS")

from the akpm-current tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vxseJ=fnbht=IjELBYlUJ7.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9hkHIACgkQAVBC80lX
0GzixAf/UIv2ZnuPGuKI/0X3MPgcqv+llNphg1PEJqK91yUPnxpobznXqIZiB3ep
ctir8Ohno8bJgck2SbN49MFiTyw1FNPAbmcTA/BgJ/G4hMg93wEdCw/s/Fyhe5nJ
jM7hUFHRh/6sh/nkdTNArQ3CnTVmAWD5Nxv5epGmCoLoUsagp5l4oNSk6PhBE7+K
1Jhu8RjqRL/BXdM7pls/2XskAFB9Cr3V6z+Axl4zmst0k1H55ik73yC51G7iW6DZ
yUf36kZdwYSGNMQiP/evZ22wXZHGKLOoeQ+zCpF0Fzj61TS2Sws0kLhnb51IDri4
hzKGhHgAVhimEQPtQ051Lf3kfqaQww==
=LZzK
-----END PGP SIGNATURE-----

--Sig_/vxseJ=fnbht=IjELBYlUJ7.--
