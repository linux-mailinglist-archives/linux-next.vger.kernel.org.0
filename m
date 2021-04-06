Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA53D355DFD
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 23:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237726AbhDFVfU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 17:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhDFVfU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 17:35:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C48C06174A;
        Tue,  6 Apr 2021 14:35:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFLQx2xL3z9sRR;
        Wed,  7 Apr 2021 07:35:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617744906;
        bh=D5FUnZGLBFWs8c1n7JY8+Rn8VtoPmFFQRtrn0yIw3X4=;
        h=Date:From:To:Cc:Subject:From;
        b=ean501GsBLULVXqzUeuofVTJM4ZqUGx/2YVnI7NOWlI/Ttg9+N6EuDQ8iw4y7FB0n
         4ZpbjY7pVv1k1vIVjzSmWulcBb4Vp535rVJvF5vn/RpLwcNW/OkMAFyGvfEPCq0wzg
         VWfnRUB3e/3X8/zSHqNafKts6HUHOZRsG8JTqGOdLFLKgkH2VTKOiNqdz8dlzh1WQS
         eQEVSBvBOPx2pV02ZFy4nmbkSC1hjyowDKTvkPXazp2W+LpsTyAdnzhnFVlDp4QEMR
         syyK3pjF+p8DDxXpvGkjwvNN9QCkXpq1l0+HL67C8Vkf1mbfMguLOpfaiwCHrP8yop
         i/fxMAv+DvJPQ==
Date:   Wed, 7 Apr 2021 07:35:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Luca Fancellu <luca.fancellu@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xen-tip tree
Message-ID: <20210407073504.0758735d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sKlmEgpapb9bvM.80.P8UpD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sKlmEgpapb9bvM.80.P8UpD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  da3b45cbcb0f ("xen/evtchn: Change irq_info lock to raw_spinlock_t")

Fixes tag

  Fixes: 25da4618af24 ("xen/events: don't unmask an event channel

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Also, please
keep all the commit message tags together at the end of te commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/sKlmEgpapb9bvM.80.P8UpD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBs1AgACgkQAVBC80lX
0GyBmgf/XgdY3XYRU5C8z7NlQ5NqwiWO6GWz0CEJEXq6hKOSx2im8VwNBFENnLmr
JafHjaO7gjzjidJL+xfxk3FEmhwWImucojt1xk9bcxztEAiSILLlhGuUwNRKdYoO
ZmJmZ+IDVetgNCLwPb+0c5iaKOQO3bMP3aVdfoarwCarlstpAtDXW29cQ3gELty9
Tw9XhAqstjNTKrrIZIQrAERflgbbrubFgOG2RBxm2G8Oe6BAA4hPgyvfz6mwQTEi
bsFvM3irQ8yA3qkK302NYlXuVD/ELqiKCgFsgYJI8I2aQAdjziBoJMK+c53xHTDe
MP4IsxHkQ9voU5ogUU3pf58UEYXozw==
=VnhB
-----END PGP SIGNATURE-----

--Sig_/sKlmEgpapb9bvM.80.P8UpD--
