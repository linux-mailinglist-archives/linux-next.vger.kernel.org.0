Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCA49CE90
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 13:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbfHZLuX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 07:50:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727182AbfHZLuX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 07:50:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46H9L347lPz9sBF;
        Mon, 26 Aug 2019 21:50:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566820219;
        bh=XUEOKU/hBQav3jF/6NZurRChk/w8HeLKvoeo2p6vqjo=;
        h=Date:From:To:Cc:Subject:From;
        b=VcVfNGOicxM42nSBlf1G7gBCMN2dZIoVqDFQY9Z6eBiKZ1+m1tRprpsN+rU2Gj+pa
         xH4wqkUPEIg6u1dFUSwKxd4oV05/YEtmnaHAST5r0npBW/oWn2K98AWDPs7qzt7pKw
         zytaXvZZ6x1qDkR3rg6pp6cfaaqsECFMF1MrbKPSyXxilJKSIyOQXvAGMgsoxmBQaK
         WjGcBHZ9TL7fJ53uEFbqbkotrkxQ87VHMdxT1E7Dg0hUNYxQSGYJUX3paVduq0d90m
         7r55kuWsrLiri0uWZF8AxfuWI5PijmWVPfxEuwhJVFIi1bGG39RRU9YEqHjIGnKYVE
         jde7vkSidr0xQ==
Date:   Mon, 26 Aug 2019 21:50:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: linux-next: build warning after merge of the devfreq tree
Message-ID: <20190826215017.02ab0d34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VHMmzf1GG0=K07MZvmWTM7j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VHMmzf1GG0=K07MZvmWTM7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devfreq tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/devfreq/governor_passive.c: In function 'devfreq_passive_event_hand=
ler':
drivers/devfreq/governor_passive.c:152:17: warning: unused variable 'dev' [=
-Wunused-variable]
  struct device *dev =3D devfreq->dev.parent;
                 ^~~

Introduced by commit

  0ef7c7cce43f ("PM / devfreq: passive: Use non-devm notifiers")

--=20
Cheers,
Stephen Rothwell

--Sig_/VHMmzf1GG0=K07MZvmWTM7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jx3kACgkQAVBC80lX
0GwudQf/WsOaPAzNPEHyh515RqrfXNAnDGq7Zy1jj/RgpogEZ6BSTBylpb2TTMT1
8TSxuWcgjApGqs18k4Takjau3UTGsw83rY7Ith8us/Dzoo5cZogxQZrPGtUXAXja
a3xZqREJeWAjIglz/fHtZ0Z999oXw4WGwzOXqa4pd80LQlAj1HAW+gI8PSL00bmi
eYH8Ukuogs6GnJSoX99LffuG+P9+JBJqBVU3fOfTL4CrS/Pa/4Dcyz07B+NslK1r
z1t/KALgUnfTXjDFrb7cWOpw1Hysoc4+p4E5lSwygPCIc01q6U4oKcOgg6QzZaWi
cMzOWYJwQd7KziDokSqKBiPRXKYqyA==
=WSqm
-----END PGP SIGNATURE-----

--Sig_/VHMmzf1GG0=K07MZvmWTM7j--
