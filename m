Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5919934393E
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 07:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCVGM5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 02:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCVGMt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2021 02:12:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83705C061574;
        Sun, 21 Mar 2021 23:12:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3kgd5tlWz9sVS;
        Mon, 22 Mar 2021 17:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616393567;
        bh=REYkJNPpHqpteGYqPaFEfJgeie46JBbxa/DAKsGquyE=;
        h=Date:From:To:Cc:Subject:From;
        b=dtaxoGoaB1QB/LHSxPzd22Dre8W3tLHw0V0EY5m5zqge+3hHmaC3Q5JzWEVNc398x
         xkhXPGn4I3H7XA3lzwgsKNgdJPdIPbb2d/LGlFyDXm3lMEpUIc2fjKl5c70PsikQAe
         OrG8CHRYk4O4D2wVpta/wQdLpH9FQ7UjCLF8PdRDQ1q4UTFGhYo0/omzBbA3WYHqBY
         n/ERtT1w7xCk0ITt3kYeb0AlbUUtqM7XFoDhyrkHxB3e9t8hvmZGBAEnDpIJHyOZ71
         e2J2Q0sftBFQEm0zye3G2Z4j8rwuSQ7wfXAj2qbf3D8ECfkMETmDYkSJ2o4dzM0rXJ
         Nuk1AFz8hObOA==
Date:   Mon, 22 Mar 2021 17:12:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20210322171245.2441ab01@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W4YoKWSNc_Kta9xqphzp2vy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W4YoKWSNc_Kta9xqphzp2vy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/mm/init_64.c

between commit:

  d9f6e12fb0b7 ("x86: Fix various typos in comments")

from the tip tree and commit:

  68f7bf6e7e98 ("x86/vmemmap: drop handling of 4K unaligned vmemmap range")

from the akpm-current tree.

I fixed it up (the latter removed the comments fixed up by the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/W4YoKWSNc_Kta9xqphzp2vy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBYNV0ACgkQAVBC80lX
0Gz4VQf/QkPoAg8Ux0q4L5rT3m6NrtwhVhMEk5LnyNDfmpOE3CSsPkG5doN0fNGB
9tYx0NQ+N/89j6gEvHgjTX6ozbUX2+ZOkrKaQBKho9VbY87C4QdvuMTl6pWT68IQ
85yKcnYu41Ylkh8Pzb+Djd39P0rgFXDCB4ZPMGlWNCjxd0LJy2H+FWA1BvXL5BWw
lrHYmB72MKhcptUAWyJIfgYl7mIx8IGaAdSqgvB8PPOzb5CAlh3YukPz4LZjoXuQ
g3jkfXLi3aY1T8A/6h8e0StMSeH2Y2n13J4yj6YWGE1iQb/Y4n6YZotyoCDq//68
Br6lJauy7kVJEJZzEh6UC2J0wrO/xQ==
=D/NM
-----END PGP SIGNATURE-----

--Sig_/W4YoKWSNc_Kta9xqphzp2vy--
