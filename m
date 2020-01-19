Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F336D14205F
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 23:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgASWMq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 17:12:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38055 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727195AbgASWMp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jan 2020 17:12:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4818Dp68rjz9sR1;
        Mon, 20 Jan 2020 09:12:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579471963;
        bh=F0/uUBWapm8iYojCapqbHi7fMNj227TO/r4QzxxIdLc=;
        h=Date:From:To:Cc:Subject:From;
        b=i7LinkgYPBe+SJDaRtt33rOeynzd+tJb0+tYp9KJxSV2vjz1b0E+DIwxapZ3OZRpU
         aatFbRZ6SwKP/N3wtDUq296MCHutvHhjSWLaTe6/rcgVmd6r0AwBZHB3D9rJLiL2Ag
         IoMMEXJzo/KNSd1e9KA87n/aRFdgur52iiVpf4+LyZS3vgtTFdA9F545yX+39K7u4i
         JSFL78TnByhmOJuxBFevkQXrBFZ6FS8tK5tM+4xRO/NuMzt19leripjDkbg7Mj9h+9
         8BPPR3DeNn+/jZ+k1NT24WUo16QuKklwF3cqTBJORFmmU3VijZRF8O93KltScXyy1q
         t5FYLeCJFi3kw==
Date:   Mon, 20 Jan 2020 09:12:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Artem Bityutskiy <dedekind1@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        Richard Weinberger <richard@nod.at>
Subject: linux-next: Fixes tag needs some work in the ubifs tree
Message-ID: <20200120091239.045c7c65@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g+65TJXtNyGmwDCUORN8KC6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g+65TJXtNyGmwDCUORN8KC6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  31f36312d2ca ("ubifs: fix memory leak from c->sup_node")

Fixes tag

  Fixes: 4793e7c5e1c8 ("ubifs: Store read superblock node")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you meean

Fixes: 4793e7c5e1c8 ("UBIFS: add bulk-read facility")

or

Fixes: fd6150051bec ("ubifs: Store read superblock node")

--=20
Cheers,
Stephen Rothwell

--Sig_/g+65TJXtNyGmwDCUORN8KC6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4k1FcACgkQAVBC80lX
0GyT9Qf+MotPR0x7r98Q9ekpoN17qvRdsh5rrFIHc8HsDaEwZkLpLiUbxkMqJ6tw
3CUohzjJTb+tVjpq/CHdBrHr9GZKqrNTSS//muwclQaVtmHQilyRO0lsFLuND2DF
VwTEqUpVG5Tj2ZmzDjM/t+kAHcKSkatWSw2klOFjoGZLLLBktEiJ4an+8ORlhMbh
YckZmfoJ/roYvVvvnbUKXEsVzCA1FPfrNTGl7Z8HFHNp6OfE2YVKKDGk62VHHf/N
KgXgZzykr/NmU8/3MTNMtQfOpDBWSaQ8mKsoma3TxlkjfSktWdaBi7tEXfAREUfO
3M0mAcEdpQIc/sef3cAm8O7HpRi9xw==
=P34F
-----END PGP SIGNATURE-----

--Sig_/g+65TJXtNyGmwDCUORN8KC6--
