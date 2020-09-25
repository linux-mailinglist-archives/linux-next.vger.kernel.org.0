Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34748277FF4
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 07:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgIYFfO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 01:35:14 -0400
Received: from ozlabs.org ([203.11.71.1]:51433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgIYFfO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Sep 2020 01:35:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByLGR3BFLz9sRf;
        Fri, 25 Sep 2020 15:35:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601012112;
        bh=8p3sauSbq+mpYhld9DyFAUnuEStxI7MV+6sDacV3WBA=;
        h=Date:From:To:Cc:Subject:From;
        b=kydefUcfHZoxG7MEvE37q4eBVh3fiNGoBQA0eHzwBDciO4oU4G0BrhVcxlN6DsmdY
         nj4m7jaOcWyavPGvC8L1qVYCHaZYhy3kPaoWiQ1OFZWd04KIADjSB02MIJewZ3lCzk
         DcMvLGyCldJyC8Vq5qmVKXD5fBqN/TVynqIIbM3YDn22F9WiF+NOWwBijJIFjsL4hL
         02MzajC/tH9DG+UQgmsbxAAQxuhprvnO713+pzYWvP9hy9bvYGL7FvP+ucrCMOonEx
         hQLOU3VBlITFcJh3+knHawsTd1x4lfpns8pTBhZPVFeaD+SmTde1MS9suT3Kp2y6wS
         pclk7uHsiYz5w==
Date:   Fri, 25 Sep 2020 15:35:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jon Derrick <jonathan.derrick@intel.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20200925153510.5fe319ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8uqibGxB7=sDaTlJ+RM2ylQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8uqibGxB7=sDaTlJ+RM2ylQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/apic/msi.c

between commit:

  2705b8e4d46f ("x86/apic/msi: Use Real PCI DMA device when configuring IRT=
E")

from the pci tree and commit:

  7ca435cf857d ("x86/irq: Cleanup the arch_*_msi_irqs() leftovers")

from the tip tree.

I fixed it up (the latter removed the code updated by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8uqibGxB7=sDaTlJ+RM2ylQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tgY4ACgkQAVBC80lX
0GxLIwf/XcPNTx97V81j4bVcef5/dFKroEXLMTT/n5ai06CnTmfDgAQNM4IFPAo9
Ty8UCknGmKZTd5+V/anks3pKXzuBFmpM4UDgzxgMJpCHzDbMJaWiMHrrv48j2iDb
1ypXzbIe1BkEhlX6ZcHX153JzEyRi7xtgsOQXLWkqWrNGeR5Lt0n/Bp7VUqGRtBq
7pdmI65ESpg1TxpzYTGDBjWTIPwE4thyR5EkaMdNDwaM1E+MxlN94FU004iAbJzG
2I/oT50//kamoeUUCJ3y+rCe+Ej1ozILPcSIHl0UNHL7OE/eZs86JNDa3FP/M+Q1
zkh6AHEZAxtYtbNbZJCi+QccmZN/IA==
=K1ta
-----END PGP SIGNATURE-----

--Sig_/8uqibGxB7=sDaTlJ+RM2ylQ--
