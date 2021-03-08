Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2741D3318A1
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 21:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhCHUce (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 15:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCHUcO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 15:32:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C019C06174A;
        Mon,  8 Mar 2021 12:32:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvVPm2292z9sW8;
        Tue,  9 Mar 2021 07:32:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615235532;
        bh=od+CU7GK+sQqhVAAqCYOK4lCYgWJK9s3sKp5/lrinoI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OfOF+sLzazfOa0AAy9O+DrgvpabA/foNhSY2ElWKddSqJdp/htcSpX7bi8L9ChTSS
         sK13uMKHfWfHpCokw/MxJWMLUN+PRcJ2qM53JzA1h/LAnnU7TfOI0NMkWjwDUXRokl
         dlnhykDrrp0U3vfPkXNHj8vuAxnOJ0FK0wpGDmagB4tl9BTyAQ0phBbhAxy2lvfUcl
         nRSenkcAgMfCqD1WYrzr4U/mEYOgYbAR2n5Gt4MmWfWeJVR5fAjo9G8h+C19NLk6lr
         NRgpvIQF1yCkVG97QsWZxBiMbfujYcVnraywBP6eh+mZRS8alcXM0eIVRXmPuwvh5b
         Pck0ND2I1X5Gw==
Date:   Tue, 9 Mar 2021 07:32:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 gpio-brgl-fixes tree
Message-ID: <20210309073211.392a838d@canb.auug.org.au>
In-Reply-To: <20210309072620.656e8078@canb.auug.org.au>
References: <20210309072620.656e8078@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=0gUaMUgvU7yV+1SWsKpqeC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=0gUaMUgvU7yV+1SWsKpqeC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Mar 2021 07:26:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Commits
>=20
>   eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Ge=
n 2")
>   809390219fb9 ("gpiolib: acpi: Allow to find GpioInt() resource by name =
and index")
>   62d5247d239d ("gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk=
")
>   6e5d5791730b ("gpiolib: acpi: Add missing IRQF_ONESHOT")
>=20
> are missing a Signed-off-by from their committers.

This also applies to the gpio-intel-fixes tree (since it is now headed
by the same commit as the gpio-brgl-fixes tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/=0gUaMUgvU7yV+1SWsKpqeC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBGicsACgkQAVBC80lX
0GyCLwf/U++SIi7lHQqdGIelIR+3JOgJKgUJp3in8iGgHkGYSoJJjMwZ+g18eFTD
2isb8QxFiSFjUmAX6e9nd0PJDixMRhwtoXZJYWPg6Bv+H8DHPMJCJgeakEGAP8l0
Qh8VTCnwtZJq9HbcF+NaJFuPp/+EAGMITVEiUzLRLCZ/H0u+xtLttMZ2Jm6l4pXs
QSEQ7iqPaW9gFgo2+wWP+Z5B7v9v0p4ZukmMyhQ5GJt1ccKWugtcbwLFXPww5zBg
+1oPEftYuRjLKlxY6NQPmCqptEChvvffgEJO5RRWNgFd1HQxZ3wB2npT4nBUJkut
9OlVrtjbRyViDuzTRr7o5m5pPOsDWw==
=vz4P
-----END PGP SIGNATURE-----

--Sig_/=0gUaMUgvU7yV+1SWsKpqeC--
