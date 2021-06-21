Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7753AE2D3
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 07:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhFUFk6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 01:40:58 -0400
Received: from ozlabs.org ([203.11.71.1]:34889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFUFk6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 01:40:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7dcK2Qs8z9sW7;
        Mon, 21 Jun 2021 15:38:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624253922;
        bh=vxr+NI1ARhFqgXcu3KmRNV3DAto9I4LurB4qnjfhNvw=;
        h=Date:From:To:Cc:Subject:From;
        b=pbLB0aLsRoUMhPOqpDRGOkhKuGd/gBZEnXMe8MjVqF9UM9C7GdSp7E9b5aXKVi+uR
         djkzCsix4snx29oiKXxMzI9D99kKTCn92rB9hHh4XI+W7Rt6NtSkI7oDMlkxpGkYRU
         5EbuYhlPM8GDCsdoJT+Bi+ukhhMDi3OumDDm4TTGnC+vLvZeZwpTllzGXWkYnMg/Gj
         6zOV0lTUzTUu6DvS2So5kMHfvrdXJ1RvoSaVJHAeJuZH96usIhV30VhcxStz8HDImg
         WiD9NG97a5sAWgv0pYBZS2qSqqb0nKUW8idIDgaNzDyAN23ba/9cSRqVn9If69Jliz
         ImqV56xiM0jbA==
Date:   Mon, 21 Jun 2021 15:38:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the watchdog tree
Message-ID: <20210621153839.43dd423e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Teyys8cS/W5/nBG=c8p8zzx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Teyys8cS/W5/nBG=c8p8zzx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the watchdog tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "bd70528_wdt_unlock" [drivers/rtc/rtc-bd70528.ko] undefined!
ERROR: modpost: "bd70528_wdt_lock" [drivers/rtc/rtc-bd70528.ko] undefined!
ERROR: modpost: "bd70528_wdt_set" [drivers/rtc/rtc-bd70528.ko] undefined!

Caused by commit

  f2a5178b0b9f ("watchdog: bd70528 drop bd70528 support")

I have used the watchdog tree from next-20210618 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Teyys8cS/W5/nBG=c8p8zzx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQJd8ACgkQAVBC80lX
0GwoSQf+Lmmu83hAOjrJ49F2rB+sCr1aDsvIKaEisJyDJ1/LBT4gy2GTE7CpvlWA
iczg4mq7P2vnKeuQSYfKMEAv3dR7GmfqGoi+jD9avIZiFjKMKPj3XEyoiigo/lBT
vwZbbf+btCL4/pnVv9u93/wofw1KKDbx7i0DeOUn5qjCi3KSSqKrMytFp/8mgGR/
8CIAtXgfrm/TYpdg8JWDuOBex527tZquQpiNd0wh3KHkLV8Dwbunvxt17HKFrK8B
Jz7VKyuvV61n1sSK/3U2HG0B8bQlZLKusNH6JRa/qVubBfbnZo6QB/4aHbYq1566
CqGSjP/uVvzoaiSWSwTPwN6reUroGg==
=kUkq
-----END PGP SIGNATURE-----

--Sig_/Teyys8cS/W5/nBG=c8p8zzx--
