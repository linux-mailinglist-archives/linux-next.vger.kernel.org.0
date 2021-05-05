Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CB83734C6
	for <lists+linux-next@lfdr.de>; Wed,  5 May 2021 07:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhEEFrR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 01:47:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231380AbhEEFrR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 May 2021 01:47:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZm0j3tH6z9sRR;
        Wed,  5 May 2021 15:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620193574;
        bh=wApHHOtDSJWFYUVgVqWGMm/xWrWFB/6uOr1gW+gaYqs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HWCBOcxrvUtyOD9IAmDMNTxrzh0FIa4vnV1jf6Kxhxd+oXMSbawXfC/7VPoQMlt63
         ob50wGzc60fy6MM8w8Mye5RjKKLKxF45/ssKb3fzFSOgZITxyS/UnNRQqSCANvIYxm
         JTqRRw8C3U+QCHaMLNYxgsTLB6VZQUmiZohUq4G5jukLOVgQpW08dVOtxHYNe9DyEM
         DiN2c6uKLMfeSH7TZCQksyI0lOnDfnzD2iaKXe5kwV02atqDjGDD3DiZIPzZcUgsSt
         wE2u7n3i8OaEqomjdeYsCbdFxUQG3hUiKeF+Te3xn0291KVF1bdrxyji0ij69bFmQu
         97AGMXsEZwsbw==
Date:   Wed, 5 May 2021 15:46:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Message-ID: <20210505154612.514b1779@canb.auug.org.au>
In-Reply-To: <87wnsd93rl.fsf@mpe.ellerman.id.au>
References: <20210505113959.43340f19@canb.auug.org.au>
        <87wnsd93rl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//z8aK/HK4ZSVA=0YSLM2hYG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 05 May 2021 14:57:18 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Urgh, I did check linux-next to see if that patch would conflict but
> didn't think it would conflict *that* badly.

Its not as bad as it looks, the akpm-current patches just added three
selects and just need to be put in the proper place.

--=20
Cheers,
Stephen Rothwell

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCSMSQACgkQAVBC80lX
0Gznkgf9GdW0eJlCaVO0o4bXI9ZF4pTCI0iJGRcD108K+NgqzZPhgm+2qMalombw
0E3NUlg5DKxtctuO6G8afAjer99FdaB+19gT/2rfCM6NT78PrksIQDqpbQPn4VlN
K1AkK873BW2VHWGZDrm01chQDcs3FVKBhRvLz3+K7omo0hI4rOMoKaTK3e6sdDDm
s9TQ1xnJLidnbm/mWO5RKh6i9urqLTLZ012brxlet9BiFkxyr8BdLJ0g8ba4rzyP
OZ0+sZfn4pLQvMPDIijni/Z2Xvzvb/EBdXP22ux+0D6vFc5tQGpHh8WhJ5Q7DTsr
UPca4LiTLxbkJCZeF5qZ/MD/nAlQgA==
=f3Gv
-----END PGP SIGNATURE-----

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG--
