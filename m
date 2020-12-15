Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2AA2DA973
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 09:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgLOIs7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 03:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbgLOIs6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 03:48:58 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88FFC06179C;
        Tue, 15 Dec 2020 00:48:17 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwBjn6Dhxz9sRK;
        Tue, 15 Dec 2020 19:48:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608022094;
        bh=G0nGMqIjphRDmGVeKwaLlJ3hIUON42JkRDTZccfldkk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q5tsSbuW3LrNHRPBzqZlO7mqkBGcbZuhpoLEQ2emJCa37QdPWZepR7W9FLCpFS1dn
         w8h0FZJxmrzNCmh7AwLTypOg8Q2OcB/FwU/JyoUwhwfvjOyD7S3m4UmtFBSmWpOvIp
         Wa8xXkuAFgmb10zmZSF1X5/0XOyZzUJo2QR4JOURUuklQZVJsCpWMck4oVoyGrOrol
         Xw4/9rYmJIlzbq9DW3WRM6IXk4+Dc+OJ8RSRSuaEJ2dTlE6ZmRYc4u/IyH4sjvRHxW
         BrRRkaEV9F75jWMQLTqpeI0zRxXHkkLqrhY2K+5XzYSzxuwksqO6XLT0ermIa9CelZ
         sQTzriD2GOiYA==
Date:   Tue, 15 Dec 2020 19:48:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rui.zhang@intel.com, lukasz.luba@arm.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/devfreq: Fix missing dependency with
 the energy model
Message-ID: <20201215194811.0505c1c5@canb.auug.org.au>
In-Reply-To: <20201215083520.601988-1-daniel.lezcano@linaro.org>
References: <20201215125806.31495950@canb.auug.org.au>
        <20201215083520.601988-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yhLX/en6_+M.90HcJ1WJD60";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yhLX/en6_+M.90HcJ1WJD60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 15 Dec 2020 09:35:20 +0100 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> The devfreq cooling device has been converted to use the energy model.
>=20
> Add the dependency on the ENERGY_MODEL option to reflect this change
> and prevent build failure if the option is not set.
>=20
> Fixes: 615510fe13bd2 ("thermal: devfreq_cooling: remove old power model a=
nd use EM")

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 7edc8dc6bbab..ee62d51ef351 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -193,6 +193,7 @@ config DEVFREQ_THERMAL
>  	bool "Generic device cooling support"
>  	depends on PM_DEVFREQ
>  	depends on PM_OPP
> +	depends on ENERGY_MODEL
>  	help
>  	  This implements the generic devfreq cooling mechanism through
>  	  frequency reduction for devices using devfreq.

Looks good to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/yhLX/en6_+M.90HcJ1WJD60
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YeEwACgkQAVBC80lX
0GzzTwf+P86BZpvRvRkz2tH+fw3Nkq1/eUBcdUthFdXzxOLx3O7t+V5ZGp3594A5
I+l9KFrHZ5MsJfAQCGHPKBxxgQqrKJBpYwA3sP9VXNpx1CaBezpSreQ1/A++rnkW
sLXe/k716T6bWweH+evliHbdOPqk54EQchmXPgBqhj5daevYqsBdolAWur45JAyk
cHmFkoEfjn8xit0/R2jevGTJiHhnJ0/4FgGm6a1S3ow5BFrcu0710k+GupU5IacN
zcm1tBB/cQfjsjPMlTDFwMYJRONfesV+LXupOrSmzILkocczTa/6kifZEndcshYO
/B8IgVTOO8J+Xs0ABl4clPvPxaTTww==
=KIAA
-----END PGP SIGNATURE-----

--Sig_/yhLX/en6_+M.90HcJ1WJD60--
