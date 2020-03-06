Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540B417B65C
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 06:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgCFF3l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 00:29:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgCFF3l (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Mar 2020 00:29:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Ybll3vDpz9sPg;
        Fri,  6 Mar 2020 16:29:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583472579;
        bh=t7kO+23O4AQyWMQiGP82lyAOnnJwgWc5WAO5yzIARVM=;
        h=Date:From:To:Cc:Subject:From;
        b=MB7NafcyEAvifyEqL4xotZBIPNbRnJQmwFUwYa7iYH8hdKnUCjdW9duKcu+KiDAJO
         c/5FDp7bZHGTuNwv/1AN0KyWusqj/rnzl3GlcsJ3cGZf+ZKRHSAjxIYXxy7rJn3xhs
         xuZbXEksJaRLU/cZzt213IMcRsP2gS7RNgZ91Pgz4EmSlDy5nCI8/2nqYZAlGJmtli
         QKkdi9BgYQ5qmHUMrIX0bCrNp6ZtLJlqWPIbcqJK0R5fa20q8MqE+kkW5p//CXK83b
         HMmEvbflS8HPi1M8ZCRAbFhTnDlcaHE+sLDZu5lhGkL5ZoD71uiNI4QdXXTC0IjwV8
         5ljuOD1ENnbBQ==
Date:   Fri, 6 Mar 2020 16:29:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>
Subject: linux-next: manual merge of the akpm tree with the powerpc tree
Message-ID: <20200306162937.082cd994@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AxSgnHjYYrwYT+IA1LV6HOX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AxSgnHjYYrwYT+IA1LV6HOX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/powerpc/mm/pgtable_32.c

between commit:

  2efc7c085f05 ("powerpc/32: drop get_pteptr()")

from the powerpc tree and patch:

  "powerpc/32: drop get_pteptr()"

from the akpm tree.

I fixed it up (I just dropped the latter version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AxSgnHjYYrwYT+IA1LV6HOX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5h38EACgkQAVBC80lX
0GwWVgf/b9cMicIX4DCt/qrkOHGgvNBu+8TbB7gAfYs65qisVKTSU7grIUTkqxKS
xpUBgKhBUiAtC/JkLkzm2VAaX/WyjEJ04u/9ebeqWZFZVAuvfbqu1sG+CYm22lKo
g2D1xC+8oWMZ16Xap91ByEUiXQ+pG1zVgTFG9O+WDv9mFrFnl2ONsLGxrleqHD5o
lIPTwAn5r7PYCmXy/9jSKZE5Ry5FhB+t7mHt6xzd3mJKno2TiqmDIKIBj6EVeS+I
vjLdv+EVLFTOD4vMz1eXz2qg2+JiGnTMBzW5GjdXHZMIOVSBrykPK6zdagjP0mjf
yrciqH/VnA9EPN7RiUQ42pGU38yQOw==
=gutR
-----END PGP SIGNATURE-----

--Sig_/AxSgnHjYYrwYT+IA1LV6HOX--
