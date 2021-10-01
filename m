Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795A741E589
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 02:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349814AbhJAAfU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 20:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhJAAfU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 20:35:20 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B36C06176A;
        Thu, 30 Sep 2021 17:33:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLB115KRTz4xbL;
        Fri,  1 Oct 2021 10:33:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633048406;
        bh=AkFkW4EcUD95VI813YSQNHGOvkw2/Vfjy1iyFridIDM=;
        h=Date:From:To:Cc:Subject:From;
        b=If5zTFzMHWYLEB3z4iW8RV6d1bfyhcu7x3rlJRu4iv6zRAosa2vUoAJQTcPVvrpZv
         s1NkKGYYWLvAC4BJSeEuE832BmmntKtjKi/mo9ol7Cmiiv8smj/JmxQQ44NEpw+ppT
         TXcSGuSfQajQnWYGKCwzB1PBrfL5NCBkzhHbVVDodj1qgeoqF/kLC+WgF5T3gT2ty5
         EMgPK58+ODfI/7oeRoE5qsW5byKkcXsiYNjFw6NKt/iSbl3DV4cy6/u44Q/UqEcScv
         DvqeGWvmbXruIx+XX65YiOVnufZ/k4+FDqAsaJlKjU0SWbgSRYY2XNFZc2GeQm56zn
         PJzC/d8AdhC7A==
Date:   Fri, 1 Oct 2021 10:33:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sean Young <sean@mess.org>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Message-ID: <20211001103323.31a69d5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1GR2RiRG4HJo6E8sA/j6qcM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1GR2RiRG4HJo6E8sA/j6qcM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/rc/ir_toy.c

between commit:

  f0c15b360fb6 ("media: ir_toy: prevent device from hanging during transmit=
")

from Linus' tree and commit:

  4114978dcd24 ("media: ir_toy: prevent device from hanging during transmit=
")

from the v4l-dvb tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1GR2RiRG4HJo6E8sA/j6qcM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWV1MACgkQAVBC80lX
0GxZHwf/VAMPNG/tL/3JzGdWW/SQT6szzBmD22OWaHBasIjKpqmGg0JAAljV8Qca
SpPIq8CnyBGmcA62S3QrHFFy2KNbZ6n6uDn5fWOBjSVqSuVUSlCzVZJrrpCPCHNg
x4kgx9bN5OBjiuxCF//AXGzW7aUKCqWplcTU/cRTCQpttsryPxcuIlelCk7ltyRK
Ty9RUeQdqNYTANZQhr5bvxY2kqMchDe2rNKF4msMmv5b/Xq7mmN+5LolwEZuL6aH
A6n2m3k6vXMC4rDhVDDflmXbTrPdx+ZuDCKCuIZTm4p8R6ZOecPYSFF5alWdORhD
eI4eNpr4aN/QVVZTwT+UbHmOUyXmcQ==
=GiNi
-----END PGP SIGNATURE-----

--Sig_/1GR2RiRG4HJo6E8sA/j6qcM--
