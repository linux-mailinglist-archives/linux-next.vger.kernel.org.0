Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2082F6E1B
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 23:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbhANWXx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 17:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730584AbhANWXx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2021 17:23:53 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F0CC0613C1;
        Thu, 14 Jan 2021 14:23:12 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGzND3V0bz9sVX;
        Fri, 15 Jan 2021 09:23:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610662989;
        bh=FYJ/k0W9Ty7RWBAAi6vztPgKWINJpYMQQ8/JzNdEgpY=;
        h=Date:From:To:Cc:Subject:From;
        b=aUhxoJfI7yZOIbh3nZYoj2JQWjXBQz3F8Ia2HaLeALEnBwATyaiU4wDkuHPlzA5ri
         kWT0GoEhreytc0lJLUgteS/RxgPW+JAYW2w4d3fDqZ1tm0xzLV2BQ6IJompeLjJ0gb
         K6AFrFAgI+DOhpLxI1AvBbRUZYskrK31Xyr7fblHmOs8TI1w7L/8lIESHRjxJrZg9Z
         DgeA0vlkF7JPzAFfucYqsAzQSBh3/vwzc6oHMDVL4IhttlhrkB6S08utqxKJ8ewInl
         zUMSvHd6fUFOrepyz4xCUXBZ/vaL/YMmQHCg35InbOcRVWsYpcRXigxcfKwef3IuzA
         L9rjydPG2w2YQ==
Date:   Fri, 15 Jan 2021 09:23:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the battery tree
Message-ID: <20210115092301.4c1f4893@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NxvgCWvkJb1GkFF=pgSiY=_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NxvgCWvkJb1GkFF=pgSiY=_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c339b3aec780 ("power: supply: cpcap-battery: Fix missing power_supply_put=
()")

Fixes tag

  Fixes: b0134cc14b9 ("power: supply: cpcap-battery: Fix handling of lowere=
d charger voltage")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 8b0134cc14b9 ("power: supply: cpcap-battery: Fix handling of lowered=
 charger voltage")

In commit

  efa32492629a ("power: supply: cpcap-charger: Fix missing power_supply_put=
()")

Fixes tag

  Fixes: 688ea049233 ("power: supply: cpcap-charger: Allow changing constan=
t charge voltage")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 5688ea049233 ("power: supply: cpcap-charger: Allow changing constant=
 charge voltage")

--=20
Cheers,
Stephen Rothwell

--Sig_/NxvgCWvkJb1GkFF=pgSiY=_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAAxEUACgkQAVBC80lX
0GzQtAf7BcZ3rT3zMvzMPVfozgewG6DsfLL/7l5Fb0zIXOwDKfL0+AXd+hZsnXJB
0tr28mNEEY2ZtgaOLeMMyPAO+kiDjvV8TVvhsDAlgO1c2b9vSwJ1Di8K7R4ubF2a
sRTbOkV4Rk1D3AXmu8XJyR97MF98HTZTdk7JGP/rS3EoM1DyZ8Lq/Dt+LCWP4X7l
eOLvm4nSZZPY7dZgEugmZatlR0wcrL/xyZ4NcvJBAGSdQWXUXIfEQkQh2AAMZpqM
iBdYq7PNqCwRPrxPEqOhBn+7sq5ZVwT8fF2TuAlFd9NcKKkMtOaWaiZdACyQj+G2
opBGxDGSdFJa/qBHUHcLoD7/xPaq4Q==
=xreV
-----END PGP SIGNATURE-----

--Sig_/NxvgCWvkJb1GkFF=pgSiY=_--
