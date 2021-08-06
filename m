Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020B83E297F
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 13:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbhHFLY0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 07:24:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245465AbhHFLYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 07:24:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AEB461176;
        Fri,  6 Aug 2021 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628249050;
        bh=dFhpkoJ7MfTkaqb3AWepwV1LJZX0iriP7IMwTHp77uI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bcETpNsVaE6/DYkXDUj1HNemf4ajaX6LWB0jKe4nKiaMwU6y1yXOPkvWpRXE7qrtu
         X/Xmfd62juU2QfJ+43lt8ccmKukEyl5GoGHtI8JN3IXAIJBjy8ebJqW+vuVPRlCXni
         zzVNWY2MGml9jUSxuOl2Uobd8Mjwka0KFKkYZJfItUXy4Mw8nlhoOobpvb7YtW7jOJ
         0y6yn3gYzoK4btegAZnQXbO4X/5l0SM+hG59q3bRzoobTr2iXicKtNdtdO7QH68Ug5
         JsO4zKw7wboauPXoPkTBF8vuZUgzm7gGsTj1yiCt45sKWHOdaV53heEA9QjAHCVJSH
         zgZpOkaryhO1Q==
Date:   Fri, 6 Aug 2021 12:23:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: linux-next: manual merge of the qcom tree with the usb tree
Message-ID: <20210806112353.GA33586@sirena.org.uk>
References: <20210806102138.27373-1-broonie@kernel.org>
 <YQ0YKiFVx0KrkW5s@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <YQ0YKiFVx0KrkW5s@kroah.com>
X-Cookie: if it GLISTENS, gobble it!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 01:08:26PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 06, 2021 at 11:21:38AM +0100, Mark Brown wrote:

> > diff --cc arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 78c55ca10ba9,31686950004e..000000000000
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>=20
> Love the fix, did something go wrong?  :)

The fix will be whatever was in HEAD.

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmENG8kACgkQJNaLcl1U
h9D6zAf+Krf2wBiZrjp3SHLH7WN1Zlx4aBn+fs/Ky3GfoHG1LF5l2XfZOY1M7iT9
QS3UxCCbQ3MPsEM81qkByUgKaSgf4xE/lCx3vgfCsjiIGH2ZPlQQyHp47ungmCui
/+r7WLcEwoHM6B31P4hq2JVtBCjR9enCiJ5DQfDRIgONliyrJDe01veTvSKuHzBb
A9aadg31bFPMrkvoToexpGppL7Vmta60JVl9UFYWruwCJP+lCh2VSDYUFnifzxUj
B5Sved8fZ83RlQgOEPD3svQRWmhNPO35Wvo6Tv8SAuan0K4+19yRJQQR9GQxHdW4
3gFnewCj/mChhXW4GVOQoE9OAysPKw==
=TJYa
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
