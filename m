Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FD73F94AE
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 08:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244310AbhH0G7O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 02:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbhH0G7O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 02:59:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0720C061757;
        Thu, 26 Aug 2021 23:58:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwrCM3n1Qz9sPf;
        Fri, 27 Aug 2021 16:58:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630047503;
        bh=oC3JXl0WYeJRX+mKxO79pZ9PI24fJsREzlFtXIIzK3c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qixaTv09i9jJiqeSWEj7f9c4Rsikha4sw8a4GHaoZBZEpp1itknG28NlbY8Rm8UvI
         U4pcsZNxJaam9/4fWDrkXvwVKidODv9i2Lec2ZtavH1cvS5ppbfT62uwfOU0x7az84
         40+xvDtoDbUwzr61MIUIMdxb7nqmNhrym5NM1iLX23YKwbkaVujBbyxG4JRUh//3zJ
         xFN8aMl+QcxsrxlioycNrwiidrz373U+MELDpBdhHg70dvs9F6r7A/HK+/SF1oxKiR
         O4K1DAH+5c8SiZDzNbcYtlatmWfU5Rfpk3ZyGlgtYcRix0OZzJdlONYFZjcFpLITI6
         C/iRmWq5e/ZQg==
Date:   Fri, 27 Aug 2021 16:58:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <20210827165822.7186411f@canb.auug.org.au>
In-Reply-To: <20210809171023.4d387ed3@canb.auug.org.au>
References: <20210809171023.4d387ed3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a_8TFRCye7TzpJsn2JsL=KM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a_8TFRCye7TzpJsn2JsL=KM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Aug 2021 17:10:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the phy-next tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
>=20
> between commit:
>=20
>   e516ac5d48fe ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC72=
80")
>=20
> from the usb tree and commit:
>=20
>   1a00d130596f ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for sc81=
80x")
>=20
> from the phy-next tree.
>=20
>=20
> diff --cc Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> index 20199833f144,1d49cc3d4eae..000000000000
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@@ -14,7 -14,7 +14,8 @@@ properties
>     compatible:
>       enum:
>         - qcom,sc7180-qmp-usb3-dp-phy
>  +      - qcom,sc7280-qmp-usb3-dp-phy
> +       - qcom,sc8180x-qmp-usb3-dp-phy
>         - qcom,sdm845-qmp-usb3-dp-phy
>         - qcom,sm8250-qmp-usb3-dp-phy
>     reg:

This is now a conflict between the char-misc tree and the usb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/a_8TFRCye7TzpJsn2JsL=KM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEojQ4ACgkQAVBC80lX
0Gw8Wgf9EeOkQH9pHRXGU/jmX2NuDr0KYxxAfecTlRoP3VsD6qEUNV1uGiZf1W/9
e1ugF0TfiRZkRU7moWe+fx5ebH82LHkDA+p6tyds2RjkBiHIPsck8mz/2KkKa+pq
BDhTc71cXIexIzR29WEbENirj2yLGnLVrUhxmHA2AqfHQ5slq65AilHhgRASmHD0
7Y4VXrn/6vYUczJ3pTZgklk20cGeZsSvh1qETN0jss512w2V2Op/pPs1XK2c/Frc
YHj4RafkfZtH9wJK3aKILIUtz64Hh7d50cPETt52/uBB/k/pUi4flAcOGDdCyW9x
fkoNi2IaqR/mxUOaM+zuXglWkuZxrA==
=TzOk
-----END PGP SIGNATURE-----

--Sig_/a_8TFRCye7TzpJsn2JsL=KM--
