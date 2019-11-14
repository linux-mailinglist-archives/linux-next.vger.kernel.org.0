Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F43FD0FA
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 23:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNWeN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 17:34:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47375 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbfKNWeN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 17:34:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dbr23Jzhz9sP3;
        Fri, 15 Nov 2019 09:34:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573770850;
        bh=LecphZhSiYlqVqlEdBXf4ZRNKormqhCBcUUJzQ3dR/g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eT41KWityLO6vw6d4voa1Ah2DOe1znqT7s26Y3EXjFb02z3n1HevCq8CVOk03JhrS
         w71dzADKcfj0LQHELZuRJknmhvFYNc6al+4e2gIUcdqRedeURypIJDK4PVomcM7O87
         C5cAEa1skpgbg8svbkLnZIvdxi1DNANOMx70VtWzZ5VVlig1L6RSn/qV5YvFsoMu6E
         1sSy8rqCxz4m0Dh+ZF+TmbQpLOm0rEaQMlYehdOrlQPIR5N3eZZFx+/99fRVVEpxW+
         6C5iXoAravzkihBi23I2pJterQ1vGl+SwWa8XQkKlHVtCHsqpHGiQAK2oMJWhgda8d
         haDdMuqocNRGw==
Date:   Fri, 15 Nov 2019 09:34:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20191115093410.4a7938f5@canb.auug.org.au>
In-Reply-To: <20191113081035.7e7f9bc2@canb.auug.org.au>
References: <20191113081035.7e7f9bc2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E9v2VoH/WsS_U2EQEBw7wag";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E9v2VoH/WsS_U2EQEBw7wag
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Nov 2019 08:10:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the sound-asoc-fixes tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>=20
> sound/soc/sof/sof-pci-dev.c:116:15: error: 'snd_soc_acpi_intel_cfl_machin=
es' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_c=
nl_machines'?
>   116 |  .machines  =3D snd_soc_acpi_intel_cfl_machines,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |               snd_soc_acpi_intel_cnl_machines
> sound/soc/sof/sof-pci-dev.c:136:15: error: 'snd_soc_acpi_intel_cml_machin=
es' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_c=
nl_machines'?
>   136 |  .machines  =3D snd_soc_acpi_intel_cml_machines,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |               snd_soc_acpi_intel_cnl_machines
>=20
> Caused by commit
>=20
>   1d3e9077307f ("ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary name=
s.")
>=20
> I have reverted that commit for today.

I am still reverting that commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/E9v2VoH/WsS_U2EQEBw7wag
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3N1mIACgkQAVBC80lX
0GzgYQf+OVvzm/o2m90vFuDGztm66e8A6/AW9z2Hg5fpJQfk8GQmlSTZPP5Sjo1w
WhagSNO2dqSozE8lNqUbJLmbmrqE8fk+KR3kM73K+8P9NgAzHGZtM1d2MITJOuG1
YHPv2ufjter2OV5YlFfj6vKPvIDeioltUifsZEAmxViDIplBxwkzyps88UqH5HB0
4CRxLSlXwW09MS8ARcL49hZmNV5hVn363ATxEoBfELJiHMRlkXTUEh58r9GaNm+y
G5fv+D6NgD/e5iDwci4UWJPtDM+Ih5/HviR0fgLqZH73dDodARyhnjAdGoG6X4WM
cW5TiVW/19+Y4JdQci/mjRrQI1uVEw==
=IaW2
-----END PGP SIGNATURE-----

--Sig_/E9v2VoH/WsS_U2EQEBw7wag--
