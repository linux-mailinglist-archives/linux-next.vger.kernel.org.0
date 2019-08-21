Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9AC9721B
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 08:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfHUGQX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 02:16:23 -0400
Received: from ozlabs.org ([203.11.71.1]:33021 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbfHUGQX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 02:16:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Cy9057lqz9sDQ;
        Wed, 21 Aug 2019 16:16:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566368180;
        bh=C3JS9eWylw/jDZ7Js+18vZRRj+dDN5bTMZWNqK8bTzY=;
        h=Date:From:To:Cc:Subject:From;
        b=RtYQqKzpyo9C7ODEBV6Szw3s6PzkQSDxdOFgTvo93e/lKCFj8Soj9ctkrseYy96TW
         aeV7RPrNZp9VH6OZ0x1Hv9wzpOSXzUwyxkeMsSYn0fQYMCy3vhhxhX+sNbXsXb9l1S
         OgEygSqVky5F9KLUvUHU81+UggzUckyDArVd4SRHdFki1fz+E4YPcI+SEI9FtEhuj1
         IeXX4aFXXaLGUmu0dPhWfsJjuANjVeMlwmZzKu7pu1QWTMPYNM4lYffxHEJXzctQo1
         oTxh9dGH9+ool3lETzWikxMAkO7mipz5ubsQVjpBdI8jcLykip7JKpuOQUMM+6NLhM
         zHYtlKPVxEfcQ==
Date:   Wed, 21 Aug 2019 16:16:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20190821161620.403f663c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jB.TcCN=qHuU2IAp8DFPR0_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jB.TcCN=qHuU2IAp8DFPR0_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/pinctrl-st.c: In function 'st_pctl_dt_parse_groups':
drivers/pinctrl/pinctrl-st.c:1212:15: error: implicit declaration of functi=
on 'of_get_named_gpio'; did you mean 'of_get_address'? [-Werror=3Dimplicit-=
function-declaration]
   conf->pin =3D of_get_named_gpio(pins, pp->name, 0);
               ^~~~~~~~~~~~~~~~~
               of_get_address

Probably caused by commit

  712dfdaf62b6 ("pinctrl: st: Include the right header")

I have used the pinctrl tree from next-20190820 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jB.TcCN=qHuU2IAp8DFPR0_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1c4bQACgkQAVBC80lX
0Gz83Qf9FVaZ4yjDC89TBP5bTni3Ml3fr1UUPjKf4cbrD8MPBMDEeDx4bhhNf0qf
TaaTbsLoq2dBZqVltVEtvkoun9D2sGxn+K8DA3bmwtgEzgAnyIjLLBpDcpTHlcNX
cRuoLsE878127e5Ie66QxfvUqBX8lIK5KiMrN53aTe1/OoQqqXK0RwAzoG2hb+GQ
k9murRf4c3gLUeK5q69/AAdDIQOMeQj+lDNCOQ6Teet0CNDg44FoiSRfQs3pmOj2
pXXM5nUPvkeiW6CtNhbeDPLZL7bAQkZWhOFyxLYvBch3LFXS0Xmu2Nn8FplHaXRE
MWP5ipV62DymQcxY9rgv2O0RPLZbTw==
=GF+G
-----END PGP SIGNATURE-----

--Sig_/jB.TcCN=qHuU2IAp8DFPR0_--
