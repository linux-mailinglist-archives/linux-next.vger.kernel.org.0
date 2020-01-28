Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7765514B245
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 11:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgA1KGi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 05:06:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgA1KGh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jan 2020 05:06:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 486Mhq4nfcz9sNx;
        Tue, 28 Jan 2020 21:06:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580205995;
        bh=l/ocmuSwqhgFJhi93Wf9ycxzSqcALOQnU2DzUcJuyvA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oKQEN7YR6d2BvLVRjXFRmmnwqNSZ6BtAVkzio0Qrzngq4J/1oiwoAbHVkCnAlMtMs
         KUcNmbkVdK54xQy63hQiB949YTZMHIkGiQaZLBgTtntRxQnC6Latfd6SLfAQeTQa97
         2pZrrh9iNo99bxv/LlLCCVck/q6wUOmBaftKScOEmjdd0n7NPJu5UfvA20j20hNASL
         WKSk3ztj8AziAp5Ng1VXfxOeW+xeEWLyAQxZ99LzevEiLsx58ZxUAJ8mfb7QRXm76i
         xOefaSxKSbprg5/yIXKQlAi2HczzUFjBgS62JxwKsqMwAbc5HJsbosiefCncY3Cnh4
         GtQ2iUHLCb7sQ==
Date:   Tue, 28 Jan 2020 21:06:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 drivers-x86 tree
Message-ID: <20200128210615.4347a362@canb.auug.org.au>
In-Reply-To: <CAHp75VctM6DBpDFj0eXUo4ipawCpfDgqexBHwjQGQpomjY2YDQ@mail.gmail.com>
References: <20200124161558.7cbb88c9@canb.auug.org.au>
        <20200128100311.3ca81231@canb.auug.org.au>
        <CAHp75VctM6DBpDFj0eXUo4ipawCpfDgqexBHwjQGQpomjY2YDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HET=K3uTDM3=NSfpCKooC/p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HET=K3uTDM3=NSfpCKooC/p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 28 Jan 2020 11:11:32 +0200 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> I can't reproduce this. Linus already pulled PR for PDx86,
>=20
> $ git checkout -b test-xxx origin/master
> Branch 'test-xxx' set up to track remote branch 'master' from 'origin'.
> Switched to a new branch 'test-xxx'
> $ git merge for-next
> Already up to date.

Thanks for letting me know.  Sorry about the noise.

--=20
Cheers,
Stephen Rothwell

--Sig_/HET=K3uTDM3=NSfpCKooC/p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4wB5cACgkQAVBC80lX
0GxKcgf+OcXzZTagjmWdoc22VxMX1g1xQ7bVFyt39+TFqI14zUuvwPUJ2Usmqhok
DuMAd3fZbYu3mOymlbi56YqkfR/8pJt3o+fgFY2d8blzg93EWeOzBjzUCbxnME9H
aYdxMSJ+JlNVgNbElIWd6bmcAlxMAros5a1IpxaHaont/XGXawGijqnR/1zzcam3
TXrmvVBi75bg8PTRkVmdXDDojRZ3sb6w/HcfudURA8bh8JNc2C6E0rb25YHjXTE+
T7jhlicIffomQvQD8j5IJjdXtPyHVm8m4h/C6GlwKy97kCZgq7aT9W+rEUnCfO0J
k5/ozsCR/Dr7Eaq5rgUdwaiyJb8aHg==
=i1+i
-----END PGP SIGNATURE-----

--Sig_/HET=K3uTDM3=NSfpCKooC/p--
