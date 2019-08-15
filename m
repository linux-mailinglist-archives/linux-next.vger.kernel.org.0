Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C538F68F
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 23:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbfHOVnG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 17:43:06 -0400
Received: from ozlabs.org ([203.11.71.1]:56393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728828AbfHOVnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 17:43:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468g140fvwz9s3Z;
        Fri, 16 Aug 2019 07:43:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565905384;
        bh=MsZwqAxaGQ8nQeIeHtBo7cPYHvMCXyDlUc9DQt1kJeU=;
        h=Date:From:To:Cc:Subject:From;
        b=nzzDkZtVtYYP3llCdqKskl4Wjv94obTfup+jgUPatHsPH5vO1meDMEwcppJqODJX+
         fewY2RO1Kza3B0wKdgKTPcrjAIOfFAXh1uNfLRD5iFyGoP6fao1U5qAhLU+tk/9Cip
         S24/GARqQSmK8FCWc3LlgmlfnEb3g5mWrfqDihfT1sVdIdaJ4WmiWwTsrEgbVs0NIL
         vxheA0gX08dYhkZ0jIVUTxHT4NISfBDfFaRM8kxdiHT5aIjn7kCze2ErwY8Lxf9M+c
         a2gqWvLoHb3OE1VoTDAUiS2BBe9J8rbeOhenyqwKZykMCJKTlbljk294OzReOOtBRH
         Gh3jXdcVFIvjQ==
Date:   Fri, 16 Aug 2019 07:43:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20190816074301.619b80e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gg_YmVflBc=Gx6pTe1ADh2S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gg_YmVflBc=Gx6pTe1ADh2S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  772775c1dfe0 ("net: lpc-enet: fix badzero.cocci warnings")

Fixes tag

  Fixes: e42016eb3844 ("net: lpc-enet: allow compile testing")

has these problem(s):

  - Target SHA1 does not exist

I can't quickly find which commit was meant :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/gg_YmVflBc=Gx6pTe1ADh2S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V0eUACgkQAVBC80lX
0GzNxwf/Wn6cWTIb4CSTcLtAUP71YmIqt8UWIxksx9w/0l1R8T2BZPdB/PQDJqQ2
APiTCKmqIKtYao6cG2ogSK4X/hWmSzXliQCXoaSU0C5hSSnzrPeGubQNVqgyj49j
2x/yrAlZcTrWrgJljOadrLCWqRvniyEc6CwklKQjYvuDWDENrCYrzli9YvTFHwwb
PwpyGaElSyf2SUaOpZxpQLObhxZlwkodZxCT/5DPL4Ih+LZR7k6fHWoBLLKfZf7S
fH+avN0Kit5aa6w/5ONDKTb++Am0V/EnA89GevuwV5u7i7YgLpntlQuuWPDEgqME
7HO73spQXnE9eSIZoUb7zxDMDZ2Gfg==
=Edrq
-----END PGP SIGNATURE-----

--Sig_/gg_YmVflBc=Gx6pTe1ADh2S--
