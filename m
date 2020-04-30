Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33211BF038
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 08:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD3G0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 02:26:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726337AbgD3G0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 02:26:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CQQ93qGDz9sPF;
        Thu, 30 Apr 2020 16:26:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588228002;
        bh=zPQ5L1yKI+ONGJlrcAm4go+qXtogaYO0JMpUg7V2byU=;
        h=Date:From:To:Cc:Subject:From;
        b=NcerQMQx5QrChDS6+/RHBrU52nZQxa5Q0V9Hrll0/6oHwtAaig+ujI29D9s3zzqUX
         r9EngloS7DPygDyImshQ9OuHO7WQ3N67Xr9OB2zf7bV4+1JfGuw5oXs1FqZtjieZTh
         ZIQF+Grr9LkVzx0YU1P+eAnpJ9EUcqxKo80X70d3nlvecfUyt6QTIted19z7DQMHZ2
         kmKR5HIkA7oikk33n6gzN0VJNgeXVAs1qN1OSR+TcO0cmH87sNcS8cDuiJ1Uyktuwh
         o0hU1UgjdUj91mKrgCHBtCocidp+hnpRLNT5W00C/yeFQ1ytP6wRPlUd2HaBRCf8ZQ
         sFreujsk7NcDA==
Date:   Thu, 30 Apr 2020 16:26:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zong Li <zong.li@sifive.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20200430162639.4eaba859@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.OnAhcc3kTN9.z/0SMfptII";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.OnAhcc3kTN9.z/0SMfptII
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  ab7876a98a21 ("arm64: elf: Enable BTI at exec based on ELF program proper=
ties")

from the arm64 tree and commit:

  03a534dd08f3 ("arm64: mm: use ARCH_HAS_DEBUG_WX instead of arch defined")

from the akpm-current tree.

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
index b5d91fab64b0,787b7202676b..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -9,8 -9,9 +9,10 @@@ config ARM6
  	select ACPI_MCFG if (ACPI && PCI)
  	select ACPI_SPCR_TABLE if ACPI
  	select ACPI_PPTT if ACPI
 +	select ARCH_BINFMT_ELF_STATE
+ 	select ARCH_HAS_DEBUG_WX
  	select ARCH_HAS_DEBUG_VIRTUAL
+ 	select ARCH_HAS_DEBUG_VM_PGTABLE
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select ARCH_HAS_DMA_PREP_COHERENT
  	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI

--Sig_/.OnAhcc3kTN9.z/0SMfptII
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6qb58ACgkQAVBC80lX
0GxifAf+Oe2ESLserO2H2vRLoYsz55j9ATJcnegjnGldBaEGvMXoh+QWFctuagPf
TUxTqo874Riizqz4tTJqjlkN4JJ/SQ90KgEwsNll/j/ziXT6fRpRaK47j/4uGXFZ
tT3K5j31AiW1AAg7xiCssgb0SlYpiCw4qAcru6vjiqWweG7zzM4Uv/llYCaVd1bO
dEjj7WESknEXKEndgAkwwqY7iiwrN5jn2m/IWRLR64go4sua5CLUWCUrDgXz/h1O
zOpJhDFhRuqVbKWJrYxU1MhzKiJ9Kvs1ZtZIqaO9aMjPYSs6jsjJtnclUZlj7oJ9
25devcpFDMA6FbSbGjpp2H+wE6EhKg==
=Gv+z
-----END PGP SIGNATURE-----

--Sig_/.OnAhcc3kTN9.z/0SMfptII--
