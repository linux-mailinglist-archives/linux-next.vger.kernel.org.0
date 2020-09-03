Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBED25BDB3
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 10:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgICIrl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 04:47:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbgICIrk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 04:47:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhvZg2978z9sTC;
        Thu,  3 Sep 2020 18:47:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599122859;
        bh=7XSGqw1cRdmxACET/3Q5VvXqm7KWP3tt+FQk0zysPSY=;
        h=Date:From:To:Cc:Subject:From;
        b=WXvdoXLNsBO7TFXYAwpwLYJZ+IqWBSy7U/6XJ1u0KFveCI9Rnhx0M3Zi8wIpJtwOh
         37pgef6UQo6jf9mWZ3BHEiYeVns8dbJ0juYjAWm6SDOBEUEYcHQuaedSHW/nTOpR68
         584U6r58acl3PVeaevgc0K8E4CiWAB2UzFuFmPW6iUAk9oFm0NrKjd+KPwGvgKmQsZ
         Qj8irjUyj8Gnroglvf1ExE90II5cq0hwN2w8AZbB/9YqC2+jI+R7lyWkS7Poicard1
         AXhqhQln0kUKLp262mSXiFqjlZQNsFLG352sXA7RON+xK8WIvjml1GGy9YYAkCnMyC
         ix/YiBkQRZPXA==
Date:   Thu, 3 Sep 2020 18:47:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomas Henzl <thenzl@redhat.com>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Message-ID: <20200903184738.53f62617@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/05kbYHXOJg0EjHE4+0FP1fz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/05kbYHXOJg0EjHE4+0FP1fz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b614d55b970d ("scsi: mpt3sas: Don't call disable_irq from IRQ poll handle=
r")

Fixes tag

  Fixes: 320e77acb3 scsi: mpt3sas: Irq poll to avoid CPU hard lockups

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  d2af39141eea ("scsi: megaraid_sas: Don't call disable_irq from process IR=
Q poll")

Fixes tag

  Fixes: a6ffd5bf681 scsi: megaraid_sas: Call disable_irq from process IRQ =
poll

has these problem(s):

  - SHA1 should be at least 12 digits long

These can be fixed in the future by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

Also, Fixes tags are usually generated using

  git log -1 --format=3D'Fixes: %h ("%s")' <SHA1>

--=20
Cheers,
Stephen Rothwell

--Sig_/05kbYHXOJg0EjHE4+0FP1fz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QraoACgkQAVBC80lX
0Gx8/gf8DHwKLGWgUiLx1o+QXwgqhl9Cf1SE28bcWDnbr6cgRS75iD+/MsMkHixU
lbhy6Cx+GY9THglE9pFxZ8RVQ+b0isycAyH3qADJZUNRAxX0p7H4wV8J5w9uc/li
677tF7/zQEeAzavFj7Tgmvh+M/uu+qZ2DRZxMps1VFmQLBcjUf1LwxdOBJrvM8DF
8JlRLCskmIp757huyKpqSWUrzJUylhg6CbF5uiF/2ojIz358NJebZzhmu7Q5RWlp
uNnn4pxbkq3W/8KatTivfOu7+CS0DYmE71UPMZFmQGNByhH4mNDJV6wsIT7jA/5I
vyuzHPXS7IQeixGafuR2Jkv4sEuSaQ==
=rc+G
-----END PGP SIGNATURE-----

--Sig_/05kbYHXOJg0EjHE4+0FP1fz--
