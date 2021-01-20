Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331E02FC777
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 03:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbhATCHE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 21:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbhATCGu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 21:06:50 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C743DC061575;
        Tue, 19 Jan 2021 18:06:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DL8596hxHz9sVy;
        Wed, 20 Jan 2021 13:06:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611108366;
        bh=mu2hwEjOKf1ka9Encmu2T1NzHXH5ODvQIy7jtJ3KNaw=;
        h=Date:From:To:Cc:Subject:From;
        b=mK18dqXnAMy2UsfBks3FTOxfbKcc5aAQzVzjpgp0GBmXAD7+IsMKDriveJC8FRPDR
         yakSlxSOMAHnLGAyEcbfgBS9Ga8ov7xvvsi3sGyTbtE0HRZEy/cAEUpvLWNztEFw0b
         1n8mp3xQzLFdsVT345ioyVZkXgEnvJLZfsAAixjY86KTybdUtMSv3XCgNZ/8SNJPph
         Z1SR6sahhhPMsaRVCEIs+KfLM4q8wovt5cORrq9sr+Qu/GJ17TVnl7vQ/JN+JwpK/2
         rvPfjLK9Dl6phWEEcCirNfT2e/Rig/1RK/c42Reqxaw1y4oE676Y5/nE/kOBmL9vhK
         BH24MlwZu7TPg==
Date:   Wed, 20 Jan 2021 13:06:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Al Cooper <alcooperx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20210120130603.1eccd490@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MXJw3KNBXkJR8x=a4+47Qh2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MXJw3KNBXkJR8x=a4+47Qh2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/gadget/udc/bdc/Kconfig

between commit:

  ef02684c4e67 ("usb: bdc: Make bdc pci driver depend on BROKEN")

from the usb.current tree and commit:

  7766cafea0ec ("usb: bdc: Remove the BDC PCI driver")

from the usb tree.

I fixed it up (the latter removed the text updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/MXJw3KNBXkJR8x=a4+47Qh2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHkAsACgkQAVBC80lX
0Gyw5Af+PLSwN397i9gQgwW7o1hGR0VIvwnXqTaBYgq+bKpHH5V2syUoDoY/NiOm
d6tSvs5vQtjuydWxCj6PjvKz6h8R+hVojSeREYNvvE3sdY7/gBznaA4mQM0346xt
bMPoXloZN0GAIkXchR43PWt0hEdbE6rR5ESXj/pDO6SAKOs30R9ad/fM1A6xIbSy
ZKYcRxZdAd2V+ZpyRrW9LyzGj0ZjkgvV0tk4SDUxC9H/98TxF96lekT1c1NcLTJa
k8aTpeaN4qoEMVQrZyuyPzOvsnydhM1GB5Gwpj1ezCktj4JjKt/4fFz1S0Fdhrbu
HPHuwtsfQrUJyMYrln5vgoMn/hYyMQ==
=Lu0F
-----END PGP SIGNATURE-----

--Sig_/MXJw3KNBXkJR8x=a4+47Qh2--
