Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E424130C9E
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 04:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgAFDl0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 22:41:26 -0500
Received: from ozlabs.org ([203.11.71.1]:54719 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgAFDl0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 22:41:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rhBX0mRTz9sR1;
        Mon,  6 Jan 2020 14:41:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578282084;
        bh=RuY20d6p1htWPH+1tTPPvNN9OuSfE/X13IHrRPkPK8g=;
        h=Date:From:To:Cc:Subject:From;
        b=pcSztysJBVa0QNKnW49DF4phR6B8EFalOY1LauHPrh9KCZMsNaniH9mDl7ZClMp7s
         NVz1QfUlVpA+IQ7PLyvPljq/sdjpee6+VFEpKTpzcfyJCO341BerDPFtUMeUXsCC73
         f/GS7S75YF+x7sKBnMYDc9SGOjISxy0Fx9OqvkiOWzP9T2FSROGYQ/3xspUqDBeEcX
         VjuyzOVaXQi/eCX9hsTYOW36T0nJi458zDCS6jrOKeJZItr47nQr9dsakfMFlRAxSR
         HmB8XsujHJmi4a8OJ0Ymhk1Y94DkWv7h3U77t9AfMNtITr+sAvAXcpKBixP3C0eriF
         He1cz3yq9a1ag==
Date:   Mon, 6 Jan 2020 14:41:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20200106144122.01f51be9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HYVkpLFNHS6Y7DpUt2yJALP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HYVkpLFNHS6Y7DpUt2yJALP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
  Depends on [n]: ARCH_DAVINCI_DA8XX
  Selected by [m]:
  - USB_OHCI_HCD_DAVINCI [=3Dm] && USB_SUPPORT [=3Dy] && USB [=3Dm] && (ARC=
H_DAVINCI_DA8XX || COMPILE_TEST [=3Dy]) && USB_OHCI_HCD [=3Dm]

WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
  Depends on [n]: ARCH_DAVINCI_DA8XX
  Selected by [m]:
  - USB_OHCI_HCD_DAVINCI [=3Dm] && USB_SUPPORT [=3Dy] && USB [=3Dm] && (ARC=
H_DAVINCI_DA8XX || COMPILE_TEST [=3Dy]) && USB_OHCI_HCD [=3Dm]

WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
  Depends on [n]: ARCH_DAVINCI_DA8XX
  Selected by [m]:
  - USB_OHCI_HCD_DAVINCI [=3Dm] && USB_SUPPORT [=3Dy] && USB [=3Dm] && (ARC=
H_DAVINCI_DA8XX || COMPILE_TEST [=3Dy]) && USB_OHCI_HCD [=3Dm]

Introduced by commit

  88eaaecc4446 ("usb: host: Enable compile testing for some of drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/HYVkpLFNHS6Y7DpUt2yJALP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SrGIACgkQAVBC80lX
0Gyzuwf/YcT3nLjbS6mNKzYrZMoWLqIM5GYL/gfsj9aKPW4SLhScJSygUDzYGg4A
Gu7FfXMEgcFUq4SC/S+j9QwyXrLwA80PGtoQ0PtIR5KT+IPm0ukvNEiGD/RytfWE
4l/uEIZvCuyqKXKLtZmQOxLl261Gsqk+CulxXRKgbhU1ddANzleqTuIURAOusVEF
QeWscmuPuX5opjzgJEgl8FafwLL7VygRO+xvEjzNsa9qYejVOHakOb27cDDl89pB
8Ac2APP8Y4MYznZTGI271ymrURJCG9nQ9DrA3StgP6yRYdycb/0pfy/UgfCg88l5
lW29NfWjoFAoJccjsFfx/kv3TXz6HQ==
=q/15
-----END PGP SIGNATURE-----

--Sig_/HYVkpLFNHS6Y7DpUt2yJALP--
