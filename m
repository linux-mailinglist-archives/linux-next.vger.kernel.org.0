Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3092716F0F1
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 22:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgBYVMf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 16:12:35 -0500
Received: from ozlabs.org ([203.11.71.1]:40999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgBYVMe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 16:12:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Rs8K0ByVz9sQx;
        Wed, 26 Feb 2020 08:12:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582665153;
        bh=FbUnWz8w5dBkv2TfpQakMbRTxmcfO+kSj7AfDrCfDUA=;
        h=Date:From:To:Cc:Subject:From;
        b=I3PBN+1Lc3FA/1+Z9yWMpzRIC75bXT5Gd/k6YajpawizY6WFgAM6Q834yUMyaQTA3
         MYBz3UnKDnZgCSyXGYX8UbpQw4p9Kqt54i4WZCl+nsc6PbT/C09Avq7gz5jxlo/25V
         CfaGv9LZcP4WZm3Xe7oOjn5J9H8+qObrjFdMaZ16or3L5KE7merc9yyh7Zj0j8CKY6
         zPWrZscy+Qe2GGSi8VE6f8ehI8VdChLTHrMuJf0ztn8NYY0k+hVuMYkesEE0Y6zxJV
         HrhLLgjKZ3hMvDmHa8yfT1LUkQURy/cfs5rB+oTevF54s20NKYjDwpXMHOLPrJrt9Z
         PcVFwS1n7tuOA==
Date:   Wed, 26 Feb 2020 08:12:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: linux-next: build failure after merge of the hwmon-fixes tree
Message-ID: <20200226081228.3adcf58e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_XhNdD+2.mN/kVr4bE8sIYF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_XhNdD+2.mN/kVr4bE8sIYF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwmon/pmbus/xdpe12284.c: In function 'xdpe122_read_word_data':
drivers/hwmon/pmbus/xdpe12284.c:33:9: error: too many arguments to function=
 'pmbus_read_word_data'
   33 |   ret =3D pmbus_read_word_data(client, page, phase, reg);
      |         ^~~~~~~~~~~~~~~~~~~~
In file included from drivers/hwmon/pmbus/xdpe12284.c:13:
drivers/hwmon/pmbus/pmbus.h:458:5: note: declared here
  458 | int pmbus_read_word_data(struct i2c_client *client, int page, u8 re=
g);
      |     ^~~~~~~~~~~~~~~~~~~~
drivers/hwmon/pmbus/xdpe12284.c: At top level:
drivers/hwmon/pmbus/xdpe12284.c:127:20: error: initialization of 'int (*)(s=
truct i2c_client *, int,  int)' from incompatible pointer type 'int (*)(str=
uct i2c_client *, int,  int,  int)' [-Werror=3Dincompatible-pointer-types]
  127 |  .read_word_data =3D xdpe122_read_word_data,
      |                    ^~~~~~~~~~~~~~~~~~~~~~
drivers/hwmon/pmbus/xdpe12284.c:127:20: note: (near initialization for 'xdp=
e122_info.read_word_data')

Caused by commit

  47555027eae2 ("hwmon: (pmbus/xdpe12284) Add callback for vout limits conv=
ersion")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_XhNdD+2.mN/kVr4bE8sIYF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5VjbwACgkQAVBC80lX
0Gz2NQf/eRNizUEUYk9WSczMQTeBbmVjsNSM76p/MxFcMgJxWhbwSoJ4ngMKcx9E
djsXf1pbIRSpGOFwhsPydDKncrfZAIrjcPq754IkaRF9gwj321JtpusSsU14eTBl
X/VYBTQ0EXwQ8qSNxRxEKP4Ebi2FMr5a9MWCv8NnSFqg4oxmkIbJR5bRdF1x6UC3
p8CHHDnsnlH5QGL0LHwCypLoH4RA9AA2hzKhDY24momll6kpRSKxlrkGEw6f2C18
qkHHrYQlmmqlmSDR/vynK9EH62zOi10LJQPJaV94l2Tp2fB3iltA07hekFR+yvMF
5Hjew7fT42To+Nzta20a4jzJzZ6dFw==
=e8rd
-----END PGP SIGNATURE-----

--Sig_/_XhNdD+2.mN/kVr4bE8sIYF--
