Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96469DDC34
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 05:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfJTD5t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 19 Oct 2019 23:57:49 -0400
Received: from ozlabs.org ([203.11.71.1]:39639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfJTD5t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 19 Oct 2019 23:57:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wmFQ4kCyz9sP6;
        Sun, 20 Oct 2019 14:57:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571543866;
        bh=fAm69bW54Fgvpi4N+txWHTePsutjG8ZhT5plvBvvJn4=;
        h=Date:From:To:Cc:Subject:From;
        b=M8kVACp93Kch8KtqBGheNGK02SVJ8J1yAIpjuUpP1u58ldPAq3MWrjfDGTx8mbHT+
         l03QLKOlBgVrqrsZaeqweO1nDjK8LUjGPvDwD6kuqOViTUQz2qDnycv4EQ/rZqTOpr
         sPApGgdeKpFw5ND5IGOfr+gWyJlxpXEv14hiDH7lRt0dLNqtku9hMPq05+RCzOgk7l
         DKZnrqCkda6x2hwDgkye4rsHEAufl/DtnGdSwnWZAzQ9lw+QhoorvnPUwFzFYJHlxg
         971AppqpoI78O38F/uYxLrU3btMiOWY5QdMH4LaBLtWvt9pk+hfupcwL2jPn/tZLWx
         3j+X4+qpBMMJg==
Date:   Sun, 20 Oct 2019 14:57:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: remove the siox tree
Message-ID: <20191020145745.2b71d067@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wEcsVlO2DD9h7ohlmDqM6Zq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wEcsVlO2DD9h7ohlmDqM6Zq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The siox tree (https://git.pengutronix.de/git/ukl/linux#siox/next) has
not bee updated in more than a year, so I have removed it from linux-next.
Please let me know if/when you want it reinstated.

--=20
Cheers,
Stephen Rothwell

--Sig_/wEcsVlO2DD9h7ohlmDqM6Zq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r2zkACgkQAVBC80lX
0Gyh4gf/fU+CA4aqgrQOrCjZ6YkBaag+H5UEaNhT65bdEeY8k5BluBO+XSEyn9SC
Ndz+5TZiRtDkLNVtNfsoiKs2CctRG5PNeeoXD+/1Pi+PIz9R1bYSTisv4sTXXgdJ
TWjf+5x5V+XXIxRehHYgUOjMgpTi4gSz4kn/jIkj8BXh0XrAveptX4ZLfvQlyp83
055xd03AZmSkcQf1Kx+0cS/Bi5gMbebKmyVUAK8eEG/uIpPsXTY3DsgKOZP9gh4H
LYPjzzc9P61V1v7WSh5XAcnaqsB+pDr9ZCEc/DljLl5/sydVQrtIKgQBo7O46WIn
0GFu1KJgXanv7TAI/HZeqQtvW3lA2g==
=M7m2
-----END PGP SIGNATURE-----

--Sig_/wEcsVlO2DD9h7ohlmDqM6Zq--
