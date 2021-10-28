Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A29743F2DE
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 00:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhJ1Wj1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 18:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhJ1Wj0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 18:39:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AA4C061570;
        Thu, 28 Oct 2021 15:36:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgL5g0wZ4z4xZ1;
        Fri, 29 Oct 2021 09:36:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635460616;
        bh=9eeQaGQGPYKxTDsNj7/Y6zXShdllX9TeK91s4sW5YQ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kpz2kWSpERt7NZ+WtiyNmuBmaCd/sXR5/cRH27JX+kLZga66L454mEqU4TpeKiVvM
         v3yRoNGSHvsrUX3sQFJ2EVX3pJRo7+G/3by4q6UQkNRBk9Fm5zPZaAc8uWZqXe90Nc
         R421LNhttswEDepiTKj+ZRObI80HcBLXu95QTcVJ/OP84kAPcilJTfhly7kIrQ37m2
         n9kg2r3C1801iigFcReWFn0z+xcU5hulTiJB2K3AfeiID2/oEtR8K+2wqHlkTiT2sd
         s3ZATyBfcGkFGtbt8SGeO4db0+TwbIQpLKiMZXNmN5pwIoCzelu/aC4V0kDIZxdnRF
         zMFzqHSu3GcQg==
Date:   Fri, 29 Oct 2021 09:36:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211029093653.78c10d98@canb.auug.org.au>
In-Reply-To: <CAC_TJvd+RT0dwAHC8wM-CU4P15=7yQObWmJ+DZMCh26Lf-im2Q@mail.gmail.com>
References: <20211028232345.5ffa43bc@canb.auug.org.au>
        <20211028091646.15f6e6de@gandalf.local.home>
        <20211029081009.0fd1a83a@canb.auug.org.au>
        <CAC_TJvd+RT0dwAHC8wM-CU4P15=7yQObWmJ+DZMCh26Lf-im2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ovXM2oMsWuFvBX5P5Wj==P6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ovXM2oMsWuFvBX5P5Wj==P6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalesh,

On Thu, 28 Oct 2021 14:29:47 -0700 Kalesh Singh <kaleshsingh@google.com> wr=
ote:
>
> On Thu, Oct 28, 2021 at 2:10 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Thu, 28 Oct 2021 09:16:46 -0400 Steven Rostedt <rostedt@goodmis.org>=
 wrote: =20
> > >
> > > On Thu, 28 Oct 2021 23:23:45 +1100
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > =20
> > > > After merging the ftrace tree, today's linux-next build (htmldocs)
> > > > produced this warning:
> > > >
> > > > Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis st=
art-string without end-string. =20
> > >
> > > I have no idea what that means. =20
> >
> > I assume you need to quote (with '\') the '*' on line 1767 (?). =20
>=20
> I also found the problem to be '*' character. I posted a fix at:
> https://lore.kernel.org/r/20211028170548.2597449-1-kaleshsingh@google.com/

Yeah, every now and then I forget to read all my email before replying :-)

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/ovXM2oMsWuFvBX5P5Wj==P6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7JgUACgkQAVBC80lX
0GywcQf/Zcwp2NfASf4Z3t+P1Plt5qFWP1NcC3NQ8RlHesnXFUl5lULQAKCPBAr+
VaOK3kayzaAYxd0Xx2dht2B0T0B0OHkdaPHAaXwH3VAt83K57a7oyPn+wNjwluPM
V4WflOiKQSRNsbk321YRREJmBmcII68rnr3OcntWvJ0H0fLKhAS203N779mjZJzh
msuSrJnaYq0g+Ew6yvezkVHB1kOgkP+3yU8L+u0uSkZBPqBosfjJdRaC8lPMLluw
bZl29FkoJNY+PsPqT/u/BctGWAgla2RLWajTxAY98qvelN98L3kRBk0/O5GuujyL
dE0Ja1R2OirILO7PBz25slJMudej+g==
=w/sL
-----END PGP SIGNATURE-----

--Sig_/ovXM2oMsWuFvBX5P5Wj==P6--
