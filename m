Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484EA1C0B41
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 02:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgEAA23 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 20:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726545AbgEAA23 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 20:28:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46232C035494;
        Thu, 30 Apr 2020 17:28:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CtQL0qdKz9sSG;
        Fri,  1 May 2020 10:28:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588292906;
        bh=wyr0EIFFtRtJ3v7Vy8yjcCiv3PyNEKGRKEJwlRwtFuI=;
        h=Date:From:To:Cc:Subject:From;
        b=Sr5ind3o+NAHaRAxhFjtclqPHns1I43ZBj03J/b0uBP1ujAsae2xf7rsvfhcqjeSi
         cG0Xry7kgE1bn9SR7CWFdC4q+l0VCDdPq2vdZHZ0QTCZ54/91C84fjuDOqQG2cM9zC
         WSMLJvoBnOaM14vjGZYtdGAdlPdNgZuwkHmmFhYfAFHzCbqMwA+VpjwyZxET75/MN7
         K1hR+IrroLfbK9zgTxk+MIji5N0Zfad5Hp6GTDGTOvZsuCL5DrEugRECIrJKKqWVM4
         j5oem0P8KI7y932QaqlS1TZrzLjvur09QcgdEg3HzcE4FAejbfARr3XTDb2kGcJV7i
         WjBVBvAqcskXg==
Date:   Fri, 1 May 2020 10:28:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Filipe Manana <fdmanana@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20200501102825.431f9cac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u+WjmABmJRStqA62JTl0CIv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u+WjmABmJRStqA62JTl0CIv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/tree-log.c

between commit:

  f135cea30de5 ("btrfs: fix partial loss of prealloc extent past i_size aft=
er fsync")

from the btrfs-fixes tree and commit:

  e94d318f12cd ("btrfs: fix partial loss of prealloc extent past i_size aft=
er fsync")

from the btrfs tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/u+WjmABmJRStqA62JTl0CIv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6rbSkACgkQAVBC80lX
0GyTgAf+JGsYlNfIbv5Ya85HB01TEp8GDkHTonserEV+GRkJeJAfBJM8k8mm8dF2
RJv1Gx+P+XsywSaDTPX1ofZvkBbHyrtehudrw4+Hl6C9CzYujnYs8qWWyR87sS9i
O2FkxnyK/EsZWpZl231o0gE7niaHJKI2uwZbcb9DLeyeFMjQXoXr87SoCLwuTCxW
G5AggvrFxOWqt+0/mJKFhIubW3LY6GWJRikMNWpw6knJouoiRQxCegSToGSEjfVl
Wt0ZOEhgx8mTOPcRWDqrqSUk6ePIbq13Uh0DkAvCq3ffDIEvIQ8UwQRkHrIuF8sh
6E3rdonbhq0E3aGa4YT/sMSA0qNdNw==
=IaXQ
-----END PGP SIGNATURE-----

--Sig_/u+WjmABmJRStqA62JTl0CIv--
