Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D6927E8B6
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 14:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgI3Ml1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 08:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729767AbgI3Ml1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 08:41:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9438C061755;
        Wed, 30 Sep 2020 05:41:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1bTt3vJCz9sSt;
        Wed, 30 Sep 2020 22:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601469683;
        bh=MZa3I4X11U6g3zahDyYonOXRWDpauA3FSK6KKipyz8o=;
        h=Date:From:To:Cc:Subject:From;
        b=chGh0mA1PnSuSJuNCVTAfkN/kHIUCTA9lPW6E+bmro+YDjVaDhwBi2yP22TcJarCw
         OYW52lus5XwaBbQgyE1CZmWyv13jyvJb5gXMXgGz1xnTxyDwMrNZn3XWlfbCeYNbAB
         Xq1zFWAd2wcDBxVf8vQICG93Qzm5JeiAsDFcfTogVT1UlHmtCK35j04OktamXW9CeV
         3SnuAblkr0HYfnOxymnVSuVrpBLDL9CQuHDpZPKcI/Bbq+E39a2vttOFUV2ZfessUx
         vdiG+5zTla4mTwZM5DP4C/JczTWWet+mZEHQFvWhBI/ryTiXQT6vnZa6m1AgCxeubA
         LLPY9VLKI2ZWA==
Date:   Wed, 30 Sep 2020 22:41:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anup Patel <anup.patel@wdc.com>
Subject: linux-next: Fixes tag needs some work in the risc-v-fixes tree
Message-ID: <20200930224121.12b54d61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uhBCk_IwK1FtX98DtPL/9G/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uhBCk_IwK1FtX98DtPL/9G/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1e555ccc72e0 ("RISC-V: Check clint_time_val before use")

Fixes tag

  Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not break Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/uhBCk_IwK1FtX98DtPL/9G/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90fPEACgkQAVBC80lX
0Gy0vgf+Nyfg/+LfxjCpyWYg71LQ8x9yQ9TaXRjiLha3pcEETv2uO2qBLY5pDFRN
qKC/zYjFX4vX7ut09shqzz1ALJEtAV44YE5CcI/7uraqdIDyCIeyacXaPoYz+0hq
5jbqVSRCt24Ou0i+OBw4SQF/d/U2XBToDHGizLSbUgD1PoHOV86A5+Qm98/FRigi
oMsXiYVQwN4nulfSwRrh89V79IFiItwAf0eoZdOIgmOkq2L+NuSyIpKzlGLW3Tgx
gMa328B9TCqzYH94RKEjkqEo1o8VY2yp0bLftqkaPrbMPPfcAzJnANhbEZ2SuSDP
JHPrBVCIndOt0Ca8ech0smcjTgckiQ==
=6L1F
-----END PGP SIGNATURE-----

--Sig_/uhBCk_IwK1FtX98DtPL/9G/--
