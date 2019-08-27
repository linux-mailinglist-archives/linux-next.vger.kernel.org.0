Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249F79DD54
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 07:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfH0FvA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 01:51:00 -0400
Received: from ozlabs.org ([203.11.71.1]:37479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbfH0FvA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Aug 2019 01:51:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46HdJx1c3mz9sBp;
        Tue, 27 Aug 2019 15:50:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566885057;
        bh=8l2yHo/zsqDgKdonCW9f8t8dg+Ve+MZyI/KgwsQsRvs=;
        h=Date:From:To:Cc:Subject:From;
        b=ngJAMjjd2861Zre7xYXmX5CTcwsOmNDIxgVVlQHk9RrIrprAamjx535HjOWbRBA1A
         raqEpi6Uq57DBBH1LZpkCYZ9bjPs9N5EXIopSfHswq65scNZ2SjjwX2oCos+PFde6f
         nexEqP5Epu7PZThC7APnp5FA0LmeynrEbZwXvjOQM9QIjuGEsE3P+en3grocXiwP9E
         yWuO4QvSAWEjWhiMb69n+KpdlPfqB932IY2eSu/V+NIfcgQ0qWxfsHFT4WebDLzsby
         bHhFGXS9hXUgzLyDEM9AsFf7pVhD1e9BBN9dSb5OzrSGCUxHlRh/ieDss3t3dHSCd7
         HOZeDBGhy7cHw==
Date:   Tue, 27 Aug 2019 15:50:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Chevallier <maxime.chevallier@bootlin.com>
Subject: linux-next: build failure after merge of the phy-next tree
Message-ID: <20190827155056.3dafb17e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TvQjQVBNpyGMBk1Co4XsQai";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TvQjQVBNpyGMBk1Co4XsQai
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "__arm_smccc_smc" [drivers/phy/marvell/phy-mvebu-cp110-comphy.ko] un=
defined!

Caused by commit

  ccee80654309 ("phy: mvebu-cp110-comphy: Add SMC call support")

I have used the phy-next tree from next-20190826 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/TvQjQVBNpyGMBk1Co4XsQai
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1kxMAACgkQAVBC80lX
0Gztagf9E0xBamruCKMV8zSsMkhqM116wzZGsOMYRG/GNtNdFdp1G9VxQyLF1kt6
HZFNl/Uc7hppxWuhzx1CsEcUQaFHdGDrNbgULSfbpEvT/2kWDfdW0KuXqpy1NDrW
rNwyWkppG4lmTEKEAF3ZowZ0WJjAjQytqjBQRIBFnve1/JRPm+zZ4cW6aLQWu3OP
9t1Pl0Qq2Mk8oAhXxOIglI6DoEvSbokBCLRnc6FGKgL6Ll74knvYONMG15mk3OS1
eOQqw2bb6sj0zudYEbtiamrk4PgS3HapKIneeZKUE4fHydy8SMCVoVg4NI3P1GSz
N1512irwGuke1QR6m7/pWIJqT2+NaA==
=UBWi
-----END PGP SIGNATURE-----

--Sig_/TvQjQVBNpyGMBk1Co4XsQai--
