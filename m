Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5594A436E18
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 01:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhJUXRh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 19:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232282AbhJUXRh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 19:17:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FBFC061764;
        Thu, 21 Oct 2021 16:15:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb3H95FG7z4xdQ;
        Fri, 22 Oct 2021 10:15:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634858117;
        bh=zGLJenURHHt8jck4mkWKA7oPW22QVMmOYjxoXknXqdM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VoKi/CNi+qhbHtBv8m4FpCwJEis5BOkIDJpkDcDx5L3JydcElVz0g3R8s13mzH99/
         E5Ha3SF/r54T7owkRnTFkwK4Riw0N4GBa3QpPhnP/FE3937yOqk4I4Xp/d6hImE95S
         kHFxfqb4pM5QKEXaGCsu+BHdoPierDWCYVzeda84oOgEYe/pl42KN5TWbiuvJEK8Vv
         sMTtjGb07zo7iCcAKFBLypROWoAwGilnVuyXojwZtF7IxlN6yZeutiPdTaQ954NMVB
         rfuZzTC1b0tPLuLKv9BmB9tj4HFJfb/hUEgmxgiSXdoZvQLw6FOF7cTn6nu9R46SNt
         w0siaGf/y8S8g==
Date:   Fri, 22 Oct 2021 10:15:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fscache tree
Message-ID: <20211022101516.7877fa7f@canb.auug.org.au>
In-Reply-To: <738109.1634826774@warthog.procyon.org.uk>
References: <20211021122909.0346c093@canb.auug.org.au>
        <20211005204613.53cbdfb9@canb.auug.org.au>
        <738109.1634826774@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YJJXyfdgsUPEV5V6D/z_UyP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YJJXyfdgsUPEV5V6D/z_UyP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 21 Oct 2021 15:32:54 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > > Documentation/filesystems/caching/backend-api.rst:402: WARNING: Inlin=
e emphasis start-string without end-string. =20
>=20
> I'm not sure what that even means.

I assume it is referring to the "*cres" with on ending "*" ... I am not
sure how to quote the "*".  Maybe just with \ ... or ``*cres`` ?

--=20
Cheers,
Stephen Rothwell

--Sig_/YJJXyfdgsUPEV5V6D/z_UyP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFx9IQACgkQAVBC80lX
0GzHWgf+JAECh71zG7lnuaSRZ9OytX57Er+KqH9tWeMNsbpKwsY4xCJufdVaZdes
s8ZaB4p3GwjfDVmN653HCpNejaCsjWRLPgZPFr5H3Co3LJt4eN/P0PQUT90y6EoF
bMgOp/lDOrbJ8A1/2Jgbf5MwRU3Qc5qIJPKgsToSElqueeSYts+LbZtWOxBCKIoy
PbIZP0JLSKyxcMxTITH0+gS8mhXRgrjv25+BTggr8AXLwOXmUii+eyVSx7eqwGqL
pRtuOK6R8ueQ0Ev9rGvqkK6kxNcPAX0ZcHUq900GFcXgBNjXKakiWvEzn+VmwYzq
Sz1bmp8d6wGoaujYxHvwOBA1riXh5g==
=/ggr
-----END PGP SIGNATURE-----

--Sig_/YJJXyfdgsUPEV5V6D/z_UyP--
