Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EBE432899
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 22:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhJRUuX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 16:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhJRUuV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 16:50:21 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62350C06161C;
        Mon, 18 Oct 2021 13:48:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HY88l6Tzgz4xbb;
        Tue, 19 Oct 2021 07:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634590088;
        bh=YT7M4csQgCRnGXVeGaF8mV6PLKkcLRquanAzqTzaxxQ=;
        h=Date:From:To:Cc:Subject:From;
        b=EGT8LlnMS25LWHyf1zN4RqApdJSlDADwGVU0iRPIgZ/l4euKBhgGB4nLbnej72lal
         C1G3cmSDfI7dC4QkCNVODcALszsns++vK3Ch1Yhuat32BUFtsEr46YBaPEN8MatwMK
         5OulOc0Pbykr6qQIcidAsihTK3yB1n3kOBajsC7lWvayxzo5DCxJ1LjiIhken/ICZ7
         cmx+WrVHc0EXaeTEkvfJgDGfOWgOjhmft5c4QyIOGll9G3UTbc8JT2a7vrbw+AHZ8o
         67dK59dLvxykH6OHNTrA1AED68A5sUDg5guXryD5VautEv3EsCZ9ZV3iyMP+dk3pvu
         YctqUoY15+XyQ==
Date:   Tue, 19 Oct 2021 07:48:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20211019074806.4bb0cbcc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6+iN67ftml+l+RBtQPel8Ht";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6+iN67ftml+l+RBtQPel8Ht
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e036488d8a4a ("md: update superblock after changing rdev flags in state_s=
tore")
  3a79dfe0318e ("md: remove unused argument from md_new_event")
  b6f5737bc4f2 ("md/raid5: call roundup_pow_of_two in raid5_run")
  57644bef4efb ("md/raid1: use rdev in raid1_write_request directly")
  7d5f9b337c20 ("md/raid1: only allocate write behind bio for WriteMostly d=
evice")
  78eef929e8a5 ("md: properly unwind when failing to add the kobject in md_=
alloc")
  c57a1efbeadb ("md: extend disks_mutex coverage")
  a1094e65cde0 ("md: add the bitmap group to the default groups for the md =
kobject")
  96c85588b9b6 ("md: add error handling support for add_disk()")

are missing a Signed-off-by from their committer.

Rebased?

--=20
Cheers,
Stephen Rothwell

--Sig_/6+iN67ftml+l+RBtQPel8Ht
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFt3YYACgkQAVBC80lX
0Gxn4Af9FiKpjqWRLArzEx8kIDaTypBo83aJO3QxwA/pCleaIW6a6rRffV9UgqOX
ohbIsvFlL1qPorSto623MM+NSzkqg9TYaHD09VHku5KhOqBKNUD30LdKGhyAOlo4
tSidhPKUqpBwI5FUS9ixYlPw2TfX10NVqoGL83E5bSaONwxARKItF6QoupHeKKiZ
Tfq3MMNiD3avgkFnl5BYX4+WURMO05jW0KUHjKau+Em+qdoB7yQYF1Zn+D4XvgZB
cLQAMpyfnXy2R3U4267CfIkTfpaGSz9Mf0V2er9LYVpQpEVYwXX8UvBvBNWeoR3T
x1o/Oj5NT5FmxRg6VqqXlmjAwTiS3A==
=bHzh
-----END PGP SIGNATURE-----

--Sig_/6+iN67ftml+l+RBtQPel8Ht--
