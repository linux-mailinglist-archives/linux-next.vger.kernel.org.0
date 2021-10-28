Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411CA43EA05
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 23:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhJ1VMm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 17:12:42 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35679 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhJ1VMl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 17:12:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgJ9c2s6Cz4xZ1;
        Fri, 29 Oct 2021 08:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635455413;
        bh=IyHTHI8wfsJBwIWK15vm9EIrjgKPX5C+Ahx30g+k4QM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CoFrOh9xrLI9Tpxew+cQ1nlU4hQp81S8j56ACywyrUNz/RgmOIFe1aIS8BrO35x+Z
         tvAIHDa3m/3+tj1XpBmX5F1O2EMGMdQxyPkuSizFMMHCm+EcWXQx6mxugOs2cPefYs
         tGaELKWDcK718xayKVlEEfgm31tRh8FXIMxkC6vXiAnPZZqefHZdM2CTMLrpGYHxx1
         VtgBC1cHqtqWePwgx/Yvpy4L5+NzfKq/vCkElnazkHITEvVRnXe+mu/C5O9Suev98L
         idWRnfz9U6gbUvuTP8WisYzUNUybMP47uwlvQsS4iDdNbsug0Fo+jMzwm86HvDYGQz
         cZH17bmPL7Slg==
Date:   Fri, 29 Oct 2021 08:10:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211029081009.0fd1a83a@canb.auug.org.au>
In-Reply-To: <20211028091646.15f6e6de@gandalf.local.home>
References: <20211028232345.5ffa43bc@canb.auug.org.au>
        <20211028091646.15f6e6de@gandalf.local.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VfXdm/ixJMWpftaaH9_SGGq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VfXdm/ixJMWpftaaH9_SGGq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Thu, 28 Oct 2021 09:16:46 -0400 Steven Rostedt <rostedt@goodmis.org> wro=
te:
>
> On Thu, 28 Oct 2021 23:23:45 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > After merging the ftrace tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis start-=
string without end-string. =20
>=20
> I have no idea what that means.

I assume you need to quote (with '\') the '*' on line 1767 (?).

--=20
Cheers,
Stephen Rothwell

--Sig_/VfXdm/ixJMWpftaaH9_SGGq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7EbIACgkQAVBC80lX
0GzSUQgAmG5DznI57UeGjxA7tQfKgmfGK+XCwU2PEfeteT5Qf4KWcRIp4PWIk5N2
JIPCsw3YzOORum2ICk698gXE60PFspkF2+Bf/1sAKiFRWcaF0NsqLNPZu32CQ+Vp
zCQT5VL2h7Zca3HA4Pv9I1VJmVanWUStuG9EpqDoOYF/ZgoZJb6+/HJY9RU12pfk
/BcorzAXACLhTjA9Ryj2WCnTApvYlfCDHasIORhDmPPg1sxO4KV14dC2yV2Wv0Rr
wKyYLm+O8LvY9tRECRGCZJCLV0erbTb5BOprzoh1p2s71CCyc5JtseJrMvVrzGJD
fTlxHcMyr8JSIult+OP1e5VojIj/wg==
=8s/S
-----END PGP SIGNATURE-----

--Sig_/VfXdm/ixJMWpftaaH9_SGGq--
