Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F025D1EDFE1
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 10:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgFDIiI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 04:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgFDIiI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 04:38:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40495C05BD1E;
        Thu,  4 Jun 2020 01:38:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49czgf4R3Sz9sSf;
        Thu,  4 Jun 2020 18:38:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591259886;
        bh=Fw81xUNRxSEfr/K2a41wO/SlsASJNJ6ZEGKglcUTBhU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BRJKJNTELzccZZlcQ6aC+MJCXwoHaorwVDckpFcIW+elWGhu5ytiSMqUSYA7u7m4/
         1LjQOJr7oKKQgaMuL4yPS6aOrqIEneuvMe0Vizwjm4jrQj+RhBrcpIQ1mjs+lGargc
         hjdOZACWqzp1XB8uoAFQi3E1onhKNn2Z6/cZ7sC0xGjnm5hNFuEOFw77nVnZNDwmgx
         sAtwhadQZS/86XPNI3OtljWczqHFZXr/53kBThoq7ZOiaZQbneNccEh6a1knTTVJPd
         MwxiB7YdROQninB0Mn7v+nTOBRmN5KXrW94buNHe2A4eGDXFkNAKanJN25cgSqbhYV
         D/6udXo/aGZtg==
Date:   Thu, 4 Jun 2020 18:38:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200604183805.6f384b23@canb.auug.org.au>
In-Reply-To: <20200604165246.436f02ba@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
        <20200604165246.436f02ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SvRqq+9lvuVyD6gXBTM7iQ2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SvRqq+9lvuVyD6gXBTM7iQ2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Jun 2020 16:52:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
> index 25c3cb8272c0..a6799723cd98 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1008,6 +1008,12 @@ extern struct page *p4d_page(p4d_t p4d);
>  #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
>  #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
> =20
> +static inline unsigned long pgd_index(unsigned long address)
> +{
> +	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
> +}
> +#define pgd_index pgd_index
> +
>  #define pte_ERROR(e) \
>  	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
>  #define pmd_ERROR(e) \

I have added that hunk to linux-next for tomorrow as a fix for
mm-consolidate-pgd_index-and-pgd_offset_k-definitions.

Its not strickly necessary, but Michael expressed a preference for the
inline function.  I was wondering if pgd_index "Must be a compile-time
constant" on one (or a few) architectures, then why not leave the
default as an inline function and special case it as a macro where
needed ...

--=20
Cheers,
Stephen Rothwell

--Sig_/SvRqq+9lvuVyD6gXBTM7iQ2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Ysu0ACgkQAVBC80lX
0GwIpAf9HNqmGtGniydmF0H4hLlZjKycJ6U7wVQBWTZh40QmaBNhJo4Cq2mG4U0u
SGEKP3LMv8GVAo6lyLyoIv53uAYcmrWv3L7iIAyd+1EPz44VURGXudmTXdLTH8mw
s4jNwXbVxEOADoRs5r+cF/8+bofKdqC3ehJcd24NU9VEbadfcHOdGMfAVSyk6+Ox
10pI2Wd1u4SxS/PS6j/XJU+6EZMyCz5TYFAsAnZzL/09NxqShgcz7f/Wp7vN3KUQ
g72Ar0TulShJoWwbn3GOuqznN5nkkmMQSWd/1RyIs///jaDTKw4W28Wq8GkBEjdU
S3RU07Z4DFQCS9UIQVm49RYneteAbw==
=/0oI
-----END PGP SIGNATURE-----

--Sig_/SvRqq+9lvuVyD6gXBTM7iQ2--
