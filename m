Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7DF2DDA4F
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 21:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgLQUvD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 15:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgLQUvD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 15:51:03 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C264AC061794;
        Thu, 17 Dec 2020 12:50:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cxkf44MXCz9sTL;
        Fri, 18 Dec 2020 07:50:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608238220;
        bh=S3cmhY3LlkmiCs8LciG44LtHUT+y0pUqc85nnsRMlxw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J57Cbmj6yS94085Ngclc7Uaxl+3ZVxbEVbdMXQNXps+IiQf67cjNSvd0Xa6qdG04W
         Y6iO5KOJC6m3aDZIrzD7Wsvs7F7UXD0MxK5LAhnsRUDUVFyhf9L4r9Wcnw6oF9IBm7
         3jV3Vf2GEv2A1xGpTdz8tH/WLWfMFCp6JwfC0kUilaliMIbr1LAy/fkhAnbv9EqXhc
         4veP1DNgrFJDbGEg2SaATH1QI44igzaosu1KZZ6pHalmsESoaDWpR+tKm4Qs47uQJ/
         UUtkMCyimClNw18qqplctIjRDZmOCbp0Ev90MFIEcwfMVEnCN9BuwriV/9Lvm59Qz3
         390Qybrdizsvw==
Date:   Fri, 18 Dec 2020 07:50:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Dec 17 (objtool warnings)
Message-ID: <20201218075014.70b286a3@canb.auug.org.au>
In-Reply-To: <3140d3b6-e1f2-38a7-60e8-8dca948f962c@infradead.org>
References: <20201217165304.42c98402@canb.auug.org.au>
        <3140d3b6-e1f2-38a7-60e8-8dca948f962c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6=XiT02swapFKo4b_Dduj8.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6=XiT02swapFKo4b_Dduj8.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Thu, 17 Dec 2020 08:46:03 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on x86_64:
>=20
> (These are on 2 different builds.)
>=20
> > gcc --version =20
> gcc (SUSE Linux) 7.5.0
>=20
>=20
> drivers/gpu/drm/drm_edid.o: warning: objtool: do_cvt_mode() falls through=
 to next function drm_get_override_edid.isra.30()

This one should be fixed by commit

  d652d5f1eeeb ("drm/edid: fix objtool warning in drm_cvt_modes()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6=XiT02swapFKo4b_Dduj8.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/bxIYACgkQAVBC80lX
0GwsvQf/aglUBremNbvm/qpDmu1krELk2lb13BP4nCpdAdZIRqw/6LGnYAGsxVya
+t7Hm6HuRIlbqa+Ht32TrMa4c/DsxaBf3fx7ZJhy/o2kod0wAQw8LIv8d759q/Mq
wb2P5Y1Lcw+M8gYjNy78+8vJr8RHsbzj/1c/AL2eyts5mVVfJyJuRUX7eTymNI0I
TwcVbucj4CnRzKRcJSBRN10vSj9MPQqhRgFVKvim3x9Ub3pryaQHnpslqFX9tCqa
I2HLWxXeRfNOwYsSE1A+1PaHTUNWfPdCIr9tt4HUpaMXheFRgteMxZuOzNa7R3cr
TV4cGKZgJDFkZuei8gwlszjEdUmu3w==
=iIek
-----END PGP SIGNATURE-----

--Sig_/6=XiT02swapFKo4b_Dduj8.--
