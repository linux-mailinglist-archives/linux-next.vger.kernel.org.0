Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E0427F808
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 04:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgJACxQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 22:53:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJACxQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 22:53:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1yNn1FWMz9sTR;
        Thu,  1 Oct 2020 12:53:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601520793;
        bh=bzhHsD9F+82Rc9As0BJmM3vlChyB3KuF3Wox7Cz256I=;
        h=Date:From:To:Cc:Subject:From;
        b=rzVGibBSE2DYf7WsIiGWFZRzK5zDAHNnfGcRsZQfi2JZ3fPa1amaHnr+VwDjj48qI
         yN4+7gz27j1Xfrg08oPr99U25v5HaaglSjka/nC4BJSZe54PEENQtHd1thiHBBLBUw
         s5Gew47NLNj39xjMI0dMVrg3ef5Iz1qjmOiPMFWuOI3UCz6pcQI95iQX8Wr7whJwZs
         f+R7hVDXFdVkFoH8AsuO1Oog8ol6GjP9aNozCM0KD9lD8S1f1jPzbRcjNNDjbH64Da
         757cngT1PYGxKYtqEHDXAdX1VmriUKV7W3fJGzCu+WYTafsdXStlMmA4+DxZmICf6o
         6rCZ+r/VEFO6w==
Date:   Thu, 1 Oct 2020 12:53:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <20201001125310.3399978a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ot49Y=10vJ5ouB+B0c3J7Q.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ot49Y=10vJ5ouB+B0c3J7Q.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwmon/pmbus/mp2975.c: In function 'mp2975_probe':
drivers/hwmon/pmbus/mp2975.c:740:32: error: passing argument 2 of 'pmbus_do=
_probe' from incompatible pointer type [-Werror=3Dincompatible-pointer-type=
s]
  740 |  return pmbus_do_probe(client, id, info);
      |                                ^~
      |                                |
      |                                const struct i2c_device_id *
In file included from drivers/hwmon/pmbus/mp2975.c:13:
drivers/hwmon/pmbus/pmbus.h:492:73: note: expected 'struct pmbus_driver_inf=
o *' but argument is of type 'const struct i2c_device_id *'
  492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_i=
nfo *info);
      |                                               ~~~~~~~~~~~~~~~~~~~~~=
~~~~~^~~~
drivers/hwmon/pmbus/mp2975.c:740:9: error: too many arguments to function '=
pmbus_do_probe'
  740 |  return pmbus_do_probe(client, id, info);
      |         ^~~~~~~~~~~~~~
In file included from drivers/hwmon/pmbus/mp2975.c:13:
drivers/hwmon/pmbus/pmbus.h:492:5: note: declared here
  492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_i=
nfo *info);
      |     ^~~~~~~~~~~~~~

Caused by commit

  dd38ac315b23 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 cont=
roller")

I have used the hwmon-staging tree from next-20200930 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ot49Y=10vJ5ouB+B0c3J7Q.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91RJYACgkQAVBC80lX
0GwS9Qf/SbbejcpJ4T0s0C+j5NsyN3sWxjmmUQj19l/8jN039K0fGAEHg0pAPw6a
xBtZSlqZjYH7VR9Yu8c1xFzMfE4YuqllnX97wZ9CyktOHf3JhuuLbh9/oXm4bIRg
2PhTf5QuZsTuVmjz6vQSTN6Bd3/11bY/RWOj53pHXB1tgTNkKH7n7tFWu6KZ3R6w
Tc/TFYyJ6Gmmwq7cez4sqKc0GvMhRdx35rdaDuipjj6ZMGrptW97U7KP2McoUeUb
Lv+Xf0gsOjLpKAg17l2C2JSEZ1FKFf+oM+ZXkjuz9cG9aRY6czsr57B4uDkVOKrQ
McchV/BrCXfZU0+BaSPFau8EBZTylA==
=9aBv
-----END PGP SIGNATURE-----

--Sig_/Ot49Y=10vJ5ouB+B0c3J7Q.--
