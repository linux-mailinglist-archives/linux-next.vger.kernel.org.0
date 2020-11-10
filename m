Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFF72AD00D
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 07:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKJGy4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 01:54:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37769 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgKJGy4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Nov 2020 01:54:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CVds96QQRz9s1l;
        Tue, 10 Nov 2020 17:54:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604991294;
        bh=HQBaI6PLLJahyjskam4381TETPs4ZFMKJ7CPwhjWjTQ=;
        h=Date:From:To:Cc:Subject:From;
        b=uQqzoNaQI91wt76YQD+15jkyZkp70yp+UfXmp2YKy/WZ8E9qKqUcJe1cAGTut6gbJ
         jrvmOU1U1bKphuzMqwPzuOYlH/iqi3b/7tW/l3i34B5CtWrE5hctWFeZV5BsMu9VYq
         3+Dh+Ea+d9UxhvbDlf7jmKyH7/o6v43C+/5IZaLmuKQKIQIWcfFZpiwT53Jdh7gssD
         LVISc8rGZzcUlRyogibGF89ioRNnNYEtf36INeMjq3pHKUl27AsN6mGC/q5Jfi9tfp
         Cokeq273oGNTDmezQnuhLo3vATgo8GsG6rS7dRs3yTu4uTCObjUP90UEG2F9lpju8n
         Wf+H+qpubFujg==
Date:   Tue, 10 Nov 2020 17:54:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the arm64 tree
Message-ID: <20201110175452.3dc0e1bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9rfDwdjRY9b72Wz9jZlfuBb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9rfDwdjRY9b72Wz9jZlfuBb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm64 tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/arm64/memory.rst:35: WARNING: Literal block ends without a bl=
ank line; unexpected unindent.
Documentation/arm64/memory.rst:53: WARNING: Literal block ends without a bl=
ank line; unexpected unindent.

Introduced by commit

  f4693c2716b3 ("arm64: mm: extend linear region for 52-bit VA configuratio=
ns")

--=20
Cheers,
Stephen Rothwell

--Sig_/9rfDwdjRY9b72Wz9jZlfuBb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+qOTwACgkQAVBC80lX
0GyRiwf+OfQAuKmEr3LIuXBxzDLi7235U6eiQTYfUXyX0oqp9sMu/jjs/qD1GHEb
iV7cARxal6rk9V5852H7eJhctDoO0TkMpcOOvi84gg4jCrwYHEb2UDCqb+1iNbaw
9CWIDH/JOf77yPMWbkkp5Lm4FusKifjhLaWRR5RVcFbxvOBg7m9yIqochyrQeJya
LpaursVkstpCiTUO0f2t+8tRH4RTB+DZIvQ8yFaZiYBmZrZlhHsvqd409Aoy4zzB
QIEG21btB5rUnNEDaqWadjrI7nE7ZWz+3+IJk9R3KqORi2DOGoPrPtNXUwxqTvPk
0eXWaabF4XLR0V0SjGTnHFliTnxuEA==
=NKmr
-----END PGP SIGNATURE-----

--Sig_/9rfDwdjRY9b72Wz9jZlfuBb--
