Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597F13AE0F1
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 00:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTWew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Jun 2021 18:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhFTWew (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Jun 2021 18:34:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED77C061574;
        Sun, 20 Jun 2021 15:32:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7S8Z269Hz9sRN;
        Mon, 21 Jun 2021 08:32:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624228351;
        bh=hs2SGmGvDQMenmvAclP8Bxfn0M7H+LaWftKnHEA6v9Y=;
        h=Date:From:To:Cc:Subject:From;
        b=TnhGChvvWaa2KnSXcju6RabRcet8nR034mBs2rgvnlYH331s5i8vaQcMY7h2xY+xq
         O3xOMAd4pIuWSTWvnSFC7JYK8FicLPajRPnIm4Zd2Sifo9Cab7n5inv5qhzt90hZvt
         6grAO0Mu8BFSc2E5jYWS1paWSlOXbYLuG0JBYWr4SPP4XlYvlxWr8i23ruErWK0Jc0
         SHeTZgc4SfyLIA8UK8NjiRmUtO78zpVmpCnxe/9CBWyaANchDRtfh1RdA/CGsGVOfp
         +L7tPW2RT6fHkHYV5yPjGgkRVOAj6zk54krRe+sIIbdVS78QJGPct54Ec+7Bh1XQbU
         2wCR21x82IWtA==
Date:   Mon, 21 Jun 2021 08:32:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Bob Pearson <rpearsonhpe@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rdma tree
Message-ID: <20210621083229.5913c8fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mv2HXJzIQ+6.sUGYOrEqldG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mv2HXJzIQ+6.sUGYOrEqldG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c1a411268a4b ("RDMA/rxe: Move local ops to subroutine")

Fixes tag

  Fixes: 8700e2e7c485 ("The software RoCE driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 8700e3e7c485 ("Soft RoCE driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/mv2HXJzIQ+6.sUGYOrEqldG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDPwf0ACgkQAVBC80lX
0Gyg8wf9GeKrB4HpJlITMd+pnNNSrKKVvYLXksCeFJZbeZkhvMIA7mOGkqBjeQ/9
Gt1N4L6oHNxwqw8akZNllsZr9qLN5xzdbH+w53vByD/M4oGcLtHwJ1Hm5b3IzKSm
jFUMr4NtgGWmWkJUlF6DGL0wZCoQ1xmbfZJWauVqruWrgJgk4l0A3AZ1Yg8f0zWf
y0Nt/2RBCOIH5/qshg35UbcTukhnNS0wgwlN+zQEktNf8rBmlCvpm25ercjoA443
BHbMika2Gz6cXgHzRfYknxwV8/4ks/xegnNO5px2qyCThlPxGeJCGlk/A5Fr9Ypc
R9oiXqlqG5NpjrQxPvVYfNzGnQXmeA==
=doMA
-----END PGP SIGNATURE-----

--Sig_/mv2HXJzIQ+6.sUGYOrEqldG--
