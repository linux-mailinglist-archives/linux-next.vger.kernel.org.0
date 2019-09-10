Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCC4AECB8
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbfIJOPV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:15:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44583 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfIJOPV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:15:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRrC6bvlz9sNw;
        Wed, 11 Sep 2019 00:15:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568124918;
        bh=uveICKI/Zy2jOMFY3utIvKtGujqgY4Bx6V53QBYzQ9M=;
        h=Date:From:To:Cc:Subject:From;
        b=HZ4Fu1lSomB3GvI81gMDbKN2euUztS7sbSBtjngQB3BTd0sipNykAtPJqAcBbSk1a
         wJJ6N+tZ8zDtTzMP359mXvVW+Q7k19dl8jVpwbpAt5Kw7W927mkrH7BcZQNnTcnySn
         hC6u1prEswNy2Xfn/koq0NyZjQ45qB7Ua2iqw0NxA1XrRj0ZVxjvJEdL6r1V+0Dheu
         WUdx55HFbuY08axCfNaaWHfyiXY1fys+JrLI5PXlKNpLbhhEYTkDYEUGa3j0iVrlCr
         2Nz5wq/N/kkpoMh3EUNFI+Pq5v6YEHEhOVYXdbYqT1aS29DkrOOd5aEDB20xjnzSm4
         rwTirjRwLo/9A==
Date:   Wed, 11 Sep 2019 00:14:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <mike.rapoport@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>, Chester Lin <clin@suse.com>
Subject: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20190911001459.6ccc76ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zKHOt/cHZiNbKLEbF6_dwjz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zKHOt/cHZiNbKLEbF6_dwjz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2505b9ba9c37 ("ARM: 8904/1: skip nomap memblocks while finding the lowmem=
/highmem boundary")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/zKHOt/cHZiNbKLEbF6_dwjz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13r+MACgkQAVBC80lX
0Gy7lgf8DRsJmCV6Pmj6moGNfZwC9sWFlaayGzYiKyG5D2DP7EKRKipqOqd4XQTF
i12FQvYmR5k3YXE1t567hHfTAJlwo3A3E5G9B7sewYn/N7P8cvD+s0eeN5oqhaD4
ImalFcRAZD21N/NAgWkiapZmcND2TieeNh3bl2OI41QraX3pg9bwkBktAGQ66t6w
g6RS+MZNFGxqqNqxWhu3KCl6V9xx4munm1juexypRLNYsN/Jj44zmaXg6SQeFi5O
cFog6CpFeUYmJobbIkNfDrCiQR8lxpYj9qWrcftCHViNCIibF16FL7tbU45/b/AD
Y6W/VAtw6RL3DVjiU2O94mTNZX4E5A==
=vZLb
-----END PGP SIGNATURE-----

--Sig_/zKHOt/cHZiNbKLEbF6_dwjz--
