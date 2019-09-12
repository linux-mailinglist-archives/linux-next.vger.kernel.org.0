Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47606B0E5C
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 13:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731518AbfILL4q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 07:56:46 -0400
Received: from ozlabs.org ([203.11.71.1]:49461 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731283AbfILL4q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 07:56:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46TcgX5mw6z9s00;
        Thu, 12 Sep 2019 21:56:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568289404;
        bh=/N+GHb6Q4DSPJrXliJOICdcpLmYvTsamZ3rmrW6spnM=;
        h=Date:From:To:Cc:Subject:From;
        b=rbhXD03TQsGooid4wLhTUDWO8BmwB61GgK6QV47Gleif8ZA1Ksd/zqo744wIPwn7T
         qVfbJe9T7sttEx2975c6u00CGZzr2bCz+WNeBNvheQwQ7bwv0pM7jXkm3GsSbn2Sry
         y9Ip/LV0UPI0Youx2TgIZpB6xC4pfOC1V8x0m5hAlS7usCFLaLlq9NrQgAKp8PXXIp
         TnlJ9daSM/2Ueetj7N1dBm3cxPrT2pRU5epPXJaB1uwphRckKU7K0nOuIihxu53JS7
         l2zBBaYD1qDT1k7zfJgGdm4p2+hXRkQGn4s5ZvgQgAhCIr7BZbFcGQn85pfn01aXlZ
         q1yHvuZ35JU6A==
Date:   Thu, 12 Sep 2019 21:55:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the arm64 tree with the dma-mapping
 tree
Message-ID: <20190912215558.473206de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ga3xg0O0/4COl5KooqPVUmq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ga3xg0O0/4COl5KooqPVUmq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/dma-mapping.h

between commit:

  5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h")

from the dma-mapping tree and commit:

  b907b80d7ae7 ("arm64: remove pointless __KERNEL__ guards")

from the arm64 tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ga3xg0O0/4COl5KooqPVUmq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl16Mk4ACgkQAVBC80lX
0Gx5OQf5AWmAI7PcuY5qrjVrmxOGfiAYSFFQviVgTYqxbX8Yuu63JNeEmjP4YVwy
pdCT2f531PKRdnfR9J2F0jselppcHQf4dhMaMGvd+MKa4eqdsDpDLVrlAheAm+d/
1rxjDHfWtr2R2zryvkiaqezpFMBuwf5VmQG2vRFsFB1f41VxPOllIHX9/A6qEqVA
+Ql7V5EQNnATNlW8+yY1txHRWDTseylgHJAxy+Uq2cYM9r9H1md3/eiRgGphuECO
YbezVvHJs+9+hpME3ICs5gx8Pfo8To0a4n5/GnXiNWI1iMOHXOC7USr9XJ81sdaP
ODFwSLJuIipCg2tsTaW89pTH6WhIww==
=zu/j
-----END PGP SIGNATURE-----

--Sig_/Ga3xg0O0/4COl5KooqPVUmq--
