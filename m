Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117532305AF
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 10:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgG1Ip1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 04:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbgG1Ip0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 04:45:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46699C061794;
        Tue, 28 Jul 2020 01:45:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG9H71hVlz9sRW;
        Tue, 28 Jul 2020 18:45:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595925923;
        bh=dQmldVc+wreAkG6M94ItSD4oGEiD3QPrpKD6qStMaaU=;
        h=Date:From:To:Cc:Subject:From;
        b=nAYUrqq6FL7/BHEsYDfKV1EZXktKEsTRYv7IipT5T2awjHM/hlkJBDHcEnvRj0YLI
         s1Xf/j0HRHpqHEpRf1r+Ufj/7VJefjiIyVEZHHMI2Bw0nyD8SPWJ+VmQ/MIporrObC
         vI/McQtCfEZaKhwMD2MukYu1MXrBUUJXSG1PO91E+hirkZn1TLQTUa8dUfCpfYudSn
         eFDXYsJc5h+ooBPbvNqcIjFcBq++xTjNrUmK+jckQvpmbORyb7cpoYvKmbpMwmDn+u
         eoLcB+9nL+JMMxeETYx4x/4H+opDng7veldcxfdPypPzEq9BAlJqv3Z95cZTNqv5fg
         wADO5EmPDv+Pg==
Date:   Tue, 28 Jul 2020 18:45:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leon Romanovsky <leonro@mellanox.com>
Subject: linux-next: manual merge of the kspp tree with the rdma tree
Message-ID: <20200728184520.5634a0a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/brtQ5yF3b/XQBvAo+YFBl8W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/brtQ5yF3b/XQBvAo+YFBl8W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  drivers/infiniband/core/uverbs_cmd.c

between commit:

  29f3fe1d6854 ("RDMA/uverbs: Remove redundant assignments")

from the rdma tree and commit:

  3f649ab728cd ("treewide: Remove uninitialized_var() usage")

from the kspp tree.

I fixed it up (the former basically did what the latter did, so I used
the former version) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/brtQ5yF3b/XQBvAo+YFBl8W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8f5aAACgkQAVBC80lX
0GwU9Af/ZI2vygS110uanKKD+OYtIVBpnRmUxRXm1o43YGdRR/XDK+vEVo1x9hW8
IDUbA7FCPmhBvKUjPSrDesUHVTN13Sk+pA9Uf5njdJsPl5aX9V8Xq/oWu+IEVB3g
hzo94LR4po2I8JP1CAXAXjm7ArC6Ny2rkYlI0GHVnL3wheT8Ljs9WIc02v89ZEVt
EHsuvz+MCWzfzmp3jXkrlaGYh2bZy+vFD6NsKtyNppSLTvtH9osxvy6i3SwTxmEi
ldTEYIXKIFjvsbCKquSsETL5bFZgXqOrMztJYUnmv/dHjOV4kHN8CXy8FFRA5OiX
IxVJj+UJbdR5AC3zzYMm4mKOsPuqsg==
=4G68
-----END PGP SIGNATURE-----

--Sig_/brtQ5yF3b/XQBvAo+YFBl8W--
