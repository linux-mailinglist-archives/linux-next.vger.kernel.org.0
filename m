Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D552B756D
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 05:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgKREjQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 23:39:16 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgKREjQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 23:39:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbVSx5BS0z9sRR;
        Wed, 18 Nov 2020 15:39:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605674353;
        bh=Gucab2yI14o6zvvOYqLkW+9J8GFKEzd/VbbCZuXBYiE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KeEohY5wFCYEz90vSl6jMYLsu0JwUxda0yFj+FR2BUm+hwaxhcKK9AddF0w82et2O
         m37jc6lK+AsMIK5qOx3m8+PhsIsN0nU9RkWVkjqL8hcodvexRydZMk1smwF3R9DhCp
         SD437hOdU150fXbJ9mvcqkrJzNrIcYqGgJF2BWD8+J19YjQtknmr/PykUJAOhxnA/W
         zBw6yLgPgzMNAyfTyE2BWe3FKuwWgkLgnLYa8lJp/BBGhTON2rztswePpP7JP6bSMM
         KIOhk8l7EYiw6Flb1bddb+V8kHDIeTeu63K1JheeGis0XcD0WMB8oQNPsUaFi2/+9E
         fkvJLQO7p+Lig==
Date:   Wed, 18 Nov 2020 15:39:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201118153912.1decf6cf@canb.auug.org.au>
In-Reply-To: <20201117042359.GB7787@work>
References: <20201117151225.6a50abf8@canb.auug.org.au>
        <20201117042359.GB7787@work>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ogDxEJSofVVf92VZ1KduOKX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ogDxEJSofVVf92VZ1KduOKX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Manivannan,

On Tue, 17 Nov 2020 09:53:59 +0530 Manivannan Sadhasivam <manivannan.sadhas=
ivam@linaro.org> wrote:
>
> +ath11k list, kalle
>=20
> On Tue, Nov 17, 2020 at 03:12:25PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the mhi tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct mhi_channel_=
config' has no member named 'auto_start'
> >    27 |   .auto_start =3D false,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct mhi_channel_=
config' has no member named 'auto_start'
> >    42 |   .auto_start =3D false,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct mhi_channel_=
config' has no member named 'auto_start'
> >    57 |   .auto_start =3D true,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct mhi_channel_=
config' has no member named 'auto_start'
> >    72 |   .auto_start =3D true,
> >       |    ^~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   0cc1f3a385b2 ("bus: mhi: Remove auto-start option")
>=20
> The fixing patch [1] should've landed in ath-next. Kalle can you please
> apply the patch on top of immutable branch?
>=20
> Stephen, feel free to pick it up in the meantime.

Why isn't that "fix patch" in the mhi tree (with necessary Acked-bys)?

--=20
Cheers,
Stephen Rothwell

--Sig_/ogDxEJSofVVf92VZ1KduOKX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0pXAACgkQAVBC80lX
0Gyl0gf/XjG1Uu80fmwth2c0nFuemW4VyqKUBgQGUNNIBi5Z9Y1rB6D9fig0gz1W
byX+37r1JGxcw8ed6JTriRLQPTi0IemrTP7BbZ4QNDJwYjL8IAE9yIBeH+5UbvcP
+k+eEpQIMezgKcM/z/n73NxNQR2QnHIzF8wKuIpCcnRoEXaezKLxEH0ZBkdaiU40
j2Vcxx9lJKZoAbt5ezCDRmTHfucxeAPMNKNZw01nVjtxOoBEZA2nbtHVo//943q8
KnVtgq5ld7PIvrrnc0UEPYZsIbr+U58kuBCvdnot4KqB50MIkCTf1PkY/92QD3Ee
fXdnxhXVWw4MWzDowE3WLoXsGKNCyQ==
=dRxm
-----END PGP SIGNATURE-----

--Sig_/ogDxEJSofVVf92VZ1KduOKX--
