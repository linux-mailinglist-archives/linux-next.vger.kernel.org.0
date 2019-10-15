Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF92D7531
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 13:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfJOLiZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 07:38:25 -0400
Received: from ozlabs.org ([203.11.71.1]:37227 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbfJOLiZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 07:38:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46stjB27ZXz9sPF;
        Tue, 15 Oct 2019 22:38:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571139502;
        bh=EsbTxF0X5XVWWt+kkCs2nGfRrfWNdAsgwxYcQxzup8U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AwanyibKqRkv1aDNm+Smtm7Q+KAQ60/WEgslXzNaeqBiAAcJocrjnYW+YliqWiBgf
         Ky0Nvsdwc9vCdjdB2n8ShNb6nDpEKLpCWTrQuuu8r6hq8bug7+dcG/0PM8jhB92hrg
         DYGkT7wIQCiALjO9aFH8lFk+NjYnjeDwGGahw+tSIb7qLk5XOg3JKTK2N51ybqmzhn
         degejpZuHAnYilAuL9tOKX4nmgiFvMhFVNSkPq2/bnPhbFCCV7VfyjCrVsFgwJdrlk
         hQ94BkRvBJy5llJRcnDwwSvu3wPTRybrCpJXSmbu8/6HPi9Xt38CmejEtG4DN+H1jE
         CGQJhjXxPtxNQ==
Date:   Tue, 15 Oct 2019 22:38:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Baluta <daniel.baluta@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20191015223821.6270d593@canb.auug.org.au>
In-Reply-To: <CAEnQRZDONh-HcPnKPV_ieTNqVKJkxfNZ_7hd+KEut85tY=BMcQ@mail.gmail.com>
References: <20191011110149.79d529c4@canb.auug.org.au>
        <CAEnQRZDONh-HcPnKPV_ieTNqVKJkxfNZ_7hd+KEut85tY=BMcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gM1XB78C/LadTM0S+elGifZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gM1XB78C/LadTM0S+elGifZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 15 Oct 2019 09:46:33 +0300 Daniel Baluta <daniel.baluta@gmail.com> =
wrote:
>
> > I added the following fix for today (include/sound/sof/header.h
> > probably should have something similar): =20
>=20
> Thanks for doing this! Is this patch in linux-next already? I couldn't fi=
nd it.

Its part of the commit that merges the cound-asoc tree i.e. not a
separate commit, but sould be applied to the sound-asoc tree itself.

> For include/sound/sof/header.h Morimoto-san sent a patch to alsa-devel.

Great, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/gM1XB78C/LadTM0S+elGifZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2lr60ACgkQAVBC80lX
0Gz4ugf+JWVVNxLl6zv0y1AC91zUjA4jHGgGzaCmKL9InnLjapNdUSFAY02RqLOV
Yf2tmjT+7VhEwBFfRos1GCkAxdL+zrd29+NAZS0ZJJ8ssUEZIMO6m/pyBl/AIuSt
E2tLjn8UyORZrr4epHDohZhy2MCaTcPfQOKzRO+37DoK82MvNOKn0Sbwn1q3C6K9
7L0Sit4BLiAMOoOauMnHN9M/t6HMR33FJusqDOs13DQQPKOdA1DaUwxKCPVUzFOE
X1W6u6KIejGpk8S93XkWBHWtvcu3+wrttyQ8J53uauZaCdXObTQCmYeobF+7MiTx
zicRZiw/BLJIgJfdCv0i8kk6DlkzNg==
=aujH
-----END PGP SIGNATURE-----

--Sig_/gM1XB78C/LadTM0S+elGifZ--
