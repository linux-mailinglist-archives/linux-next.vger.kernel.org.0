Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D25161ED6
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 03:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgBRCJC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 21:09:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgBRCJC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Feb 2020 21:09:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48M4642hG1z9sPJ;
        Tue, 18 Feb 2020 13:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581991740;
        bh=EpDkVgnz/Ap++RYbCEG7g+aMyezkq2l/YXrSRmWTL4I=;
        h=Date:From:To:Cc:Subject:From;
        b=mljVrBe0mRbl3OQtAzV9kH3RPviGmdFqRF5yFdOwiXE2VcOkkFqBorj6GSBM6uU98
         2zHTprcodVj3FWmYq5ploNV4//NOQbpKUZsMKzEdeLUhllag1x3m5BHtmI7x3Kc/mG
         F72Cfj7AOWiXmTJCq1Gus3tYLrcg2F0JO/+cWKOarz28147bNAX3fwbdoFAOYnZv4F
         Ote8a40Jz8h35GgkE7jnsoGNBxDJQV2XAn2ex8mTE0NSRdbofgYnBhGAOw4ol72RpN
         s1hSV4ZAGPYhgd/wF/Rfx8V2uhtN/wddeQexLb9wPlKqyE5axGednAYDs1ySf7mJj5
         p1CpWXv8I6hvw==
Date:   Tue, 18 Feb 2020 13:08:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <20200218130859.3deb3404@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CBsnXqy2RIT3gG.T4E9pJZG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CBsnXqy2RIT3gG.T4E9pJZG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: drivers/soc/imx/soc-imx-scu.o: in function `.imx_scu_soc_probe':
soc-imx-scu.c:(.text.imx_scu_soc_probe+0x44): undefined reference to `.imx_=
scu_get_handle'
ld: soc-imx-scu.c:(.text.imx_scu_soc_probe+0x134): undefined reference to `=
.imx_scu_call_rpc'
ld: soc-imx-scu.c:(.text.imx_scu_soc_probe+0x20c): undefined reference to `=
.imx_scu_call_rpc'

Caused by commit

  68c189e3a93c ("soc: imx: increase build coverage for imx8m soc driver")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CBsnXqy2RIT3gG.T4E9pJZG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5LRzsACgkQAVBC80lX
0GwRhwgAkk9A5zlb8+3cFHiJERVO6KFmENh7ClMXo8HWwhg8j9CLhjF3F4BrCNW7
wILY3a6CG2DLxBjDUoSUywzLeRaeSjpcETJJ39MQsK0wnFp7jvM10TBC6Gzk8IKG
DINLI190uGKAZfz1Fbq2YxRIfzNRVTEWbo1trSNXsJoOYVZrl1mQsZ8mAiVvg3R8
iH+jqxhPD7VxciXlEoX2ra4Q/js5TdI5ITcN/21Sh07wLR44jQsppldANcExwfsD
AqIGUBxGf1oilIj2HlEDK4aSqTzP7HMVF8CRiKlOlI8PZglE4X54kW7r0EXzN5vs
8GpY0pYQC8tZtd8y6LgoDXSsHvH5LA==
=zc9M
-----END PGP SIGNATURE-----

--Sig_/CBsnXqy2RIT3gG.T4E9pJZG--
