Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310743EB120
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 09:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239256AbhHMHMH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 03:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239230AbhHMHMF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 03:12:05 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E95BC061756;
        Fri, 13 Aug 2021 00:11:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GmF934cbfz9sX5;
        Fri, 13 Aug 2021 17:11:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628838696;
        bh=rzdZtyoqNdlhNULIYYA8qf3YbQGCby2dBpv50fz3FAs=;
        h=Date:From:To:Cc:Subject:From;
        b=Qz3VeCn56YXyeY10Sd93/b62OFX5BHZ24j4CtYAkNciXittNMei6SNePrXVaYtgtq
         V7j9E7AiO4AXhmZyviU+rEDunH60Gyt6RkMxij6h/ALAXCxdbJXZabE8+fpzTu5Qk+
         C3B/WGsINrlKvHlJTmvBwqgEZ9sHb313/JewuNfSaVBlrOlYhOpCAv+4HYNqQyPj9+
         uPoxaNgvkp8sGRaRKiwkvaz04Jty50GjUaWSJu/GE3PW3x1aI+8M1nsdbYXGzKrcfO
         tTprj3A1HBNPz2+vOemTpLA5M8h2sqd0UMliC0/I61LQS1qq2ZnRjv/0OwNa43Ccsx
         +kno5GWCGwiNA==
Date:   Fri, 13 Aug 2021 17:11:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Logan Gunthorpe <logang@deltatee.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20210813171134.4ad7d640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YLaE55UFyg5G90ZRUkeQbju";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YLaE55UFyg5G90ZRUkeQbju
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (htmldocs)
produced this warning:

kernel/dma/mapping.c:224: warning: Function parameter or member 'nents' not=
 described in 'dma_map_sg_attrs'

Caused by commit

  fffe3cc8c219 ("dma-mapping: allow map_sg() ops to return negative error c=
odes")

--=20
Cheers,
Stephen Rothwell

--Sig_/YLaE55UFyg5G90ZRUkeQbju
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEWGyYACgkQAVBC80lX
0GzbhQf+N1Q+bUP0L6/3sLzhU+J7aozmnRLKKi0VWMLbJGMX/SehziiPgS5EncI+
vMva8GPc8T3aHNu/38ZptUXo9C8LDG4RuXrR6mDTdzNRm4yxlZKR/Ubr/Eh6kCh5
xqL9op1MHZCQqs/dDKkTJcQhLK63ohl2tAiMWoIIL8jF4wFyL+GfQUcPHNDxDJ6Q
PlElY5nEfz8ABnFfkp/G96MXbYDaYNeactYJUVLIAG7brF5ymC5/gg2EchLnG+7y
2WQMecb/GhZOQDxBuXtKX+9ZJTyPRlD8a2G1NbxoITT2GSkk0Usjh3HHruUVevkm
/MfGZGtqTiNQQIFXcoQeFy1s9RPuGQ==
=iJ5R
-----END PGP SIGNATURE-----

--Sig_/YLaE55UFyg5G90ZRUkeQbju--
