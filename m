Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C94305113
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhA0ElF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404629AbhA0BoM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 20:44:12 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A34C061786;
        Tue, 26 Jan 2021 17:43:28 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQRFp1FRzz9sVn;
        Wed, 27 Jan 2021 12:43:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611711806;
        bh=gyP1KOO0UPd3NodWSOu2qqCjP82R4eGfiCFgktKxJBs=;
        h=Date:From:To:Cc:Subject:From;
        b=Bxe7mVFWNLU46GEi/S7XCpkb3uvceuDji61ShUt95aI81KUMjupWOiKimNQsSpra6
         wCCnlHqbF7a1VgImuhRNOJ8uEuXY1IAuRYITV3ao0P0wXRWeSUw/R6E533hfZRN1aC
         cW4zULI+1jU83bXfPZjtLwcNSdjtVskk9YfZpisHPXIxj2089V1WF9brpAYtWFAx7q
         Y49ZHRYuNoWOnIb54cHQ1Hx3h0gjDoWf4bMwLuCwrGu2qvHrKv6d9f50rX6zb7QI17
         whEqxFnjGkAbCrn19TFd4xB9nbxRgc5uXGDoZtpsq35XtFU9YTbJz1m8ZPPodSV+NH
         V5RbHy7beFk2g==
Date:   Wed, 27 Jan 2021 12:43:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20210127124324.29b7c4d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/huNVb4FPoBQyr5Ewx5XLoQC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/huNVb4FPoBQyr5Ewx5XLoQC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/printk.h:7,
                 from include/linux/kernel.h:16,
                 from include/linux/list.h:9,
                 from include/linux/kobject.h:19,
                 from include/linux/of.h:17,
                 from include/linux/irqdomain.h:35,
                 from include/linux/acpi.h:13,
                 from drivers/acpi/acpi_fpdt.c:11:
drivers/acpi/acpi_fpdt.c: In function 'acpi_init_fpdt':
include/linux/kern_levels.h:5:18: warning: too many arguments for format [-=
Wformat-extra-args]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
   14 | #define KERN_INFO KERN_SOH "6" /* informational */
      |                   ^~~~~~~~
include/linux/printk.h:373:9: note: in expansion of macro 'KERN_INFO'
  373 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~
drivers/acpi/acpi_fpdt.c:255:4: note: in expansion of macro 'pr_info'
  255 |    pr_info(FW_BUG, "Invalid subtable type %d found.\n",
      |    ^~~~~~~

Introduced by commit

  208757d71098 ("ACPI: tables: introduce support for FPDT table")

--=20
Cheers,
Stephen Rothwell

--Sig_/huNVb4FPoBQyr5Ewx5XLoQC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQxTwACgkQAVBC80lX
0GyBYggAkv5kWKT8dFd5XyqE80tH8IOP5b7aSkWZrMEQZgG+gVMbUFBY/S8GNc6y
QSwglaXZtlfXV1NhDswH3L42SwnNoUMWe8urw/BxUshsvHGLmyavTX7KHw02shYZ
z8FaxnSlPZF4LZhuZJzmh5KuGTjYWkasrt5ar0YEjpCtzFTgNDqPcjRWOOS3QuEM
GJ0a4HjnsSGzlxtkdAYLNjrra8JdukEHUN91FEgyJIKQtXz2QNrEEGJzYVO3+iZ0
owtH1GfMyJB0T/GB0dPBDYvx/WRpg9DXRMkqAFHjdf5PYVJM4hhHMO43P/vw2iMJ
QQWfTyad3NFHry6Z+weLCqo7x2lYuQ==
=zSNb
-----END PGP SIGNATURE-----

--Sig_/huNVb4FPoBQyr5Ewx5XLoQC--
