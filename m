Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3302D2F0AB2
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 02:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbhAKBK0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 20:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAKBK0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 20:10:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4373CC061794;
        Sun, 10 Jan 2021 17:09:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDbGC5Vrtz9sWj;
        Mon, 11 Jan 2021 12:09:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610327381;
        bh=W5yEqvPRAX9Ph8yTBRkoKbr9bk7YJU6Ay1+V3Swbz34=;
        h=Date:From:To:Cc:Subject:From;
        b=hotX+jd8kd9mDTTxpouZUmilaE8MNP/Sjdsh3C+IUBGEAdq3O/EObn9LW504TxXg+
         5CPbeFzKDDWr2u2W7E0dzjbdk0GqpWw21eGY9xNwPnJB8g9Ob12MRj0ag4LCPBhfDP
         1GWJBjFSpSSO9nIfHdfWCsE/w53yUbgUejEQf+obtKCnklW5Hf03Oam7sRmyq4t/j0
         O+XsHlH2yf6hbp7w896Nd0WxAIB7FqyBAlCpyBYo0d4Nq13uIepHAtqyEcgyap01Kv
         ZDRRDLU1vKVFT5R4vlpicpZbGpwxJZqMrfScpBwCpCE7s0ywitTNeUvhFNK9+I8lgT
         6ZT30VA+EPTUA==
Date:   Mon, 11 Jan 2021 12:09:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210111120939.7d982bb2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IX3Hr6fTTQq1GCYa0EPQj+U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IX3Hr6fTTQq1GCYa0EPQj+U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/kernel.h:14,
                 from include/linux/clk.h:13,
                 from drivers/spi/spi-cadence-quadspi.c:9:
drivers/spi/spi-cadence-quadspi.c: In function 'cqspi_direct_read_execute':
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
   58 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-cadence-quadspi.c:1153:24: note: in expansion of macro 'max'
 1153 |       msecs_to_jiffies(max(len, 500U)))) {
      |                        ^~~

Introduced by commit

  8728a81b8f10 ("spi: Fix distinct pointer types warning for ARCH=3Dmips")

--=20
Cheers,
Stephen Rothwell

--Sig_/IX3Hr6fTTQq1GCYa0EPQj+U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7pVMACgkQAVBC80lX
0Gyligf/UHPdx0ZdtXiO6H7wFRWdp7aEO1Ioj0X9/ES+/5Al48YQWwzOScjlbpYs
9jVrEluo1i/3q+4aMnKWK8ikRPL6Hvp8JNYpw74uI2+TQ4hueTATqoD8Xwllb6Ys
aA9uVKm6IQfzOsg3CAcYu8FRoTsGkYWJHHFpcBVqBw51Qip4qu2bgJcjY338EcLw
vefS7/uOtkM0lUe8s8rY8LsSGfzjI2CEfPChZaU2bLyk11SNSbWuIT+hhgjDwes1
Te/793FzIALNa9Lnc2e3/V0vepw/SNWpPu5AMSG8IulceSWSKd25dv3vjuUAoBj9
xv1W2hO9RaBZH8TeDCT0OAi0MpXDTQ==
=avOr
-----END PGP SIGNATURE-----

--Sig_/IX3Hr6fTTQq1GCYa0EPQj+U--
