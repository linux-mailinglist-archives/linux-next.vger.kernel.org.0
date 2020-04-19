Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962B01AFEE5
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 01:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgDSXgI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Apr 2020 19:36:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgDSXgI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Apr 2020 19:36:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4955mz6zkgz9sP7;
        Mon, 20 Apr 2020 09:36:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587339365;
        bh=FSebgOkL50kUcLV38jVgyrcFXK82rcTF/lrCvgcSr0Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VTipk5WRosI8k6dLEgpS9VNCdzzkHxecSEDBlJNDVSwmPVs7BlkXxWEGNDVLcxeep
         v1NDw61wQBFd2p7SzesXxQw6wnhiIv7nNMriPNsJhPx3OfX3F5O8xdHa50EioTakXy
         pmO5W0D4uNSUMbXEi7gbq+phuy4mnQEZjgOFNAICveY10wMDso1qQgQ+H+qvlcdSYU
         GtfwRtRYzGTb6RxYw+azwKxE9V7uKtbD4ZaE4kxtu1A9FNqRmnCUw9XEyidsQx4fXq
         yThSWHVVRWlSjEXX/TiRYoGU8S6Y9GermmMKjwQX/OPL120Z2ol8PuRr41FE45DFpK
         JNV6M9EVZnq5w==
Date:   Mon, 20 Apr 2020 09:35:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     coverity-bot <keescook@chromium.org>
Cc:     Manish Narani <manish.narani@xilinx.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: sdhci_versal_sdcardclk_set_phase(): Uninitialized
 variables
Message-ID: <20200420093556.27bcd407@canb.auug.org.au>
In-Reply-To: <202004171451.9D7ED8B@keescook>
References: <202004171451.9D7ED8B@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EW4_YNAD5Wec2_8mPXzwwYW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EW4_YNAD5Wec2_8mPXzwwYW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Fri, 17 Apr 2020 14:52:01 -0700 coverity-bot <keescook@chromium.org> wro=
te:
>
> Hello!
>=20
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200417 as part of the linux-next scan proj=
ect:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>=20
>   Mon Apr 6 23:13:31 2020 +0530
>     f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")
>=20
> Coverity reported the following:
>=20
> *** CID 1492645:  Uninitialized variables  (UNINIT)
> /drivers/mmc/host/sdhci-of-arasan.c: 784 in sdhci_versal_sdcardclk_set_ph=
ase()
> 778     		regval |=3D SDHCI_OTAPDLY_ENABLE;
> 779     		sdhci_writel(host, regval, SDHCI_ARASAN_OTAPDLY_REGISTER);
> 780     		regval |=3D tap_delay;
> 781     		sdhci_writel(host, regval, SDHCI_ARASAN_OTAPDLY_REGISTER);
> 782     	}
> 783
> vvv     CID 1492645:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "ret".
> 784     	return ret;
> 785     }
> 786
> 787     static const struct clk_ops versal_sdcardclk_ops =3D {
> 788     	.recalc_rate =3D sdhci_arasan_sdcardclk_recalc_rate,
> 789     	.set_phase =3D sdhci_versal_sdcardclk_set_phase,
>=20
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>=20
> Human edit: also on line 860, same issue.
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492645 ("Uninitialized variables")
> Fixes: f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")
>=20
> Thanks for your attention!

This was reported elsewhere and should be fixed in today's linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/EW4_YNAD5Wec2_8mPXzwwYW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6c4FwACgkQAVBC80lX
0GydSggAl3dZEUDCr/39mSr9q+QgPPjviSX7bgN7x66acOgMMR+gVHpGJzguEOF0
3DFUPsw1OwPFzuXQNew8r+4Kavb/nj/gjOrbKSKyG+g0ggflV2HcBfXMlOm0CI0B
0MD5lvtf5MpG+sXDP7dKkZUaXfdWRUwTFhY15B+5DCvl83IW+4LbiIeudmSB65kP
IfJWL7unH1t4RfzgYdz2/q3U97o7ZInx+I0jULRwukJUn4qdFPwwHgKNjX40seAj
38OlVn7ObnEXvIQG65wMWnKezEcpVfNZmY6Swlnr1GO4/uRnMmnnpv0VcD+Upidy
Bzs6B3Ewf5rvxhY4Eb3mrGubvlzxPg==
=Q63B
-----END PGP SIGNATURE-----

--Sig_/EW4_YNAD5Wec2_8mPXzwwYW--
