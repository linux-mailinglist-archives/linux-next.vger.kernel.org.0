Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43EB3A2143
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 02:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhFJAXR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Jun 2021 20:23:17 -0400
Received: from ozlabs.org ([203.11.71.1]:51701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229788AbhFJAXR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Jun 2021 20:23:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0l5D060jz9sRK;
        Thu, 10 Jun 2021 10:21:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623284480;
        bh=OcbPtiGtoSQqHQwInlNZuQFJbqE5IHOH3h37Obg5fdQ=;
        h=Date:From:To:Cc:Subject:From;
        b=nerQ0PujLoIlzVrTUBC4jWcZwWTx7zzRdMSb+brct/wTTcJhUWQ6jt5KyajFtirW7
         TK5OedxnzilSZUcp42+P1pK7/j+hhWLgJdY0wy7tmD6+ecmpDHU/57MA8o3LS+ai9p
         OsyzxJyKD6+MtjKVbd8pD9J2rMTtT+yFjO1ZQt6mPmvnsJMEveVU+YZogfhz/D3WZW
         suBaYgZL/UsyRIPNpcjrPuH3GTGYyTqu2eEXQC08m/VYlVvjgjgt9hkvMr1rDwlv8R
         QU2r8UVMEybDyYFu7BVKW215mM9TVIaR498yMh+hwKdsxLpuzSX/eCt/Hslw/qccUX
         Kj406waf7z0ug==
Date:   Thu, 10 Jun 2021 10:21:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210610102117.4881387a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7WHVZOlxlGAspllA84TDl9C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7WHVZOlxlGAspllA84TDl9C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: module dps920ab uses symbol pmbus_get_debugfs_dir from na=
mespace PMBUS, but does not import it.
WARNING: modpost: module dps920ab uses symbol pmbus_do_probe from namespace=
 PMBUS, but does not import it.
WARNING: modpost: module dps920ab uses symbol pmbus_read_word_data from nam=
espace PMBUS, but does not import it.
WARNING: modpost: module dps920ab uses symbol pmbus_write_word_data from na=
mespace PMBUS, but does not import it.

Introduced by commit

  47e986c5a316 ("hwmon: (pmbus) Add driver for Delta DPS-920AB PSU")

--=20
Cheers,
Stephen Rothwell

--Sig_/7WHVZOlxlGAspllA84TDl9C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDBWv0ACgkQAVBC80lX
0GzrXQf8C2FXTdYttM/i6WVF/ipogCM06XeoeIdAWhmFsB6Kw7R6PgoHOG9asMDM
rzEqme6pByopfkMp/vZvxSTCr5kiDMXuBTwgnwYARXOHKSxeBsPLO4nKdpiQrE3L
E4ODvqEZdIACR8X2gJ6nljHDjRDoZxKoaG7VwhwzDO6tLmShsrlKD0uEkNxy4evf
fmcZB+1gApkE+/g/KRVc8blZCwrAr0hx6edMM97ZLedNrc+CK6IEaI1WkcFennxi
436xHRFJf7ouTUQW0ucyMvuEQdxg+BRaC8QDIGyQh2lFE9WSDvAkcJUlM71xvHCy
JQk949dhvf2sdsScYV9ppmBhdcLnuQ==
=CVsG
-----END PGP SIGNATURE-----

--Sig_/7WHVZOlxlGAspllA84TDl9C--
