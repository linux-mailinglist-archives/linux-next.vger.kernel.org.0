Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7168F2A038B
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 12:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgJ3LBN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 07:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3LBN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2020 07:01:13 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1A2C0613CF;
        Fri, 30 Oct 2020 04:01:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMzrN0dlRz9sRk;
        Fri, 30 Oct 2020 22:01:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604055668;
        bh=uEbNdyWgkBsqCmRQGYsCDMHY6jZJ6AZC3FBmS5PdPko=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P6nJ4foGeNUjTx8BdAOQPEfmepgGMSeAY4Fc2QIrkmPkk2b0A5RkMPazJJ6Eoy6TO
         pRd3CWCF5Dlpv+td3uVxGp1zRzmxh55az7LAdgV5vOyoV+A1aBwvwzIdYNotm5F5FO
         9C4r9yVCKbWIWcB3BDrfLDnAATqLkzEnPCu8KG96ep6Lo8uEG/snpguh9/yRyY1ccO
         STMuLVzI0yRSqLxnaMxRMhRy0u1ALudNL1bgYKq8F1ZUB74w/livobnky2ZXi47PGZ
         gZQYAqv6Ucd8/h3sW2qcazuEkWWOUle+3jCB5KlWtFPvPMGm8SQvmWNPwanTCFLtsg
         awhAXWavMDZDw==
Date:   Fri, 30 Oct 2020 22:01:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: failure while fetching the pinctrl-samsung-fixes
 tree
Message-ID: <20201030220104.5cb6b2c1@canb.auug.org.au>
In-Reply-To: <CAJKOXPfy-iXsL43S2AYrOXGzbKjxi_Cp6BvP5zNTGGe9+G3V9w@mail.gmail.com>
References: <20201030081018.11279822@canb.auug.org.au>
        <CAJKOXPfy-iXsL43S2AYrOXGzbKjxi_Cp6BvP5zNTGGe9+G3V9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bHnf/VFzpfbF5p.oxx3B4AB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bHnf/VFzpfbF5p.oxx3B4AB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, 30 Oct 2020 08:41:22 +0100 Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
>
> On Thu, 29 Oct 2020 at 22:10, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
> >
> > Fetching the pinctrl-samsung-fixes tree produces this error:
> >
> > fatal: couldn't find remote ref refs/heads/pinctrl-fixes =20
>=20
> That's my fault - I wanted to have unified naming across by
> repositories. Could you start fetching branch "fixes" instead?

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/bHnf/VFzpfbF5p.oxx3B4AB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+b8nAACgkQAVBC80lX
0Gz+ggf+KISLVg+n1DviT0rgLLOWI+BQDrbaVSxcBRcolUFbmsQuRuJHQm8Sh8cY
TpAh2ycotVwkH5C32+K30w3vWKBjcFjaAmNr+ZItsDA8S+GZgQtjLwOEahHN34oI
1J33asOIB9pMEyRM0Lv7r6M98NeRMelMk6je1WrfklZ7OAaaSOoO0OjKBzhb8LHc
oY2lljhXEVov1L4Vu2V/xvcWeKequ5MrCKuSWNiMyh7Vx/LnGHGyjSJy5OFVdmMI
1PToUwoB9gi6ZvQq46YwhJbH07R2n4vfSdque7mwKdSzs8xvReBKDOvMaNrv4UFr
aMQ6XhD75qZCNGTBK4+N6QmD4ajo4g==
=trig
-----END PGP SIGNATURE-----

--Sig_/bHnf/VFzpfbF5p.oxx3B4AB--
