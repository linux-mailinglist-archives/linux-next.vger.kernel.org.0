Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BFB3B6B8F
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 01:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbhF1Xwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 19:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbhF1Xwd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 19:52:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024A3C061574;
        Mon, 28 Jun 2021 16:50:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GDPVL06GXz9sXN;
        Tue, 29 Jun 2021 09:50:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624924203;
        bh=1KgKNLYDKdeCfLcT88TJMse+bZyRmCpg/mkbwx6HP9k=;
        h=Date:From:To:Cc:Subject:From;
        b=UeG2EQZSyi6g4zK3hqREmhqalz9emwjil3lKvQteR27UFIctiMN5FUbMLQPpDkZX0
         p9oyA9McEqLMpKa0snjPojnxjFrUpJeyBke7sgkpkSMCJSo7K5fGvkd4zYx78fZOAL
         xQN1AvHbEbaa3yNP3TURk7wjYWe51qV6huiY5fixqIly3SZwcWNq7EPYLzNS4k9WDC
         4qQ2sIMuDIMP+4NyQ873ClkjDKygBnQGNlgxsed6o02ixOSXCn/9ltoLCZSj22Xhx2
         /f5BXealOvq9u48seebdriwTN8apPDaYAD75XK9Jg3aSo+cKP8lLfiRTwpciGS6+bB
         I/23SNLtVeisQ==
Date:   Tue, 29 Jun 2021 09:50:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the thermal tree
Message-ID: <20210629095001.1f0575ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/33I63fev2QgIpT/d1VWp3ke";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/33I63fev2QgIpT/d1VWp3ke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f019bfde7a6f ("thermal/drivers/int340x/processor_thermal: Fix tcc setting=
")

Fixes tag

  Fixes: fdf4f2fb8e899 ("drivers: thermal: processor_thermal_device:

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/33I63fev2QgIpT/d1VWp3ke
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDaYCkACgkQAVBC80lX
0Gwu2Qf9Gh7/TnhxPiE5AwwiAz1Rlchp+yaYM7ZFXojBJTpZrHbeHOf4Fo67Eeit
Pq1ZDada7GUI+YkurjL4BjpnB06gB2n/VZdvJgeoFja7p2yySOo0cJV8oiY8J1GD
+A9rBnPfRNPCu89JoeWCcDnr58mgJEtBCcCsXDGV8DLCAUQqsLgWEsVl91/OyuEy
56TndX4nZIQ1+ZrwTUCZPdqLlF8bXy6EKt8/FJ5sSvMblV10UgN55/93TI/ZDNnV
61wZG0Q1A5ad1UrLTroVEaz2UYSApehcVFSJz+eWxdooJlwPxy4wYbO7yRTQra6F
TT2zUqtCBdzkZ6CIpbqe29IFsuDiyA==
=mzsy
-----END PGP SIGNATURE-----

--Sig_/33I63fev2QgIpT/d1VWp3ke--
