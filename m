Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514FE1EEDE0
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 00:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFDWnM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 18:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgFDWnM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 18:43:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4476C08C5C0;
        Thu,  4 Jun 2020 15:43:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dLQh3Dmlz9sSJ;
        Fri,  5 Jun 2020 08:43:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591310589;
        bh=zK3BHarQmmxAyg+jwdX46k4FA/B93Cs3xJgQROQsF4Q=;
        h=Date:From:To:Cc:Subject:From;
        b=ebus9Labfalg4Gem7PmSnfmUaLmIz6gmC/6Ti9CAx4NG9cqowCLxk0i4Bs2LthAVB
         vdZlOfSr6PxKQKHP2IBvZkJUy5hJsNojy22gjUKh2rNb3xer7d0PQEbwzbNrU5eyLr
         /XjyGWYrSmzhFJ9Req7LyBNYgAKZlptN7Y0PBFcmEbCUyzZ4+NseA9mBRMVyszV4Pj
         47m72ek9EEXyyCcY+L77cvZLeOw3HmZa6l1MQxbA7Jlz6EwHpPsUjmw+dOLYyVn2VE
         B3EtN35tMe5obtpY03/HVTr4AxH5mfPmHNQECcbHt5kNyFrG2LMa8uwawxix8c+IHK
         oBS4DHu6DrOqg==
Date:   Fri, 5 Jun 2020 08:43:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Macpaul Lin <macpaul.lin@mediatek.com>
Subject: linux-next: build failure after merge of the sound-current tree
Message-ID: <20200605084307.47d31882@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2WoqLhkTf5Ca7FGYkaGGzHj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2WoqLhkTf5Ca7FGYkaGGzHj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/home/sfr/next/next/sound/usb/card.c: In function 'snd_usb_autoresume':
/home/sfr/next/next/sound/usb/card.c:841:29: error: expected ';' before ')'=
 token
  841 |    atomic_dec(&chip->active))
      |                             ^
      |                             ;

Caused by commit

  3398e5c7b038 ("ALSA: usb-audio: Manage auto-pm of all bundled interfaces")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2WoqLhkTf5Ca7FGYkaGGzHj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ZePsACgkQAVBC80lX
0GyQ/gf/T4y6xJNKRyQUJ6dtvKGJgiJSpFbeno5Er9M0yqSXwNzly8PCSsPxiol5
xLzX8KJjZksLmh88loZ2cBIecnaashWuu/IfAsuEm9RYWYPPyYdpGICVT8bBLAmS
iuUv8nexnPgB+7OOquYDr0qJRz0F2zMyU7JtWAd/FhpYfAOO4obnkdRBdY5LJG3V
9vckb1O+8RyBS6PnTGPFnJfIYpvsUKWNKgpeFDCbetIMahuSj1yCdR/OLRSJi/Jv
l3uGe5U1UVYnKiz9nn0tHGYBlG4VZn/0Tf56QcWQ/QyubkWZ316o2lA8/3TZTVcb
c+dunQGaF6wkt0OMNOXTJ/wIpgPH9Q==
=OmEx
-----END PGP SIGNATURE-----

--Sig_/2WoqLhkTf5Ca7FGYkaGGzHj--
