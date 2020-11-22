Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DC82BC4E7
	for <lists+linux-next@lfdr.de>; Sun, 22 Nov 2020 11:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgKVKGd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 05:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgKVKGc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Nov 2020 05:06:32 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2865BC0613CF;
        Sun, 22 Nov 2020 02:06:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cf5Xc3zGmz9s1l;
        Sun, 22 Nov 2020 21:06:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606039590;
        bh=EapKncfwystsGtwiAGD7dMZIKfIxkKbL3fqM2h2qlFs=;
        h=Date:From:To:Cc:Subject:From;
        b=COe6+1TQSOH5lAlVQ79axdJpQPwYXPTj9Sif1RhySL/oFGwwr/wwFpHoQGAZrrAHm
         gtO0LG4+Ijz+P/BqA9UaBulcGlFYiTguwfF4kocxj0+BJjHT7QGGA2PV2TztPbUV8K
         FWUOXXiHCu9hTcl0i3QmaDctj85JQQcC92Q3RsjlZRGw9J4GUpSSEhtT6kb2GKPywt
         Vx9958xQlc3bzF0LjoD5B2dhain++hT8ilLnuYbGJg/y5KU5CzvV6VCc+hIDyLWzzh
         LMjEkO5IriTDZPYqI2wfT0T4uc/4N3qlhmr7WmbX3rwOrY72fcARfQznIU4g00ercx
         tdy0noxQJV5zA==
Date:   Sun, 22 Nov 2020 21:06:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     David Woodhouse <dwmw@amazon.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20201122210622.36495372@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pLFFYCEkauBJExFeAqD4_KR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pLFFYCEkauBJExFeAqD4_KR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d1adcfbb520c ("iommu/amd: Fix IOMMU interrupt generation in X2APIC mode")

Fixes tag

  Fixes: 47bea873cf80 "x86/msi: Only use high bits of MSI address for DMAR =
unit")

has these problem(s):

  - Subject has trailing but no trailing parenthesis.

--=20
Cheers,
Stephen Rothwell

--Sig_/pLFFYCEkauBJExFeAqD4_KR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+6OB4ACgkQAVBC80lX
0GxSFwgAjeB0uMjqwgAaM+p0YN/A44MrAWGBmjNdqj6nJgXbd3Nnbx0NBFqLrXuQ
QA9B9ExNVLxBr/vwI37Kc31WBoqZ4hZfOyMvorf6+rPSRu6Z7uyUXI/FN/bh/Y/8
Tt9oGvd6NwuSiIVg+W2W44SP/FoQJeMZegmZZ1ecADiy6V/O7vFDHDXfMLC8q4wB
8HtMiLkQHJwwPpyd1S2c3Ia/9nxJ4vvPEjORDseehvL/PuyqVTUv5LQBEgPZmEUF
k9+ensfik0trhffs9tFLXpgkIC6xLjH219rm/110dOKxAQhM4jw4Wc69mUFi8OHu
CQ1NGprNSah/5J3UCGCQmZjURCyB0g==
=hUH/
-----END PGP SIGNATURE-----

--Sig_/pLFFYCEkauBJExFeAqD4_KR--
