Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CE2260732
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 01:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgIGXna (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 19:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgIGXn3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2020 19:43:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60090C061573;
        Mon,  7 Sep 2020 16:43:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BllGG03QVz9sR4;
        Tue,  8 Sep 2020 09:43:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599522198;
        bh=BIr9aLATK/fIc7nAGDKco1dJkX6S6hj+9Uc6Rg3zqqw=;
        h=Date:From:To:Cc:Subject:From;
        b=CiMaDb290e08zfSq/pwXQ0rfOOR9C8SJO3kONZVzZLd2fNDTXDORrT4ntTUkujees
         8sAXsi6KZK7CFxPCMAesuJX4pJnqfOTS1O2r9NezV6sHE+J1OJkUCwb1EEGFSi+U87
         nzix3hMSUIHg285xb7fiaSn7lMLOpSAyB3UWELiX96uWogN/epEEtACRbwnm5o54lS
         NSkQTEjRhZCdSpO4tAfyhe3D/F/mEfXgjHor3+h4+PXrFBziJOG7cuJBea+UqCwSBu
         UCH6Y4oqhXCPY63wP+b8fvNVfJT42yChylFSIlX1WPuNeJuNrfDCFcbb019IMR4bP7
         WPzPmhwhIo4Iw==
Date:   Tue, 8 Sep 2020 09:43:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the char-misc.current tree
Message-ID: <20200908094317.6dc1cb2a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E8tCM5jXcPbyFzTFOo73b6d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E8tCM5jXcPbyFzTFOo73b6d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc.current tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

In file included from include/linux/printk.h:7,
                 from include/linux/kernel.h:15,
                 from lib/dynamic_debug.c:16:
lib/dynamic_debug.c: In function 'ddebug_parse_query':
include/linux/kern_levels.h:5:18: warning: format '%s' expects a matching '=
char *' argument [-Wformat=3D]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
   14 | #define KERN_INFO KERN_SOH "6" /* informational */
      |                   ^~~~~~~~
include/linux/printk.h:369:9: note: in expansion of macro 'KERN_INFO'
  369 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~
lib/dynamic_debug.c:116:3: note: in expansion of macro 'pr_info'
  116 |   pr_info(fmt, ##__VA_ARGS__);   \
      |   ^~~~~~~
lib/dynamic_debug.c:119:28: note: in expansion of macro 'vnpr_info'
  119 | #define vpr_info(fmt, ...) vnpr_info(1, fmt, ##__VA_ARGS__)
      |                            ^~~~~~~~~
lib/dynamic_debug.c:388:3: note: in expansion of macro 'vpr_info'
  388 |   vpr_info("module:%s queries:'%s'\n", modname);
      |   ^~~~~~~~

Introduced by commit

  42f07816ac0c ("dyndbg: fix problem parsing format=3D"foo bar"")

--=20
Cheers,
Stephen Rothwell

--Sig_/E8tCM5jXcPbyFzTFOo73b6d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9WxZUACgkQAVBC80lX
0Gy1rwf/RG91RZh3+yPekVSQyWNs7+7KWRNHPCiEKCfAiyaayRlXOdXLhOurMyzb
9/CpeJdGbufexKXXEJuUTYkkmG3Ixia2bsbR/3HZmBRh9FCwwQH1CprONMupts4y
q56+UPQexveVTzeleuWTtCqDFslnuiFmqpokW7lmDKx52R3dNLDLI0YGM2SUCVwQ
afFRweBZtMcVyjKM7lCObEorQWZJH0zWZY5IH6A34rwv5aml1D3S7zbR1B4JOzky
GVjGlIlz44PDWXJS2g38E+SgBJZTcAUs44LCWM0ztgMZj1YaiO8iOgnZ2MT7QNtX
zuOp2GU5MlU0Vnbqy916oU1TuaR0ag==
=LNS3
-----END PGP SIGNATURE-----

--Sig_/E8tCM5jXcPbyFzTFOo73b6d--
