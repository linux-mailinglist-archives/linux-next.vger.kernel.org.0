Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A80C957D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 02:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfJCATR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Oct 2019 20:19:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729403AbfJCATR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Oct 2019 20:19:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kDC61mRlz9sP7;
        Thu,  3 Oct 2019 10:19:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570061954;
        bh=j0/8PDAz9u0mCIgmnUYn4sa6fAVrE3H3mjWMLrHDgmQ=;
        h=Date:From:To:Cc:Subject:From;
        b=QVW9Ca6u4i8N5H17DSouB++CdBy03SF22BZhYF2Ze8/YZnYZ7jDmL/dz4Zy0+kbjy
         dDaMvbhJAm33hZZ4MNXx69Va20HT/DpLTIKjtWEwUHkvv1sP0o1833XwlUYAjYxqCY
         rQMjPTBb+eSxOm2xeAxnEAOl/0SeF+O16i+U8KJvZb7ti+MAxGvl/hTp+lzyJzMUee
         R3ptB0AXRd/Bmr14ohZkoboWBPmlLl7qYKVWcrq6x6Y8VRi063ZWkIAxhwIWY8K/U0
         WjkHEhKIfOF6C5d0a6tkBLJojvoAadlG2Hhn01VGMtCZhv8iXqWrp4ydVjffWSNa5k
         U5JRiVTR+AxqA==
Date:   Thu, 3 Oct 2019 10:19:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Yong Zhao <Yong.Zhao@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191003101901.67efa929@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z4xOnbbIMfNja5oGok1Aohh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z4xOnbbIMfNja5oGok1Aohh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_priv.h

between commit:

  471f39020569 ("drm/amdkfd: use mmu_notifier_put")

from Linus' tree and commit:

  4b3cece1863c ("drm/amdkfd: Use hex print format for pasid")

from the amdgpu tree.

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
index c89326125d71,fc8b81208368..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@@ -687,7 -688,10 +688,7 @@@ struct kfd_process=20
  	/* We want to receive a notification when the mm_struct is destroyed */
  	struct mmu_notifier mmu_notifier;
 =20
- 	unsigned int pasid;
 -	/* Use for delayed freeing of kfd_process structure */
 -	struct rcu_head	rcu;
 -
+ 	uint16_t pasid;
  	unsigned int doorbell_index;
 =20
  	/*

--Sig_/Z4xOnbbIMfNja5oGok1Aohh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2VPnUACgkQAVBC80lX
0Gw1mwf/WjgCerrGOo0JXIahm9n+nUZ7Zwa8DHPNvuc3pK8XsGVADLei9vi7lyqy
r4U0S1RwUr6QoNq0rsW23JrxmSIcQTr1Mmf4SNdKj0Bqag8eGs3WEHJ33JdYWN9v
phmiCoMmd/kqwficHL6e8dA9IrH9LV2bCbb+3EkOuSYOCzpqCa1MlkDkNjT1mkQg
hVeduENK6dKXNz671rUnTZKkbBhKoDd9t9Bq+oxcrYhkXLDq3s/Ijg/iEtOarBxR
7Qr8I5tp8Bt4aysqbE4/4dl2iZL1BxT6zPbQ5FDU9U/IXd6n/6INbM6ncZLSpWwE
utxDJAJvL14ZWyQdn63LRp/qQPaqwg==
=ii+d
-----END PGP SIGNATURE-----

--Sig_/Z4xOnbbIMfNja5oGok1Aohh--
