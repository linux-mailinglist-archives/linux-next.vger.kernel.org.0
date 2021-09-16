Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA1840EDA9
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 01:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhIPXHm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 19:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhIPXHm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 19:07:42 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4356AC061574;
        Thu, 16 Sep 2021 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631833579;
        bh=NVLNJise4O43rAhgNgQnmJZqXyUWeHQ89TeyIjf5OtU=;
        h=Date:From:To:Cc:Subject:From;
        b=rp0kycHBYlszh5bxwiLmEFYTjd5CaFwC7xXQWli6r8WRSDcTNiZwYX154FCrBoo34
         xycL8zJtz8aUFNPoK+Yt1DQspNMPIwUuIC9JlCyYqytldWEXZvSwrWXhN9zIu8d/5r
         OR8nhvphV9oarf6JayfJIb/y8YTx1QNEN9qfnynz6yIbNDS1gXbkSmdguGsnkZUyrX
         gKD7zxGJuHhXrMv8DuwdXo2do8WYAD1rNPwgVmuHUc+w2zGdGIJDrPh/E8zZj0qPSZ
         YOUjoK767+NLf3Ke36NtuTxrbjWxZ0rfiQVMSC7iKJHOlZF/AHRVf5c2pnsUe8bqjj
         ezruhfKdQE2MQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9Xkz0DXrz9sXk;
        Fri, 17 Sep 2021 09:06:18 +1000 (AEST)
Date:   Fri, 17 Sep 2021 09:06:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the clk-imx tree
Message-ID: <20210917090618.3a7ac4be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b8dF_tbP=zcH1ieeJHlsPoK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b8dF_tbP=zcH1ieeJHlsPoK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk-imx tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "imx_clk_hw_pfdv2" [drivers/clk/imx/clk-imx8ulp.ko] undefin=
ed!
ERROR: modpost: "imx_clk_hw_pllv4" [drivers/clk/imx/clk-imx8ulp.ko] undefin=
ed!
ERROR: modpost: "imx8ulp_clk_hw_composite" [drivers/clk/imx/clk-imx8ulp.ko]=
 undefined!

Caused by commit

  86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")

I have used the clk-imx tree from next-20210916 fot today.

--=20
Cheers,
Stephen Rothwell

--Sig_/b8dF_tbP=zcH1ieeJHlsPoK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFDzeoACgkQAVBC80lX
0Gy2pAf+LlQ1PAlKmvsdPaOx8cZG21uN8mHEyli0TKqZHGr3ax/HQnpJEQh6GVcu
1csMNg+Yqicq2VVxFp1F1Z+j4CwefABKl6BdqKOwN2ADxHhOqfnbOm59ViUBlwR8
M/3Ee4gJibURQq5FB0BJ4VnDOJo5fcMP7/0g48DB1FltQy5Y6d+9BwEepUIrHf3V
kDPRFzplb+peNtvwJ/R0/05LTj4n/i1mGkT3G7gJLMNHMHoglCtHP1qKZPC1IFLl
H2zja1uWF3QG+HdUI/SF6u8IlihAHz5VwDVGZ7WkavjzQ7aHV5Q3cqzvaD7E/ZEK
DyTJH5kvqryr+4EAIjA/bvCESmDlFg==
=0r0u
-----END PGP SIGNATURE-----

--Sig_/b8dF_tbP=zcH1ieeJHlsPoK--
