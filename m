Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047A51E7CF2
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 14:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgE2MQf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 08:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2MQf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 08:16:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3AFC03E969;
        Fri, 29 May 2020 05:16:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YNpS613Nz9sSy;
        Fri, 29 May 2020 22:16:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590754593;
        bh=VUgAsTO88V09d8wculMG/QQ036edrCnYcvW4gJWhLOE=;
        h=Date:From:To:Cc:Subject:From;
        b=JFJrApXM+NQ3w2iEVbnM66tNjpQOU0K1s5Q6ks5aOXlyLxokLgFe3Y8RdbPIb7xqg
         /oSLK9faicv7Btum87L0/HZM9Iry8XcdMIBcWVJhUbweV/dw3g0qH+aVLmyBz0Uf2B
         zZuDDbRRNgm2VgnVT/KRSDYAbZ1B946DxavS8hRiKqNX8DDXF7CtnpueHsVr5X7IzQ
         mgT1+t/AEKPij4LqIQOsloC/4AAZhJQPSfDacVBuojeW8rR6OnyDhY50MDHHIaQS1K
         ZhP97GDBMEKBbpDNis1vOtytXKw8iXmEufR7oBozATFyU7sUzhXZOMTzRRWfdjn2aq
         sFoQOTfOw3l8Q==
Date:   Fri, 29 May 2020 22:16:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the mmc tree
Message-ID: <20200529221631.6057872e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i_no.CC0lAwo875EqdtlzFz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i_no.CC0lAwo875EqdtlzFz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7b16993c2bb2 ("mmc: sdhci-msm: Clear tuning done flag while hs400 tuning")

Fixes tag

  Fixes: ff06ce4 ("mmc: sdhci-msm: Add HS400 platform support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/i_no.CC0lAwo875EqdtlzFz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q/SAACgkQAVBC80lX
0GwGIQf/RJGnF8sTNODt+IB3t84mKMQwYa4rDyBHukZtJNAoiV+BxAKYu1joaG0g
/q3ewbrjQZ8m6OqrVaSulRnrOq21StRhtTaJungfBXnEnmJWsTe8fLSHnTC7DUK4
NwGiEf4F8FyDUlAqjWnBvjmND1ezaaaPaZqvR2cjV4yQvxpW8VAej5sSHG8F0wfR
+RGGPgVWTQSDGJ/XttcGTiZtUUnXLaFsQ9/8ni5dDBh2m2roDvTL1c7PcyjIa3jc
r4NxSB0KMU8XRe6CmYr58ISNAiisQmldTzabzGdHubp7h3q4hKpln9C5DTnHFveC
qnbGi+Aoj0HK/zZQ8u9JPpSsVy9/LQ==
=+0fs
-----END PGP SIGNATURE-----

--Sig_/i_no.CC0lAwo875EqdtlzFz--
