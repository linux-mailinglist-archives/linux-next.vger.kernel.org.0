Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EAF3F5409
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 02:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhHXAOu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 20:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbhHXAOu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 20:14:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A274C061575
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 17:14:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtqNF1VGQz9ssD;
        Tue, 24 Aug 2021 10:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629764045;
        bh=1wHzsAmHrSZW0xq6f7z49WWAObuooJQZCRmdk/Odil8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OpsfPNPEF7zvVKScytNeCwP3L3uJXjFHJ5Y83qna/4S18OxhuqOTO/9iV3TE4f8Ef
         h7pl7x1fyhe7q1awkmIMS/unjY/D1tjpSnMXlI4bUHF4EWsRvuQ5n5L5WrNjJoufG5
         Qj2iTu5CuChYU8n8a6/mPgxDWrpRwpx40tHCaIqBm/G/5qjgPoy0ljVI+zo+bg/WC1
         q4rlwRFeEeN5Gkr53/S5m3vvFqECc0JPpsJomvsJY+sHo+uU+Ko8g7Kps/LJCr2RxH
         D9AoYgQOYXM7WZtYRjB8Wy7p8W7ThVa5LDDBOSQj/WOObdtvGf8yOjzlKztOaGzHQP
         51uvJXnGh1ZTw==
Date:   Tue, 24 Aug 2021 10:14:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Notable build failures in next-20210823
Message-ID: <20210824101353.68b6999a@elm.ozlabs.ibm.com>
In-Reply-To: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
References: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLZAFAP0Cg7m=+lZl3f7XVJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gLZAFAP0Cg7m=+lZl3f7XVJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, 23 Aug 2021 08:47:38 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> Seen in next-20210823:
>=20
> Building arm64:defconfig ... failed
>=20
> drivers/gpu/drm/mediatek/mtk_disp_aal.c: In function 'mtk_aal_config':
> drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:47: error: 'priv' undeclared
>=20
> and the second
> error was introduced by commit e2b44fa97cb8f ("Merge remote-tracking bran=
ch
> 'drm/drm-next"), suggesting a bad merge resolution (?).

Yeah, bad merge resolution on my part.  Fixed for today.

Thanks for pointing it out.
--=20
Cheers,
Stephen Rothwell

--Sig_/gLZAFAP0Cg7m=+lZl3f7XVJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkOcwACgkQAVBC80lX
0GziWAf/Vr5HR5ato32GJfv0oapzVmLg0ozd3AUBrYp+Ece0VNUlbcO7DXufs+5e
7q7yL+K8+nCtJExrXsvcuujNrwFsbas5XS2nsHkn4LySTbD5tE4MG+WGNCUdwPhC
4Q2W7uiu1IvRPi3yvKOk16MEpt4WWIKIpxYLQ14YuXbUl3zNZcGExORScoKkSOYt
qF8pPBRPd9jHj1nSuO+OixaO59I2qm00Vmu8C3v/ybh33mAfV18vYN7gpaiSinOF
4jhrrqPVetTbr9f0HyRVWbIrsgr+hjKsXNeTf1HdL94WeHc//FjUCE1aIg5/x5ea
QlValqm/6pva7bFavVKkxmejtInAGg==
=jS15
-----END PGP SIGNATURE-----

--Sig_/gLZAFAP0Cg7m=+lZl3f7XVJ--
