Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED5D1894E2
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 05:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCRE1j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 00:27:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbgCRE1j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 00:27:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hxpY5tS1z9sP7;
        Wed, 18 Mar 2020 15:27:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584505656;
        bh=dOom9243483APTZDiyPHNPbFu2OaGWNAJteJqH6nYOE=;
        h=Date:From:To:Cc:Subject:From;
        b=V2FURspAyd6rp2hfmM0VQz+6s314vqb7VwTQpddc4UfOXOUAaSAFfcD6C0Qp6AKYl
         w1ph966rg1RKcLcPMCUYr3z+5ioIoVnx9ufUVLiYTcA3gEnG94zCihuqvYvZYfG8mC
         L3lWevvqdUJlShqFTpE8Kfr0NwQl5vv2q4f1w21W9lvkdaofnfS98IhQhVJf8FYFgU
         oiWZp9jcFlL20FNJdda4aWFWWPDt0KNKzeyOnELGhY9jRuvJZbvWp+zLU6IjZDProZ
         Ahxwb7nnR+n5W1glTGXFp+JCjptMN/lDsu+/A6ms2+MBp6RNlHQu/72XwOmSIM/OqG
         Mv4wn+oPQ7vDw==
Date:   Wed, 18 Mar 2020 15:27:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20200318152731.0114975c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tx/x6nL20AR7lvSvJW/WvKc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tx/x6nL20AR7lvSvJW/WvKc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  ab7876a98a21 ("arm64: elf: Enable BTI at exec based on ELF program proper=
ties")

from the arm64 tree and commit:

  5e3c6a312a09 ("ARM/arm64: vdso: Use common vdso clock mode storage")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/Kconfig
index fdfdc77c5067,c6c32fb7f546..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -9,8 -9,6 +9,7 @@@ config ARM6
  	select ACPI_MCFG if (ACPI && PCI)
  	select ACPI_SPCR_TABLE if ACPI
  	select ACPI_PPTT if ACPI
 +	select ARCH_BINFMT_ELF_STATE
- 	select ARCH_CLOCKSOURCE_DATA
  	select ARCH_HAS_DEBUG_VIRTUAL
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select ARCH_HAS_DMA_PREP_COHERENT

--Sig_/Tx/x6nL20AR7lvSvJW/WvKc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5xozMACgkQAVBC80lX
0Gx2/Af/SkdPef8QdhKnLjlPoRG6LCcDhCTftfEGrL+BS5vepl3QAfYxFf6qWDXg
PZHuRXlqBMySa9yLUZaBSBgIidGvQ95TpxzKtL2B4jhfw4xNlvdq+fq8FOEQfWyf
V71FrWoxU4xTw6fGC5t+U0aM3FVQgN5atdjtp3DeI8VCvk6JtbIp0y14GHqiRGEE
6xtIDLBB/qLnY3bwgdvjvF6P8DiyQgPTrJ9qMH3Ln6CtC5dff0Dt2MFa9MCYfCAI
rxbzgqFW+++ubUK+gNNNXBLFJ01edaASkb0IxQDgHeBpXitdaTAzO+BbUOwi6eAM
Xa24s7qldsRaj+gTpc6WuLb53RybQA==
=nvGD
-----END PGP SIGNATURE-----

--Sig_/Tx/x6nL20AR7lvSvJW/WvKc--
