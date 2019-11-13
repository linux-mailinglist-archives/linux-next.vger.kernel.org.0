Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F667F9F3A
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 01:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfKMAWp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 19:22:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbfKMAWo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 19:22:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47CQL940G1z9sPk;
        Wed, 13 Nov 2019 11:22:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573604561;
        bh=c3qLzfjeiLIqBGV0B6M9scduwRbdRDG8+sWRTjvF2FQ=;
        h=Date:From:To:Cc:Subject:From;
        b=TfmAvEFcHyDb7wfKeiEp7vkH1d+G+nvspf209ILde0X6JDhZQiUAo+C5Dw+VZKzwg
         TdEd7ubV2dPvwEW3cz1WS8hQquuMOm+kr5LJGmyWaH8IvA7rxtvGVc1Jbw0c36Yroj
         u9wcds9LEl1nd73qkjv5IQuGbV3FosWXgsTOORMwkmX3g56ahe6ChZCgnji7cDzzp7
         al9uUF1N3nIfVE+aWvBbl95ceawxFiZZK9QlY2UTlU9ERkiSoxWw8c+vRSd8TOijz9
         Egu4QfXNOQEDOHEODE+9v68cAJBclTwtW9JRiKiMeRS9nz8QAVWyzWtytks+p+XEwZ
         ww8U5qMPDW6fQ==
Date:   Wed, 13 Nov 2019 11:22:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: linux-next: build warning after merge of the mtd tree
Message-ID: <20191113112240.1fb68337@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4s2oT43zNREY7c6CM_BWxAz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4s2oT43zNREY7c6CM_BWxAz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mtd tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mtd/ubi/debug.c: In function 'ubi_debugfs_init_dev':
drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused-var=
iable]
  512 |  int err, n;
      |      ^~~

Introduced by commit

  3427dd213259 ("mtd: no need to check return value of debugfs_create funct=
ions")

--=20
Cheers,
Stephen Rothwell

--Sig_/4s2oT43zNREY7c6CM_BWxAz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LTNAACgkQAVBC80lX
0Gy1hgf8CqorK0g1xdrL5RIEwh54Octd8A3uda5Llp3HbaUzsEG8iSg14FQ53GRZ
LQHD2HpiU6wh0y8M5qpMIvygekiaDZlR64zqwKw9ZriAMip8WlV18ZLUXm7dNKhe
WWYaMB6kcJn7e/hqiQeZ0+VcQRxrbQzo8R7prL0rDoGHKZAoPEGaDH7b7fpRVelz
myIfDlYUmolmZJYh/MCN7aqN8dpDCS7hI3O8LpJgP0FDYuRcsFIBNi7OFh+XnDj7
mo9A+QeE4hLjcK0g4j1E4Nw1ZMgc5ScqRfqkH3TfHpA4EW3c4Vqy41EN1xPn+mxP
en9LdqJ4aZ70I3qlfrWvwp+lRXnJiQ==
=xiDS
-----END PGP SIGNATURE-----

--Sig_/4s2oT43zNREY7c6CM_BWxAz--
