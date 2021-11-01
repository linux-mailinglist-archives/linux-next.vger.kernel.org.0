Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79CB4411D6
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 02:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhKABjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Oct 2021 21:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhKABjV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Oct 2021 21:39:21 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFF7C061714;
        Sun, 31 Oct 2021 18:36:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjFxm4qMnz4xbP;
        Mon,  1 Nov 2021 12:36:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635730606;
        bh=bCKRL41vwGERGAU6XSktu0PQOdeDQ2pSM6IhizIvfgM=;
        h=Date:From:To:Cc:Subject:From;
        b=iBy+XaKGWEBaGpBS7bAUH9D4yQ1X3Rfj9FJlR1hdJW6Ev5GMpI7oF6KFo/9RM8GMZ
         9iUxV4jNHL8MMfGrew7KK24R8f5gOqGPsxE8dO34qFIoLZfqDPxlLYYfBan9tnNgoy
         xgdbFkVuPNgbjctldKCJQh27BM0e4U2ICdqiV9iKAlsPNp5iW1V9FbPeoY4dbQ9HwV
         pqGLtuYy6RKlepnR22GbOfphBTknTL86A7HnfJJbphC/hHwLKRHzXGuGrdKsGveTjR
         0TtHCrizk71zDLmXlJvlRjcuH6Tr/XskdOPss6k9fohmE0zF7Ve5bs2LUD5i6mageR
         g+qZhvhpodcEw==
Date:   Mon, 1 Nov 2021 12:36:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Avri Altman <avri.altman@wdc.com>, Christoph Hellwig <hch@lst.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20211101123643.2b637a50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GtwtyuFKLcCICD7f3a9_Jmz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GtwtyuFKLcCICD7f3a9_Jmz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/scsi/ufs/ufshpb.c

between commit:

  09d9e4d04187 ("scsi: ufs: ufshpb: Remove HPB2.0 flows")

from Linus' tree and commit:

  0bf6d96cb829 ("block: remove blk_{get,put}_request")

from the block tree.

I fixed it up (the former removed the code modified by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/GtwtyuFKLcCICD7f3a9_Jmz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/RKsACgkQAVBC80lX
0GxnBAf/XqUt0Qkq0FjKPQS8olf4QP74yIjWcu43tCOsZdq09Chr+bJkMJXRaztg
lnmNQ0bSoZE3p6nEJoXOU8Lo66EHnjugynNLgO9Pwtkwk04Mi2twPCTuNPnU8FhP
2Zg7g2p/MY9BMNbfBwayEiKVui8E1YDDPoDsSTSRZH2z9S0a9252DvpLsOcoQi0r
MW/o/NSM2viVML3wFHpc55p2bMYNeNtrPZ+06ufhsBw8V3LSGMIVeMkBSDsm9Vyy
xkeBFvuvc03KzO5drj9GNtc/itMVfcBk1KyfVlMVvtjCgkjCDsa2LvG3fD6gqz8r
aojTS1CT62zfh9Mn4p8iq3QO7nhBQA==
=TwgH
-----END PGP SIGNATURE-----

--Sig_/GtwtyuFKLcCICD7f3a9_Jmz--
