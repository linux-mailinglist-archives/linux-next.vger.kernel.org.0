Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C9120ACC0
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 09:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgFZHGI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 03:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgFZHGI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 03:06:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55494C08C5C1;
        Fri, 26 Jun 2020 00:06:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tSbJ0rP5z9sSc;
        Fri, 26 Jun 2020 17:06:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593155164;
        bh=eRDOwPExQiE2slh2fdRAHhUhk9gs5zzV6oKLmDMdRdg=;
        h=Date:From:To:Cc:Subject:From;
        b=IZ3gNXB4CeaA/8aRoZegg6KOPd/PsCM0MsmM1ckPpaPCR5sdhqFP7s4U1+AI/ZKLH
         qtdmizC+Zg7loM2TV2iJTX8gepTObKXWdAeKrh/hRhuvzOFHFcaJBHhahc4JifwW3J
         Lvm2HzE36qfzzeWAE/MAROXGu5X+zQTLuB3hgixH3rQRh0MklRva5HU3h0zeMMhmvr
         7fYE27BbVjVt/sJTTDXChOVgO9joNO3tgw7N/17NxNplCJ2ts3qaZfP7ENupuCgVuV
         BvZpXqRAZ0T+sJNqCJpIkBe8ED/5TwFI6uKmSkn5P0VHeLKplOn+HUomgjllpnWRv8
         9t/5H0+NdrIQg==
Date:   Fri, 26 Jun 2020 17:06:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200626170514.13f9cd5a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bVNEA5XtAs6VDNnUJdj/xDe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bVNEA5XtAs6VDNnUJdj/xDe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

mm/slab.c: In function '___cache_free':
mm/slab.c:3471:2: error: implicit declaration of function '__free_one'; did=
 you mean '__free_page'? [-Werror=3Dimplicit-function-declaration]
  __free_one(ac, objp);
  ^~~~~~~~~~
  __free_page


Caused by commit

  1420b22124be ("mm/slab: add naive detection of double free")

__free_one() is ony defined when CONFIG_NUMA is set but used more
generally.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bVNEA5XtAs6VDNnUJdj/xDe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl71nlsACgkQAVBC80lX
0GxzkQgAksmAJGvNuBYIYn3oGomOnfix01nchVS0LWO6gRLjT7Lsnfj1K6GN8KBS
xRObMOiCIaZqGFgsDW79PpXy5n4XaIySjtc3shwhe3DLEsGCPdQruBJfeVC/sV5y
pcm2UTlJ+cxn4vfhlzik4yE2pIgUzG5bLmYNAiV1SkoC5seLZqLw1+2Iiqz/WRKr
o2F5aThEiSGK72qn4Hc60VyYGNJMsUfmgDsRibZsf1KabnoBUw5fyT+unZb+qFaT
QlA99EXr1zbsaXubZSnek/kcbFex8opH3v/M8MSqR0gFWb0AczKPL4FOo0l7uR97
kshfUN1WrFd/j2YN6sGF1xezRwRjmA==
=iWgp
-----END PGP SIGNATURE-----

--Sig_/bVNEA5XtAs6VDNnUJdj/xDe--
