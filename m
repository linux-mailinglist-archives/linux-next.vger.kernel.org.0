Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91222EA98
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 13:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgG0LBn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 07:01:43 -0400
Received: from ozlabs.org ([203.11.71.1]:37857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgG0LBm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 07:01:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFcLr2gP9z9sPf;
        Mon, 27 Jul 2020 21:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595847701;
        bh=JcrwtuzTf1Td8z0PhNeQgTOjS9LYgqoPWnumxhyecmQ=;
        h=Date:From:To:Cc:Subject:From;
        b=OV+7mc+C1WN55vuNaPEFt8baEO7b7I4Ip7yRw+Sx5V7mFkpSPDS5YpWxqgBEi3oS7
         HHzHOZjPV6xlcoD4WCOPworR/4GcdXczPby15mtRk1BAkejbJQr579wLTKN6iFKE++
         ccerq9hob9l0GklKUMlGnGdrwqsqiJC8xEV75aECkzb/9nMPFCgtRF8du5JeowBPgO
         pW5lWnSL6Y8CCtTAr/H7bWMBPiT3PQ9rmBhs3ZrhdAaRdttvbDn8a3qVKb8MZPBq8g
         xgWuOk4DUu754SK4vy/fnzcqMTcWjI96aX5gWRqIx/OAFZxVx3LbLfn8CrSWqvn26P
         WAL+EDoyZ3s9Q==
Date:   Mon, 27 Jul 2020 21:01:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yongqiang Liu <liuyongqiang13@huawei.com>
Subject: linux-next: manual merge of the set_fs tree with the battery tree
Message-ID: <20200727210137.01a5d03d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4NmD3S59rw+DPsjjpoTFo70";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4NmD3S59rw+DPsjjpoTFo70
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the set_fs tree got a conflict in:

  drivers/power/supply/da9030_battery.c

between commit:

  9d832cd36c60 ("power: Convert to DEFINE_SHOW_ATTRIBUTE")

from the battery tree and commit:

  4d4901c6d748 ("seq_file: switch over direct seq_read method calls to seq_=
read_iter")

from the set_fs tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/4NmD3S59rw+DPsjjpoTFo70
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8etBEACgkQAVBC80lX
0GyoUgf/c2wl8WGbs70FOlAtbSu3j63DNxJ5/TO6ifWmhLQ2o/OapGXF5h9KHF2x
UYzrFf09jefoQnYV+2QJ4Ig3M5Tg0ooTc0IboO1uzgfjyTdCQ3qqUPrz+4EU9mXi
5+Tke1eqrDOLnwr3g7atE3NhLScU+JoLshN27JZutE9O5ywvHW1ckEvWmzs4d+wI
0k74kXc9YEziym2EIipBofNoaMHrR+kzhATr6QEtrwLt/ajDp7kydri13iuBXI2c
fL4K0RLw3eetXZKRDQW/IQwrzqIYd5wXQP031ZNqNrT+hQJMwSsYC8bdMFNDWonP
WODnEj4LVQpUmRz5tG7Du9kNn8K/9Q==
=igdf
-----END PGP SIGNATURE-----

--Sig_/4NmD3S59rw+DPsjjpoTFo70--
