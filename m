Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D389F3E60
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 04:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfKHD1G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 22:27:06 -0500
Received: from ozlabs.org ([203.11.71.1]:48115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfKHD1G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 22:27:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478QgC2dbPz9sP3;
        Fri,  8 Nov 2019 14:27:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573183623;
        bh=L8hdrEO/Huj0NNEdUGCwZ1N0P5lIySi3cYQ2RznsqxM=;
        h=Date:From:To:Cc:Subject:From;
        b=sNGAbhpUt8NW9XFdADVLAZgshLKGV7a8WPjz4a59usGSRpAGW9HDxJQBT7B+ss/bw
         R8zr+qM12QRAP/5Igbdc1DdtSMOFjnMsuffl+Nk7z9963LArwoATS5lHypUb1MHVEY
         pdZzPdH8Ta4jDxr3y2wztyd/WIcW3MQW+dTID86CsHcjnKTUqXLE610kmOiR88ZpYp
         zUBoUEqCX6lZD//CZ+sXeT9/8jZ2QHbMKSTFBOdYi+d95zkcUr0afy9kv1mL86AYvP
         7pE8q85AKndBZV91PFI5y6ou6y8lB9XhKUTZ+NhzvVVABWeveVcp4B7BuakW5ZdeUp
         PlRdMmERYKT1Q==
Date:   Fri, 8 Nov 2019 14:27:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the gpio tree
Message-ID: <20191108142702.2e5ddcbb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2rv=tye26ORUMSS_.+MQj/e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2rv=tye26ORUMSS_.+MQj/e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got conflicts in:

  drivers/gpio/gpiolib.c
  include/uapi/linux/gpio.h

between commit:

  8c550e94b883 ("gpio: expose pull-up/pull-down line flags to userspace")

from the gpio tree and commit:

  6d8251b35add ("gpio: expose pull-up/pull-down line flags to userspace")

from the gpio-brgl tree.

I fixed it up (I just used the latter versions) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2rv=tye26ORUMSS_.+MQj/e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3E4IYACgkQAVBC80lX
0Gz6qwf/XcJlSZnD1nvsIWYKt3bYAcZPwJ5SHTpHxXCt3KRgGzhuFvrOFStz98fu
VB34wGTf5cPxiha99/ZLbc/mj6LB6LGboQdcTiG2GjIRWRqnAp/jDZHx3mJFO3XO
3Wi7DPbaDDHgfIkvoiQDZ2mcY1csL8/apWMiNSz0a9IaphBVuqV12+7A3bilMNFW
i12lVS4TXnmEflw5k2tzx0NKK0UU5WoLWBoF2/6HKs5UjSb2+2WdwfkUG2Xo2LIo
0sMgIu2KZxbOReZ8RluKAlCNlqPmE49AhYX7VEEO9o7/tLfh9+4IbnXr8WanSqg5
XrExPGDPWDt2s0djCIXYn3RgvUYnHA==
=TjAD
-----END PGP SIGNATURE-----

--Sig_/2rv=tye26ORUMSS_.+MQj/e--
