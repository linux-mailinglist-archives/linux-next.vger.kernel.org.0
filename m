Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0DF1D24FE
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 03:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgENB6S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 21:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbgENB6S (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 May 2020 21:58:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF50C061A0C;
        Wed, 13 May 2020 18:58:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Mvny4Mzyz9sSd;
        Thu, 14 May 2020 11:58:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589421494;
        bh=TfnS8yU77VuJwwO61vQmNZF4HFAvsYRLgC0J2A5bv3I=;
        h=Date:From:To:Cc:Subject:From;
        b=dkNab214vSh3R+Azer2Zt1RX3k5Y0DI7Q/8EiFaGsRI3IdOsZhGD29KRfVWTcNkUO
         Y/M9evz0WcQsAJigtXZ/ajVCBjGb8nQcR5ugL4hzXGBebQXardpwV1W/ghEwemQfVE
         1e/Vz61whixvvHI9+O++PYYx+YlFH5tUGtHYjgYwpIjR8XhOq76LTAEztkNajvLGiz
         nPm+LAgGTCCi6CeSkF6Ah5xcbhCy2ywn8VRaYI2lHela4YAeAW6DbBn4I3/x64eLDV
         hJ6HMsPGgqERuKWX/YyM0AWHvJwJXsXnaLQ2kCD9zEwW6IyJdahw2XCxa+LtGW/xyo
         xX969L6fVeD8Q==
Date:   Thu, 14 May 2020 11:58:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: linux-next: build failure after merge of the opp tree
Message-ID: <20200514115811.1c6192b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8su9.eJmUL2l_yik_A3lOfP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8su9.eJmUL2l_yik_A3lOfP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the opp tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

x86_64-linux-gnu-ld: drivers/opp/core.o: in function `dev_pm_opp_put_opp_ta=
ble':
(.text+0x76e): undefined reference to `icc_put'
x86_64-linux-gnu-ld: drivers/opp/core.o: in function `dev_pm_opp_set_rate':
(.text+0x2c59): undefined reference to `icc_set_bw'
x86_64-linux-gnu-ld: drivers/opp/of.o: in function `dev_pm_opp_of_find_icc_=
paths':
(.text+0x3ca): undefined reference to `of_icc_get_by_index'
x86_64-linux-gnu-ld: (.text+0x441): undefined reference to `icc_set_tag'
x86_64-linux-gnu-ld: (.text+0x542): undefined reference to `icc_put'

Caused by commit

  12fa389dcf86 ("OPP: Add support for parsing interconnect bandwidth")

I have used the opp tree from next-20200512 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8su9.eJmUL2l_yik_A3lOfP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68pbMACgkQAVBC80lX
0GxG1wgAjCwV62ddqNYeydnRDib1ozmtknbMVsadgAYWK7kIfqYft5p257Ga/IlK
AXBwAiQFtKCoQw1qsYuUAJ7MIHkco2C/j5gYuG2r21lODWckzc+3zG0OyogZ/wn9
j+VdJUE1tGqLYmms3QInE69gMKHZ3HuPNL9JAbsYcd3lQTj4fh3k7dpdjAoQolmC
yWHJXL8XjS4bPPjakPYkGC8XxlAB6C3Zt7ICY4s1ej6lBJOUzTwJLYi+GmUc+hEx
IwUF0iu2NxyDTu/RJ/CIOgs1+fyqBZLibXeXhWwdDuq3tAO6Bn3wE1boqUnzoE5J
FtHZHTrAl58L9cwAYI57KU3f2E9i2Q==
=2Lu5
-----END PGP SIGNATURE-----

--Sig_/8su9.eJmUL2l_yik_A3lOfP--
