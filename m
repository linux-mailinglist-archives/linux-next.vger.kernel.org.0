Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFBA144AB6
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 05:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgAVELF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 23:11:05 -0500
Received: from ozlabs.org ([203.11.71.1]:34297 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727141AbgAVELE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 23:11:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 482X5L0rZpz9sRR;
        Wed, 22 Jan 2020 15:11:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579666262;
        bh=qrvzB3vEuxB1QqbgDsl30qtbycln/l2c4UMczIawoZY=;
        h=Date:From:To:Cc:Subject:From;
        b=gdH8SWymMz8+lz2k+GqdqVlSp1FXksqW5XsF6oi12X7SmFq2XunfXbP1Q0pR5uqi4
         nHGBdVHVo3u1Ava6ORhHQrCXA8gLUyoZyhRS7WDirPomLKVsPPoiypBK1/gQZ4DErV
         aLPuInBUuCAr4lBKrCHrnwwTE+4F+KG/oKEoVCL5qiWfYvdGC7lnULkiM5Rm9YpoZB
         DB1R1bYCBat0HNO/OjQp1Uf2kq350nuySViyabfz6GPuown24Ig3dk3AdeEuAqGrXH
         E2AdmXwvkDkpmmOplq4HXYvXFk5ZJQKJd7S8Z4MvsBTNWgdZTEVehfLY+s5KwNGvaL
         Ku4L8xFPRSB4g==
Date:   Wed, 22 Jan 2020 15:10:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20200122151056.7d09abf0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e4ndf2+nh.Fv1o5+f20VbAz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e4ndf2+nh.Fv1o5+f20VbAz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "irq_create_affinity_masks" [drivers/scsi/hisi_sas/hisi_sas_v2_hw.ko=
] undefined!
ERROR: "__irq_set_affinity" [drivers/scsi/hisi_sas/hisi_sas_v2_hw.ko] undef=
ined!

Caused by commit

  3869a618eb88 ("scsi: hisi_sas: Use reply map for v2 hw")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/e4ndf2+nh.Fv1o5+f20VbAz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4ny1AACgkQAVBC80lX
0GyOgAf/TeQCpz99pkq5AgSe2EeBxd/fs+4uaZAukWdgUwrDcv6ZQBhgZqJ/ChYo
armOFsEpeUJQMnzXWw5nJYtZmn1UaP13gIfoJX0WEQRCvCR3d66sGIhYesxbOEGN
4RjQfegntkADX0DXbcneIJJaIZCWko0VtinzXD05Qg2PYwptKgWntXXjg2RzkgmF
BVywaSpTnnZB6NpZ+xv1DDMSxQ4kdCcV0VgqYruahIGyn+UjcKMqYu2gqEWPNikl
/6tebPWhGmoo9VDPX7bPZY7AXap/nTNmiLA3oA4UYS1HQQd+dflWHV9NVKusUdTb
RF0d9o/4zpz3ppuhYTlvVq3WCACwSA==
=UNFA
-----END PGP SIGNATURE-----

--Sig_/e4ndf2+nh.Fv1o5+f20VbAz--
