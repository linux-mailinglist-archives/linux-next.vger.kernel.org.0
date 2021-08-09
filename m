Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934F63E42FA
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbhHIJjD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 05:39:03 -0400
Received: from ozlabs.org ([203.11.71.1]:57567 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234468AbhHIJjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Aug 2021 05:39:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gjrcc1LNJz9sWS;
        Mon,  9 Aug 2021 19:38:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628501921;
        bh=cwU8YpfBWgvbAGf0nx6bPXxWP1ghW/KeNYrB+GdTMgY=;
        h=Date:From:To:Cc:Subject:From;
        b=JM+9zIlLRkZGMi8f4uwpr5e5ofTSF5ptqKe+ZCkQDe9Do9IYe8TjTgHb+e/GKG72Z
         2rQCFk1VqSy05ukSiVQ/2DzHZNwj4mb7PSHDZwvtybGu33c1+TIAovOcyYmO4bTfNt
         i6sG4gTfe0CqHesYLtO+Yblsiu8QewIjRCBBolJt2FjU53QHrHNApM38WG3YWHOQsO
         9WZhdLynmdEKf918wcHpHtTaQrvkbUrd7i6m1ijEu+38WsoLUFVRhwPBX+TvvzRL8V
         ivXIAO2M+tgdm6jM6ED78rm4/ojqN1ejRoziP+6XsLibL9d/UySpnUx7pQTMcX+9Zy
         ae28fD9K4LvXQ==
Date:   Mon, 9 Aug 2021 19:38:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mhi tree
Message-ID: <20210809193837.373a9f68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vBGHKn9Dme7gC9ikLgnT_SE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vBGHKn9Dme7gC9ikLgnT_SE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/bus/mhi/pci_generic.c:406:40: error: redefinition of 'mhi_mv31_chan=
nels'
  406 | static const struct mhi_channel_config mhi_mv31_channels[] =3D {
      |                                        ^~~~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:372:40: note: previous definition of 'mhi_mv3=
1_channels' was here
  372 | static const struct mhi_channel_config mhi_mv31_channels[] =3D {
      |                                        ^~~~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:417:32: error: redefinition of 'mhi_mv31_even=
ts'
  417 | static struct mhi_event_config mhi_mv31_events[] =3D {
      |                                ^~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:383:32: note: previous definition of 'mhi_mv3=
1_events' was here
  383 | static struct mhi_event_config mhi_mv31_events[] =3D {
      |                                ^~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:424:43: error: redefinition of 'modem_mv31_co=
nfig'
  424 | static const struct mhi_controller_config modem_mv31_config =3D {
      |                                           ^~~~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:390:43: note: previous definition of 'modem_m=
v31_config' was here
  390 | static const struct mhi_controller_config modem_mv31_config =3D {
      |                                           ^~~~~~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:433:38: error: redefinition of 'mhi_mv31_info'
  433 | static const struct mhi_pci_dev_info mhi_mv31_info =3D {
      |                                      ^~~~~~~~~~~~~
drivers/bus/mhi/pci_generic.c:399:38: note: previous definition of 'mhi_mv3=
1_info' was here
  399 | static const struct mhi_pci_dev_info mhi_mv31_info =3D {
      |                                      ^~~~~~~~~~~~~

Caused by an newer version (but almost identical) of all the mhi tree
commits are also now in the char-misc tree (almos identical patches,
but different commits.

I have dropped the mhi tree for today (please clean it up).

--=20
Cheers,
Stephen Rothwell

--Sig_/vBGHKn9Dme7gC9ikLgnT_SE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQ950ACgkQAVBC80lX
0Gyy6Af9GM+sE62gBCtBaIQ80Wz0DbjvxBw/S7QVfgejerGtYR9Q/B9DI+ASz9Aj
qhzwbFLcqJYfVT9SNiVyTHo8LPTlb2L8JPvgteX7D5J0qBSjny8ai9wLzigTxERz
9QQxLybyunF4pV+d9GN9FTzYgf28EhKMUaPnA1fnoVjbVEVg+f3WPJlIDSXeT6GO
ktQQiMQ7Er6WIqnkGGEQE/KyXWOTQxyfhM3GLPu16j2EiUmyqUaBTHRwT/r2ewHJ
GFoTlsxCF5HpaDe1mL9150PhdEYx84W1avkHojea7+nt9FUuvODVjOid+Ezfc+Ut
Yrph5wRDV9OX5gQ9bu0yqXLVkdJj0Q==
=PA2V
-----END PGP SIGNATURE-----

--Sig_/vBGHKn9Dme7gC9ikLgnT_SE--
