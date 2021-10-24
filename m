Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317AD438C10
	for <lists+linux-next@lfdr.de>; Sun, 24 Oct 2021 23:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhJXV0M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 17:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhJXV0M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 17:26:12 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29620C061745;
        Sun, 24 Oct 2021 14:23:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcrg32FWmz4xZ1;
        Mon, 25 Oct 2021 08:23:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635110624;
        bh=ySMup7slLgs9GKvo6mz6M6b9wQSL0hppBSxsAMDXV3w=;
        h=Date:From:To:Cc:Subject:From;
        b=W5UzRrW5E5mL4M5CUKrRuL68wj6ihlSQKaRsY+VzZaGs5Q8FAjKK6OPeW/DrHW9pD
         MfwVy1SyKDLk5a1frC46fY+XwdIRYXS8hWOx7aRt7QdFZFagLSlhc0flJyOQQddSW8
         Fu5pf5wmL3D2Rv4lU6Ep3iOg23tfyCGQUNZ0FvIfcCHuytRM+5NafJGMCtR8BtBpbI
         1XyYIWY0vx0yHCBKpY2PG35wfFKtmwbza/43HwnM6KWDdDSHebzTH9JhqvvcfyxFuD
         mulYxVszivJHrMmMsxLjH+us45+utnz7LhV/iIUByP2EcFMmwvAqFoh+ewOMrQaVzx
         Z9JuH48BVGrwQ==
Date:   Mon, 25 Oct 2021 08:23:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20211025082329.4bc6a609@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dSQbQUsk9q54wDBAegvbm0j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dSQbQUsk9q54wDBAegvbm0j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f89ef240d5d0 ("virtio_ring: check desc =3D=3D NULL when using indirect wi=
th packed")

Fixes tag

  Fixes: 1ce9e6055fa ("virtio_ring: introduce packed ring support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/dSQbQUsk9q54wDBAegvbm0j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF1ztEACgkQAVBC80lX
0GyGhAf+J0PCy/o08odZ5wuMYpF0PgE4Sd4RuJU/aTM8J23p45NL7lESBFd1W7dO
TbxWYsMtBj77Jzbmer9b6cartScG/MkKCwkliFLA3ohBTomaaFRI8uj5Q3tYDhxz
rHr3NNz5yOoc+RSvJSYsDNTVNA7uqRdQJntCclgH59qHkRcIdFTsOxN+giKw3bUR
hfiBQ9Bcidh2wHHX5/r/h6MSUNU8SM3MHuXx5arl59OeyEQhmKUIbiLrbdnGTOL+
VFPveBn7QjCEpXjOlxBGwTH+vEXP/4YVk2SqMOWJfC4neOreDdHLD0k+Eua/FHzH
ylrsUNWxqDbwKu3kqrtEe8Sx2+L3rg==
=mvme
-----END PGP SIGNATURE-----

--Sig_/dSQbQUsk9q54wDBAegvbm0j--
