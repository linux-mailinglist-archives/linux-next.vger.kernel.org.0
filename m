Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE1A21E2C7
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 00:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgGMWD2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 18:03:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgGMWD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jul 2020 18:03:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5Hhs655Kz9sRK;
        Tue, 14 Jul 2020 08:03:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594677806;
        bh=khC3Ulq4B/pdeWOT3QSuaNdHiKYcUdRAfiJlivA0Srk=;
        h=Date:From:To:Cc:Subject:From;
        b=fEj5lMjQXaBBPs03l0knH9bVSZPuGD3OFS4sVlpyVr1ifunwSR0U7hGE2kAmAnPmY
         0vMCLPbf0Y/xJMm0mb+cXiItKaeyj8UHfAThe7Xa9LPEjps/JLgDLZCf3excQgbEyh
         R8/Ys19dRXKXafcg8xbjwCpuk32TJL3LGS+7dw32LXqX/NxuwqIZ6/k1U4HowfwmNN
         mHfTN/p32Dj5FHk+pOZ4fkbbL+ZaH2fJg+VrfKtvQPGIkaFChBVtgD06UE9uzLMvhL
         sqhlc6Xo9zUmB7OzSchFJ0A9KqCKmAhpj2nc6HU32B6cp5BIEGIO7yZX+fcW+T7kIM
         iGm/HR36loMZg==
Date:   Tue, 14 Jul 2020 08:03:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chen Tao <chentao107@huawei.com>,
        dillon min <dillon.minfei@gmail.com>
Subject: linux-next: Fixes tags need some work in the omap-fixes tree
Message-ID: <20200714080324.48bf88d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tge6YxF1z7mYn_Hp+p6ged2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tge6YxF1z7mYn_Hp+p6ged2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  35094c15d41e ("ARM: OMAP2+: Fix possible memory leak in omap_hwmod_alloca=
te_module")

Fixes tag

  Fixes: 8c87970543b17("ARM: OMAP2+: Add functions to allocate module data =
from device tree")

has these problem(s):

  - missing space between the SHA1 and the subject

In commit

  4b2f657f6178 ("ARM: dts: Configure osc clock for d_can on am437x")

Fixes tag

  Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during ini=
t to

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Also keep all
the commit message tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/tge6YxF1z7mYn_Hp+p6ged2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8M2iwACgkQAVBC80lX
0Gxf7Af/ZBEfVvBcVTZOJaen9RkfeWhQwA/ZEX10C5pRv5zD+qo0Mhe1HnPvkTJn
GtqlB7q9tThYCN3VmFuchWZfiyCt1B7n0CW90But/RJOIIetK1daeepZ1wZEl3DE
NNjfrW6kIRJOPzVz/dtpQzweWdOQLbX66Siy2t8Qj3EfD3ptbI9QzhUFlUG3z4rE
FpLUBj/bhnccveg9tJhBPv/CVI5yhFuXcfeL7q6AObcSZ1ouaaPm+hoVM7njk5Dk
6oSHexTLT+Ok1bSyV56YIyb712mwZPb5C5CJ0Sc17cKBHBL7FNO0xWnymDnRrceE
eo++Ow47plAo4npcPDpTCFPv5TI0Xg==
=poNd
-----END PGP SIGNATURE-----

--Sig_/tge6YxF1z7mYn_Hp+p6ged2--
