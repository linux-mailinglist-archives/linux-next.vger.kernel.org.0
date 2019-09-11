Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7323BAFEF8
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 16:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfIKOl1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 10:41:27 -0400
Received: from ozlabs.org ([203.11.71.1]:45547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726762AbfIKOl1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Sep 2019 10:41:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46T4N23CsCz9s4Y;
        Thu, 12 Sep 2019 00:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568212885;
        bh=UC3U6plrH8X94TDXBLOodUB+8J0CqlIt7Wkb6yaJzRo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rt2nYJmmauNCwvjj85MJQaAoJlyYKWbpVTHf4KoFS0lslo+sfaZC286whLvX2QFrG
         cze5IZsEZwP9RArfBO0P+EB8b66lpmNK5RvIfBkNBgmAbOM2JRgJwWTl1T+yxTxAgt
         /mE4mVLoQE/DHcbcERkPCQOrjqfA91P0kzsFnYcfDPTvNcXHYkbRtJJzc6OibiQdQS
         SMhVYsX4Ra2di8McFHF4J1wwbc/rWd+sATLWAJV9JTYY9CfwglWwGJaxtx2P5zdYV7
         JtKKdmi2Wj0cNge7L+1P0ql1cEfpA1MPgHpc54iKuRDfNXiNaU/BDEmWpY8OFzLUVf
         FIfWs+3f1SwEA==
Date:   Thu, 12 Sep 2019 00:41:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <mike.rapoport@gmail.com>,
        Chester Lin <clin@suse.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20190912004119.3f2fbe4f@canb.auug.org.au>
In-Reply-To: <20190911142106.GA6429@linux.ibm.com>
References: <20190911001459.6ccc76ee@canb.auug.org.au>
        <20190910142128.GR13294@shell.armlinux.org.uk>
        <20190911142106.GA6429@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bXv=r5lWWH5tTSyjhEXvh0i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bXv=r5lWWH5tTSyjhEXvh0i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Wed, 11 Sep 2019 15:21:07 +0100 Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Would you like me to resubmit the patch?

It looks like Russell has already fixed it up.

--=20
Cheers,
Stephen Rothwell

--Sig_/bXv=r5lWWH5tTSyjhEXvh0i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl15B48ACgkQAVBC80lX
0GxvJwf8CJ8zNpLSF58PJeRTIw5HY8J14LK9WCRRxwoGzs1CPRSdH4BsB2qjckW9
+IKMaSI0kOQl0IwHoeMcHrY1hNbJuCpwHUlLyt1F6DPxFQs/FnUDm7mmvLmjFeHi
GGll+OY8G8iUpBkIEEAa9bZjtNeBF4f8+9MXrkTvFFn03eg/V28MhgnEHMIUHu8y
3d9HFSlPB0xeoAh2FdOM4z7WTvsd85sKZ0xjProvuhmA7hvXNwvWHNwQprquD+Dp
3kOAQ1DHZnjbc/Yk2awczWCPdiWDnX8bDpTrQ7kdIVDj0mSDuGyG/OziAEu31N2q
5vKB4VJg9fb1zctMFfnU1YXja+bc2Q==
=ONJP
-----END PGP SIGNATURE-----

--Sig_/bXv=r5lWWH5tTSyjhEXvh0i--
