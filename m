Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8899418DE0
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 05:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhI0DMJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 23:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbhI0DMJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 23:12:09 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6897AC061570;
        Sun, 26 Sep 2021 20:10:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHnh51fFDz4xZx;
        Mon, 27 Sep 2021 13:10:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632712229;
        bh=h8rtu75to4NfxJjfxqNtLXqSKhwwbkwlH4NRoSzJTqU=;
        h=Date:From:To:Cc:Subject:From;
        b=rBc3QOv4+eJrQBcATWEoRblZgMcuJQAxxqtlN8Y0cW3bQSLKAmMTNC+pWllnbr4mE
         2O5nX2Ox05vvR+iQVSbDfLCNByUgQdZ3L/iK1Nx/tCv7PlIL/gKBANJfJANG+EZr0G
         4O3X4obb68rP4B/Ufr7YhkvNwJ/rlJ+H51bZZiiIUTUwj+cszfsLypnURdcizubBq0
         bNq7Jli33GxQVmfpV4d+afY2BY+fNzdhw3c1Bl7tjgVIV89L03ndbn3cPe5lGOJcmz
         JOrepUK2XSbsArU0J+3UA0WKq4uDs2mV//PakBwFuS0VfmC4m5ue8ew2BaK+xEUhXc
         WJsLfi8RrFlmg==
Date:   Mon, 27 Sep 2021 13:10:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Romain Perier <romain.perier@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rtc tree
Message-ID: <20210927131027.13113c97@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=H2XQVCft/=alhz.li_S68K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=H2XQVCft/=alhz.li_S68K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/rtc/rtc-msc313.c: In function 'msc313_rtc_read_alarm':
drivers/rtc/rtc-msc313.c:54:12: error: implicit declaration of function 're=
adw' [-Werror=3Dimplicit-function-declaration]
   54 |  seconds =3D readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
      |            ^~~~~
drivers/rtc/rtc-msc313.c: In function 'msc313_rtc_alarm_irq_enable':
drivers/rtc/rtc-msc313.c:75:2: error: implicit declaration of function 'wri=
tew' [-Werror=3Dimplicit-function-declaration]
   75 |  writew(reg, priv->rtc_base + REG_RTC_CTRL);
      |  ^~~~~~

Caused by commit

  be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")

I have used the rtc tree from next-20210924 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=H2XQVCft/=alhz.li_S68K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFRNiMACgkQAVBC80lX
0GzrfQf/chhBxjquC0qlcOWmdCMaq7SSflPcHltJ4xcZfdrLH+/y/ZQxX2wJIkri
zE0RSqh40Y721QCF7kVlKXPtZYywVUYEQYnaybyBSGKbsq0OQ6otBSWFiA+0bJab
XmOZi4IaRxLl5wseQ0AiCEDy7oHghpDqI+cTglYWCgKwT6G6HJvr5AMXQ7nL7ocf
eBDNkHkZLmD4g9+K2S48C8ZnknEo8JRj6YIRgF6vWcTcykCQ+EMfXkXTa+XwhQjw
uD84YjwV9k3atu8D9pD7Fg6PCr0hrDPLSvoY4coQHnNu5borMfzidpzDykRB+pOp
VUsxoorEdVLqG3K70N9VeWWcLHs/lQ==
=Dwgd
-----END PGP SIGNATURE-----

--Sig_/=H2XQVCft/=alhz.li_S68K--
