Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD253235C0
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 03:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbhBXCcd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 21:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhBXCcY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 21:32:24 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E71AC061574;
        Tue, 23 Feb 2021 18:31:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dlg0Y4GhJz9sVR;
        Wed, 24 Feb 2021 13:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614133902;
        bh=teW4F7ShNMD3Z2K/+ddENAjT3IT2wnK9LGjyfl58Sg0=;
        h=Date:From:To:Cc:Subject:From;
        b=n/Jj/XbT/6NG6Ky58LgKL7jmUQ5kWkPF2Thsh8eO7h1uc9lGVF1vOY0sT8bTTEZXb
         tuGNqaCJvV5qXV53KD6t2hkLAGvR/+HEOO7WFzG9S8kmIb6+Z0o2LAgWWYjIEUOTmd
         ce+AFb/wpWDmrp70tyx4iR5MNbqqqGT0Z1M58Plc1daPIURNobt+xfhhZbrI06Uzfr
         KptDn+jY0ThC0TbSQUQ+TWEiIEdMyqODAcuBAhKTdONYEmyqSpmPjn9obc2bx6kY/+
         IC6bLpga5MYhvBldqjjIGIZvdXd1uDaqqamIJTTaohAIv/+aSIAobwLIUWg1xQoq8p
         olvREKmhg6iTw==
Date:   Wed, 24 Feb 2021 13:31:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20210224133140.5f02fa0e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j1olF1CnjZPaOf6MSGqet2Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j1olF1CnjZPaOf6MSGqet2Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

kernel/trace/blktrace.c:1878: warning: Function parameter or member 'rwbs' =
not described in 'blk_fill_rwbs'`

Introduced by commit

  1f83bb4b4914 ("blktrace: add blk_fill_rwbs documentation comment")

--=20
Cheers,
Stephen Rothwell

--Sig_/j1olF1CnjZPaOf6MSGqet2Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1uowACgkQAVBC80lX
0Gxm1Af/UXjvmtOl6AfiKLUcRNBWiDwAMVTfzs++Zc6j5WCTU0+C4njgH0y1gu9g
1xKPyQIUxWfAMKlfup2kBOKle964knb0qOycgFqXc3zSJdcb+eJH360ILBL2K9HJ
/1fTzzTuh1I8aU2BNPVqj8kxyaEkZJeuL97akPGIutR2QTzXY/1PigsguaCeMrw7
h66AMz0XFaSeHaK8bPkaRTDbyHm27eXmctVGdvuy1WMja2S6yUYTdAMaSJUelhSc
N9VemKBxvyvXcrS/bUo7CjHxIb/Rsi4iwNwEKpR/DC/Y/gn2v5a1uKhN7aG/+zaK
aW5Eo77NNNs1GmWlMmoShEx+q7AWYg==
=660b
-----END PGP SIGNATURE-----

--Sig_/j1olF1CnjZPaOf6MSGqet2Y--
