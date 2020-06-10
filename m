Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437861F4B0B
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 03:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgFJBuB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 21:50:01 -0400
Received: from ozlabs.org ([203.11.71.1]:53073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgFJBuA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jun 2020 21:50:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49hVKx341vz9sRh;
        Wed, 10 Jun 2020 11:49:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591753798;
        bh=JcCB3Jwjs8Ym9pdEb48PmqG0PTcVsLFh5SQbcLiEZG4=;
        h=Date:From:To:Cc:Subject:From;
        b=N/gZK7ruVgtDgJ0nOuefiQ5U2Ck0OEQCiRy2MIXwZnhvICr4YvK9bSlE+3zU3yRFh
         Ss4LqJgbKS1ddNB2S6rspzBM9JB0DsLcS337rEwgAtTkbTLSHnuoqOwtr/i5A7RhHB
         Pea8BBxSNaXSK+4nwvMcshuVJcJJm7N7JdHDRUXpPJwmhjfdUUGJca3ZueLpWy69ki
         EYcgcTezXmGYl9Kha0n/lhF91kXMUNnYBx9hhyoVkqG5J1EJJ7XCCQMKNMA60fYCf/
         DUl48NXmcW3EBruMF9Aq0LbKkRWytdRKgCU32AvQYmGogmQwX1mcfKhMyDPMsQK2cm
         LwNybSOixN1vA==
Date:   Wed, 10 Jun 2020 11:49:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200610114956.0b41e116@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DPYlI0_cVmDRVpYEDWyT+Sl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DPYlI0_cVmDRVpYEDWyT+Sl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/sparc/include/asm/pgtable_32.h

because commits

  3408974d0533 ("sparc32: mm: Restructure sparc32 MMU page-table layout")
  c95be5b549d6 ("sparc32: mm: Change pgtable_t type to pte_t * instead of s=
truct page *")

from the tip tree also exist in Linus' tree as different commits followed
by other changes.

I fixed it up (I just used Linus' version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DPYlI0_cVmDRVpYEDWyT+Sl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7gPEQACgkQAVBC80lX
0GxVmQf9GlMYcfn4vfP4aZkeiG7V4H5Y7U9wH6paRhF5hB2N4pvq17HWsSBwDqNs
EOmkl9Myf9Vi5Nwdw40C/vVdyPNm9Cv6eOxnj3YZPk9QtIkWkzZu9l/TG8MGnl2o
N6+UBgbkrP8UT0wlPUvCVKBV9J1i6/FFefDlDaeq+IFe10jzfN6r1SlmZdsu39uL
9gustVHb56sd+VUZGjFoucgi/YlyW1kwx8gc+uk15BB3+ovRRZ24cTvum678tJxF
Gh0gQeNEb+pHLawYbARYum4M/6fSW1LpVoAczXwllnaWqchTseWJztyCptfnnSZO
Htq6InXiQVJyMA39+WKvqlsepwomhA==
=uERo
-----END PGP SIGNATURE-----

--Sig_/DPYlI0_cVmDRVpYEDWyT+Sl--
