Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC25036651E
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhDUGDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhDUGDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 02:03:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA306C06174A;
        Tue, 20 Apr 2021 23:03:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ92d746kz9t5G;
        Wed, 21 Apr 2021 16:03:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618984986;
        bh=Nu0j856JHTrbRn2ZyQ4NPGkMiZ3iPamRi9zJal79JSU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IuCSCJQemuTKKnZUw3pNa+w0FWd/PaaoQ/97jvSAZgRQGH7nJpSm74K/2I3PM83kq
         ZfQ38o/ntyWK9ndBg3v6TVVHaCB+pTfwh7tGsLhvntagQRFJOK4AWnwz3Mjb6lwhbu
         hfqcFWQHLO86FD7Xo6kojS0DmF/Mc5iuohht7HZOlrLStWgo1T9gxoNlQiHssP361d
         W8Idzw+y5ztXRJBPE9ks5igsRY9gROtqY5xT23tXydenZzhsxptqfDpq3QqTov9s3Z
         FF4Fy4NCUuzEmS8lYkUztWL2Q4tdLbJ4ik3uNBb/l7hspHd4rgV4tN0mymRhmD/FLJ
         6fb186ylrDQZw==
Date:   Wed, 21 Apr 2021 16:03:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the scsi-mkp tree
Message-ID: <20210421160304.2a2480d8@canb.auug.org.au>
In-Reply-To: <20210303170349.2165b7b2@canb.auug.org.au>
References: <20210303170349.2165b7b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gibTvOtKrKw4bZmP/yDv9Yx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gibTvOtKrKw4bZmP/yDv9Yx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Mar 2021 17:03:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the scsi-mkp tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/linux/blk-mq.h:395: warning: Function parameter or member 'set_rq=
_budget_token' not described in 'blk_mq_ops'
> include/linux/blk-mq.h:395: warning: Function parameter or member 'get_rq=
_budget_token' not described in 'blk_mq_ops'
>=20
> Introduced by commit
>=20
>   9dda23635dbe ("scsi: blk-mq: Add callbacks for storing & retrieving bud=
get token")

This is now commit

  d022d18c045f ("scsi: blk-mq: Add callbacks for storing & retrieving budge=
t token")

in the scsi tree and I am still seeing these warnings (as of next-20210420).

--=20
Cheers,
Stephen Rothwell

--Sig_/gibTvOtKrKw4bZmP/yDv9Yx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/wBgACgkQAVBC80lX
0GyVKwf8CYSOHKqe7PocUMbYz+WnMV09mLFpFkn2Pp+2Q+gH7lw6spyq8gFwnRkZ
7v1efjcyqoEBGsxDLe6cuZ3xHZvEgUckbYI1wL/i/GLv3CQ7P+8EtRxpyrL8+qH3
oZUwXcjhGaUJ/6QMjw4FrVDgSQwZla46YHgzc1Ds+L+KnKeJ+2WyWJluO3+83T1+
xF3nOB1If8t6sziGXZ7JzgjIMYlNjohn8EJGzfB6M0WlU0foncSMIWTt/6MpZPRn
OeI9+zYoi14HM6EiIKiwhg/Brf7LKNf0SUDJdhxp7e2DuoiJqUjsqnLOTwfhnbQq
+AMTZL40OFeFPiX1CGlPbWL/JFlkyA==
=+Iur
-----END PGP SIGNATURE-----

--Sig_/gibTvOtKrKw4bZmP/yDv9Yx--
