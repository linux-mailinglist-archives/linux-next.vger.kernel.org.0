Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E321236D5
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 21:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfLQUNx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 15:13:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51465 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbfLQUNx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 15:13:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cq8t1TM0z9sRC;
        Wed, 18 Dec 2019 07:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576613630;
        bh=w1hDoDA1NRxotFgoED3hZItRRTvbqbNnQRT1X50Qcz8=;
        h=Date:From:To:Cc:Subject:From;
        b=uRJRC9knnjoWbpv/A4gjv3/ZBnzWUICujlX/ya6l+GBiYqaEqMIyu4LeQnXSXrUtS
         +UD17aCVLe7/OKBcUi7upfT6yJxxO4Dsb3XQXQFiuH+snvWbvdPCN8weH08IATXWHJ
         570iT0+DzmDTdy6moCuC62D6CIdrLn/EnxtjyjmT1ZeXZPN0nmsfuH4/sNXSiC4cp0
         bt6fOrpdB6ONONsWJvh0aSQVNYUWVeT1AT+93ZjcVsGbWMrMwpCPIIGWh4kLfvS8v+
         DV02lIhqYVZit+r/xLyQ+6lpmFuYYfRhV0yoo6gEVEtpliPg0Sacvd4kDLQqudzp0M
         d9lft2No3a3dg==
Date:   Wed, 18 Dec 2019 07:13:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20191218071348.024f73e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H++slodE+m8ve8SdDGsw3M7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H++slodE+m8ve8SdDGsw3M7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d094e1b4b232 ("ARM: dts: am571x-idk: Fix gpios property to have the corre=
ct  gpio number")

Fixes tag

  Fixes: d23f3839fe97d8dce03d ("ARM: dts: DRA7: Add pcie1 dt node for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not break FIxes tags over more that one line.  Also, keep all
the tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/H++slodE+m8ve8SdDGsw3M7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35NvwACgkQAVBC80lX
0GyHyQf/fAVGOtsNGIUOlOlGUDPrzdGbOkrpECvJfDp3XR1NjoCMuuiu57OdtfiF
Xt9zQy7nQrnYppmU+KXos7LMAEr0TrJRaeHgiRBt/rURFvVrAADvo770jJZiYni3
7HU1o8YXUtQQB5VTKNKR5alcpQUELF2+5Hd4gk3Sadmai3F4+g80B/pqITmouS13
+cFp5Y75dL4KFMOW3VoCvena74Cxb2vuGfFDrJG4SmN2rJWVpBrL6oOZGHOVjlsC
JRhpsJBo3aYsW7xXM2ngEyNbJDwZn4cjw8MpgPMSAJvHdZLna3GYyO6YieJe/pF4
1/gb7L5DgLONvQm9coo2dNebcSu+NQ==
=ulye
-----END PGP SIGNATURE-----

--Sig_/H++slodE+m8ve8SdDGsw3M7--
