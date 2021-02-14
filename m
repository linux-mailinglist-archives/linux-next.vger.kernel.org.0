Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF8431B289
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhBNUt5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhBNUtz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 15:49:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CC0C061574;
        Sun, 14 Feb 2021 12:49:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DdzqX5x1Bz9s1l;
        Mon, 15 Feb 2021 07:49:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613335753;
        bh=/zVETE5aqasl3AxNIJh3u+VAh1g5klGO4fBEG4Em/Oc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kcU8pTArbj54db0/c8VuKWZwBLfn6K0Jg5ptQyJi0hzyc/0PKQBVKsAAMnNH1Dd2i
         c/dEZseENrD+aR6Y8ZPrMOh5QG6+XgIvsRPgjntpepZaoxzFzHHsroLiSLblOpOhj9
         GUubHAm1N0tIGEVYUO93IQGNASxO9YBiVrFly7peKmfqKWFepC4w6cvbTDB/rKaJXK
         oRxSKZAs3JvGP/CF1v7lOdA5PvZj+qtHMAN8NV+qfEnaCHY61WVSS3NrcivbBdZd+u
         KRnHp9ajeJV4eHn6Z2vBFeyvv2HGusVgi9MBtmarHrc2MzH+uSUvWsq1gN3mIGIvOK
         msiJ3c/C0rdmw==
Date:   Mon, 15 Feb 2021 07:49:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the hid tree with the qcom tree
Message-ID: <20210215074912.667768ff@canb.auug.org.au>
In-Reply-To: <20210119104536.50e08bac@canb.auug.org.au>
References: <20210119104536.50e08bac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7O3eVqM7gEidDlAN9_Ud=4+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7O3eVqM7gEidDlAN9_Ud=4+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Jan 2021 10:45:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the hid tree got a conflict in:
>=20
>   arch/arm64/configs/defconfig
>=20
> between commit:
>=20
>   74b87103b3d0 ("arm64: defconfig: Enable HID multitouch")
>=20
> from the qcom tree and commit:
>=20
>   1fe16cfd311b ("arm64: defconfig: Update config names for i2c-hid rejigg=
er")
>=20
> from the hid tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm64/configs/defconfig
> index f2107444df08,326198305beb..000000000000
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@@ -756,14 -746,11 +756,15 @@@ CONFIG_SND_SOC_SIMPLE_AMPLIFIER=3D
>   CONFIG_SND_SOC_TAS571X=3Dm
>   CONFIG_SND_SOC_WCD934X=3Dm
>   CONFIG_SND_SOC_WM8904=3Dm
>  +CONFIG_SND_SOC_WM8962=3Dm
>   CONFIG_SND_SOC_WSA881X=3Dm
>  +CONFIG_SND_SOC_LPASS_WSA_MACRO=3Dm
>  +CONFIG_SND_SOC_LPASS_VA_MACRO=3Dm
>   CONFIG_SND_SIMPLE_CARD=3Dm
>   CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
>  +CONFIG_HID_MULTITOUCH=3Dm
> - CONFIG_I2C_HID=3Dm
> + CONFIG_I2C_HID_ACPI=3Dm
> + CONFIG_I2C_HID_OF=3Dm
>   CONFIG_USB_CONN_GPIO=3Dm
>   CONFIG_USB=3Dy
>   CONFIG_USB_OTG=3Dy

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/7O3eVqM7gEidDlAN9_Ud=4+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApjMgACgkQAVBC80lX
0Gy+mwgAkvgC2inoBJTgz7BAygvtdMLhh6eD2+TqCPzyC1Hf/ck7EM0DpNNFN1JE
8JS7Xy2s1oHkE3papehH9kG/jIOwYwnB2yim0r9X+JR83d8ZCKaG/gdvjeNnjAyW
dn5Rd4amjrFD8YXYfwJ+4ar7Pp0tMQuZ2y2k9tEVR8ao24Lw/p/aqWRV+7lu1YUl
5GxNyF+UxeK6nSW2v3dePWoMqTiTPw40zqSYgOH2Jpt6ZMpQLvcF1/wD1ZRW0eKW
EQ1jn7ozUTkz0FkMmj9XlGGbUoeDlFFJ0Yb0wYp/t2MY58YAszu0sjaVnqZB5i1F
eD7keMaoGkHNOMnkeOs5HnEKJ3RH3A==
=NPw1
-----END PGP SIGNATURE-----

--Sig_/7O3eVqM7gEidDlAN9_Ud=4+--
