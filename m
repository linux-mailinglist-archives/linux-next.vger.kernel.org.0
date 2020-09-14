Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763532683AA
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 06:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgINE35 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 00:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgINE34 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 00:29:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7864EC06174A;
        Sun, 13 Sep 2020 21:29:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqYL84NKlz9sTN;
        Mon, 14 Sep 2020 14:29:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600057792;
        bh=6b/mDq/3QAr/1YD62GFOqQo1PLtnCBY+v0GMC/ZiQY4=;
        h=Date:From:To:Cc:Subject:From;
        b=uSgQvy9/JBGr0hlf1vwJfGBABebHsrUCdW+AaOnyx/PPNZPaJZ3LAPIqkks+rgsWw
         IdEZcm55BXUPfMSyBKuGYqCCVgfmoB86C+2wj4UESi5KsGCBV4BBH8z5GSDkPL97uk
         uin4RrKvPQ56FWXwWoPteQkJpX3HZREZpuZYz/oGGOSWCkUvu33O7BXaehobOrTUD2
         x9d+3yNlG6BeRK/EDlvElKJwDeU7KCPvug768G13zTz9+xoTbcrrsz7TtjzPSSN74v
         dEV9azRhT5SDzaHiGXZvFTgYSPKbQIjjYs3pu0q7QP54qpB3Qeo5X9cZms5HnnE6J7
         ttmak12b3Rv+Q==
Date:   Mon, 14 Sep 2020 14:29:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Brad Kim <brad.kim@sifive.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the dmaengine tree
Message-ID: <20200914142951.66cd3498@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T_6P2ekptJ7jjOZECFQy7tb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T_6P2ekptJ7jjOZECFQy7tb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dmaengine tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_donebh_tasklet':
drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unused variable 'desc' [-Wun=
used-variable]
  287 |  struct sf_pdma_desc *desc =3D chan->desc;
      |                       ^~~~

Introduced by commit

  8f6b6d060602 ("dmaengine: sf-pdma: Fix an error that calls callback twice=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/T_6P2ekptJ7jjOZECFQy7tb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9e8b8ACgkQAVBC80lX
0GxvfAgAkUberfm0WWPsAXdCHTlAsoduLqL1I4l5d3hwti3Roexf2a62YJYfxf+V
zQjus9S1FzPUP9EQVcGv/RccbrM0mPcul/44Ifn4Fo1KZbn0GaAD/T+zm/SdaABl
LkM59tFuRuAhqP4nMIIXLFHNdW0EK6RQ9FzqPOk3vfS62SHQ9FgZ6cHhJF8ympmC
8HHKHy8RtpWRz9QbvJCuNEP01WFsAoB1AyV6cJELCyHitfHYqutn7I+xEHu+Lcdr
R7qSi16GMDIPg+BMHDVWTb8ZziQyQ6KMrDho5TqPCAMTKUxFTexBPVf9O72h0uBd
zifnzHZ/heliyOkOyS58SGYXjwZXcg==
=rg+f
-----END PGP SIGNATURE-----

--Sig_/T_6P2ekptJ7jjOZECFQy7tb--
