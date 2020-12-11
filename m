Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152472D726D
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 09:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393169AbgLKI6F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Dec 2020 03:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437266AbgLKI5l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Dec 2020 03:57:41 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B29C0613D6;
        Fri, 11 Dec 2020 00:57:01 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Csl5h1vMWz9sSf;
        Fri, 11 Dec 2020 19:56:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607677017;
        bh=wrWNoZIPbsbw6fGY3LqHdTd+hBl3d2MuNM3dNBAZBwk=;
        h=Date:From:To:Cc:Subject:From;
        b=pFfdoaVPi9a3Z1hZHvAISJRwQEh0GalZfLnzjJym+LidO33EkXUc9zZKUejxbH1ey
         BvqP9SjAv8WE0zMRuoIx3mV/VEZnabsTFZPrBeSBkTd053nDJ6ImWHlc9jClXIOJSm
         pz3aSe7NJkGuNskcyVvyWFhS/ot/AIOQKkulcffVzwAotrB+crlbOMCYMHo1EGDr7O
         pXYpUVQ5k0Ps1gPBL3Ms+3pOb6/zkDKDlM9LkkeJsJnzViaw6umjvM4tcm9X/hMAq+
         p3CITSnLYNfotPfOJta5ZQr3ioZC8LOZzVaUSLxe5wVKUelrN33obn6McIwLZNE2Wo
         zSDe1zlgEwf+w==
Date:   Fri, 11 Dec 2020 19:56:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201211195654.6b414f90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NLq+hY2ZoOh+b_n74Y+jayo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NLq+hY2ZoOh+b_n74Y+jayo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/gup.c

between commit:

  2a4a06da8a4b ("mm/gup: Provide gup_get_pte() more generic")

from the tip tree and commit:

  1eb2fe862a51 ("mm/gup: combine put_compound_head() and unpin_user_page()")

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

diff --cc mm/gup.c
index 44b0c6b89602,b3d852b4a60c..000000000000
--- a/mm/gup.c
+++ b/mm/gup.c
@@@ -2062,29 -1977,62 +1977,6 @@@ EXPORT_SYMBOL(get_user_pages_unlocked)
   * This code is based heavily on the PowerPC implementation by Nick Piggi=
n.
   */
  #ifdef CONFIG_HAVE_FAST_GUP
 -#ifdef CONFIG_GUP_GET_PTE_LOW_HIGH
--
- static void put_compound_head(struct page *page, int refs, unsigned int f=
lags)
 -/*
 - * WARNING: only to be used in the get_user_pages_fast() implementation.
 - *
 - * With get_user_pages_fast(), we walk down the pagetables without taking=
 any
 - * locks.  For this we would like to load the pointers atomically, but so=
metimes
 - * that is not possible (e.g. without expensive cmpxchg8b on x86_32 PAE).=
  What
 - * we do have is the guarantee that a PTE will only either go from not pr=
esent
 - * to present, or present to not present or both -- it will not switch to=
 a
 - * completely different present page without a TLB flush in between; some=
thing
 - * that we are blocking by holding interrupts off.
 - *
 - * Setting ptes from not present to present goes:
 - *
 - *   ptep->pte_high =3D h;
 - *   smp_wmb();
 - *   ptep->pte_low =3D l;
 - *
 - * And present to not present goes:
 - *
 - *   ptep->pte_low =3D 0;
 - *   smp_wmb();
 - *   ptep->pte_high =3D 0;
 - *
 - * We must ensure here that the load of pte_low sees 'l' IFF pte_high see=
s 'h'.
 - * We load pte_high *after* loading pte_low, which ensures we don't see a=
n older
 - * value of pte_high.  *Then* we recheck pte_low, which ensures that we h=
aven't
 - * picked up a changed pte high. We might have gotten rubbish values from
 - * pte_low and pte_high, but we are guaranteed that pte_low will not have=
 the
 - * present bit set *unless* it is 'l'. Because get_user_pages_fast() only
 - * operates on present ptes we're safe.
 - */
 -static inline pte_t gup_get_pte(pte_t *ptep)
--{
- 	if (flags & FOLL_PIN) {
- 		mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED,
- 				    refs);
 -	pte_t pte;
--
- 		if (hpage_pincount_available(page))
- 			hpage_pincount_sub(page, refs);
- 		else
- 			refs *=3D GUP_PIN_COUNTING_BIAS;
- 	}
 -	do {
 -		pte.pte_low =3D ptep->pte_low;
 -		smp_rmb();
 -		pte.pte_high =3D ptep->pte_high;
 -		smp_rmb();
 -	} while (unlikely(pte.pte_low !=3D ptep->pte_low));
--
- 	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
- 	/*
- 	 * Calling put_page() for each ref is unnecessarily slow. Only the last
- 	 * ref needs a put_page().
- 	 */
- 	if (refs > 1)
- 		page_ref_sub(page, refs - 1);
- 	put_page(page);
 -	return pte;
 -}
 -#else /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 -/*
 - * We require that the PTE can be read atomically.
 - */
 -static inline pte_t gup_get_pte(pte_t *ptep)
 -{
 -	return ptep_get(ptep);
--}
 -#endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
--
  static void __maybe_unused undo_dev_pagemap(int *nr, int nr_start,
  					    unsigned int flags,
  					    struct page **pages)

--Sig_/NLq+hY2ZoOh+b_n74Y+jayo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/TNFYACgkQAVBC80lX
0GwnAwf/dBGr4K3UZhwxq2U5u3lmcyzbfZADcI24Q1rDqoirOKqAeBmWxX1hlTqo
SCOh3jguYoK1t7r7IYGg6ge+YKjx2B72tUaiqX6U+ISwYe1rZJ8nhGAiQYS6MzCA
YDLVeIVK8g7N4mTa1aP9YzPLtVCoWjS49/TGPdepn3uTdOk7u28TR7yKpLl9AoS3
ubz7IFdzrbSd+pnrXHAFmrJkkyV9BSqUoI9djSxN1BMzgYdIChI+F90D3QFG88U6
9ng1npxgSsFuzPFAvIU/YnkanyGgaHAqz/QHDj8Nx66NRQeQwnrXeBe8S0i/iiMf
XYNbd5gqrA+db2ssCEoYW0arduBB7w==
=EDHr
-----END PGP SIGNATURE-----

--Sig_/NLq+hY2ZoOh+b_n74Y+jayo--
