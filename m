Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85583459ABE
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 04:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhKWDxQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 22:53:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhKWDxP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 22:53:15 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DF7C061574;
        Mon, 22 Nov 2021 19:50:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HyqsT4ty1z4xbP;
        Tue, 23 Nov 2021 14:50:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637639406;
        bh=4MZ8Hj+ibHRUk22wTZAll78KyeVB//jBk9g/Gg7sU4A=;
        h=Date:From:To:Cc:Subject:From;
        b=cRIt3AmMcr/K84f6+4+TMAzD//kyf3sdjpC+Egc7SM4yydcf29Qtjkw71cc2bqAtX
         rr23CFkcokbkfDbry7iEO+GHDAn85/f1kiNybyjzG7JDj1EGJN1NNHqZ0pU+z8e9Ps
         89z2EmYjNUmv6CmNMI+4uqPslE1az+gFMOlKQ44Ft6NLi66hBnlSCHpA4qhTUfjz1w
         ofKWZJJ/6RFi+fPWQ4Bf8K8USE7MLwpCLPsK5HkqcptJZCIblBDx5h02RxQmtZ/cuR
         TGYN3z9jmZUz+bBU8XD8Q/B4HAdD+516V3vXLHNWFP9B4P+2fgOsheOGMl9uCViNjH
         kf4xHbMQ1eERg==
Date:   Tue, 23 Nov 2021 14:50:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yury Norov <yury.norov@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bitmap tree with the dmaengine tree
Message-ID: <20211123145004.6018b7fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FJODxGkuJX4VHs60z0yK249";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FJODxGkuJX4VHs60z0yK249
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  drivers/dma/ti/edma.c

between commit:

  365fceecd66e ("dmaengine: ti: edma: Use 'for_each_set_bit' when possible")

from the dmaengine tree and commit:

  523f4c8e86c3 ("all: replace find_next{,_zero}_bit with find_first{,_zero}=
_bit where appropriate")

from the bitmap tree.

I fixed it up (I just used the former verion) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/FJODxGkuJX4VHs60z0yK249
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcZOwACgkQAVBC80lX
0GzZrgf/SLERbwc64h/+9pJtHL57zHOSwsVnvBU2Kif0/XtL8Ry7iNQImdetS6l0
gClNecQkH+nMm4O+tMaLDKDVhxqEYb+S1Lnqe9mhlzxML/XehavUNJEqvcEnMHYs
nQwOPYcBJmtULFzonlHCwR23WvVO3Eude6JcpzhNURWL9bQkOU8rP6w+UGm2rCle
JNRViDzFuDSdUPRBaaDFrqu6EA4HEeNQEBRe4HlFCJsXeWuMo548EjJc9MBBec2b
gw1n6Ds+5TxeioCKcy9c9Ssa4QTtQRPJHysiJz0GFU0j1SvZa9+JN54Ual52xjza
bm1yIThdoho6uis1ie5aDLTfzZsYfw==
=j2zw
-----END PGP SIGNATURE-----

--Sig_/FJODxGkuJX4VHs60z0yK249--
