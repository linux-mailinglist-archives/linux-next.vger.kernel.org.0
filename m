Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7149322E2D5
	for <lists+linux-next@lfdr.de>; Sun, 26 Jul 2020 23:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGZV5X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 17:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgGZV5X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Jul 2020 17:57:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15E6C0619D2;
        Sun, 26 Jul 2020 14:57:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFGxr4WmDz9sR4;
        Mon, 27 Jul 2020 07:57:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595800640;
        bh=w68z9elGHIX9P0R9RdUtZpCt3tNk3gp5u1a//7njPx0=;
        h=Date:From:To:Cc:Subject:From;
        b=L8GXh/8GQYLzBv5BYw78aBJTG7U7ftm9tIdeAC31yQ1mKqJRMf6w6gjY8ebc3/S/1
         IyzmQKjqHh6eGNJ9mhJmSI2tDFPAmhLDmbeA32Ydehsmms7ag0DTrFjW4ITbHgzy2N
         Bi1hoGdNR/07vHI9F+60BDTwcuCs2lfgv6yq0Y6GV7nvzIJC+iCxw1xF+jXhih40JQ
         S3HoNbxXIKbiVcjxFLfgJnLhBYqWM0O7ADKOw/yx0AhPWybnMMF9FtC9xw5kxgx2RW
         ZBo0pM5mCnmyEzTGejVOKFTDVA2IUTBnTUhr8uKaVXd+NZLgrrwRxM4k/2VIp2oDMM
         Ga5xLZPYkVkEg==
Date:   Mon, 27 Jul 2020 07:57:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the xfs tree
Message-ID: <20200727075719.627a3efd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/znC0=KRqyGnD4u/8uyqbHhf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/znC0=KRqyGnD4u/8uyqbHhf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ea52eff66dcd ("xfs: preserve inode versioning across remounts")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/znC0=KRqyGnD4u/8uyqbHhf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8d/D8ACgkQAVBC80lX
0Gwivwf8CykkuOiZjzkLPiHZubcnQZvD1GtaYVY8zAgReKO3S2QuX0eNkupoBMa/
WEaZI271C1natetPsIg6OC7/TIuR2yWFP1dX/2zn4Ax4Swn5IEIjWQaPA6AvTucq
EEaqLynqwEOYlT32NAl7BxvGwRatwVpuiiEGjiq5VcDAYx7vVTQTIzwgUGETzI3u
oHvde8C3DuB0t6C8+y5ahUYIkzWAgZ8BB+a6TwbIRC66PDxPOIfODvJTD+hAna2c
w3GnW1lGwBwXsT/98GTKn+5hQGCPHtIZXST2ggIJ1hTYLNKQYaAS5lR3rML/GjGM
awsRhDDMdhVT5kxm4xhSFEODfKJ6TA==
=NiM6
-----END PGP SIGNATURE-----

--Sig_/znC0=KRqyGnD4u/8uyqbHhf--
