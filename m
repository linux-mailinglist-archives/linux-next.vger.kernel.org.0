Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C5F31B3F1
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 02:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBOB3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 20:29:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229829AbhBOB3i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 20:29:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df62H4mbYz9rx8;
        Mon, 15 Feb 2021 12:28:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613352536;
        bh=ssv6blcH9R4SUj/vVkbyevvWiJkjmfm+qmr+wXT4ybU=;
        h=Date:From:To:Cc:Subject:From;
        b=vJy9d9dxkM9Txj9s4qKHnB+Y3rPgkG7QBSgI5LCD2KrU+DcLzEijF+giZqwQFb3va
         KdiYWBvmHkcRVxt0ULuar9SverlfFj0i41+qDIQNMMwlm2OIfLnoMkN5Vy7qahjyHE
         X3gyq84UnvXFNGy0e4HiN10sZoifUbqNka2pDasrJhG0gcaIPqSd+7ZXNJZQN/zlB8
         tuF5nk3fuG2RP1qFmVugNnOFvRteTKrRWmMYU0py0n+2wN+z85t4mWyFlCckBcE0a4
         cCmqPX4yK28A377DO7vB/KFOSl5UEdAUxIs6pnGpbdw2w7qmKBmNRuzZj5xOrl/oOf
         sp34V0qyx8rkA==
Date:   Mon, 15 Feb 2021 12:28:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mtd tree
Message-ID: <20210215122854.4103ef4d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OyzF79wBgj_QhVZPDUDqOl1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OyzF79wBgj_QhVZPDUDqOl1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mtd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/mtd/parsers/bcm4908-par=
titions.o
ERROR: modpost: "bcm4908_partitions_post_parse" [drivers/mtd/parsers/ofpart=
.ko] undefined!

Caused by commit

  09cf6ee6d21c ("mtd: parsers: ofpart: support BCM4908 fixed partitions")

I have used the mtd tree from next-20210212 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/OyzF79wBgj_QhVZPDUDqOl1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApzlcACgkQAVBC80lX
0GzxLwgAkaruwbFpER4mI9xNIHD4F0ZkiCiHzdVxT/ErAbd+wMXpFRX1rWSuTGFo
cFXLkch0LlGNQTJKNs7cy42q3fl0lZLcTegsLOEfaGrx5pBKs5Jx6QN1AUoRVNjS
rqGjTyHGYOenSfjc+F4E0vKBJZw8Y4cIxZX2RS/pltX6BkAnw73fQ0v2P6g8I619
EiQ4oSpFtjgfmNwu1o4rno9TaHW/HYuHcr1HWVN19YS41E46ebQdPsHQKEk88+S/
Vf0TcNJtfUcHNaM3aJvYin2ov2za7dQwyeR96ARnVfzO9nA0eBbAlDxp78XFneWJ
cTFs7FqC6MOw4ZxGXl1H2OYfw2xE7Q==
=siaC
-----END PGP SIGNATURE-----

--Sig_/OyzF79wBgj_QhVZPDUDqOl1--
