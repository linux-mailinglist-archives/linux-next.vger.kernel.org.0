Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F267A32DBAF
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 22:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhCDVUq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 16:20:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234894AbhCDVUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 16:20:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds3fh0FMqz9sRR;
        Fri,  5 Mar 2021 08:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614892796;
        bh=YdmoeCR39SwTtAaIHmNjeyDqs+iEg8Lut0rnucNlbuY=;
        h=Date:From:To:Cc:Subject:From;
        b=fvZEUJZr0BjRdz18SvVf5aQhZVnrLxIbyA4wyHSn9Hqpbnp0cJdf9auyCIjqAj1sv
         50saAC5tM9EUeirHoT2XpZZRWq7HP3npVaurqc5DhYTE/pCeXbaHGe6GayRmQMtyj8
         sxqU5oH5x0NE+MtfEnI9FiZmMMF5+cUEMryKU2W8FHWlHOAJzcs3EBm54zwa7m64CW
         Bf18hPAUb2qdueN8U2h+5p7UjhUCqeJIzl7ERYTZTD/X0ZpfUJ9kGPs8c4N7qTVkl6
         vOrTnTZJ4v1YpEet1SCOPHRQ40VnSM2opn+tHM26eURPk+i9c2yJrXtw0pRAy0BJ8I
         YY3WeELyiOhqw==
Date:   Fri, 5 Mar 2021 08:19:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20210305081954.2cfe52b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YQlEy4QIxL8YwlNhf6KjNE7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YQlEy4QIxL8YwlNhf6KjNE7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  1b40fa66ac2b ("io_uring: reliably cancel linked timeouts")
  42699d33e969 ("io_uring: cancel-match based on flags")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/YQlEy4QIxL8YwlNhf6KjNE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBTvoACgkQAVBC80lX
0Gy0wQf+N8df3bRdCXMHBA7PxJq3kgLCuujJojelkeeTb4yIfaLp+wzYfgAInNjT
Fgn5XVTzQjPUFt1Jp/tnZkT1ajKHFshqEJSqCz0229+/AWl4q2m06XtO2sVF1154
6Miz0Gm9T8Vw9haolxtkJ4giu1v6FR54QpfL8JIfKgsilLjKbTzLfOxdg3gjnIGR
I1BfvksYbRRs+7EErU3G7uomjgcB6sADdz8WBma2tR5N4xh3NgACWKizooIv58U2
WrYhpYxIIyJdSbdPHePRET0p4a8KXytKAbHkX73fI2ooysKTesTl5NHr+B7MDraM
Dl466XAuFFV3oYkwtCpA3NWAOeotQw==
=RMAh
-----END PGP SIGNATURE-----

--Sig_/YQlEy4QIxL8YwlNhf6KjNE7--
