Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3371E519A
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 01:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgE0XJq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 19:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0XJq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 19:09:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55037C08C5C1;
        Wed, 27 May 2020 16:09:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49XRP33DLqz9sRY;
        Thu, 28 May 2020 09:09:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590620983;
        bh=aeZ6cnnOuwisND5DdjrOSTo33yM1MR4fyUAadjGwuEE=;
        h=Date:From:To:Cc:Subject:From;
        b=uMPByhVHKID+YFT/WHdfuGMrjXV1FfwwcZ5eFwOrOMSM487JWa7yR+WjEkXMmeQYF
         j42vgRg7GzrPjBKQ3BY71kTtURFldOMAZXQktNKHGr/qX8ioOqseKt+YhTxa1y0G+Z
         iWbIm+mGrj6oTm42kA062ziiawOd2eHLjSLwXxlMwZnxzpQ8vW+hGXYpn3CqzJ408T
         3E0w7lD7KTEyxvMRi5WleDiRH8b1DAch1lg8gIphpJK12b6n+VDFpLcZaJhg6t7m8E
         YefWwBzhaNO2ZGX4RVCuRzZgVjkKdwiRr/JVOpWr7RtVXF3IvYdHeHx925wTuPiWrz
         LAP0bT0tik+eQ==
Date:   Thu, 28 May 2020 09:09:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20200528090941.341ad93a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8AI_rclgG6ytRkuQ9lxso.b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8AI_rclgG6ytRkuQ9lxso.b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm tree got a conflict in:

  arch/arm/boot/compressed/head.S

between commit:

  a94691680bac ("efi/arm: Deal with ADR going out of range in efi_enter_ker=
nel()")

from Linus' tree and commit:

  d0f9ca9be11f ("ARM: decompressor: run decompressor in place if loaded via=
 UEFI")

from the arm tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8AI_rclgG6ytRkuQ9lxso.b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7O8zUACgkQAVBC80lX
0GyPfgf/VA3CjG2gRIkv3oywIndKU2bCv7p6tpg1Y9RqhkPEgr1lwYMVqhId/oEi
ok2eNFjN77LdnY4Oj95Y1VxucH2mWguQumoRwuIGlef+fQavX3LsvYmpf3wIMF8q
L2sUNIxFrHPTNkimcb/NnLStVE0oBkdbtaeJ6XUSiRjrwJq03mdRHojfPbmFlvfM
QQsBGLHdi5LE7OtNrRVea/NohYFYYgtb0PldfJhlHuiGSDa4lJCADS1A+1fHcXVr
2Xv3kPH8c4PLoBMMcqb81Mi4ArwCH+WfIOQz5imKi55UUClhda+tMdTcfMD5Sk6j
6bN8hJ+kGNmk9lPgSFvq06daKFmBzQ==
=aXGV
-----END PGP SIGNATURE-----

--Sig_/8AI_rclgG6ytRkuQ9lxso.b--
