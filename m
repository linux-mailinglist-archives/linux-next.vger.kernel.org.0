Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF5620CAE1
	for <lists+linux-next@lfdr.de>; Mon, 29 Jun 2020 00:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgF1WFh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Jun 2020 18:05:37 -0400
Received: from ozlabs.org ([203.11.71.1]:56959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbgF1WFh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Jun 2020 18:05:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49w4SG6MLJz9sQx;
        Mon, 29 Jun 2020 08:05:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593381935;
        bh=6LZe2nZr8VoOLYVYiktOniguFuItwnZTcURW7KKJ8/M=;
        h=Date:From:To:Cc:Subject:From;
        b=upfEa64gQuGNZFrAs30I/7WXOfJ80j5LJ2cl2jZm0mVHk7Ab8u04K+t1vwul2ZKk0
         QsMsSH1MMFrEfmbV5qxxKksAzwZdXLm+dKJ4DePsFq6AuPjpHWerKGbn0BsjxLH7lT
         wNmKFq3hYvVtqcvsCHkXLXFCIIT3lG6ubgZ+7lqcj6Q/BK0aLE957krCKBAyV9lBoc
         +LBTmwFbmDdUX2UWffSfA4vT1PVCU/1XeFnzwLQHr2LMnS+Yvim1mHYPhQCQKPQFLj
         b6PpKE/sNybKlzGspjmcrrQ7MCRLZIPpiuU0LnHwZSkL+m/ZiWX2qNdbbN4QNZnb1S
         ikpFlJ/i4X7vg==
Date:   Mon, 29 Jun 2020 08:05:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200629080533.5f44d445@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ai6xo+jK2O9QUvmRdMJ=rEB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ai6xo+jK2O9QUvmRdMJ=rEB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c9cb6cd9a46 ("io_uring: fix refs underflow in io_iopoll_queue()")

Fixes tag

  Fixes: a1d7c393c47 ("io_uring: enable READ/WRITE to use deferred completi=
ons")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Ai6xo+jK2O9QUvmRdMJ=rEB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl75FC0ACgkQAVBC80lX
0Gzgpwf5AecpB1tPaVWggRq0JAou9FL0nEms4soAcbhL2VLLeKwjDT7gRTbw48ge
t4UV1Qow1JdWVBKyp7ZiPg+fLXJNFYG1BXxXLd9mZOleV3ZTXNSB8BpPL+9AKibG
rpBU1cXM8WrXWtlIPEUYOl4I24Em7G4fiQCqrutK8ek4Ja1CYvyURs5tdCxBXrwE
WpYiFItNxumOYaVPFsznKxL03NpBjCuW5ecp4BTKz+zytS9D7QjUmQ5TF9eKx4kQ
42Efo5TMfbCD53AgwQkAkqkB0GS8brfycppy7GvzEt0+8nF/8PSiW6n6iNX+ISBv
VsYvmcnlX2z6nJKmRa9sikRcEOP9Rw==
=RwBk
-----END PGP SIGNATURE-----

--Sig_/Ai6xo+jK2O9QUvmRdMJ=rEB--
