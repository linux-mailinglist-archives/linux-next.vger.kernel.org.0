Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916153F900C
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 23:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243671AbhHZVNA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 17:13:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59565 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243683AbhHZVNA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 17:13:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwbBt38DVz9sVq;
        Fri, 27 Aug 2021 07:12:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630012326;
        bh=zeGUz5df8KhUeyPgApG+22IxfX6aNUnL1sJ1Ca6pnhE=;
        h=Date:From:To:Cc:Subject:From;
        b=JsimorbcI5fEA2MGG526k7zNpxpfrNLfsJrYTo5DIboKqeWZyt9dO/V3t4Xj2Adjg
         8LxXh4XFaHNldKIDBMwpS53NRvrz73aosigNxYq5b3IQfjzEtReHT4+uBSkX4ZdOYF
         lsqy9hawY9aB/FX4R7lBHKrIAMMCHPZkp2qji0gvb51PADniH7G9s2tfdiXh/Hmq0K
         BynnfUuc5m7+fC/N11kiiVIjl3wm03aEt36njhWX48J89lzl1c1arsy7rXjk7HzAuO
         K+qUFD5oGti3AG3kFg3lfkTn/Ued5Zl31eFhQdBAx3/UU4Do33wgkTN7Dm2Q7Yo3PG
         F7LvG6V8XoEaw==
Date:   Fri, 27 Aug 2021 07:12:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20210827071205.2b8f5ceb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k0YA=5ITZADD+H.X3f.qdC4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k0YA=5ITZADD+H.X3f.qdC4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ommit

  89b5310f101f ("riscv: add support for hugepage migration")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/k0YA=5ITZADD+H.X3f.qdC4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoA6UACgkQAVBC80lX
0GwsaAf/cI38j380zVPbFf+aKMk3h2QnCZ3yvYIyVOP4H++36ucNpoZK1Rc2vm5/
p80PKLO+0dbiflgKnc9090AgirWK3wPmYvwnlnSwI7qdHMR7Z/GIaZA80pYc/tMD
TwVf5UGa6E697f9dES6Dk+pfa2mYh6YDmeUtEKouO54P87OIrcBhYHNFc6OUqPAn
/8AG04JilciyEioHsbmy9WNo5Jxbtfg8JeZraz0whbs/KmZ0G0usr/yYoqfZXUqL
UlcCqlxBRZBmsY4i+2E8iRLPP6L5Yg66ei1/AyXAjTtvcss/u5hxc7L5PmsgBEVz
7L8WaTrqt3Hxxzj1fKC1aB76xfr6dQ==
=eiKg
-----END PGP SIGNATURE-----

--Sig_/k0YA=5ITZADD+H.X3f.qdC4--
