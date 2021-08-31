Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F793FC000
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbhHaAdX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhHaAdX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 20:33:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BCFC061575;
        Mon, 30 Aug 2021 17:32:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gz7S65yg0z9sW8;
        Tue, 31 Aug 2021 10:32:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630369944;
        bh=LhdBKPsFY2Teh7WbthD5Ps9+cXQ1553ImHKbZoLdgiA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FlV63Y9Z6Pb72G6ka5kPL9RZpySjWezsyIyCdfcAso2gACLkt52SLTehB6YfrmeOV
         HR/CiJJPPEWU0BkAhYVZVI1h+LRYikZM9zpd1436uujQgBWb2PnfjEG7MtFnygBJNp
         LqonHnHuZaVeDumnPj4YkTn8gKXO9U7MRVWEQ7C2Cvs+tjKsLjYtndecVSJ9Y59BEX
         URIoM4Xoc31ipN4XN6IARGO8xxhgxyFxtAlvd2jSmwmpSEs+SHwvQzONeZhf7m/IIl
         5OG4Sz1aJ27w6VeOQKiFx8RlU7T7LfoUr2PsOUCrTJsTYzRPFdeYVOGeI1p7/C2qJs
         21B31fCxOVanw==
Date:   Tue, 31 Aug 2021 10:32:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the chrome-platform
 tree
Message-ID: <20210831103221.4aa2eae3@canb.auug.org.au>
In-Reply-To: <YS11KS/XAGgTM5iQ@google.com>
References: <20210823152134.00d95cb4@canb.auug.org.au>
        <20210830172132.4fc0ae7f@elm.ozlabs.ibm.com>
        <YS11KS/XAGgTM5iQ@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XuVWglZNs2CzsJK2iPLfCbj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XuVWglZNs2CzsJK2iPLfCbj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Benson,

On Mon, 30 Aug 2021 17:17:45 -0700 Benson Leung <bleung@google.com> wrote:
>
> On Mon, Aug 30, 2021 at 05:21:32PM +1000, Stephen Rothwell wrote:
> > > Introduced by commit
> > >=20
> > >   d453ceb6549a ("platform/chrome: sensorhub: Add trace events for sam=
ple") =20
> >=20
> > I am still seeing these warnings.
> > --=20
> > Cheers,
> > Stephen Rothwell =20
>=20
> I've just pushed this to chrome-platform's for-next:
>   5a51bdb0ae26 ("platform/chrome: cros_ec_trace: Fix format warnings")
>=20
> This should fix those warnings. Sorry for the long delay.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/XuVWglZNs2CzsJK2iPLfCbj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEteJUACgkQAVBC80lX
0GzOTQf/SEjvRYtEG1BA+9Q+RgixyFHQwC8cY0Hv1sxFw1IbVGwMreGFRf9h1FZ+
dBbP8OcFX4KhBHkw/8BaF+62rVvVmptTs7bXQLq/aiF4zvuY6DRynglYi01DZzV8
FJcNHF0Dljz8o8HhgsLRyCyqke0llG0EThvLQ8bX+EMPPMleNFOPwe0ufhlhJ93c
QbK8T++rsBrub1+mqvXvhrrEArHf35tIq7bAukCviNQ1Yr/FkUoioIXOtCr2yURs
dk5f7RCPGnZuwDMKd4ZmatuofMk1IRijMME8ifC1DAN+Dw1JyQa42ib70COvtwln
nNLMtpPLNSrWP8Nmmv4z2T/3vZ2L2w==
=eQiz
-----END PGP SIGNATURE-----

--Sig_/XuVWglZNs2CzsJK2iPLfCbj--
