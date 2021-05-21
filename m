Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBC138BD30
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 06:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238896AbhEUES6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 00:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238062AbhEUES5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 00:18:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8B1C061574;
        Thu, 20 May 2021 21:17:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmYGx511fz9sRK;
        Fri, 21 May 2021 14:17:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621570651;
        bh=dpPnY8Gd2VHW7NF/ujHUlfzp8fRXOyyt2N7y0oMimwk=;
        h=Date:From:To:Cc:Subject:From;
        b=coCPu9rSQzlXw/Y/KD6uSh6jLUSjb3OMmS9zVbO+2ZGf9dAcwObiS5u/JRUO2b6xT
         SjknpNBAXGqeF6MBEIJ0L8NLruldgcJuSWlOz7zfZuhNQCB1qLSlGvbQb7gbHIISlW
         +rkiUcntXMy8AECal/DIwy9GNDfICcC3qnJ2/MNh7v9oqukrtvg8RtfqGFwMyujG+O
         HD5K5OxSrCRTqjEbAX1qutGlcoVT1xkkQbT9bU0LAzSl0Rmi1HyTaNEt34h1LByBEo
         9ovmiBVNAQSHG/Wed3oryjxR9mfRiQpHLjmrWAd1uSd+4edqZuz2RmNaN8fJeDMm0o
         nsY8GJUF+8+kA==
Date:   Fri, 21 May 2021 14:17:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the pinctrl tree with the jc_docs tree
Message-ID: <20210521141728.6f5e3621@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ILC.JW1zqbgeVmk_dLIjm8_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ILC.JW1zqbgeVmk_dLIjm8_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  include/linux/pinctrl/pinconf-generic.h

between commit:

  4b0c9948a4c2 ("docs: update pin-control.rst references")

from the jc_docs tree and commit:

  57b55eeb7552 ("pinctrl: Keep enum pin_config_param ordered by name (part =
2)")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/pinctrl/pinconf-generic.h
index 5a96602a3316,98ed5959ca9a..000000000000
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@@ -81,6 -81,10 +81,10 @@@ struct pinctrl_map
   *	passed in the argument on a custom form, else just use argument 1
   *	to indicate low power mode, argument 0 turns low power mode off.
   * @PIN_CONFIG_MODE_PWM: this will configure the pin for PWM
+  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive=
 a
+  * 	value on the line. Use argument 1 to indicate high level, argument 0 =
to
 - *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
++ *	indicate low level. (Please see Documentation/driver-api/pin-control.r=
st,
+  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
   * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
   * 	without driving a value there. For most platforms this reduces to
   * 	enable the output buffers and then let the pin controller current

--Sig_/ILC.JW1zqbgeVmk_dLIjm8_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnNFgACgkQAVBC80lX
0GyumQf/XG0UzCwx/IDZCdvTjduy5hLiqBPYNu7GzAWgw8IBqkEoqNchJdLPCLaa
v+JuQiv0i90IXXFOwwMcdwMkivFBNt8jktBy9L8JGyuqYu6Pvs2WZ7zHO2AFaiRC
4ru1v7KMYeGsWr1guaVX2i2Hbk4DWuszFBSZ9P05ZtYam6ZXK8wtfawofoovl1wq
pb7e80RlG2QqXoaUdH4pJd4MM6Nk3a1AP4WM9yE2R7yYdP/AFN0KdxngBO8BwMAa
3CIg8QkzvQKBXy5mF4Ws3FAVtKJ2bLytMsG2UZOPKekpwif5BpRKx2ElFMNLPc7M
/7bWvXXP2uR8W4WhF/8FjIxhkBjV0Q==
=aMfU
-----END PGP SIGNATURE-----

--Sig_/ILC.JW1zqbgeVmk_dLIjm8_--
