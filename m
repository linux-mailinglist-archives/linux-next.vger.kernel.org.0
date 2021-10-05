Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04230423415
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 01:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbhJEXHC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 19:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236898AbhJEXHC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 19:07:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D00C061753;
        Tue,  5 Oct 2021 16:05:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPCpm55Mbz4xbP;
        Wed,  6 Oct 2021 10:05:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633475105;
        bh=ewpFWfW0q5hk3lR5Cu+DXpceMnTH8rPJHNPPIJHe+9A=;
        h=Date:From:To:Cc:Subject:From;
        b=Vzp51VBZ6rbSS5wzBgOJmJ059KySNak5U+HFJyf38s0WgUe+pABJC29TJQwLlIfKA
         ryrCibbzbh7yaJfTuQh+UVTGe7wItIciutNQ9VWHllU/HI0javMXYEjyJU2hBFmHtH
         BMW2J7xXTxuLdWLM4Na8smpD83Ev/NQxxVEo6Ls0/7E2aq1ka0gdQu8N+LD3JMaM77
         a3DTZ1aroDyX95Lu3DxQNnmNPc6hNrTL+uobsDysfMF9C4/G4e0eQqPn50+CoTWw69
         1HTupG8QRnCBqkGPVtgK0bRK07K0Pe7rMdWnUIIUmwYRhzaASDTNrVAWIx8UKgZhPU
         GcSSkysLCEv0A==
Date:   Wed, 6 Oct 2021 10:05:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fscache tree with Linus' tree
Message-ID: <20211006100502.78cff1c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pboin9D8r6p/42l+KYnA7u1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pboin9D8r6p/42l+KYnA7u1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fscache tree got conflicts in:

  fs/9p/cache.c
  fs/9p/vfs_addr.c

between commit:

  bc868036569e ("9p: Fix a bunch of kerneldoc warnings shown up by W=3D1")

from Linus' tree and commit:

  fcd4c99b70ce ("9p: Convert to using the netfs helper lib to do reads and =
caching")

from the fscache tree.

I fixed it up (I used the latter versions) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pboin9D8r6p/42l+KYnA7u1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFc2h4ACgkQAVBC80lX
0GyL5Af+P+N+oS2ZtWCkehFlh0wZtMJAls/gQHIjmEF9qbq06ImQJyMMEoQu1stI
Yt7uOEDSL1bdH4dNNJnZCmSOm3sHBU8RFiZ1PQ76OQMMZJJREg/tMhdOPfOloSF8
FlYVamkiv6OZ4FMZIlGq8CaKKzzhd9IaWVseEMSgwxarKooAuvXpl0fozyFWpCit
LCag08AhKwE4kQ16I+G2HXz6bze08kVA4hg/he7hxA/xL3j3xg4WNJ/vZn2WZJEb
T5rKlo6QC3Oz2UVeiR/QyRw5XiyhvJg1Fb6dYQPh6SI9zuR17UW0uv63MX7uuoII
6JtcKB694Q+04O+pJOeWqKJLe+tUcw==
=x3Qh
-----END PGP SIGNATURE-----

--Sig_/Pboin9D8r6p/42l+KYnA7u1--
