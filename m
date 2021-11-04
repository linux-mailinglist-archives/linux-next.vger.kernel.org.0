Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E52444DF3
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 05:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhKDEkM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 00:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhKDEkM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 00:40:12 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698DAC061714;
        Wed,  3 Nov 2021 21:37:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hl9q06DT7z4xcL;
        Thu,  4 Nov 2021 15:37:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636000653;
        bh=km+vDm/JaqGHebveB57IgH4dx/DOvuBxnFo5HbhS+FI=;
        h=Date:From:To:Cc:Subject:From;
        b=E3qWJzDVBLwTxlpnN58Mbz6MgArfmlmHCu3b/ppw++LvZMcu0+IayJIyghRCDNUgs
         SO8A+86B/TX2SQg7ZqL2sELypAkejtsPVdpUrcYXkSl2IR0LujxbN5nTJ1rJyx90kv
         xJHva1VdUQ+PPpbKd/n5nOkr03Y+jJxR7s41m6eH5AdjTN/CrpiIkstflqfIOXMAhX
         +Vk9RaWoAsP5/1ZTlW8bYHWuhIdnQ0+IA/sukKIPLKGBjlNum8QtvLaazDIp/r8hmz
         SD6fKGGpIP2tCv6Bz6298WkA5x+lfzhIaUrAMPRr4FHr5GK4dAviFNej5Xf7Kk1I+O
         9XEuigNy77ixg==
Date:   Thu, 4 Nov 2021 15:37:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
Message-ID: <20211104153732.0cb0169a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EkmeHY+Qa2n2FwiWke_+opr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EkmeHY+Qa2n2FwiWke_+opr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  559a5d048ec3 ("scsi: core: Remove command size deduction from scsi_setup_=
scsi_cmnd()")

Fixes tag

  Fixes: 2ceda20f0a99a74a82b78870f3b3e5fa93087a7f

has these problem(s):

  - missing subject

Pleas just use

git log -1 --format=3D'Fixes: %h ("%s")' <commit>

so

Fixes: 2ceda20f0a99 ("scsi: core: Move command size detection out of the fa=
st path")

--=20
Cheers,
Stephen Rothwell

--Sig_/EkmeHY+Qa2n2FwiWke_+opr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGDY4wACgkQAVBC80lX
0GzwOQgAoXHTThTh8p6NvPytteB72P5BjDBDf1PBM7mzk+N/F9CNSPvF57Vqq9O4
X4IHsBYwtLE1QMjNYTbuQtQ9MX7Ic6Ar3yaY3YSttCPCe8LXdrIOvnBHDD78g4Bb
i067LfUe3F47v14ugSe5qXTHb6jOTlq51eTN6QxYd1TxoUjAUbMeMwMqPblABMhJ
n8mhYnY4VjPp2mXzjf85PaH1TP82QBSCyiV8lYVyrV3tght4cH9rvXGvrkuFEIoH
PWHmjwLZUN4ko29d/ATMeuvOCTwf/qgPj3iYx5q/ZuIx6+ubWFvm9VyboEgR0OJH
kPTWTMMbw4NzLbjadLEVD1UX2P5JCg==
=J8zU
-----END PGP SIGNATURE-----

--Sig_/EkmeHY+Qa2n2FwiWke_+opr--
