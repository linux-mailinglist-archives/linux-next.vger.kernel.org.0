Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBE626F873
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIRIhZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 04:37:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52241 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgIRIhX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 04:37:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt6dq5f2Tz9sSf;
        Fri, 18 Sep 2020 18:37:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600418240;
        bh=hmCzQhEi7bWRdO8KkTvzSrxadPgLdBKBCKwHIxoqEfo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B2yrXJvkBR7HhvcTW5fc2bAIGl0huTkYC9IC+WX4MN18IVdo1BYGikJNSPEAyOxt3
         pT7fRUD/4yFw4g0zr4p8B4Ygys71F2qyuMfEJqDrKp2+IJ76qTvxnCgo/CPJOxZZbt
         SquM/f2+CXGbNyjfjYfNL9T+pvgTutHLM+jVevt1qxUm+TfwticYMDPyIW9XCXz4BO
         549BimXlOmY67Ytqke+8Fdv6vBtRkENlr7UbsFLSs5S6PAt4eiB1N/Rg1Uc0QlDeZJ
         1tcjyrIFW7szpOjWBegY08hVtP88zMtZaIv8/lEPL9edy3wMuQdAPFrD7mlkLLvL8P
         56IRxgdjknRlg==
Date:   Fri, 18 Sep 2020 18:37:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: linux-next: Tree for Sep 17 (net/ipv4/devinet.c)
Message-ID: <20200918183717.7d25a71d@canb.auug.org.au>
In-Reply-To: <0b592973-55d6-b318-ed38-1d5fbd706e7a@infradead.org>
References: <20200917202313.143f66f3@canb.auug.org.au>
        <0b592973-55d6-b318-ed38-1d5fbd706e7a@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ys6gp6t29CdFQvBiIY1hLmh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ys6gp6t29CdFQvBiIY1hLmh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Thu, 17 Sep 2020 13:45:52 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> Maybe some older versions of gcc just can't handle IS_ENABLED() inside an
> if (expression) very well.
>=20
> > gcc --version =20
> gcc (SUSE Linux) 7.5.0
>=20
> This patch:
>=20
> commit 9efd6a3cecdde984d67e63d17fe6af53c7c50968
> Author: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Date:   Wed May 13 15:58:43 2020 +0200
>=20
>     netns: enable to inherit devconf from current netns
>=20
> causes a build error:
>=20
> ../net/ipv4/devinet.c: In function =E2=80=98devinet_init_net=E2=80=99:
> ../net/ipv4/devinet.c:2672:7: error: =E2=80=98sysctl_devconf_inherit_init=
_net=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98devinet_init_net=E2=80=99?
>        sysctl_devconf_inherit_init_net =3D=3D 3) {
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        devinet_init_net
> ../net/ipv4/devinet.c:2672:7: note: each undeclared identifier is reporte=
d only

With your config, can you try creating net/ipv4/devinet.i (preprocessed) fi=
le and
see if sysctl_devconf_inherit_init_net is actually declared?  I
couldn't see any obvious way it is not, but that would explain the
error.

--=20
Cheers,
Stephen Rothwell

--Sig_/ys6gp6t29CdFQvBiIY1hLmh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kcb0ACgkQAVBC80lX
0Gw1gAgAiT4sf2zE41aKkEOnKuI8WAl7XpRmaS0k+IHVWloHV1weK9rwwq+F0vwe
To1DxM2Np+gpBEpMFCTTWierg8M2Jm8RkCqiRsEcKgL7aTkCwcrP9Jsd2O3YMzm2
dvyYzDzI3EiRY5avg6CViTY9NEYFFC3jaoYkvq1K9XsnBU0tQdWoorWo+pybzg60
UF97Pd3TxrUtsl9T8+rU5HA5R/X2nCphYbsVhpSraINERfONDPIeynp9FqRoZ2VP
TMN7lEar8XbrqzskGUWbya/FORpI41tZKGmtpQGc1r/akEXxqjqdmzaYA1Jg5d+x
qfMLahYNkeehbi96DAKCFiHYiGlTiQ==
=qqr7
-----END PGP SIGNATURE-----

--Sig_/ys6gp6t29CdFQvBiIY1hLmh--
