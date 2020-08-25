Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A912825137D
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 09:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgHYHoU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 03:44:20 -0400
Received: from ozlabs.org ([203.11.71.1]:55239 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726024AbgHYHoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Aug 2020 03:44:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbLbb0zRZz9sTY;
        Tue, 25 Aug 2020 17:44:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598341457;
        bh=Y7qAOm5LXj3xJO1LU4/Uc9yKGGyRuix0iKjtoR5Ybwc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pgC21sqz65fkwXGPg1EjAn6DYcG7FDJ2dkW3Xt++e2hodyY7IDjPbmP1ThGopEZt7
         N7zwytmjKsXkZpmrmzMWYQZ3Ev1ii1RjEXYowBSHiqKFfmz7kf+raEUT+bNzKH8etX
         aUlVKvw2qXS6zM78dURS7e+z3IVSPUA+vJOjQD/36p5Pl10NOspmjX2eqIw97v6nbS
         H1oWoMAVl4V2b4RApkVbG4fEgdcLPT7/7i/g64AJw0tMv5lzoP2lsGCNQokI6taMVG
         Y54H1X33vqBOGURyOYenuLLKzFJVvQmZK95AjFybhysrpAjNScXw1GTf4ZHddt/xPI
         YFPXyhtZVB16Q==
Date:   Tue, 25 Aug 2020 17:44:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>, Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: BUG: Bad page state in process true pfn:a8fed on arm
Message-ID: <20200825174410.1af823db@canb.auug.org.au>
In-Reply-To: <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
        <20200824110645.GC17456@casper.infradead.org>
        <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z40Eod_0LnLaojqiTY7/wC+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z40Eod_0LnLaojqiTY7/wC+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Aug 2020 13:03:53 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote: =20
> > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024 =20
> >
> > Somebody freed a page table without calling __ClearPageTable() on it. =
=20
>=20
> After running git bisect on this problem,
> The first suspecting of this problem on arm architecture this patch.
> 424efe723f7717430bec7c93b4d28bba73e31cf6
> ("mm: account PMD tables like PTE tables ")
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
>=20
> Additional information:
> We have tested linux next by reverting this patch and confirmed
> that the reported BUG is not reproduced.
>=20
> These configs enabled on the running device,
>=20
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>=20
>=20
> -- Suspecting patch --
> commit 424efe723f7717430bec7c93b4d28bba73e31cf6
> Author: Matthew Wilcox <willy@infradead.org>
> Date:   Thu Aug 20 10:01:30 2020 +1000
>=20
>     mm: account PMD tables like PTE tables

OK, I have reverted that patch from todays' linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z40Eod_0LnLaojqiTY7/wC+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9EwUoACgkQAVBC80lX
0GxJJwf/VPBxX45ROMwkoKpUInftEerYb6NZ5Muk8AS1xBRl0rD+0luk9VA1ABGi
TzqC7jVz4maQV4fxLZH9+sMMvVkaW9ltHXDgxmoksmFNvLBPkVdMOWNyEYIecxAX
zExf6S4P2NsZ8yky3DSEW+nOhFqCuktnR91sJXhUN45buP9vKKmszqgtFOrdNtkG
rwUlJP2GHr0TOLvEUKthE3lUnxL/whN2X5ZDYj/0HiIn00C0YSbLF3vGyFnlwKy8
lkMCk87hk+xKpND9DEk/IjcpLPIaJfFiVhxucEAgDjFv3/uRb/D+owtmdXAmRKip
/3gVT9vtSLlOrwBo95Pu4mB1Ke46YQ==
=bf3j
-----END PGP SIGNATURE-----

--Sig_/Z40Eod_0LnLaojqiTY7/wC+--
