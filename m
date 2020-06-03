Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584BC1ECB05
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 10:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgFCIHe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 04:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCIHe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 04:07:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF49CC05BD43;
        Wed,  3 Jun 2020 01:07:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cM2q6KX2z9sSd;
        Wed,  3 Jun 2020 18:07:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591171652;
        bh=HxO3Wpm6XOrIJUNFfVubWTuMmRFb+J1z2Qh7xpR9dKQ=;
        h=Date:From:To:Cc:Subject:From;
        b=tDHCUgHC/QG3xTk5v5w67yAF5Z5CV6BpJKeFwBtXB6Y0JuRPRSPPmdqv2cZoPXV//
         jSSYptLw5I2OseSx5rfCWyAr7Wecq2G/SzQjxr3Ox3vzc/o/BGLwAq5a4jxbYraOdA
         AtJsNHrhKFVf/3CYBBzaxs4W2MsTocLQBX7Xr00UfJwA1qA7sQ306pKJSPKL4RBAa7
         1qWFmS15yYZ4b8KyG0kuAlKSOoYviyH9eTQAZ6p7LR+H8bIeP9vnGonZDvNyCFvXa5
         Yi1tTxW4PCKP+9tT3GNw5AS0QM9JyiwkXCnzcNtVkkIvJbdTQ44Cz0phXrW3T2E/Ce
         xD6KnhcO9kGBg==
Date:   Wed, 3 Jun 2020 18:07:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20200603180731.7df1082f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zfpFXzvyD7h_7PWNrU8fLh6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zfpFXzvyD7h_7PWNrU8fLh6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/gup.c

between commit:

  17839856fd58 ("gup: document and work around "COW can break either way" i=
ssue")

from Linus' tree and (at least) commits:

  d7f76db8e4ad ("mm/gup: move __get_user_pages_fast() down a few lines in g=
up.c")
  6a5f74c81019 ("mm/gup: refactor and de-duplicate gup_fast() code")

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
index 3edf740a3897,fb28e7aecd35..000000000000
--- a/mm/gup.c
+++ b/mm/gup.c
@@@ -2814,17 -2743,21 +2758,33 @@@ static int internal_get_user_pages_fast
  		return -EFAULT;
 =20
  	/*
+ 	 * Disable interrupts. The nested form is used, in order to allow full,
+ 	 * general purpose use of this routine.
+ 	 *
+ 	 * With interrupts disabled, we block page table pages from being
+ 	 * freed from under us. See struct mmu_table_batch comments in
+ 	 * include/asm-generic/tlb.h for more details.
+ 	 *
+ 	 * We do not adopt an rcu_read_lock(.) here as we also want to
+ 	 * block IPIs that come from THPs splitting.
++	 *
++	 * NOTE! We allow read-only gup_fast() here, but you'd better be
++	 * careful about possible COW pages. You'll get _a_ COW page, but
++	 * not necessarily the one you intended to get depending on what
++	 * COW event happens after this. COW may break the page copy in a
++	 * random direction.
++	 *
 +	 * The FAST_GUP case requires FOLL_WRITE even for pure reads,
 +	 * because get_user_pages() may need to cause an early COW in
 +	 * order to avoid confusing the normal COW routines. So only
 +	 * targets that are already writable are safe to do by just
 +	 * looking at the page tables.
  	 */
  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
  	    gup_fast_permitted(start, end)) {
- 		local_irq_disable();
+ 		local_irq_save(flags);
 -		gup_pgd_range(addr, end, gup_flags, pages, &nr_pinned);
 +		gup_pgd_range(addr, end, gup_flags | FOLL_WRITE, pages, &nr_pinned);
- 		local_irq_enable();
+ 		local_irq_restore(flags);
  		ret =3D nr_pinned;
  	}
 =20
@@@ -2848,6 -2781,46 +2808,50 @@@
  	return ret;
  }
 =20
+ /*
+  * Like get_user_pages_fast() except it's IRQ-safe in that it won't fall =
back to
+  * the regular GUP.
+  * Note a difference with get_user_pages_fast: this always returns the
+  * number of pages pinned, 0 if no pages were pinned.
+  *
+  * If the architecture does not support this function, simply return with=
 no
+  * pages pinned.
++ *
++ * Careful, careful! COW breaking can go either way, so a non-write
++ * access can get ambiguous page results. If you call this function witho=
ut
++ * 'write' set, you'd better be sure that you're ok with that ambiguity.
+  */
+ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
+ 			  struct page **pages)
+ {
+ 	int nr_pinned;
+ 	/*
+ 	 * Internally (within mm/gup.c), gup fast variants must set FOLL_GET,
+ 	 * because gup fast is always a "pin with a +1 page refcount" request.
+ 	 *
+ 	 * FOLL_FAST_ONLY is required in order to match the API description of
+ 	 * this routine: no fall back to regular ("slow") GUP.
+ 	 */
+ 	unsigned int gup_flags =3D FOLL_GET | FOLL_FAST_ONLY;
+=20
+ 	if (write)
+ 		gup_flags |=3D FOLL_WRITE;
+=20
+ 	nr_pinned =3D internal_get_user_pages_fast(start, nr_pages, gup_flags,
+ 						 pages);
+ 	/*
+ 	 * As specified in the API description above, this routine is not
+ 	 * allowed to return negative values. However, the common core
+ 	 * routine internal_get_user_pages_fast() *can* return -errno.
+ 	 * Therefore, correct for that here:
+ 	 */
+ 	if (nr_pinned < 0)
+ 		nr_pinned =3D 0;
+=20
+ 	return nr_pinned;
+ }
+ EXPORT_SYMBOL_GPL(__get_user_pages_fast);
+=20
  /**
   * get_user_pages_fast() - pin user pages in memory
   * @start:      starting user address

--Sig_/zfpFXzvyD7h_7PWNrU8fLh6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XWkMACgkQAVBC80lX
0GysxQf8D7LU7anSGf96oRUYwGDUTnqsHEyuZGkOKLw90AyK/mrOZLEz7K5ziK8f
l+QgHuzwKs7YmsoJ8TPr42uJvyE2LY3vIGeQeOFk4yuk6YG8QY2LkO//WGYPOk81
7MGiRYFIEHCuCmanwEAniLZOwqMWCWXRcGPXT/EuYTtf2aojgsP3B0GJ4xe6X0Tv
BTd2SbADqOADjDpXqVTdx0GnYdQPAm91Wmc9Xt0+OZtRFrGicBwVBqTeZyYcyum1
bhkdGIh6b4X77HtniCd/TskPujRjEjbbvOwZW5EFl08dT7ig+t/Z1oFdm8gtplJE
AQR3F/u0aKQ4bOE+s4yFoI/SoNdx1Q==
=GsVj
-----END PGP SIGNATURE-----

--Sig_/zfpFXzvyD7h_7PWNrU8fLh6--
