Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7AB2B5902
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 06:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgKQFFd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 00:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgKQFFd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 00:05:33 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8FBC0613CF;
        Mon, 16 Nov 2020 21:05:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZv5j4h5Wz9sPB;
        Tue, 17 Nov 2020 16:05:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605589530;
        bh=C5KjgF0SiWdqCYc1oAuQ/UH1AFK/PWdYDX0JLs83AHo=;
        h=Date:From:To:Cc:Subject:From;
        b=VFodMqoHOr0b49+x3BJuBbs8ZF3/vA+KUIzAM4qv9pvNVBkZjTALXyUx+hs8H0kIT
         6MZp2pfa97RZQTvBgiX1nruaYSLxD+o1djUH/KfqxwTMUjuCyoiZFW0G+Hc1PFQ2Bp
         Fq23Tavs1i4VxXLx8t4M7HcQq4lbVVpgkWEI8caefpL23Ur/0iBjdQQcr2RtLooqH1
         iIWgQ5uaxWZPCXL9uEc3F/RKpoEaU3qJKrT4sCoaT73UpZtBJRavbur7XjNE3fPBby
         DHCqjdh5fEPiUDcP6kgCnDW+DFa3J3na0TU9IJnGfcLlYGd6rL9FZR3DvY/pP8mBob
         D5Kr7DnO+fzpg==
Date:   Tue, 17 Nov 2020 16:05:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20201117160528.41a907a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S2=30Yqu9+ZMjhPjQJC6F75";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S2=30Yqu9+ZMjhPjQJC6F75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/filemap.c

between commit:

  0abed7c69b95 ("mm: never attempt async page lock if we've transferred dat=
a already")

from the block tree and commit:

  b5c7e73f6bd3 ("mm/filemap/c: break generic_file_buffered_read up into mul=
tiple functions")

from the akpm-current tree.

I just used the latter version for today, if more is needed, please let
me know.

This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/S2=30Yqu9+ZMjhPjQJC6F75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zWhgACgkQAVBC80lX
0Gwl/wf+InLHogofgLuBAdRaTJD/sPQNnM9vmThUCtmGmcAy9QDuZ7NvlzrjTY6P
zsry+Hv/5r1SurlzPBwKmO4Wr65kzjEYDgSjeLEI020oriyB8VqTAgf/6bJ8YH22
NAIIbPwXbjs71OzCg+YU8M73e5PE6BrzVpJigY2p26fkAN+gO54XsTrudDRdHGi0
oE53O2fMjpzPo5JAu5im7i/CQ0xNtbTv36gJVHwq4BsXInUDtPPoOrqjVMPQ1+F8
RciHimv0MOkG9JnS9VKVdBBOI0HzSTGWJ9YRTj8mH54kmZcLnlT/Q79SCBSiSwvQ
OG38rzteXSwUfE8fMRuxfaS4M1ePdA==
=PrSk
-----END PGP SIGNATURE-----

--Sig_/S2=30Yqu9+ZMjhPjQJC6F75--
