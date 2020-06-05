Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC2A1EF121
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 08:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFEGEp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 02:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgFEGEo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 02:04:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB22C08C5C2;
        Thu,  4 Jun 2020 23:04:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dXDC033mz9sT6;
        Fri,  5 Jun 2020 16:04:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591337083;
        bh=IxD/KjQzmugqC1Lw/ByIZnoKJ1TYssHUN74KIWjvUZc=;
        h=Date:From:To:Cc:Subject:From;
        b=o1R3fweAic9kApIHyRHlzUTOHqjD49iUrXJZBGPQbrsuJA7eqEPRw5Gvm6tsYUkH8
         dVWV3vCHuBHaGgbzRVbLgMnM12hKKXSQyY2oMOUHBc9jeye534MmU9E5vY4KWsr5+Y
         WiMOSMcJLEb5YmAM47fV/oZ0lPRfUN7hb/g5zlYpw9/NL5YiZWuX8jhuoivpDcmxK2
         ho8DhZJKI3OMQSgUkFBv/1ccZh0+bXwJvDXxU1rlkENsfWacK8hYFKE94Bf9kY/kvI
         FMVdhX9XRVXamYw//JkZFYTqr6FRRUjGkKaCFJF0sKiwosN1QchbiWinsswvdscqM2
         BywlYt6+ItsOQ==
Date:   Fri, 5 Jun 2020 16:04:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605160442.3f358bfe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0aow0+FpCJEkOykuULhok=j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0aow0+FpCJEkOykuULhok=j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/sh/include/asm/pgtable_64.h

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and patch:

  "mm: consolidate pgd_index() and pgd_offset{_k}() definitions"

from the akpm tree.

I fixed it up (the former deleted the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/0aow0+FpCJEkOykuULhok=j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z4HoACgkQAVBC80lX
0GwvYgf9EJNxdHQQHiyLgk0UpP8XEQW54nPi98kEhlMsCA6brjPItlC7T3PbsG97
0IuHkQPR8bOAFJCQNOY2NY6IFXiJoCBxvJjF6gGMNrGik35ArygvDm+5tGM9mEd3
0szRioSus46wCalchLodWXa0NbQLfAbUYb0gUU3KLdnzaWQXB+C6kqMkBRxTYPFR
glub8/0bEG800zjZZaB3CCHkvPdxBEXhpHVrWwkm6ZupSduDz32To5crhrXdLieh
sN2QuLU2SDVDhPHb6x1IaF9KlzrC4y7G9/pLBoEFOg1gxCKVsBZn5aGY+n1W7FSK
2bJPp3VseuU7zbHyHsi1AQ6nib7F7A==
=FKt+
-----END PGP SIGNATURE-----

--Sig_/0aow0+FpCJEkOykuULhok=j--
