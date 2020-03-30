Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2284197137
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 02:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgC3A0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 20:26:18 -0400
Received: from ozlabs.org ([203.11.71.1]:41701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726661AbgC3A0S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Mar 2020 20:26:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rCtZ31Wlz9sPR;
        Mon, 30 Mar 2020 11:26:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585527975;
        bh=QbXOxtxH7m6OajZuEjdOt9MJFpOMzsUFZjcVETW53l4=;
        h=Date:From:To:Cc:Subject:From;
        b=rFwbE5wqN4gkFsOdxwLcdIp1OKiK54nE83HOhjZ8TCr6JhSXRzsVYM0TaMQRNbdlg
         cyrsDo/O002PsHFMhJXuuJYCwPSWZLoYQwXKXrZfOLUPRhYmMVZENsajimxJOu1lfG
         FaVXd/j02xQljeCwxJXa5kAxm+Ve859sGmzk2IItxSTlxpgzfOAGbb4I6Q6yunaZ6M
         AVDJEsMZvouc6q3LoRub0bvC0RiQxjrOOOx5soTxsmVbo52cKdsS5jFNNkMEXn/X8Z
         FtcaIahtjEuBeWf80EbvC1337cpCVdRvi6ESRTPi9wIBJCutCr3qyIpY07J0vSStUz
         UUfwL/kTX7q0g==
Date:   Mon, 30 Mar 2020 11:26:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: linux-next: build warning after merge of the netfilter-next tree
Message-ID: <20200330112611.5248d1d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GjAzYQMIwpxmCSVWZ4noGH5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GjAzYQMIwpxmCSVWZ4noGH5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the netfilter-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from net/netfilter/ipvs/ip_vs_core.c:52:
net/netfilter/ipvs/ip_vs_core.c: In function 'ip_vs_in_icmp':
include/net/ip_vs.h:233:4: warning: 'outer_proto' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
  233 |    printk(KERN_DEBUG pr_fmt(msg), ##__VA_ARGS__); \
      |    ^~~~~~
net/netfilter/ipvs/ip_vs_core.c:1666:8: note: 'outer_proto' was declared he=
re
 1666 |  char *outer_proto;
      |        ^~~~~~~~~~~

Introduced by commit

  73348fed35d0 ("ipvs: optimize tunnel dumps for icmp errors")

--=20
Cheers,
Stephen Rothwell

--Sig_/GjAzYQMIwpxmCSVWZ4noGH5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BPKMACgkQAVBC80lX
0Gw3nwf/UYChx3lA48RPO6+ZQEyDam1RI2THknZFm7NiAGmhXrCKWsZHUHHt4kIC
tYRXDI9i2Z8k0Imk+NlebECPZ0M3oJvLGG5u6eoB2B97e4R2I+mb2IqPtC/yj6pQ
+AlJVmB0pHyPEdN2Xg6tIoeGk24kKnz+OB37mEN7anHOn7mok4tGGQ+leV+ktnCQ
qDBJBPY/FRWyEsl9GOut70z5YHS83pQwrk2MRq7QpFlhYlhtj7XqDmNQkFSc3FkK
Rn0u0J3Cnnw8ObhwZCYk7ERZY9q5XQs5+HDyUDZwWDki4XjEQJGig1gfsRj4EOiZ
z6Yb7PB2DrAeE/FQJIAPGX+9czzf7g==
=IyIw
-----END PGP SIGNATURE-----

--Sig_/GjAzYQMIwpxmCSVWZ4noGH5--
