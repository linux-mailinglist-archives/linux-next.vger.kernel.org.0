Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B69A2CE709
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 05:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgLDEjt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 23:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgLDEjt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 23:39:49 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8688C061A4F;
        Thu,  3 Dec 2020 20:39:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnKjJ5W09z9sT5;
        Fri,  4 Dec 2020 15:38:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607056745;
        bh=cwwlSWp33dQVjrUUT+01eSL494j3J1JrJvMO0cm5HTE=;
        h=Date:From:To:Cc:Subject:From;
        b=WFNv+0f54T+BpT4XUIuppzCMFhDjF0GaOIO9OPKEbt4kbaCxj2xTTgaTDJ//RZTrJ
         6Zj5NgpI4geuE5/iv/lpdI8Wphz73UJla0VEY5exk/WWshJaJsvT1aRLPfPPt5cJD1
         bqNe5nK2wTfUu95k2SIG/aGG7CZa5WvwlEaza1UN05b+Nnjfkhkm4iZUXuLV/dEWRM
         79Vd4l+bs25PD0NyG3XOoKMGYnOvu8h6fj8xoBp0ChDl/D6VNK9fkwjw3HI2Aqsm0W
         rExefuQ9NVwxxwBi2Tl83wGjhHoumk3NVuvvAyOznIleqNgVrxAv04z3OiDBWrVlQP
         q/p90OA4Epnew==
Date:   Fri, 4 Dec 2020 15:38:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Borislav Petkov <bp@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Subject: linux-next: manual merge of the tip tree with the jc_docs tree
Message-ID: <20201204153855.13bafa83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7QUrO_ZLxf0f8t3kiAS=JBR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7QUrO_ZLxf0f8t3kiAS=JBR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/x86/index.rst

between commit:

  ed13a92d0fde ("docs: archis: add a per-architecture features list")

from the jc_docs tree and commit:

  3fa97bf00126 ("Documentation/x86: Document SGX kernel architecture")

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

diff --cc Documentation/x86/index.rst
index b4fcb6f258b2,e7eb84484ddc..000000000000
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@@ -33,4 -33,4 +33,5 @@@ x86-specific Documentatio
     i386/index
     x86_64/index
     sva
+    sgx
 +   features

--Sig_/7QUrO_ZLxf0f8t3kiAS=JBR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/JvV8ACgkQAVBC80lX
0GweyAf/ZO/yfvaDZE8Jm/jBpQi15R9E9tsq7PaOYE64kX9iNueAmVzNyoW7uTdc
4PB3XsPk0JD5ymZFSQzB0SXOEN4V3yhX9KoCwI5NCIVOozAgPPc34jEnOez8qglr
cqmGYEOZ6Tx9GriAktvnd5uI4O7s4cj/DhNBXMkBI7KwTuRKyc4+V09DdWQ8prwN
lEN/4v0/MSvOYNUxeur9lQLHJkYROJpFxhHSExxRWtnvjZe3bKnWTP8A2tUkks/f
Pn/KxPg3UDYnhCNk0P0O4YkXNHROXcycaoRFQ3JXx98cfHc0xdT86nUO9KZsnhnU
BSiRAT1W0OdYmtLKCBMWm+1gGm+kkQ==
=FQlv
-----END PGP SIGNATURE-----

--Sig_/7QUrO_ZLxf0f8t3kiAS=JBR--
