Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970491477DD
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 06:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgAXFQD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jan 2020 00:16:03 -0500
Received: from ozlabs.org ([203.11.71.1]:59245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgAXFQD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Jan 2020 00:16:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483nRN5qYwz9sNF;
        Fri, 24 Jan 2020 16:16:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579842961;
        bh=JEIm6vKukihwsI56v4YKR/agdjCqqhxmLrVeXABK5Gc=;
        h=Date:From:To:Cc:Subject:From;
        b=vKoZC0NU6VoG6BBVVJf51JYtXGbKaoPqq5SlwFMGVMhuoLluxhoNiX16xumkDg6+n
         SXgcVMZ2BvbzfcG/reUpAM4rikZ8p3uW8vmOR+pYUimqN1ina9ccxuwbEZUfpXOa5c
         lW1BCC6Mb/8r94KASp5+RufpV4y6fzgtdRH+P5FWx3Nv6ngZGYdCMf4N9F54AbIhSQ
         X+9SGy+J1m0n+hcU4IqwBuNVGSLgV1kR5HcaxwPwKFNQ94oULiJXcOwWoftPjhZNOe
         PEkP0+PX+LHJiNkCvDR1ez6cjxYAPh+CcMxFvWJgO5CQkM1L2GLXSEakHACdO1gKPk
         unLHzhRqICNlQ==
Date:   Fri, 24 Jan 2020 16:15:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 drivers-x86 tree
Message-ID: <20200124161558.7cbb88c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5xsBvrbz9X2TRm6GIB9Xd0F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5xsBvrbz9X2TRm6GIB9Xd0F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  drivers/platform/x86/intel_scu_ipc.c

between commit:

  74e9748b9b21 ("platform/x86: intel_scu_ipc: Drop intel_scu_ipc_i2c_cntrl(=
)")

from the drivers-x86 tree and commit:

  4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (the former removed the code updated by the latter, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/5xsBvrbz9X2TRm6GIB9Xd0F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4qfY4ACgkQAVBC80lX
0GyL0Qf+OS8+RF3C0/9c/ovTO6EQWovg92P4ABaxE/Vnt55ay3jfCS2Ke6mvPQH0
7FzZp2thIMFeJmZa06DFF/zJbyD7IYy5Yabhn4mRn9LWLhwjdQtH1fYy25vq6/nl
7N8XLsqJMh/M+A479EnzRdoEtF8ONZJefzRG3HMSV5Bnm8emjqQlsayyFX7zN3Lk
+l400Z8h1aCu+p/vZu/CjwmIvNVHU4+fnaTAcOyBFFiNDZsZJBowfIMmiiFffe6x
XNop1rL1kZkPHd/bSF5x6WLDG17Q1hLJ//kQEgGr3NaOsB5P0C4PjckJYNzPBOQm
b0qs48aEMf9wB1MOGYP59ED+vrJPgw==
=9K+B
-----END PGP SIGNATURE-----

--Sig_/5xsBvrbz9X2TRm6GIB9Xd0F--
