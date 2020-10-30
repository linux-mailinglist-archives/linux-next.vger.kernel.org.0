Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD4029FAC6
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 02:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgJ3BuY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 21:50:24 -0400
Received: from ozlabs.org ([203.11.71.1]:47561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgJ3BuX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 21:50:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMlcq2YWZz9sTR;
        Fri, 30 Oct 2020 12:50:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604022619;
        bh=9/i0rv9ZLGsFDVVuaKTfoc2P51VClvw0Z+tQAsiLhLM=;
        h=Date:From:To:Cc:Subject:From;
        b=m/Nl+BwHSu38fJcsVYXvtMNL1KVevqwJRdtcnG7X5UyuJwyo0rE4ZoMooen01F+vZ
         YDZkrxXCcSyAzNfntjiqaB4GbMXlfQDbNut8lu/KndBTHK48II4cM/PddZIkGY2ICE
         Fn7Yh2MtrqlPR01b06ZRXBuKCXwbFF8ln1VaXCOc11ytF7t8t3YkoNIhB608MthtdM
         8JB07k/Unc1wgcZM/rd7EV5xMZYk4JQRlDAZRxW4lwCIXdDdJrK2u1ILoiJSQ5WVNO
         7uN4nh9yba84q90abbcYqXKmEoWEwbjcW4StLkP9qmC9JwSYtn0vPZOvOVsTOTHswh
         9HhIAmF5xhxGg==
Date:   Fri, 30 Oct 2020 12:50:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20201030125016.3423d2fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bDW6QLZGF7o1o6ih4EpN+_R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bDW6QLZGF7o1o6ih4EpN+_R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "irq_gc_set_wake" [drivers/pinctrl/pinctrl-rockchip.ko] und=
efined!

Caused by commit

  6c684f5e79ea ("pinctrl: rockchip: make driver be tristate module")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bDW6QLZGF7o1o6ih4EpN+_R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+bcVgACgkQAVBC80lX
0GzC4gf/RCZiSfx3wR1RAM0zdBCwDN4HdfpakKVi94J27CRgQrOhAf3HXG+Bg1sp
m6oXkWKlifXBMJxiYpO3kG9N1lxm0WqcHGdQSQUnmERS+wYU7ZnJBYMYVtYEEZVm
cRuTF0rv83NgeL1wdViHOvwrcB0dmzKwfFO57Doy4zacduKPm7rBLO02P9rhd24I
J8hTIDH7aAr2uOPRe/fDlZJNFeTviurruvIPUWQXNisU7JFYrufW3sQbwvz1+Y/R
OmvbdH07x7V/jfhjr5NqnHVvnePIPt721U8sc+ry2Ri+7LT30LIJZfCvXLCSKz+6
Qfm8DfO7HfFBKpHllPpX2PQlJtxy6g==
=V76Z
-----END PGP SIGNATURE-----

--Sig_/bDW6QLZGF7o1o6ih4EpN+_R--
