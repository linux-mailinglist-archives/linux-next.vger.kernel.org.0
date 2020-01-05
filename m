Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125C0130A44
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2020 23:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgAEWcv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 17:32:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgAEWcv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 17:32:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rYLQ6jDWz9sPJ;
        Mon,  6 Jan 2020 09:32:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578263569;
        bh=jCp7x7I30t4i9fpQqT1U+ewkjQ3N8KxA98Fl+ajb9gY=;
        h=Date:From:To:Cc:Subject:From;
        b=Ew8cGL6fxC+6aduM/s5DqYP7qOdGD9254LAFO1HFNiJVSGeQv6VKnuDLKS2SAkaSO
         Hi4v49BKCMY3/cZOKfdxbSh1VbfCMNhBdP8Mizjc7Xk8Um8+bOeMYTojDVXS9B0foB
         fxESGRvhetk79qLScO5xOE7xZfTv1oHaxN0isLlbxefWhL63UMJClVkB/SJt+RBOIj
         uxDpXCY3NDaICvcKMGjZVsGj1FnX1bKQ7sugJudaIVS/iSAZ1NV8nLPFvRWorHxAZY
         OMEj9JuJlQYOyyyO+oh8Kx9ERUYXZEwf5J17//rnFCnylS0L9eRwN2RA2EszoG4hPr
         fr/l+vp4XeZkQ==
Date:   Mon, 6 Jan 2020 09:32:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20200106093246.6abbb7e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ywFS/t0S6j3w=iZbYIrd+8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2ywFS/t0S6j3w=iZbYIrd+8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  Documentation/riscv/patch-acceptance.rst

between commit:

  0e194d9da198 ("Documentation: riscv: add patch acceptance guidelines")

from Linus' tree and commit:

  d89a1a16d7dc ("Documentation: riscv: add patch acceptance guidelines")

from the risc-v tree.

I fixed it up (I used the version from Linus' tree as that was committed
later) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2ywFS/t0S6j3w=iZbYIrd+8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SZA4ACgkQAVBC80lX
0GzovQgAlDsPfmHcXwByPHIKH6zevu/q/QYmgw/mSYdbgqWuWzZVCaRYGf2t7sGh
9DuHoIoTXpvSxvCwkzZ1ORvxkGaa3LzA6x+K/eHdBae+6N9tz0yNRMa28lqjoig/
1LpAZeHQh3ftDj8UdRTjK5b4RYNDCeC73k4GPhlziblzVQblVbM8FfQNKdFJFd/A
vDY3Q76Hz72M7nkp0i37nGV4ixVUIKSlBYzeSR8EsvQLg74IVwHca9V5wM3Bw1bN
67bGzsGPpzvZl/ixApXiFZrN9Dgnk5ajV3Zmdm80fWoBPeipVnAmB4YOa0L6UWIp
7jgSv1qgPDATIYOq4f/AhRIQUbTxOA==
=63bB
-----END PGP SIGNATURE-----

--Sig_/2ywFS/t0S6j3w=iZbYIrd+8--
