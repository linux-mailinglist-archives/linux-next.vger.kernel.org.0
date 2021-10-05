Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3470422004
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 09:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhJEIBj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 04:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhJEIBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 04:01:38 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315DFC061745;
        Tue,  5 Oct 2021 00:59:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNqk73Tmdz4xbC;
        Tue,  5 Oct 2021 18:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633420785;
        bh=wfeXA7dMbbU3zv2UjIpe4e0tS5IB1hPNSHNMLRMmit0=;
        h=Date:From:To:Cc:Subject:From;
        b=uSvqMIZ9QTCXc/u82OEuuMkVqDfJreRQ0jmrC1bS2ankHyCq8l2sDdMuHU8WXr9/Q
         /iVY2/IFrCLunSKHnPjVSMLSl/lawhO78oS4l2HzRu9C0VJs0BZyoyFscVRgDKRw4B
         j1StM8W3TEQTj7J/DOHc/XfPJ2jtrS354VkKVAKdOSpMLBQxrmSq7L+FGHKPq2ZG6v
         3Vv/fuZ8Q0MWSRGrOu5YphBqQ5YdfDABUA2wSeAE59MVbd2JzNt0BgM1zBYwmkswrM
         XEHfxYEHkiW46Bu/RQLXQWIULy5nW/b3NGzwU2c6qeOLGGCO1LE5i2sjk9tH9AZnsw
         OiZIMiOyiF1Zg==
Date:   Tue, 5 Oct 2021 18:59:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211005185940.382720e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DzN9LhCaJE=kJIITRXpYg2U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DzN9LhCaJE=kJIITRXpYg2U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_in' =
not described in 'dma_buf'
include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_out'=
 not described in 'dma_buf'

Introduced by commit

  6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")

--=20
Cheers,
Stephen Rothwell

--Sig_/DzN9LhCaJE=kJIITRXpYg2U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcBewACgkQAVBC80lX
0Gz87Qf/ejwjqlHJAHNP2eNsQJh+/0/HggBItJofeqDAXd9uPH2oap2ZHo85ot2P
CIn/vLl4N290pS+YVWc+D8rnWiytgb+ASFjCBVaSnIIqzN2SIMvTOHfHtTvZuGTF
owhBNWD9TkdZwJqUemERiHB3J9aHoH5RyHqhMu+drFivhTAIn/YR7suHlTuw4ogU
m1G01RjLJkkEGx23S9uFV+Dz7/zt7gYe70Y7Q3/I5xj0Od5sm4JCz/sUJjMoOMpH
UnETNYkC5tzh4ojcQz9LnoXhPIzPRuB6R+jFBD3nzCqG7zjDbAWmSbMFY9RHYfVr
+ZsCqKnBkjVOFXdQFXAltDt3piqAGQ==
=13EE
-----END PGP SIGNATURE-----

--Sig_/DzN9LhCaJE=kJIITRXpYg2U--
