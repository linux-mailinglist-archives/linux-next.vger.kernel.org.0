Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6699933E0CD
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 22:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCPVtr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 17:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCPVtc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 17:49:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A09AC06174A;
        Tue, 16 Mar 2021 14:49:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0Rl95zJXz9sRR;
        Wed, 17 Mar 2021 08:49:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615931366;
        bh=ke/83Lkue/H6DYOwOXjVSxTk1ZYAQ6IZyfcCu2W7Ubg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N3vFXfF65BXu/SvvPW//wcfSKDVwcBzH4jBRtdbMlb5E6cVsx2STm8FvtFq4070xG
         BVwuGZSJCErBZipZjpNYockJJhkX8tlt5p/74BQg3VgnAej1JXX3Pq3MlRm/yp7VvY
         Gflx7tf+5ItdPAQVni5K/74kIPUXZ1xhFN1vfj6zINsoz39unO0GjV5yXilmzA+cPE
         KvTInCxDXIU3g7++gt7aQnhK/CAXOsHn+/9a/xw6IXqfuDVqt3RKMpZtOe98kuYssl
         SSDEcKNPL6gCexb8t538mRGkmr+WlWQZl1aTev/b39laalwQezqnerAGOaKM/JmDix
         RhI/mxHVxa8+A==
Date:   Wed, 17 Mar 2021 08:49:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210317084924.2ba4c3ea@canb.auug.org.au>
In-Reply-To: <YFD2Y++LQHmWMx68@google.com>
References: <20210315163522.589bc67a@canb.auug.org.au>
        <YFD2Y++LQHmWMx68@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ji/6.BxhW2Tq5953OhqZb.8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ji/6.BxhW2Tq5953OhqZb.8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Minchan,

On Tue, 16 Mar 2021 11:18:11 -0700 Minchan Kim <minchan@kernel.org> wrote:
>
> On Mon, Mar 15, 2021 at 04:35:22PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the akpm-current tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interp=
reted text or phrase reference start-string without end-string.
> >=20
> > Introduced by commit
> >=20
> >   439d477342a3 ("mm: cma: support sysfs")
> >  =20
>=20
> Hmm, I don't get it what happened here. Was it false-positive?

I get the above from a "make htmldocs" run ... I don't know what causes
it, sorry.  [cc'ing Jon]

--=20
Cheers,
Stephen Rothwell

--Sig_/ji/6.BxhW2Tq5953OhqZb.8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRJ+QACgkQAVBC80lX
0GwWZwgAh+i+b0YgUxHoeW1qnNwNR2XGXwhQcweZUgcfMbyNpK2P4vBL2BOVCaYF
cX192M5Weh0VrdqT36HDBA+llGlf/Zh3VjZt9gV5k9x52GaPTB+wfLe97HfQbgrf
Lj3Nz3wi6eCLlkus8c2C6JKWNrGv5c3OhshZbVEvK9m/v/oUgLocwQ+eUJiS30qN
lxRQSeZ9dfp3neSX3taK6SgH6Eh9oeRKLwWrJdnKHypeGdXWneMDpzClj7J7+OYs
mNjXkKQgbs0m1d4x+nhcJYnSZKMUnAloUzGeWcPkL5ydktAYkEBhyc4FsIADxZmS
Et72dCDz2oF62EffQSysyn/droD4mw==
=7oSB
-----END PGP SIGNATURE-----

--Sig_/ji/6.BxhW2Tq5953OhqZb.8--
