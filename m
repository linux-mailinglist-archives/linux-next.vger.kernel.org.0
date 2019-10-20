Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01E12DE081
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 22:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfJTUlA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 16:41:00 -0400
Received: from ozlabs.org ([203.11.71.1]:49889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbfJTUk7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 16:40:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xBVv6XYZz9sPc;
        Mon, 21 Oct 2019 07:40:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571604056;
        bh=gaOTiRi/n6+LExv1q7SW8C9zz7O0atRLLH48X7vPSzw=;
        h=Date:From:To:Cc:Subject:From;
        b=At85Db8x/TO35UEscOd3ZCXIEvGPShe9nWCdqEoCC16pH3yunw9SkdUn3NS9hh0rq
         Cev0lYL5VheEucPCTtRbSm6h19aA4Zk/Ow/5HqeYKby6LsTXnoawP25phloFr2EjpV
         qJFvQqGFSJMgW1dVwvJaD9Q9An4q56NmdGWUHhh8TtgEQxrz8THbY87TFonGFtqeZa
         9CjG6q8/sUY8SKdQgrKrqQPAj4kJx0rg9SyHltRrtfL8xvxug1GxzVopSbGfej8Ec8
         UKCuDIPvdhiCnXVpEcn51zbEtxnLlQ2ZloucyUeQoP8br0bbgCSrkJ806uGkchmfDD
         wcvkBHMt6nHTw==
Date:   Mon, 21 Oct 2019 07:40:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Chinner <dchinner@redhat.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: Fixes tag needs some work in the iomap tree
Message-ID: <20191021074055.092bd62c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NTvrMQMgpGqZMm6wnCzb0vo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NTvrMQMgpGqZMm6wnCzb0vo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a23414ee345 ("iomap: iomap that extends beyond EOF should be marked dirt=
y")

Fixes tag

  Fixes: commit 3460cac1ca76 ("iomap: Use FUA for pure data O_DSYNC DIO wri=
tes")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/NTvrMQMgpGqZMm6wnCzb0vo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2sxlcACgkQAVBC80lX
0GyeWAf9HtzbDbZSFUh/Fkk0HOYFrsNYq9LAAfhtaohXLTBK/RRI5jXbvWQ4Yncz
vwrsdg6dcKdzL1GtCCvK+X/vvDl0bONX9C94FicoL+8kx0Ma7zGfCyUn6jgpHIRD
1XeSaZsaEBgi1XlUPq3PcZEQSP5mglOQ78dtIO+pWWeprjJ5fQXWpFmHIR2kDo4z
MU6Vo1KMP0/G/Vnlb4G2+9A/pTnYNE84BRbGcgnDy7kk4FmBPltgt9d0L0IYbWMn
BWVXci2FFHN8eKAdFUakDtCXoex7ZAyUsRBX0yJlBmGjYj9+uKTlWtis2KF+aWWp
ivV80CkEqljCU8Tfyc5fpZSO/jMZiQ==
=Hcs6
-----END PGP SIGNATURE-----

--Sig_/NTvrMQMgpGqZMm6wnCzb0vo--
