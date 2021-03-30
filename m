Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9034E0FB
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 08:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhC3GIH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 02:08:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhC3GHu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Mar 2021 02:07:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F8fBB2Hx5z9sRf;
        Tue, 30 Mar 2021 17:07:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617084466;
        bh=wOcm43wvpKvB7lQeuFsYELjj5hgqyx5KgKhpZBrADPs=;
        h=Date:From:To:Cc:Subject:From;
        b=Y67jd6Q7NnJ6WZjoIEw0DQLcEPM8pJP9mqH1QJn5Di6/iRxS3zW+7DW6OJ8chq4DS
         pLfpf5to1eO4vwzaE60kKFJ5QmZgLS87fS3F+PaqWZU5x092z1QfuQJV8Uxyu/R5nG
         VmryE9vnNI+B5mVEyc62H9jWVcssD4hilIrj3AwXYGcwNr9NxTiuH5EV+G508TLxmG
         6RSHJqwTYzmcsF1eR/YcEBfujT/z+Byc/Mymv2HnbvcK8uU/RWZSb5CeJu1cVaw69u
         4uaWH8UDcTLFj+6pMfEUuXYFiqb8pB+uIIuLpiYT7nyAeR3cveITiNvjVCcmRsWC45
         6768O/0BWAvtg==
Date:   Tue, 30 Mar 2021 17:07:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6Fu?= =?UTF-8?B?ZGV6?= Rojas 
        <noltari@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pinctrl tree
Message-ID: <20210330170744.6a1519b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dStSQin2puGgtqbE9Ri5XwI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dStSQin2puGgtqbE9Ri5XwI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
  503 |        (uint32_t) desc->drv_data, 0);
      |        ^

Introduced by commit

  705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")

--=20
Cheers,
Stephen Rothwell

--Sig_/dStSQin2puGgtqbE9Ri5XwI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBiwDAACgkQAVBC80lX
0Gzehwf8CnM80DuJHoVeH8YrRMPhPU6T//nY4eio+AFdf+/G6yURpWPSZBQjca7K
uFpVVMcEQwJau7FlNvNJOqQ+DtQFk1b6HmUyk88MjRCBcplcVD8C7u3kSKypILig
7tWn4izGLM+HqcEsF2gf3z1mMxx98gpFffJEniEufDmCSMmEPvb6Fs+P20kEwkkb
8NsDMZjyBizPdWvOHIRQvZm2jZ5fNej6qxykn/T22vpeKru+nAC91MUzVAfYdO4B
sCy6xCUKTdCeMIQfqRkfWH21LaZldmXXiWnQC/Tz9QX37yqjIMcptX06m8n9VbCh
Fyb0n1U97q2TCOYNFMD4XPavgY5HdQ==
=Fx26
-----END PGP SIGNATURE-----

--Sig_/dStSQin2puGgtqbE9Ri5XwI--
