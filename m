Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D15139D1D9
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 00:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhFFW2G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 18:28:06 -0400
Received: from ozlabs.org ([203.11.71.1]:48539 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230355AbhFFW2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Jun 2021 18:28:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fyrgn5QvNz9sRN;
        Mon,  7 Jun 2021 08:26:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623018374;
        bh=XM86FTtYk2jY7xDjQ8M2kl6jtN1ijdymK/UCAoXuc9s=;
        h=Date:From:To:Cc:Subject:From;
        b=owcgT5vvqBoO3nZzaga6808gdnX8HAOXzFYg2Y43wGt07ZpohkrabsOERYJkafIEz
         Q5JOr8Q0rkzoHz81rf0tEHm2uDY+xzS1I0oqcn0+AtzhVlDD6NHHZDbFpZUWMkfbxR
         iKhPHT2agh2qRiIBb72oRDtH+yPHHhycIIwPa6fmaNG0ZVo4b1qWFhuGANKuks3HdT
         nLSyqNZ9VR9ygbaZ7AIwuRaik0EYQAJk8kun7dr55Sr1eXeeyqVBolk0GCc/mqUDO0
         ro6R+sH+UxUHvlgwcUTPjYKVBePf7vPadCIHeILonKfsFJZ4veqjLF6rbw/rOp2jN/
         EKNwSquNS0yaQ==
Date:   Mon, 7 Jun 2021 08:26:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the xfs tree
Message-ID: <20210607082607.1356821c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YBTPPZmI3dtILHSa2nfjkV8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YBTPPZmI3dtILHSa2nfjkV8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9f059beac967 ("xfs: cleanup error handling in xfs_buf_get_map")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/YBTPPZmI3dtILHSa2nfjkV8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9S38ACgkQAVBC80lX
0GwWlQf/fqWxCQNzlWqhhC/Qr7weH3E7jpztZcbXCgxEJG6flyKJDqz4L3vmVRDi
bQQhD9jgTgh7XMVPE6KHH7AKepp+NKWE/28nvYjadYIE2APRBpihO7Mp7SgK0HKe
2GAadbtiLSPnOQU61BjhR1KFfwzs1HXv3ncLdgExo7kCIMxvl937nCFFIScE0Lg2
oxEEBS+tCo6TTILlyDJc0p/2j1tp6fMQW36Od9sJxjRszVI8dXJm9Z6319vJhnlq
cZ0CQZDPBazqbCQblNh85nEO9Sg72G2+Q128pATqMLWMlQnEnyL9M5cfUzv4kO8o
Un/ed+edIAozw/dCCHnvpOGNNVYuug==
=Vyna
-----END PGP SIGNATURE-----

--Sig_/YBTPPZmI3dtILHSa2nfjkV8--
