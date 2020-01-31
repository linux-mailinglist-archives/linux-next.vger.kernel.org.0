Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A75E14E678
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 01:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgAaARB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 19:17:01 -0500
Received: from ozlabs.org ([203.11.71.1]:49441 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727380AbgAaARB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jan 2020 19:17:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 487yT73h81z9sRQ;
        Fri, 31 Jan 2020 11:16:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580429819;
        bh=nRULQTr/D4oTpEoGssvTTFlFbyx9QblqM4IMd/FTCd8=;
        h=Date:From:To:Cc:Subject:From;
        b=pK4gvAzU9z3Lf79eJjBtu2SFarC54CmtxAl7I3z09BVR/9WNNadAg2djlaCM8tkg1
         AHzCFE/+7wSdunWLuiQN04xGnxc15Dq/oA6WNHnVvaHPA3QKGCkpmH+irlF0lYylnn
         QG2JRMKIHGK7F3fs54l1+iGxfPfuVhgP2aBX6oDs86qW1hW7is1XgcEDH41fF5AE7n
         49vUmSt7APqinllHYAVzaRZ93s3mW6inRSJ/ttrBwI/8NCvdX+Y9PUSnrJnISviAZ3
         +ni2wQggyXLu5sgERuLeIQ9/v5QlL9ycJzs+m79iJzoLtdKa8JefP9YsaXh8vGUZeT
         AsFW9H7VUcCUw==
Date:   Fri, 31 Jan 2020 11:16:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20200131111652.6995fc6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BLCeC0ZS5hLAwaC8fKX3B6i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BLCeC0ZS5hLAwaC8fKX3B6i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/io_uring.c: In function '__io_uring_show_fdinfo':
fs/io_uring.c:6558:32: warning: format '%lu' expects argument of type 'long=
 unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wfo=
rmat=3D]
 6558 |   seq_printf(m, "%5u: 0x%llx/%lu\n", i, buf->ubuf, buf->len);
      |                              ~~^                   ~~~~~~~~
      |                                |                      |
      |                                long unsigned int      size_t {aka u=
nsigned int}
      |                              %u

Introduced by commit

  0380f1b6d0c6 ("io_uring: add ->show_fdinfo() for the io_uring file descri=
ptor")

--=20
Cheers,
Stephen Rothwell

--Sig_/BLCeC0ZS5hLAwaC8fKX3B6i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4zcfQACgkQAVBC80lX
0GyxrAf/db7zV8GKvt/KKPKAFnV1c7o8+IehRLJzM0NoJzcawXQYa4bc1z/LXWTL
ojofpLmTA3p0b0a9z0y5a9NTDmQ+ZjdBvjSMOP5DyfHA7LEaApEmOP2CcRL2Nvio
MuRJ5CJ3YEDHFGGQhpDVYbgZ+AdvSs5uDXtfcambDSHRBziAqPerrvTOcGDBHOxc
o/wvNCSNCEg9kd/9aoUAm5M2IehaRuWYuRP3A4W6JYz5g0eutcP7oYfd+zT+RF/Z
9w4BHmMPJFADbl8CwJwGF2Da0n/N42NeD3OwIAFVHv77rhqCt9PWl7Mdj+vFK5TX
lNWmG9+zvFiomP5Vq47aSQFfMO4OAw==
=nG4H
-----END PGP SIGNATURE-----

--Sig_/BLCeC0ZS5hLAwaC8fKX3B6i--
