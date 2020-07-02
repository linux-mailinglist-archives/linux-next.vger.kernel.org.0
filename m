Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776AE2117A1
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 03:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgGBBVS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 21:21:18 -0400
Received: from ozlabs.org ([203.11.71.1]:49953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgGBBVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Jul 2020 21:21:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49y0fg5NgRz9sRN;
        Thu,  2 Jul 2020 11:21:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593652875;
        bh=SNDM3Ebesqm1/WP0xmTozgFdT1xUcQvv4Uv50jRwNK0=;
        h=Date:From:To:Cc:Subject:From;
        b=d0d8UCbIDdHJNx3His5M9ih2D03iEW/iwIHK/FtTqNNyJ003Vm3ArnVbeviAOVEeh
         ZUhCQga4t6I+55iWWiE7H/Tf8yCGqgyoc5CcYSZbhSmKu8O9SD7cTdvpNlDJh9rUPE
         +I3Srhe73I2eOzcErU+8Jd4H0bzEuxwKZOpVr0v5hP7lvSURtyEQMaTCK6y9u4rZfs
         9zdcXioMNDUb4u+ljd4cEMlM5gNEMkHBa1PhOYePeBSbRLZzAlJIYI6pdrVHST7a0n
         u2K599FDa0SSr1jdgpxH5GRxkEpK+CEipO/yfCO4Hpnh9VUycxu2ATSRSE7LwvorNN
         469P6VMukVANw==
Date:   Thu, 2 Jul 2020 11:21:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20200702112112.04d3f992@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m7.HGDHfzDuDAf_vqraKDJP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m7.HGDHfzDuDAf_vqraKDJP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/md/dm.c: In function '__map_bio':
drivers/md/dm.c:1296:24: warning: unused variable 'md' [-Wunused-variable]
 1296 |  struct mapped_device *md =3D io->md;
      |                        ^~

Introduced by commit

  5a6c35f9af41 ("block: remove direct_make_request")

--=20
Cheers,
Stephen Rothwell

--Sig_/m7.HGDHfzDuDAf_vqraKDJP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl79NogACgkQAVBC80lX
0Gws4wgAoSLcCudGe+r3OTLt9GR83BQ8imeImAWsb2xj1gav/efyaRNEiYj6F80V
n/6KbJmzpkXg4p6u6bQsY1yRsR8w+iGy5YTFJ6lPlO+qXNkxfvAZndfw0XDCB6S8
mSElNYSbmkD5g11s85dZtz+NdSq4yzSQHwpYruIYzNlNjxM9FOOBepGVzv7dKcsc
sTwNzvMH/mPz+udQEsvyx4wmV96uvfGrDKMfRt1B0klgdEq8oXiDqkBqtd5TnvV1
HHDcor2UgGtwwGMqgMfYQQd158/Xh3Dtl9Z7mox8gaXAmKlGv5cltOk5ogQ+bd/E
RgiEiGlaSoGhu64C9In3X10+HOkvVQ==
=yZnc
-----END PGP SIGNATURE-----

--Sig_/m7.HGDHfzDuDAf_vqraKDJP--
