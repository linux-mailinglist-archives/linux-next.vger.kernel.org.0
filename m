Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76579DBB1A
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 02:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390194AbfJRAva (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 20:51:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbfJRAva (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 20:51:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vSCM3gQbz9sPT;
        Fri, 18 Oct 2019 11:51:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571359887;
        bh=tUYMD2Pe8Fnnz66nTL/typ69plhOSrBLfdbxtxfOOsg=;
        h=Date:From:To:Cc:Subject:From;
        b=EtZ0XqX73cRJdpoBxz+MEuq5FML+oHDOYY40uLgHt503FrOmhFHacSEf+zYY7ReGe
         WYpaJPgEYhv5JxnOwPf/xCdOYrqrIHAIVkJ5Im6cirNH1lz5XZ5+pW9TURmzgpcvfE
         oKzbZTsVKR4JNrrrz+zCQI/jOVVTJC8RljXU6Ikx3K5mV35t8tJVlcHFgmRGAGyNOk
         2SXu9sTxh+/+2+UTDlgBCDC3tgnas+bMKnznTUsZUJALNOAVlP2XODXkyjcnoglQjo
         UiufreBNgU2MDM8FM4RT5dLR08er3T4Mc80hjgmrZ4T2vrXdw3a8/l8gEM1LLPFmzp
         bbYgrCMWBSWOg==
Date:   Fri, 18 Oct 2019 11:51:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20191018115126.6263a3e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SZRpgpBR9nZJAKuVCtAxz1_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SZRpgpBR9nZJAKuVCtAxz1_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/io_uring.c: In function 'io_accept':
fs/io_uring.c:1729:9: warning: cast to pointer from integer of different si=
ze [-Wint-to-pointer-cast]
 1729 |  addr =3D (struct sockaddr __user *) READ_ONCE(sqe->addr);
      |         ^
fs/io_uring.c:1730:13: warning: cast to pointer from integer of different s=
ize [-Wint-to-pointer-cast]
 1730 |  addr_len =3D (int __user *) READ_ONCE(sqe->addr2);
      |             ^

Introduced by commit

  d674c2b9335f ("io_uring: add support for IORING_OP_ACCEPT")

addr and addr2 are __u64 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/SZRpgpBR9nZJAKuVCtAxz1_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2pDI4ACgkQAVBC80lX
0GyYXwf6AgELY7Ltq8m7YeOFl6cimB/dJiS/qyr3jMO2XCMyseEc8WS5APLLPA5n
r9dNHFo9/ZJiJp8G43fDqODzOcyGgeNJo4Z/AXDHjY+BH0WJGXIaODlZGX/mpYQ9
SsHDRGvS4WcEPKXQ505pR8rG2nzz4CjGGf3vF0O1uW/M6zmG6Yd5GAADRyf1vyBE
xOGavwqE8g5tfwsmlnQuHL3pZFAp1JmiAKkKtoPQTNgVG+tPKAonl8XRk3vrwH57
IVgKhL2Hm1RwNvKx/zxiSlr9x+awLLaJEVxjcz+AF6HR1/spLlMeD2/5Jiv+evrx
zFL3ojO5ln1aC+FgOUpTbzNDSGEaBQ==
=nwio
-----END PGP SIGNATURE-----

--Sig_/SZRpgpBR9nZJAKuVCtAxz1_--
