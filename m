Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9D02C9008
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 22:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387585AbgK3V2s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 16:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387531AbgK3V2s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 16:28:48 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80028C0613CF;
        Mon, 30 Nov 2020 13:28:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClJHS1Q1cz9sRK;
        Tue,  1 Dec 2020 08:28:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606771684;
        bh=tfMuhOkIvZj8rmnw+EWrds8urPDh/wdTOGaweYlE25Y=;
        h=Date:From:To:Cc:Subject:From;
        b=hBHdBZXH7tphDh4kHwqAHX/0tANBecFj50/fHaueV2WLHPO3iHisGc+NkgLjZ69sU
         f/5P7P+9/4L/Sz6bKfsCVfW/hwq8mIljjp7RSXzYhmYiP5H5WVfy59IRTMgOxWPiey
         p3RfyoehelwwJJXwaNolg6EWhPxcRnxyWFDr+YgKg8yGHluP8PzNY8yfHChfX1wzvB
         rti1CqrO0OdefkATWb2wPptc9dUmz6kI5YKnI3lzbw7F5p89RUeCx6heixRqESxJNs
         xAU+1Lo/nV3bNfdCTq6HjEyrWrND2l1wyK5C9Wstz+jhg/dMC0ozOdXPLOB2t+28wd
         s4Z1TdAigbpGg==
Date:   Tue, 1 Dec 2020 08:28:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20201201082802.328f2b37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_X11WOFeIzntTIUS7p9kbJr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_X11WOFeIzntTIUS7p9kbJr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  107673613884 ("blk-cgroup: fix a hd_struct leak in blkcg_fill_root_iostat=
s")

Fixes tag

  Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io=
.stat")

has these problem(s):

  - SHA1 should be at least 12 digits long

For the future, this can be fixed by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/_X11WOFeIzntTIUS7p9kbJr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/FY+IACgkQAVBC80lX
0GzOZAf+PHqAMc48CszecP/gv6BzzCiJeXzIKA5GkNDFTui4/uk58DCIFl/jKj4S
MzUFQuMThNQmULJtyUkoTvJzlAUaYBFjMsOPif9wwyMMh8aSPfT4knnPzIAhU/qz
MuCwWuI8/7p5PbxZSwc7TreM01AwkcZC4jcvXKr/V+Cteea4ofH3tDRpQAP6eugP
yu6aUlzPoKfknzbOCq/yYhFyuXAPjhBZbMjG8jrkO7obouOyw5RX9gx7kc8JGAXQ
3w2Fv4g/q9bxcNvdpjeOnoSkwN+cy1URUehyfErFkoCN/ih3rQS+bVOQqORhon2S
MC71Zy+F2oQTtYV7GkVienQePyXkBQ==
=+5Vm
-----END PGP SIGNATURE-----

--Sig_/_X11WOFeIzntTIUS7p9kbJr--
