Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73CE2D8C9D
	for <lists+linux-next@lfdr.de>; Sun, 13 Dec 2020 11:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgLMKPi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 05:15:38 -0500
Received: from ozlabs.org ([203.11.71.1]:34391 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393178AbgLMKPi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Dec 2020 05:15:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cv0kg1MPzz9sTL;
        Sun, 13 Dec 2020 21:14:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607854491;
        bh=gfNx/8oKIbz/C8FQ//ILHIvDXNvgBsaZCk5dClnU0R4=;
        h=Date:From:To:Cc:Subject:From;
        b=T7/chqnifO5ws5QKYw8/tPWewFyzSpy4rEIgE4WM8MsuzufmvPFBjdZltOVQK75V4
         GlQ06zFdVGZZOmzbw5jrlbPxxYZp/439hVk2QH7TWSEH/zHI1X+P0p9memhctAHxbd
         AtQnDOV9XtEXiLApdaw3bRnWerZdWhcckkawuXPIj+uhyT8fgdKqFLNL+hnAIdaO78
         0LOGN1AERYx8HLflkKxgh84fbsw5HS4qJk/D0Xi06gPj1WVUGY+XPVpFsaubWC3Udf
         o4q70lLxZssaGRaKI39RcVFiRN4DFNwaEbygDjTtcq1ZkE3iDHGs4RBJMGpxOS5zsD
         +f3sxYLiFhFEw==
Date:   Sun, 13 Dec 2020 21:14:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20201213211434.27bf402f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/10.jE..CW9K2rw+xtI9UVZq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/10.jE..CW9K2rw+xtI9UVZq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3aa4e616197b ("cifs: Register generic netlink family")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/10.jE..CW9K2rw+xtI9UVZq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/V6YsACgkQAVBC80lX
0GzPsggApLHybUvF97x85qr9Sc6zYa5dg9u3RARn7o3hei+6toVOIk3AbTATZv6S
+Hd7eTy8Y3PYOWSYt+E7oizzOz/4UxkcZKuMfYb8r5xAy3AGjPRTDUzevE25A+C8
wN20j9lcHIfBv/0cl2C85mrYjpIyyNU53+aYchYUn/doniSXpd6pJoPhI4s44rOS
pXPm8b9U2oPukBAGS8G2oZcfbO+f1sSgdeNnbO92pCIvvqlPDXxWlOtZzk718hIn
4VK9dXizqQfO2qRC/1gYgI55kkAnJkN72D8RxirwqgCYmvdG6Mokzg9J/jEYbBnO
foCv7uFr2Y7skbOkYFNUs4Ko0puDpw==
=meC8
-----END PGP SIGNATURE-----

--Sig_/10.jE..CW9K2rw+xtI9UVZq--
