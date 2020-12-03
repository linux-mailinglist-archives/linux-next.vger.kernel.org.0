Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DFF2CD077
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 08:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgLCHkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 02:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLCHkl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 02:40:41 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA214C061A4D;
        Wed,  2 Dec 2020 23:40:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmnmZ5dCtz9s0b;
        Thu,  3 Dec 2020 18:39:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606981198;
        bh=Da7JXZxopAU/xG2r0q3g1RZDLbF31rqFw2P71n/m+vg=;
        h=Date:From:To:Cc:Subject:From;
        b=c1JPZGvcvwhWErGlVtyFiYeOV2SfxD1K9oEfgqIHVimqtAcfDed53WwfFuJjH8Sdk
         p576MGRabDI7oLsPb3eHsZfGRyt4WJtXdMNF4E971Csg+3s0dLT5yVFoTNKeKnxeE/
         5Sk9hezShSPztLrFLNI+0qaVG07sazKOx21muw6hjMu7V2K/tW+o44VyOkPSdnky+x
         TS6YlQIoclmy1aYFvk+xfZppSy8Z49R1Wsn/Dw+1qv0i4K6VLHQn6H0/3tQ6jIcWEJ
         ibk4JpNFAocQnzV2RwHdJG0yWLZoq1TzwbCIv448eYomoG8yziRdK4ioVGxXK2xVF6
         FUW8GHbTIgZ7g==
Date:   Thu, 3 Dec 2020 18:39:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201203183958.3ba2c4f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2t3Gbr0NguvxE=QCp_uLEYR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2t3Gbr0NguvxE=QCp_uLEYR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

fs/block_dev.c:1838: warning: Function parameter or member 'dev' not descri=
bed in 'lookup_bdev'

Introduced by commit

  4e7b5671c6a8 ("block: remove i_bdev")

--=20
Cheers,
Stephen Rothwell

--Sig_/2t3Gbr0NguvxE=QCp_uLEYR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Ilk4ACgkQAVBC80lX
0Gw66Qf/fqTp8WvVd8Q7i/1pwTP0hBDZ3QFG8S9Do3GXWo2vG6LLuIieRsAHB+Ru
PXQ5SQcekwtbTsB8w7t4O3Q+xva8wMMdS95VMfypJoBaZZtKJfNw7HbkBTntlQHI
D26oIjtsFZPqOamL/3E3oqERSDo+V/z0SVcj5vT47BLI4clGkLZsyIeHQO9HLWlH
3iCvpmAv8I4HqqKvUiGcuqXumh6UuZ5tKTZrqThqnhSwCt6+BgUvMHczp7hJ/tb8
wpdvvkdRSbor8BGQumMIM7Omh4/cbX9cuKJEizwNpkcnrLnXJH97EmPUfafcb2hR
xXke0mCXQZ2iCFofx4YW+/CCVseY0w==
=cufP
-----END PGP SIGNATURE-----

--Sig_/2t3Gbr0NguvxE=QCp_uLEYR--
