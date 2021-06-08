Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F51C3A06E2
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 00:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhFHWdh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 18:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbhFHWdg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 18:33:36 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C7CC061574;
        Tue,  8 Jun 2021 15:31:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G04j55m72z9sPf;
        Wed,  9 Jun 2021 08:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623191498;
        bh=uYSlC9D9KZmjm7OfUEE3EOaaIqPSS+22wol0DRycQ7E=;
        h=Date:From:To:Cc:Subject:From;
        b=JKwXolW2qEE5g8ara3D4okWvji9BVNhoZo/g0wf7pq4HNhUY0JkDxsWDMIF+kCSxX
         AiJmI04IMvdkeiBCD16o37pP8SOJqmm+ZeXNrlWKligUDkRxKhnllFGGMHaLTq0wUj
         2ZzR78ZSEIEjTD0oqefrNsvRouzKLSJTvuObABcWftvwMJrEEf/YpR1M01/+LbNT7G
         Gk1+ytdXq59meZGUwQZnW1pb6+F5U2bPK89X6By/fiwz3+jIe/jUtYWhMLHdIFGGtp
         MBkvqSDJeke9nb5tJeqHlTZQFBl0Ra3+IBlxTlxWFS2LRuiLTd6kLrnE5B8AZrWEkU
         khlKUyww59xLg==
Date:   Wed, 9 Jun 2021 08:31:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210609083136.25efee6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZPd8wcmoeJJ0BE9.CYuJlMp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZPd8wcmoeJJ0BE9.CYuJlMp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f6e8bd59c4e8 ("nvmet: move ka_work initialization to nvmet_alloc_ctrl")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZPd8wcmoeJJ0BE9.CYuJlMp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC/78gACgkQAVBC80lX
0GxY2wf9FwS9OdbYlaiYASCKboDnzzyPo/1V6M7IZmez5BVCrUy6sDimBNXAIu0h
fq/eS2y1c8IOgrdrdQimfUDI685qpQ+Hy5gD3eOVmIwIblYfi1eAdPmNppOXQMxO
FU0qOJsCaBK6MSasqCrScLxHoRekVDE/YejTs78IKr3nA2Fz9JwDWTcUcZKO9usO
SuIApisEyjBLlw2avOLIclz1KDWybo9wg1U9qyc4ipgkBFBjgxi8HlwpVW1VmsOg
3IJDfSsLJhD3f/C0BMqsWzZzqqqVJyqJdnxqge6/tT0sM5r0YgctXNYGTy0CjXjF
qwnPJdAeIq5+k32q901bz+Ws9CPuQA==
=9/KY
-----END PGP SIGNATURE-----

--Sig_/ZPd8wcmoeJJ0BE9.CYuJlMp--
