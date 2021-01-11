Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C492F23B6
	for <lists+linux-next@lfdr.de>; Tue, 12 Jan 2021 01:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404194AbhALAZ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 19:25:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:60068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390862AbhAKXBm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Jan 2021 18:01:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C79022D07;
        Mon, 11 Jan 2021 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610406062;
        bh=I/4RwbjWZnuMYBPiKSGPL8wDUJk78ytV9lAu4l0BlrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JOHl5/0XBhoSKjRK5haenGZqi1VA0aIKK67vtTCvD5SnFHAchX4CbOQGT6pSkMOMm
         rh7fJ0cjrl2MF04TALwrqnEIR92/66k3lsinSZVZy6kEMIumuFMb2+HJ8k04JD4J3D
         PLBAoHzksJZ7pbDBWrcGLsGSLNVlIvE/kANfk0lcnSHSlT6YXAnV1StUVSKR+tPulh
         +OBky6GYmaPF8OJYvzw/NTNY/vVmj0h6ddYJd98Diz5KMOBQcTod2EgGKoAiYse6Jv
         JkcFxkaR1Y0kXY4YeBKZiQiSRwr33LOKLUdttxNhL1cF69fiEotVkrJf7ibC9uHbEy
         UUYXcPHOUqZIg==
Date:   Mon, 11 Jan 2021 23:00:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>
Subject: Re: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20210111230029.GM4728@sirena.org.uk>
References: <20210112073606.7cb02e42@canb.auug.org.au>
 <20210111205810.tipt54yk2dljim3l@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OQhbRXNHSL5w/5po"
Content-Disposition: inline
In-Reply-To: <20210111205810.tipt54yk2dljim3l@ti.com>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--OQhbRXNHSL5w/5po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 02:28:12AM +0530, Pratyush Yadav wrote:

> I meant this one. My mistake. Copied the wrong hash. Any way to fix this=
=20
> now?

Not without rebasing which I generally avoid.

--OQhbRXNHSL5w/5po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/82IwACgkQJNaLcl1U
h9Dkiwf9Ganq2ycGq/TtFtz6E7gQ2GC79poZgIRvzqchNSwjoN/8Riuw3dBwpqh7
Gv1kpIACfd3OXEQTHegz5Aokgd8gcgJQjBbfXd43F+KSq8DAQsCMe8y8eei8+08O
6icjOZIBVNlnAu7NNcKbi8v4rEfoagEZxCGnP7zIdgQquiO3YYJLfyyr+Jx1ojMh
ReKwPtMp+bpynBTY2jraQPLLkDXM2BR3zLD7TY4eX1M52GzKmDHha1YSFjMPFu9F
/MhTKcZp2eYkdMygCEWGZgUF8gZBlPJPsFUgRCmdpX6kcU4tf7aZEFxrLIC/giyN
IwEjp6Khadv9kG1zzKlDYgSdexuDbQ==
=GPCn
-----END PGP SIGNATURE-----

--OQhbRXNHSL5w/5po--
