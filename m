Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E851F6F69
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 23:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgFKVXX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 17:23:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54769 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgFKVXX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Jun 2020 17:23:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jcKN5CMWz9sRk;
        Fri, 12 Jun 2020 07:23:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591910601;
        bh=aWf0uANpk6UOZioggviF2j1oIxUaXFjd9CLqFfhekYY=;
        h=Date:From:To:Cc:Subject:From;
        b=J/SaCcgPE1bPn1J1iyLmOFeQWm5Y11GVdy7BmnAzsitv4yAxxTVGYbif66EcUl36P
         rLYp+XaysrG9uKmdol+NaO32yweC8BkSzo/4bqGQNK90WcwN7eg2CzIR56V/1cNjLl
         QQiHUk3Nyp57WwWRDBdx1oIgWkeu/sbxvwm5UBgOBSkC6UmU7oJTElBRg15O12FQIU
         XMbNNG5OU5moy0ea+LTgC0EQuqsDYQjKFeYlSzIeTytqNWeR557hbLNnrUSxAM3tHD
         0SpCyP3Pl5r+fuTY0SUYZxcIGTcFdGDw2EirZQbBXMdh36xDHG6SJ/BCjOCIVr6P5c
         pTmw04MgHyvZw==
Date:   Fri, 12 Jun 2020 07:23:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200612072319.3529b091@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F93MZ/ORpm1bdjUKueshNUL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F93MZ/ORpm1bdjUKueshNUL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  02e1254d7740 ("pinctrl: qcom: ipq6018 Add missing pins in qpic pin group")

Fixes tag

  Fixes: ef1ea54 (pinctrl: qcom: Add ipq6018 pinctrl driver)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/F93MZ/ORpm1bdjUKueshNUL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ioMcACgkQAVBC80lX
0GyiYwf8CKhzYFXy4Tsz45wJ0yGBdoY4ETJlth6IzZolaH4kw9le5FTVdyZHXWAA
a8yru7u4GlylxUlBHq4lSqJAF5RxSvcBmKu9QYcrCF4atcSba4k9cQF3Bycnuz5x
VgaBJt5iZG/M9u9wrnjTnEaqtOPnnLkRYqCTCkicNXsSqoHAXPzFL2btWrIukXY5
Ch+Vcq9AKW39E1BS2aE2rdFauKqyOQaXHmxXY+4ZV3t39BYU9dfflVb3wktxTFDq
70+dcmDARch67ScPz1GHfqpg7xRtGvNQAME2GgZr1Yi/Cu6AjQXeTgRklNYp2dlw
Qa1vpZ8QPfHCMW9XOHQF4iV/hfDpag==
=kZTK
-----END PGP SIGNATURE-----

--Sig_/F93MZ/ORpm1bdjUKueshNUL--
