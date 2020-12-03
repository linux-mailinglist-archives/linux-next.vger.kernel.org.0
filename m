Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B2B2CE08A
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 22:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgLCVV6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 16:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgLCVV6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 16:21:58 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665F8C061A4F;
        Thu,  3 Dec 2020 13:21:17 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cn8092Nqjz9sSf;
        Fri,  4 Dec 2020 08:21:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607030475;
        bh=dguwPFAt+30slOyZA3WdXY1c2DjDJsWu/QmwC3Yo+h0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MKA70ro8DMlYplEq489YCWNPZlvHqZ6T6xujFRFuwjLhhAr6o9l4sYzERaS3NtE/I
         bU3ZgbIv3ETXxjTpy34hw+f/h3OjBUNt4oIBA5wHEnIVMk9men2D0mfoCEWeMrQhlN
         VNbkhTXZEKF2Y6mUJ9sOb3heLVOQP4Imcdi698OUE0vsAgp8hk3DXuKzigd/stfoTI
         Qv16JXwz1D+Bhr7M45Yh9prap092OtZ7noUOCvkuHCJMkPEQISWk8gWP56Zp8VBttH
         tiSMKw4Is32YTuCTiN1eq1ga5GafFfcOj7XqC2y2U683K5HYIVGI2haEgq9VoRVnq1
         ymCeccAvehVyA==
Date:   Fri, 4 Dec 2020 08:21:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vjitta@codeaurora.org, Minchan Kim <minchan@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ylal@codeaurora.org,
        vinmenon@codeaurora.org, kasan-dev <kasan-dev@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <qcai@redhat.com>
Subject: Re: [PATCH v2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
Message-ID: <20201204082112.331df654@canb.auug.org.au>
In-Reply-To: <20201203123253.c00767545ad35c09dabd44ef@linux-foundation.org>
References: <1606365835-3242-1-git-send-email-vjitta@codeaurora.org>
        <7733019eb8c506eee8d29e380aae683a8972fd19.camel@redhat.com>
        <CAAeHK+w_avr_X2OJ5dm6p6nXQZMvcaAiLCQaF+EWna+7nQxVhg@mail.gmail.com>
        <ff00097b-e547-185d-2a1a-ce0194629659@arm.com>
        <55b7ba6e-6282-2cf6-c42c-272bdd23a607@arm.com>
        <20201203123253.c00767545ad35c09dabd44ef@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//jXIelCd6/S1dNu7qWlVKto";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//jXIelCd6/S1dNu7qWlVKto
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 3 Dec 2020 12:32:53 -0800 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> Thanks, all.  I'll drop
> lib-stackdepot-add-support-to-configure-stack_hash_size.patch.

I have removed that from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_//jXIelCd6/S1dNu7qWlVKto
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/JVsgACgkQAVBC80lX
0Gw1hgf9GxZkiaL2ZpuXpM7GTSfCax9pLRKqdOp4MNPSb2Q5C6Rl4JmD2/1kYl5l
THZNCqEdiLZ7SUyxy/9RykfnqjrILfkMcbbjM/mJPce3xJpBqFaWDMgtDjeCI1gI
Um/aOqwuG0bFAhcCFt7ZvMaI8Tl6P9pY/nP6N38TVt6qLnn4yqzdyyuxvetJ5nOH
Mni3HX2dBZoYkeyNuayI2Z0ayya5pNQlL2f94bjQaIQ3Lb8AHr7Jv5PHgsEPHz7O
T+EZaqDajaAyLyN65YCCkSN8zVvsKE60Qt2yeb7V9wbjM9cYy9HD5DsiAH3DbZLZ
1kg4KWdYbTMRT2yJcudcrpaTXdPnvA==
=P5DX
-----END PGP SIGNATURE-----

--Sig_//jXIelCd6/S1dNu7qWlVKto--
