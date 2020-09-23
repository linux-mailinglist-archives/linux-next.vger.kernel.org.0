Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD438275031
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 07:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIWFNq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 01:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgIWFNq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 01:13:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FE7C061755;
        Tue, 22 Sep 2020 22:13:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bx5tW2xn6z9sSn;
        Wed, 23 Sep 2020 15:13:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600838022;
        bh=nJlbpMzEQF4xf7OqJ7aJ4/0mJPbl37gN6YXTPWnzUPA=;
        h=Date:From:To:Cc:Subject:From;
        b=Nx5VNkbFAG9Vwdj9F1d8lptV9Avi3FfIWlOG+w4V+wa+AGEABwd6V0ZAu9GRcMa5Q
         hzpi9z2iZzYf6zaTRMPITi2WICU1Ke77KfiLrsDcQVRb3mH7nE05RrbPE91ubZ2fxQ
         byc12GGs9YU8KbcGmafG9AoJJbRXuo+4E7O4xZk8fnr4K8XaAGx/bKw12VWLVasAfp
         FT63QynCckr/US75ZkP+PqTQ3ucwH0R3UmT2E0J+8jZz6Wr4xqN4Q8IIJhXZMHY4+6
         dJqmrxUaMtC21lxEfmJInJOCWgH8NOYr0TIX7Z7ENv4+3HakhEFrgfp/i83StgWtpP
         8b1NrvO5wujOQ==
Date:   Wed, 23 Sep 2020 15:13:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Mukul Joshi <mukul.joshi@amd.com>, Borislav Petkov <bp@suse.de>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the amdgpu tree
Message-ID: <20200923151336.1664ad72@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/moEZf_plPNC2PYvhNyfr4rM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/moEZf_plPNC2PYvhNyfr4rM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_priv.h

between commit:

  59d7115dae02 ("drm/amdkfd: Move process doorbell allocation into kfd devi=
ce")

from the amdgpu tree and commit:

  c7b6bac9c72c ("drm, iommu: Change type of pasid to u32")

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

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 739db04080d0,922ae138ab85..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@@ -739,7 -723,8 +739,7 @@@ struct kfd_process=20
  	/* We want to receive a notification when the mm_struct is destroyed */
  	struct mmu_notifier mmu_notifier;
 =20
- 	uint16_t pasid;
+ 	u32 pasid;
 -	unsigned int doorbell_index;
 =20
  	/*
  	 * List of kfd_process_device structures,

--Sig_/moEZf_plPNC2PYvhNyfr4rM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9q2YAACgkQAVBC80lX
0GwoDAgAnvKhZVCL8HwtYXvZSsE3BhOCHSjGq74qOoKTx0V1oqgdhtHs726o/e/Q
XvqBAIv09sWITdL99FpFZw/j8V2Wsqcvvua7RN38pkGMpyDOXYiYRkei/Gn1mOUE
ZokQkYrZ0vDAlMmV+wWXgsddwbLhDCLKw/V156i5qTgzR/YUZbSJDBcJv+oAnGGe
IKfZhogZ8B2k0oYAlxHJOc3ZXWaezYfNfW0F/hcW0X2J1cH4xrGam34GXkLcpkU+
njYDsrF4EHRoCQ1aUhFoqhwpqowM7HCmIX86mVO4D8hZVU7Hhl/WH6ffTqpS0dsQ
xxrxi2oY6NFQiXmlp4QqNRLnK3E/Eg==
=E7U6
-----END PGP SIGNATURE-----

--Sig_/moEZf_plPNC2PYvhNyfr4rM--
