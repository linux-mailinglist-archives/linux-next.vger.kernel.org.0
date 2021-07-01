Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBBB3B8B71
	for <lists+linux-next@lfdr.de>; Thu,  1 Jul 2021 02:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbhGAAyj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Jun 2021 20:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbhGAAyj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2021 20:54:39 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02F8C061756;
        Wed, 30 Jun 2021 17:52:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GFfn06TsLz9sWX;
        Thu,  1 Jul 2021 10:52:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625100726;
        bh=vBawSk9xFZNGIsWWYfV1txmbn3bh40tDg1X6Pjsy0j0=;
        h=Date:From:To:Cc:Subject:From;
        b=CMYnOv8oHQl/wUFiGoCpPeS1egCVvcVGdvtkLNcXiBuxIduLX8ebacxwiSljTZpGc
         ItykRWSAbBhtEOqUp9HcnHf/xDJJ23x2DUizKxhCXQeX9qt4y2mBgqUaVDPWt7NtQY
         ED3tbtJVstx0zLi9qOg9iS0O5O/0L8TKh4+T8IqCjp5IqIAUJuMd62xjP8AIUXkV/E
         BCKfYUAJzFCa9QN5qYAzva0cwGLJ1qhwGKUwjUZGGTG2mABgjEXf1u8mIAtllzFscp
         XGD0w3DUPEIcV6czTNoUqonD7oKyTI5YwpxJAuFpAwdF9o81sfX8xS0bZDKbnjnAFo
         Z2NrK2B9bEMhQ==
Date:   Thu, 1 Jul 2021 10:52:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Liam Howlett <liam.howlett@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Philip Yang <Philip.Yang@amd.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210701105202.7b196b68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X3p=+W8Q0B6UxxE/7MsD1pv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X3p=+W8Q0B6UxxE/7MsD1pv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  da68547d3692 ("drm/amdgpu: use vma_lookup() in amdgpu_ttm_tt_get_user_pag=
es()")

from Linus' tree and commit:

  04d8d73dbcbe ("drm/amdgpu: add common HMM get pages function")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 61c4fb1b87fe,6a214a4dfe04..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -689,30 -680,12 +680,12 @@@ int amdgpu_ttm_tt_get_user_pages(struc
  	if (!mmget_not_zero(mm)) /* Happens during process shutdown */
  		return -ESRCH;
 =20
- 	range =3D kzalloc(sizeof(*range), GFP_KERNEL);
- 	if (unlikely(!range)) {
- 		r =3D -ENOMEM;
- 		goto out;
- 	}
- 	range->notifier =3D &bo->notifier;
- 	range->start =3D bo->notifier.interval_tree.start;
- 	range->end =3D bo->notifier.interval_tree.last + 1;
- 	range->default_flags =3D HMM_PFN_REQ_FAULT;
- 	if (!amdgpu_ttm_tt_is_readonly(ttm))
- 		range->default_flags |=3D HMM_PFN_REQ_WRITE;
-=20
- 	range->hmm_pfns =3D kvmalloc_array(ttm->num_pages,
- 					 sizeof(*range->hmm_pfns), GFP_KERNEL);
- 	if (unlikely(!range->hmm_pfns)) {
- 		r =3D -ENOMEM;
- 		goto out_free_ranges;
- 	}
-=20
  	mmap_read_lock(mm);
 -	vma =3D find_vma(mm, start);
 +	vma =3D vma_lookup(mm, start);
+ 	mmap_read_unlock(mm);
 -	if (unlikely(!vma || start < vma->vm_start)) {
 +	if (unlikely(!vma)) {
  		r =3D -EFAULT;
- 		goto out_unlock;
+ 		goto out_putmm;
  	}
  	if (unlikely((gtt->userflags & AMDGPU_GEM_USERPTR_ANONONLY) &&
  		vma->vm_file)) {

--Sig_/X3p=+W8Q0B6UxxE/7MsD1pv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDdEbIACgkQAVBC80lX
0GxSvwf+IL2PYbMAiuZK6d1MjKyh9F+xFQ2Ktr8v/y4AAZs9wjeLSJGGFtufdnQw
Q0IinnFZqbyM9W/USX6A/SEoP6HYEjw1jd73GD8RIwyldQnDt33yXX0q2SNu3o6M
inX/7WV3/EmPeSWPBbjepn52jO7yYDKncDmRRP+paeJHYQ3b9Z7a9o7yk1jOg/E1
R/okvAH6oVviPAupXrB0IpY3nAz2mvNsONNxl7/sjJu9ZhVLP2GFbHe7sZolD0NK
AeS3FZK3T8ij6UqiY3tAV7Uh2TgyL3N+4uBiKItwg4ThyQ0wd9OltvUNkoz1Fm6C
ajhoS0Narr2HMT49L4+jQY1kYA2OYg==
=Grkw
-----END PGP SIGNATURE-----

--Sig_/X3p=+W8Q0B6UxxE/7MsD1pv--
