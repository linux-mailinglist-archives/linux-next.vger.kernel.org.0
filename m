Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09293E3D1B
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 01:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhHHXDY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Aug 2021 19:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhHHXDY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Aug 2021 19:03:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FC6C061760;
        Sun,  8 Aug 2021 16:03:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GjZW25BD9z9s5R;
        Mon,  9 Aug 2021 09:02:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628463776;
        bh=FdPjKZIYMQXQ+oBXEBzVzpzieXyHd8DHXvzoDOSQYQQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hLEbmd6Fc0JZcPtHVRj6erCeOJBlv+jqri2owYQlF3bHQbdlJTXagJ1DQSgPZpF+w
         /TZqKylF+DXJwywk93SmwxMmMKdu4pJPmc715y8ZMDgzrLaU1WuE9w+8mkhHcsdtFs
         27SEkVXu4++fiMkh5DBcQ8vi8fgxUGNQ3P/XB4Y5qM6bYrPpy0wW1j0zZmSaU39PCk
         IL3vt3xGjukMS9HCWiMLLPojb5ysmEepQEtlBnuoao3FJKigAuBfttK5p+arTgVQOB
         2Pa+aYgMrfD3JkX8IYVlSBHoTzXPdOP3vM8oafW2ODmHv/QMXF8za075WK20QE//e4
         ArRNO1wwpUUrQ==
Date:   Mon, 9 Aug 2021 09:02:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: linux-next: manual merge of the qcom tree with the usb tree
Message-ID: <20210809090252.477dd77b@canb.auug.org.au>
In-Reply-To: <20210806112353.GA33586@sirena.org.uk>
References: <20210806102138.27373-1-broonie@kernel.org>
        <YQ0YKiFVx0KrkW5s@kroah.com>
        <20210806112353.GA33586@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L_kmg7AJqdtdaKEkVzx4f0d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L_kmg7AJqdtdaKEkVzx4f0d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 6 Aug 2021 12:23:53 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Aug 06, 2021 at 01:08:26PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Aug 06, 2021 at 11:21:38AM +0100, Mark Brown wrote: =20
>=20
> > > diff --cc arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > index 78c55ca10ba9,31686950004e..000000000000
> > > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi =20
> >=20
> > Love the fix, did something go wrong?  :) =20
>=20
> The fix will be whatever was in HEAD.

I used the following instead.  Is that wrong?

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/qcom/msm8996.dtsi
index 78c55ca10ba9,31686950004e..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@@ -2566,7 -2572,7 +2572,7 @@@
  			power-domains =3D <&gcc USB30_GDSC>;
  			status =3D "disabled";
 =20
- 			dwc3@6a00000 {
 -			usb3_dwc3: usb@6a00000 {
++			usb3_dwc3: dwc3@6a00000 {
  				compatible =3D "snps,dwc3";
  				reg =3D <0x06a00000 0xcc00>;
  				interrupts =3D <0 131 IRQ_TYPE_LEVEL_HIGH>;

--Sig_/L_kmg7AJqdtdaKEkVzx4f0d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQYpwACgkQAVBC80lX
0GyHlAf/W9uSTM/OYgp2jMw9MfpMLzaJW1bF/LlALFksD5+89ZeRM6xPZCVufZDx
fpkIG6CUWc7tcZHMc+0JA/91FGz+tCny1TYgHnQDnLoSw9SGc92NN5zfUtE/gWhH
WyT+DHCr6UB425hTQRSLjc7idwJ5D31D2j+sjWUIJ/i9Krrcn1yx/eKoZJpJzFT2
n4zMsdYNVCp15oggIAKsU9vcGkk5hv5QirqZx7yb3k6U50/KsalUYPXsj4C6dgsy
cwBQKZXVR3c1GstGTqaSb/vuQxg57Y/tbspBimQG9Ij4uRAEr84VL/rtKX5YzWNZ
De3E1KSBm87Su1sZO9Ue3xUzsDzhcw==
=0F9S
-----END PGP SIGNATURE-----

--Sig_/L_kmg7AJqdtdaKEkVzx4f0d--
