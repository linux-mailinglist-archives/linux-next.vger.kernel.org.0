Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5FB19E83A
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 03:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDEB1r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 21:27:47 -0400
Received: from ozlabs.org ([203.11.71.1]:51057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgDEB1r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Apr 2020 21:27:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vwyn3YD6z9sRR;
        Sun,  5 Apr 2020 11:27:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586050065;
        bh=gzfVQrEEsmZi8z/S1LABnpgDQxpm5qIvGMNie7aLfxM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lx+K2zGpD5k/VLkKWJaZXycIOP/edI1NoiWxEL0qYRdK8e+6clFJnfcfi9iIbYQze
         6jN2Po/5R4KmkITqMffy5vg/mpcOpxWKjTolPj/lV8n2z8kuMISQPckX+jD2+MQOEm
         F22EIQFmRdo1DLLqri4zQLsET6iLVHCGmE5EkEfYaQbEbB17ed4um3gFBUrWKbFdUW
         nd63C4dhvVdGx2/M2N+QhuQKwZkxkeNtzkDhD42o2iEmLutgjquPIC4q6T7BaOWhGI
         X2U9iIHRyAzcmzGL+hCRyFj9o9RKSqF70Rtx+aQ/Sn093vsliSUF4d2hFRiskn7Y20
         rtU6GJrjvIJMA==
Date:   Sun, 5 Apr 2020 11:27:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure in Linus' tree
Message-ID: <20200405112743.58d07039@canb.auug.org.au>
In-Reply-To: <20200405112229.102bdf1b@canb.auug.org.au>
References: <20200405112229.102bdf1b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6LN=qR7mYtlBUjg5tWw612d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6LN=qR7mYtlBUjg5tWw612d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 5 Apr 2020 11:22:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Yesterday's linux-next build of Linus' (arm vf610m4_defconfig) failed
> like this:
>=20
> drivers/clocksource/timer-vf-pit.c:194: error: unterminated argument list=
 invoking macro "BUG_ON"
> drivers/clocksource/timer-vf-pit.c:131:2: error: =E2=80=98BUG_ON=E2=80=99=
 undeclared (first use in this function)
> drivers/clocksource/timer-vf-pit.c:131:8: error: expected =E2=80=98;=E2=
=80=99 at end of input
> drivers/clocksource/timer-vf-pit.c:131:2: error: expected declaration or =
statement at end of input
>=20
> Caused by commit
>=20
>   cc2550b421aa ("clocksource: Replace setup_irq() by request_irq()")
>=20
> A closing ')' is missing.
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>

I see this is fixed in the clockevents tree, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/6LN=qR7mYtlBUjg5tWw612d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6JNA8ACgkQAVBC80lX
0GwNAwf6A+ujBNOXCUAcloTVGwQez82pe73ENVXTZbbE1ax64HsjbnoPlLGlukq/
VpMMjWLEydTLj2GpAEkWTBp+63QbEg/9zd3zT/CZAXGDXzGI85eloRxNU1CX0OsM
bZAB03dnMA5tUTkfmSbDH2e37Dr1XSFlX5wEP3n6pBuGq52G2Km2DgRxwvm7MbiD
S9Q4nxbZzn99Fav4J3lLXJ0dXt9ynXwqiFaO7rTO4LI5bl41cwO1l0QP4cJ4OI9Z
r+v323IrHFZ7fqz8ahdq3rrkP1ySigIJtVmCmaIxeAoV44BeQXorcvQR/4OJQujN
GOPVmNa/5V4PgHeudafUsUTO9O08bg==
=1Tgm
-----END PGP SIGNATURE-----

--Sig_/6LN=qR7mYtlBUjg5tWw612d--
