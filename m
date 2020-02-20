Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF9A166ADC
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 00:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgBTXSs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 18:18:48 -0500
Received: from ozlabs.org ([203.11.71.1]:39979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgBTXSs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 18:18:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NrBG4yv9z9sRh;
        Fri, 21 Feb 2020 10:18:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582240727;
        bh=l9UM+zCUkLs/4YBcjYo+To2tyvruDnuXxmfULpRo/nc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ph/K03WW88ta7deHSfNMWrMWAY2i0/4+eSc/7QB5c6RNdMvfsygVVQUdFbXejRlLy
         cZKoka5PT4lQXU/wSZNNkgUG4ic3pEMcMazmdIIZDrEX70jTqfX32nHtUR9hFhg0rV
         r4BH0vhOKuiwsbVFPYAZaYEHa4VKijg5HLShb84Ikj4tkIAGQ3Frz3r5ibHp3AJlyo
         UM2CAMa6XZ+D64/e5GbO5bVA12c37KVOThfHcDa9nwNaOetZJ3s2t+9nnYm78P8DvO
         qOVNpYLEaKJzc12HDfzuXVLSqg/w3oml5XDMtAVgjMj6XEkHs/wRA8ZP/Q84dU0Fi1
         FSVOco/62GyKw==
Date:   Fri, 21 Feb 2020 10:18:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arjun Roy <arjunroy@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200221101845.21c0c8c5@canb.auug.org.au>
In-Reply-To: <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
References: <20200217145711.4af495a3@canb.auug.org.au>
        <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
        <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WlSQA3zZeWd/av48Z2WLf9P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WlSQA3zZeWd/av48Z2WLf9P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 16 Feb 2020 22:45:35 -0800 Arjun Roy <arjunroy@google.com> wrote:
>
> On Sun, Feb 16, 2020 at 8:12 PM Arjun Roy <arjunroy@google.com> wrote:
> >
> > On Sun, Feb 16, 2020 at 7:57 PM Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote: =20
> > >
> > > After merging the akpm tree, today's linux-next build (sparc64 defcon=
fig)
> > > failed like this:
> > >
> > > mm/memory.c: In function 'insert_pages':
> > > mm/memory.c:1523:56: error: macro "pte_index" requires 2 arguments, b=
ut only 1 given
> > >    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
> > >                                                         ^
> > >
> > > Caused by commit
> > >
> > >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> > >
> > > This is the first use of pte_index() outside arch specific code and t=
he
> > > sparc64 version of pte_index() nas an extra argument.
> >
> > Looks like this happens for sparc, and also metag. Other platforms
> > just take the addr parameter based on a quick search.
>=20
> And actually I guess there's no metag anyways now.
> Looking further, then, it looks like in every non-sparc pte_index() is
> an actual numerical index, while on sparc it goes a step further to
> yield a pte_t *.
> As far as I can tell, the sparc incarnation of this is only used by
> the pte_offset_(kernel/map) macros.
>=20
> So I think a possibly sane way to fix this would be:
> 1. Define pte_index() to be a numerical index, like the other architectur=
es,
> 2. Define something like pte_entry() that uses pte_index(), and
> 3. Have pte_offset_(kernel/map) be defined as pte_entry() instead.
>=20
> Then pte_index would be operating on just an address for all
> platforms, and the reverted patchset would work without any changes.
>=20
> If this sounds acceptable, I can send a patch.
>=20
> > > I have reverted these commits for today:
> > >
> > >   219ae14a9686 ("net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocop=
y-fix")
> > >   cb912fdf96bf ("net-zerocopy: use vm_insert_pages() for tcp rcv zero=
copy")
> > >   72c684430b94 ("add missing page_count() check to vm_insert_pages().=
")
> > >   dbd9553775f3 ("mm-add-vm_insert_pages-fix")
> > >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> > > =20
> >
> > In terms of fixing this; passing in an appropriate dir parameter is
> > not really a problem, but what is concerning that it seems messy to
> > have a per-platform ifdef to pass it either two arguments or one in
> > this case. But it seems like either that would be one way to fix it,
> > or having some arch method across all arches that takes two arguments
> > (and ignores one of them for most arches).
> >
> > Is there a general preference for the right way forward, in this case?

Has there been any progress with this?  I am still reverting the above
commits, so they are not getting any linux-next testing ...

--=20
Cheers,
Stephen Rothwell

--Sig_/WlSQA3zZeWd/av48Z2WLf9P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PE9UACgkQAVBC80lX
0GyOYggAjTGf7PaO6OpUQE/582qJnBS/Bp2yGI8K1o335IWQtnBApGbPvy/v/k1e
BupKbY4mBVQhC0fZnLoNwBoZ2iDnjWwkQVYnNyQFohUv5xoDjnoLBJp1BSbpnlLA
wkWRAG20ZK7NK+r5rKv6kNt1PWyRheBucfFUYabPrBuvHqSm7z5RXKjEWSw4bTIS
VIEfO17i/5iNt2h+b1+BNcVq5cr2r/6LZYadTWS+4j0yP2mnRZKdvAsTCq8Nn6+7
8cRSOoONNfsHShRnhHzKf+rOHCbGSgvm6rJEA2bWXLzDan4DqpQF/jD2jfJ982Mx
KvP2uxCsDiv9f3eEGBpMuCsirLTfag==
=THYJ
-----END PGP SIGNATURE-----

--Sig_/WlSQA3zZeWd/av48Z2WLf9P--
