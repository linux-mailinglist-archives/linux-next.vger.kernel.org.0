Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C661285392
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 23:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgJFVEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 17:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbgJFVEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 17:04:12 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC20C061755;
        Tue,  6 Oct 2020 14:04:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5VMB4TBRz9sSG;
        Wed,  7 Oct 2020 08:04:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602018248;
        bh=D2iFk0l3U3wTXzKFLPsxu6P3eYTdYFtCQAuJJJjQmWM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bhEpNiegpLUy5hin7ka+43scdjV2WhMgQCBbVXvFrfwKX1BP5/XB/JE0j40XVhdcy
         C/kwnRaTuf/P++D19+HT+V9tWz3THk6kFfVbKCuDAfs0rd3rXAkavHZDNpTwR2qUF0
         7PW29aSHtIbMBzKNm02UvtoIyksCP13GicsTGy2hY2V253vIl7KAGYSsLysQVYSJmN
         2HHy5qUj6NZTQSqduNjshB2shOSMa4VqHtNY/eY5TruCfVRvgQcwqfiN3b6Pn61kSH
         MYmJLL3Fu99Ahv919Mb3IXzJvxcYCwpqYeMWVTi8UkaIpXVYtL1jImJoA9FLJ29aoh
         VU2F0M6czV7+A==
Date:   Wed, 7 Oct 2020 08:04:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20201007080405.5e90a579@canb.auug.org.au>
In-Reply-To: <20201006143012.fgpyujguzvcwszp4@treble>
References: <20200924183038.3c6da86e@canb.auug.org.au>
        <20200924200807.GU3421308@ZenIV.linux.org.uk>
        <20200925220128.1604f09b@canb.auug.org.au>
        <20200925133820.GW3421308@ZenIV.linux.org.uk>
        <20200929041056.uj6gedgm6hfjaxrx@treble>
        <20201006143012.fgpyujguzvcwszp4@treble>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mGAqYt=bD6yUtK69wl=vzGF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mGAqYt=bD6yUtK69wl=vzGF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Tue, 6 Oct 2020 09:30:12 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:
>
> On Mon, Sep 28, 2020 at 11:10:56PM -0500, Josh Poimboeuf wrote:
> > > Josh, any ideas?  We could, of course, make it "r"(size), but that wo=
uld
> > > be unpleasant in all existing callers... =20
> >=20
> > Sorry, I've been traveling.  I'd just vote for making it "r".
> >=20
> > array_index_nospec() is always called after a usercopy.  I don't think
> > anyone will notice the extra mov, for the cases where it would be
> > propagated as an immediate.  And the argument *is* an unsigned long
> > after all.
> >=20
> > Stephen, can you confirm this fixes it? =20
>=20
> Still traveling, I didn't see an update on this.  Any objections to the
> below?  I assume it fixes Stephen's build issue.

Yes, it does fix my x86_64 allnoconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/mGAqYt=bD6yUtK69wl=vzGF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9828UACgkQAVBC80lX
0GzjMAf+NGlPx9YrXuvL8HEllDlG5h8Jjq6l+IOkat5XF5yPIOycUzr4ER118JO3
5+yMxO3WH2y8dzXv8qScrWRFPHbMFM3JsZe6OCx+HS6WWKY5DqafsAoauuBPJGu2
dbMcSYGrZWSA5sfiZ+qKVkoLHTxRf5GO0z7hg+ARD42AGsjiAxuF6KXb0cRUdAXl
Gzhh2v8UW/fvF19E2AwoiVtR7EbtRSZaMd+yFFW50/boqBIERr3/y/mzuCeQpWgn
YtMzGAsIqVE3m1hxoL6oqFmNRHCJCgYqq/HzoO1jeMru1ePd95l7vIxRbxNBpDBD
vATKKYJO06BrL6X7OL9Z0cc439Rp0w==
=YPrC
-----END PGP SIGNATURE-----

--Sig_/mGAqYt=bD6yUtK69wl=vzGF--
