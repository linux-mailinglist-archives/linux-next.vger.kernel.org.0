Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451D22C7D7F
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 05:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgK3EEX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Nov 2020 23:04:23 -0500
Received: from ozlabs.org ([203.11.71.1]:60113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbgK3EEW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Nov 2020 23:04:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cks6L0dRHz9sTR;
        Mon, 30 Nov 2020 15:03:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606709021;
        bh=GA9GndMZeNm8gRJHPrWROI3tCqFXGq4bM7SYpeaZIfg=;
        h=Date:From:To:Cc:Subject:From;
        b=FkD8Wdp6NBar9cqwVmw7SIGfhBBCK6DM0WRnpgGsX9zY9DoplPo5EWf3sr2/A9mT+
         G9E3tiR6yp5Esypq9w6udInTsATt+5MOi3DyKRHB2xSexjK3C98+QNpsbpX+jFy/fK
         uCtSqyfSR9vyIYVG63YC4/z73BhTRUHoJuRPvwoD6pKZMt+M0EDkPMbbkVutYh+AWx
         3BAXy8pS0PJjmfLpxAjfHvVma2r7zqJJEJaGKwH8IKIEAObrC06iLUjwRrr8FVPoOO
         TOFM3zC6WZ3PqaWheahBh8NpAzAv7FBouTSnQQUly/DFeR6BB/iaZ9S8T8t6np4rby
         Wi/q+TRkqi8aQ==
Date:   Mon, 30 Nov 2020 15:03:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201130150336.128b84a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mrnim1ZVGKreF79yAS6jXaG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mrnim1ZVGKreF79yAS6jXaG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/pci/i386.c

between commit:

  ace091d17272 ("x86/PCI: Fix kernel-doc markup")

from the pci tree and commit:

  638920a66a17 ("x86/PCI: Make a kernel-doc comment a normal one")

from the tip tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mrnim1ZVGKreF79yAS6jXaG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EbxgACgkQAVBC80lX
0GzUgggAn8uNCqKbtziMCOBVS4X/MtZM0V0ZzR07HjiECjmob1mWT1ZfcCzB4Med
VF60PCOF1ONpF+96RnVdgvr3UxV/TlDNw4isnYZctT3ryYKWo8+MR3Z7lJXEBP05
yHNP5m5E4UQM7GzcZuzjPB+jzQ+OGrg92N3597vgSoA8s7nEtxkYJWuqtAWix29M
u6ZprsfAlykeZ5AQNZbOcK6HIT4gtckE+eDbjMwwOEbDIUGK0LTZ4U+WFLGt0j62
ZMbZHEonZmqkG3AH+i6EYkZZTDzLiWW0ntQme7SXhIneQ0eE6brocVHIW9ughFGH
8XmS9+nZggoDf3Jh6aJqDu8J9Zy+Vg==
=EVeU
-----END PGP SIGNATURE-----

--Sig_/mrnim1ZVGKreF79yAS6jXaG--
