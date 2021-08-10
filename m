Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627853E5321
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 07:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236688AbhHJFzP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 01:55:15 -0400
Received: from ozlabs.org ([203.11.71.1]:33627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231716AbhHJFzP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 01:55:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkMbw3bz4z9sWS;
        Tue, 10 Aug 2021 15:54:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628574892;
        bh=f8R9NvkDos6wec/SrfyapK1cFZj2Sr2PK+CmVlje5tc=;
        h=Date:From:To:Cc:Subject:From;
        b=ezi0H6Hb6FXtxuHpg0Ts7uEBiStWkzcjVA87xiqF65uVBbG6TlTAaLDRm1iSXOJq4
         zRuZZYojwWMArdOu2ihTL4C+Cb4rDRCgQown+eUBDA3XVw12vQc5nRjVTASzt4YDsk
         7Gea0xwEu19MITL3Py7fkHg/o26QkZDwg8TxHe0RZFB3Yum8I7M2YLkhTy319ziOgN
         7m5Qgh7MtMBnYMit/vkDi0/FVPRAwX8J++xZne9weRuQHTtQ9/tKfM6utIXPueRvQ1
         d+AbanCIvc3RYSS89Z8IpU1729+xYqdyc14X2z1MwpVJMGe8cpBCXVZeXH+dS3T/mL
         1tvpn5ZrCh1jw==
Date:   Tue, 10 Aug 2021 15:54:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Cassio Neri <cassio.neri@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rtc tree
Message-ID: <20210810155449.289326c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z=6wINnU2pXimQ_qceP4Tjd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z=6wINnU2pXimQ_qceP4Tjd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/rtc/lib_test.o

Caused by commit

  1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.=
")

I have used the rtc tree from next-20210809 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/z=6wINnU2pXimQ_qceP4Tjd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESFKkACgkQAVBC80lX
0GzAuAf+JR6YOBbVbunvb1pcgM6ghy6PBS8uzDzWjZ0XAlv/tlffeButlL1dLvHQ
FDl+JMWb9RlJYvC9SXeNYchfSRPchSTWq+AjT31junBvtpp8YQ8YZDm2X7m/gHGQ
AjhPjGaPMdetMyCB3jCIrLYHFBNkJ82mgFMhR9v/8br3tIJVvAR3XDb+zZx+LqGB
QbNe5PCWKmWosSgfbTsQhAJ4cndnrRvJkXLKjNu7pWpT1ha45vKAcSbAfR5tZ8G6
f/cMfmlBhIV+xvWzQPh5cmk3lvUusMKVZZ5nWsmuPXi8HFxWDnr7Z0rWsKbl5znO
MebI0KaLke0HdVuEg5nUQpOSLAVbpQ==
=aBKr
-----END PGP SIGNATURE-----

--Sig_/z=6wINnU2pXimQ_qceP4Tjd--
