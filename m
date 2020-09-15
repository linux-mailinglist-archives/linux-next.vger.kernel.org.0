Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C5C26A21F
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 11:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIOJ0i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 05:26:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbgIOJ0g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 05:26:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrHt20QKwz9sVB;
        Tue, 15 Sep 2020 19:26:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600161994;
        bh=bcm070YqNE6/zFk/HFV7pW3UsnPcEG4e6gQC2h6/8Vk=;
        h=Date:From:To:Cc:Subject:From;
        b=kXuZeuY4aoU9cmuzoKd0v+u7pgJH3sLFL30Lm8SvpCpDwYKtA+/7AiSQRSfmPYSNW
         Jwnq+4qSFF16o+bAXYqxc3taYwLMZVy/K7I6lBp0BEWW7GdAT5g6Bwg6mWnVaP9rCi
         00N5KKY+vo5QTX7cnainhBft40RGBkRA/jC/QaaYmzM8VEXZ9scVEcnvfwi3GctShI
         Y8VrdpZSFMzWvAKmtbHtw4NDrVFCL8g8cSfaAniesKg7922TI4fxQRBsfu5TgiHCdO
         vHNYsLp0XxgqKbUFYNmLcS5EiFnAgMBaafvbBEJUFNmXHBZwL+ko+vumJKp+++btC6
         QCDaCvIfVh4mQ==
Date:   Tue, 15 Sep 2020 19:26:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the zonefs tree
Message-ID: <20200915192632.4bc91c9c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/63u6g+h8FodwEx1d/IFig2X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/63u6g+h8FodwEx1d/IFig2X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  7de0d8dc5dea ("zonefs: document the explicit-open mount option")
  7e7dda2cb1b6 ("zonefs: open/close zone on file open/close")
  c282d13f6ceb ("zonefs: provide zonefs_io_error variant that can be called=
 with i_truncate_mutex held")
  16ef4f7638ac ("zonefs: introduce helper for zone management")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/63u6g+h8FodwEx1d/IFig2X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9giMgACgkQAVBC80lX
0GzWXQf/WEcv7d1uzG5M45qg7iS8prFL+ag+d1iYPYRbhL0V/+SrR4rRXnvJPk2W
EcMEcr53Isl0IhQRZJ+gTLgPZOSmtAAT4mqHsgnwgPv4UrRRddGW1NqXdxa+0REu
ORWuyY+ivaFU73xkExTDK20Q/baQCplf7NyMAFZ7y0szyy7BOzveOO+wTynnmFJC
LPd3RYhB2lbxqfll8K2jjkHoU1JYqTtDOv6TILGkaWf89VZNROOkX8m5bqAePsUE
C+WXMDtPVyAI9KcFYd6ZtC45oMiX3gxinmOAGYzwUMlN8Gb0dGxWo7RIncwtA+d+
En2FpmbhDpb9XH5rCuSeg9ccqUTCCA==
=ZsCb
-----END PGP SIGNATURE-----

--Sig_/63u6g+h8FodwEx1d/IFig2X--
