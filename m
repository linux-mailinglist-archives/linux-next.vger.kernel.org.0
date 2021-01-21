Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6002FE43F
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 08:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbhAUHnq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 02:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbhAUHni (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 02:43:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C67C061757;
        Wed, 20 Jan 2021 23:41:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLvTs3mGcz9sB4;
        Thu, 21 Jan 2021 18:41:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611214897;
        bh=Gw203rkDGuemdWIYSTD9EC5OQyUDh8xmdS8SRg/nKuk=;
        h=Date:From:To:Cc:Subject:From;
        b=RujtOeYFJ7QREi0MpQ6rEFTsRWRnoQ+SBuYhRCG5DTGzV85S4Sj/pMkV73sbeBtge
         I41dpG/H+S4T0fHtUxKm91VCh8so8YNXqHFM6QkakWNfBaocnIBDmGDBtEfDUU2K4u
         3t46W93HmwD5NgSwrHR92wouPgYUYQ9faXRQfTaZ4YC+vTCb72onP0YCmGyg9NiDOT
         L54qiaGC5ioR3rCb3zfcaX9lu7565WO6Vhuuxu/TZcTTNbifv874KX/Swa//kCtfDv
         o2DVM9v6kJM3LBcIDVmOiKsLTXN7wC6dGFbJ/GyiwShFMf6YtU7BnFxkJ3md2tJ3Xn
         5QaRZCFLZNRQQ==
Date:   Thu, 21 Jan 2021 18:41:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20210121184136.43c30669@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cO7fI6BTtm2wPkZKK9b/X1b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cO7fI6BTtm2wPkZKK9b/X1b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d4863ef399a2 ("arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 n=
ode")

Fixes tag

  Fixes: d4919a44564b ("arm64: dts: qcom: sdm845-db845c: Add ov8856 & ov7251

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Pleas do not split Fixes tags over more than one line.  Also, keep all
the commit message tags together at the end of the message.

--=20
Cheers,
Stephen Rothwell

--Sig_/cO7fI6BTtm2wPkZKK9b/X1b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAJMDAACgkQAVBC80lX
0Gywywf9FFAYqxJpWSf6wZKsjpuzRwTHA/aJA0mZJ0wOnmApV46s0ZtOxah/4O1D
CX7lmFGRVXL43kreBHxgmKQ1sFgbjcMo7FLJYiCdErRuP/cP3jCvzdrOKr1V9vuH
6vLBaKTa0kyDjk1xbHEPVvn6h+ynrolbQVatcAq9YTsDdvkESs+rZOCoDJQt4ORB
zFnpFdmf1HLbksR7F4ws5MyUI4llHyrXCD6/juUmWpZb567tBtXhAM1qcGN1VEIq
d26cBqXzxLs8fWqtko14itRLqVrNjDkN/hAh7flFJ56LDjRQEVRp/4f9Xlr7N/eS
LGXnwWlbFideZbNw6swWzE+zWt7F/w==
=hYHU
-----END PGP SIGNATURE-----

--Sig_/cO7fI6BTtm2wPkZKK9b/X1b--
