Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268831D6FCC
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 06:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgERE11 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 00:27:27 -0400
Received: from ozlabs.org ([203.11.71.1]:35931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgERE10 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 00:27:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QQw973Hzz9sRN;
        Mon, 18 May 2020 14:27:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589776044;
        bh=1Nzkxf+aSIk8nn2W0ZptJe9cFICterAtZUZx4NjA5Go=;
        h=Date:From:To:Cc:Subject:From;
        b=dcstgaNlnSh2TfgDx6DbGJhpSVED3cyoVUJ02Xs0Sw3lNNe8E0TOmjvFjAVqI9k5J
         ASPfTrMBL/drQW0hZ3uc8cnlrweNph2PRcvT/AJ3b2nzG9EDFpn9DUJbX5oPuVQEwc
         2hEgxECzr0UZumfIq+i98rhQ/xPk5MafLlHqES+7bUW0ydzZzTAaAfBGgcSg7BAW/9
         VvSWleil6fdWW0M0/igKzAtGSMpQ047ifI42mW+mIJNfpyOTWWgq/gnoM0JOiM7deG
         T1uiGeaN3D5UtJmcVACOPywBh/qDyn8RJ1qLYwn6sPiLSaj30bqatD4v0NPtq0lnjj
         yVr6TE0mJnUkQ==
Date:   Mon, 18 May 2020 14:27:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20200518142720.4c0d9a87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/23ZVIktFKn3NAJzPYobrmCw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/23ZVIktFKn3NAJzPYobrmCw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/meson-mx-sdh=
c-clkc.o
see include/linux/module.h for more information
ERROR: modpost: "meson_mx_sdhc_register_clkc" [drivers/mmc/host/meson-mx-sd=
hc.ko] undefined!

Caused by commit

  53ded1b676d1 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson=
 SDHC host")

I have used the mmc tree from next-20200515 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/23ZVIktFKn3NAJzPYobrmCw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7CDqgACgkQAVBC80lX
0Gx/eQgAijQsCRNiBABuDVhQjjFMuI9q65qcOCgaAcQNRYJlbjEfj7C9xDlh8CK5
k784cDJO3y2Ch1BtWh5qRfNtOVc7Zh9mLx6x5YDqlt9+WXsFX7sbJnNOTztPakm/
F1eoQ5sUCfJSawI1vM51N34pLeASNjY5/61tCXkpguN4xAubxDKn229EFJlccDRa
raXDHkznVE/iy0DO0MFcBkb8DFCYmVA2RlXKe1+TYjRW721OkPE7Fs8+QjSEKlcu
OHtcwyiMyELFrUXUEzh98CiKcDOdvisOS1KQMwjqjNPT8bDs+ay15WkCDUM7aF9P
Ay70Pje7EC5tpgi66W8fjeTPBAH0lA==
=I6qY
-----END PGP SIGNATURE-----

--Sig_/23ZVIktFKn3NAJzPYobrmCw--
