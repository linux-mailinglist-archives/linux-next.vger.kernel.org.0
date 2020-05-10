Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCE71CCE0B
	for <lists+linux-next@lfdr.de>; Sun, 10 May 2020 22:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgEJUxo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 16:53:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729286AbgEJUxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 16:53:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Kx9x5Z72z9sSc;
        Mon, 11 May 2020 06:53:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589144022;
        bh=8dIeqj8UmZeUONqXWGUCIGyCxacc5cARWZsktLH4P14=;
        h=Date:From:To:Cc:Subject:From;
        b=XImq2gJX1Cl4P8xCHqbT4dPTxi12blxsx/w1JtQi2/zqEVJCvKY+VzdOc1HK8yWeH
         BaxRY0j4LRAysCX2IdPB1/nInZbpzw56RLCLEpZFBfTJ8RztwpJxgpSdB3fceAzjT0
         mmWTmLW5J+hCGgJ4O1L7ad71Z8v3Yex0lg1+tD7rBGj8PFi8smZTPo0vtbWmEpYJ+6
         cl8Mj1c35vbFd4l7YMs4fLMwGZnaj5cqGIqwbyLQ7KHv4O1OdKQXv1x0JaFEu26OZ8
         V2pOZg5NsR3sV+tJhUU/rNY5kO8SQLKhtBhTTZifNGzdOAsD6ZNV4RE6Y2rfKOT2Lm
         417qbIFnrSprQ==
Date:   Mon, 11 May 2020 06:53:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20200511065340.6cdb452a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UDVwFwbKCJdme0QuB+RV/M/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UDVwFwbKCJdme0QuB+RV/M/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  de80f184535d ("gfs2: Don't ignore inode write errors during inode_go_sync=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/UDVwFwbKCJdme0QuB+RV/M/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64adQACgkQAVBC80lX
0GzO3AgAgxRMG6buu3bdSkHw3TH6ypT3LZUIufRtp8sQWUHTlYKNjof1lDb8s1+6
Kj8Fe0CO8LxDdxHhpEfGDv63fRUQ/ZfUIh/y9QRRE5gZKASjF2Ru8WzRIuUHVxpO
CaF3KRgFUtsajBZ7/mvjA17CZj6YnYeelrfDTIM2c/VAG7I5kR/A98tuEXafmCwK
O7Y12acKvb5D6eLRE3KnsZ3CcMGpjdytM2BLHWxkGBUbmALcunRbMB2S50CU9UdN
kaOfceAkMyRMV+tLZL5llQoVmoRv3VTim5QyjBKvjos59IElXRZ2t2Dl4UWmdV0z
JgDDyDgu4IBGzK+G85a4c7QcYmHtQw==
=NLJK
-----END PGP SIGNATURE-----

--Sig_/UDVwFwbKCJdme0QuB+RV/M/--
