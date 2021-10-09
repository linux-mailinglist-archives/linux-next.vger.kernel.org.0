Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A0C427776
	for <lists+linux-next@lfdr.de>; Sat,  9 Oct 2021 06:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhJIE7Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Oct 2021 00:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIE7X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 9 Oct 2021 00:59:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370D4C061570;
        Fri,  8 Oct 2021 21:57:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HRCTs3Gfmz4xbV;
        Sat,  9 Oct 2021 15:57:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633755441;
        bh=kvTdE1xwFU52ecxKGXJ/Il5ls0/DSHeWi+HYNCbNm6w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vELj9wXTmrKljHJoiy+w9gQDD1p0QZzQw5YhkwaSbdjH4k3XVI4guGxX0ad31wCY0
         P8ORj7m3DfG8pN/sJpC/83T+p+hIzXxsA+ceSSiKi+9wfLCy0WTl6046UhYRttKCvw
         1AxqjE1sBG1js+IQWJ1eRuN+kkIpRelq9TwYsST44jiKBvPUpMEbX7PxRG9fi5gzz2
         m2PQefqcFxmCQ1jrWjqCh+qDd4cWkLyVMKp7l0o6O73q3a99U4iI/5CgvNMXrrhwuc
         2PYJnE/X9qP46sH9eJ9QWqLUU4SwmPlBAiXi7XBxOGAreNi8gI8jfH3NpVhmcnNSsY
         H/Ajy08T44hCw==
Date:   Sat, 9 Oct 2021 15:57:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211009155718.50655bd8@canb.auug.org.au>
In-Reply-To: <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr>
References: <20211008113116.4bdd7b6c@canb.auug.org.au>
        <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr>
        <20211008192910.600a188d@canb.auug.org.au>
        <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u+go1SMTgmhAVuoC3nBeQ.3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u+go1SMTgmhAVuoC3nBeQ.3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, 08 Oct 2021 09:22:16 +0000 Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, October 8th, 2021 at 10:29, Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>=20
> > That symbol (get_mm_exe_file) is not exported to modules. =20
>=20
> I see this:
>=20
>     EXPORT_SYMBOL(get_mm_exe_file);
>=20
> in kernel/fork.c

That was remove by commit

  05da8113c9ba ("kernel/fork.c: unexport get_{mm,task}_exe_file")

which is in v5.15-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/u+go1SMTgmhAVuoC3nBeQ.3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFhIS4ACgkQAVBC80lX
0GyHLAf9HsuKfJek7rTwY0hETY+XpvZyLlQKrRSjkU59jHxkpVvBeq6rE7Das/Fd
zJFlnekut5oV9SddwPbeONlOeXCA+xBWOucm7CiWfSu0d05VogldZUf3GvJix9Y4
UBk1E1U5gHjeWrSdV56dsNhSnEytPh/MW/gv4DsFen/3FogyJC1JOAuTzzxUbyFl
q6vAc/eu7FPVk16BOgjHDvHtLfyKbnawrgmswQnDCuNByiZLvcUrXq2S7q77mYj8
rne+zAYeZQF/HuQ6W6ojGfzzmCWEi8wmWz5QmFUOaqIxoqo2jMOSzujocCBDXMGa
5vWXGdYswaG7fTmtBKgkEquCXvNeBw==
=N0kh
-----END PGP SIGNATURE-----

--Sig_/u+go1SMTgmhAVuoC3nBeQ.3--
