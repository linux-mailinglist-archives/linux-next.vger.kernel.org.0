Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B90B1B5C12
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 15:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgDWNEF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 09:04:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60375 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbgDWNEF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 09:04:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 497HYt01bMz9sRN;
        Thu, 23 Apr 2020 23:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587647043;
        bh=RsqDktuMMP2UgufhCx84QjzJaJ3BCDZnFMhqrYgH1i8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T3Q9H+56rirN9jDvJka9cRS5NRtrWdc/QPTAW3cBRZ8CBsf0PD1RHVZOlmS+ufW4m
         vH43guW8YFopRrfDLPApSP7nuIwdE85NWG9/Es8jsQNJq+wfprxwgi3A80Ay5gyHAn
         tx42rHpVBUSyENQSZFhqy5mBaag5lx+KDnm79yN91lq5YkYpi9Z8JVY2xsJhEhdOXE
         0as+13FvAAKy/o7FEEQhS6/aAB9DK77f4+6irtIZ9t1hsTOVBAAzftBVqb5bFSt6s+
         QEVga1M6QhZnAUPLcT22hE/qr/6E5ZOYlbeKnDbRV/a2dXnU66e2ZP4DlCtk14MLhY
         fUcOoOMGR6A8w==
Date:   Thu, 23 Apr 2020 23:04:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200423230400.2cb1a285@canb.auug.org.au>
In-Reply-To: <20200423113041.GI4808@sirena.org.uk>
References: <20200423155539.4492a0cc@canb.auug.org.au>
        <20200423113041.GI4808@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/me9ky4T/dLNjtXpiU+noB5h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/me9ky4T/dLNjtXpiU+noB5h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, 23 Apr 2020 12:30:41 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Apr 23, 2020 at 03:55:39PM +1000, Stephen Rothwell wrote:
>=20
> > Presumably caused by (one of) commits =20
>=20
> >   fe17e6cdc0fe ("ASoC: SOF: imx8: Fix randbuild error")
> >   cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue") =20
>=20
> > I just removed the COMPILE_TEST from SND_SOC_SOF_IMX_TOPLEVEL for today=
. =20
>=20
> It looks like this is triggered by PowerPC not including
> drivers/firmware - there are missing dependencies but it works for other
> all*configs since the dependencies all get built in those.  It would be
> helpful if PowerPC were fixed to include the firmware directory to
> improve coverage.

$ git grep drivers/firmware 'arch/*/*Kconfig*'
arch/arm/Kconfig:source "drivers/firmware/Kconfig"
arch/arm64/Kconfig:source "drivers/firmware/Kconfig"
arch/ia64/Kconfig:source "drivers/firmware/Kconfig"
arch/mips/Kconfig:source "drivers/firmware/Kconfig"
arch/x86/Kconfig:source "drivers/firmware/Kconfig"

so, sure, it works for some architectures.  We would need someone to do
the work to make sure that adding drivers/firmware to all the others
does not break other stuff.  Until then, please add the needed
dependencies.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/me9ky4T/dLNjtXpiU+noB5h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6hkkAACgkQAVBC80lX
0Gw/vgf/RCdmmZnXRnDInT2vsf1nlf2B3qr9OvydGkxsoxbQepgegAkwiwYAyAy1
BnL/J0xhUHrH6pR1b+OfSOe/dNPtLbvAdpUE7aHDZ6/NiwCZCtbNc7+8iNwfhEz9
bTL0j4Pb+BT0zE/dKtDZSZgi5DblRNdKhEPB9VlTLwqDidJza3iAPOK2ze6yuB4r
dPVY/qT1xxpdLPng7K8zIVMtCiHiRAx8xPK0I2Tcqy/Qs8b9xqczqtYZgeC1KX14
vwEKXc4+vVvP8lG7Z6nGxpoSPF2z68G31z3IXx0Bk6suHUb6PX61Qcy+s4exSKlf
sY8twW9/duwIua7Lmygok5k7LtN8yw==
=w+zl
-----END PGP SIGNATURE-----

--Sig_/me9ky4T/dLNjtXpiU+noB5h--
