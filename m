Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464173BC34F
	for <lists+linux-next@lfdr.de>; Mon,  5 Jul 2021 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhGEULZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 16:11:25 -0400
Received: from einhorn.in-berlin.de ([192.109.42.8]:38625 "EHLO
        einhorn-mail-out.in-berlin.de" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229565AbhGEULY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 16:11:24 -0400
X-Greylist: delayed 641 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Jul 2021 16:11:24 EDT
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 165Jvnbf010053
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 5 Jul 2021 21:57:50 +0200
Date:   Mon, 5 Jul 2021 21:57:43 +0200
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: removed trees
Message-ID: <20210705215743.40b26667@kant>
In-Reply-To: <20210514123221.7c21393f@canb.auug.org.au>
References: <20210514123221.7c21393f@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TFdYKVyY9TJGsYdH9vBV555";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TFdYKVyY9TJGsYdH9vBV555
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On May 14 Stephen Rothwell wrote:
> The following tree have been removed form linux-next because they have
> not been updated in more than a year.  If you want a tree reinstated,
> just let me know.
>=20
> fbdev
> fsl
> generic-ioremap
> ieee1394
>   this contains the single commit
> 	67f8e65e4fc1 firewire: net: remove set but not used variable 'guid'
> random
> realtek
> thermal-rzhang
> thermal-soc
> y2038
> zx2c4

Would you be OK with adding linux1394.git (for-next branch) back to
linux-next?  There are two patches queued and I am finally aiming to get
them merged. :-)

Christophe JAILLET (1):
      firewire: nosy: switch from 'pci_' to 'dma_' API

YueHaibing (1):
      firewire: net: remove set but not used variable 'guid'

Thank you,
--=20
Stefan Richter
-=3D=3D=3D=3D=3D=3D--=3D-=3D -=3D=3D=3D --=3D-=3D
http://arcgraph.de/sr/

--Sig_/TFdYKVyY9TJGsYdH9vBV555
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElVwAmOXEbvmhUkgUefNvslRdedAFAmDjZDcACgkQefNvslRd
edCzBhAAhISCDr8Wfc7MpwRLraXZJWKq7jNiDoSpBi8hwKhwVye9W3v8iKtRYofQ
m8pNKivkKYArFY9kFqTxoRvvFAoMeuwMIt4au3+R5aEOlm6RWh6rhkZtDrc8H9u/
kPRtYvYaurKw8OhMtafsQn6eTL0j543mcDR5t2s4o1rPW7XgIE2lepjp1VvU6/Rc
4rSlJpBRGMy3TdMA7nbOqLudMb34YL3SNll0xNGUpCFEqRQDWnjeSqTULQtPwUkR
S0A6++JsWcU57Vda3bxbKA/ItcfqpNDfA7+KphTrh0QiP99a22SadK9dDSB/j3yr
HO4VIBJX/hux/AjpQFJeDIQoOoXOwoak1X0aV5IA0+RVtzKOMZWq1bh8RPSKASGz
vbmI9KAz71FqooGW0lUVpIv/h4p8jXCdXMab7EDO5jIOdDmCTRMMBUkZtlnDsRWL
RxIuPuc6p49uZ2AzVlTgZ2A5dlXeMzNRgmTdLEdbHDg8fcOHgt+4jGeAzofFS/zt
vqrqenRIxBe8OMHZ4G4zdV6Wz9JxGkyfRtXZ46fUeHPEkH8bc8pQbNimb8y0Bojr
1UYcBKprHmnEs2kF/jW3XRciLbOvIEODEAipWxApMvc5IdzVyb+VKsEyQuiACanl
CEBb/K2e/77SMXuSTcanvbUf90hVRag+MeIHOhfFHfN4gKaYYkE=
=JoZb
-----END PGP SIGNATURE-----

--Sig_/TFdYKVyY9TJGsYdH9vBV555--
