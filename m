Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7E727BCB1
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 08:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI2GBU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 02:01:20 -0400
Received: from ozlabs.org ([203.11.71.1]:45729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI2GBU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 02:01:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0pfh6CLGz9s0b;
        Tue, 29 Sep 2020 16:01:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601359277;
        bh=lyiMm0dbNsxCAlzMu4JOmGxzRVXQoG0UphpNbZR2Usk=;
        h=Date:From:To:Cc:Subject:From;
        b=iyAsJMUpL7ztsddYhSk3NVXQFoEwCY9QgIK6/3o6GSZ+lQEieWhbl9v+da09DmYsm
         s/ugcDNfWjYCterogxb7t6/Az7LfDY9fm8581LAM16d/dAbpWT7M+fYGyeNfj2tsTE
         tJiSmdx8n3FqVUZiz+6U8nYLHiemdnC7QupL4f86qprKGx/JUZWqzdHM8Y2uGpohBn
         YEhLoY2s6Rgx+rwTc5MutdhjmoEuGe/wwRVYxEu4jC4MrR3EnJki2Xq+3vGHvz4cle
         gdhCiw9so0Uwq9XJRG/Qhbm2Tc7Qso3Gviq+B8cSm6WcnHH2HJhWZ9cVhvFnjkmSOe
         e9ZpbTWjm2TXQ==
Date:   Tue, 29 Sep 2020 16:01:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the tty tree
Message-ID: <20200929160111.18719071@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2=V.9quiXz=cxF80yjE8NJn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2=V.9quiXz=cxF80yjE8NJn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/tty/serial/mvebu-uart.c: In function 'mvebu_uart_probe':
drivers/tty/serial/mvebu-uart.c:806:6: warning: unused variable 'ret' [-Wun=
used-variable]
  806 |  int ret, id, irq;
      |      ^~~

Introduced by commit

  b63537020db3 ("serial: mvebu-uart: simplify the return expression of mveb=
u_uart_probe()")

--=20
Cheers,
Stephen Rothwell

--Sig_/2=V.9quiXz=cxF80yjE8NJn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9yzacACgkQAVBC80lX
0Gw5Nwf8CsRTJL9V/dD3N5uLXfhjIFZa0ch5TpY1B9VSxbny2ztFmkMgJ7cQy/NJ
lsbro1apGN/w4VX1WiHSkfe110+MNO4FDSILKZBXgeW3MXpc1j2OrMaX1RxDGVeA
Kd8iYdt3Fnr6KjC0aYMQi8i2gui77GUIUXKga9gEUrcMTovdZNPWGYZYfLzTuQ4+
DDD5gEZLGg+TPws7LuOY5yr3JD/xuBtCPKUjHtPfTUYzIrnsWTJ14ffzk1mqkNaL
ysrClhQihz6Qc1L8zsBS+KX9pEqeMBDpQEiGDOdlatKQrTT1uslTWCRooxwPND0X
kDsLMbm7+XIMfQs6On5Ru1IizPXLYw==
=Qea+
-----END PGP SIGNATURE-----

--Sig_/2=V.9quiXz=cxF80yjE8NJn--
