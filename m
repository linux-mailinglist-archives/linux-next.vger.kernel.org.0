Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA87186545
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbgCPGy7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:54:59 -0400
Received: from ozlabs.org ([203.11.71.1]:36169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729319AbgCPGy7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 02:54:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gn9X4Tsnz9sP7;
        Mon, 16 Mar 2020 17:54:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584341696;
        bh=XlmEu88MeNswrIBkto+AsqiLwJFmzqSmLy4Et4feMCc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q5eInVCYlF2LQ4OmtymQC5RFgotP3kej0orC6/Z08JIYNxr+jsCuV4v3mV/ekOyQT
         igwtkLpjdyJimYki3wI7DqfQ1Ws3J8uLMRt7MzzLoU7CKr7PrkwSLUfRx0F3opW33o
         cQKeOqdxALsJ4E1HAAEFtIladCMHg/cAzACXMfW1/noEqig+l98jcyQ6iNLSkmKmmm
         aTyvA+uVOwfh0Rjogo+OfUEYVs8tePqt4pWvWYlOsW2Tlu1l4nZkX6Bqc2Rjl/xlix
         4dtvZhp7mDvV77TW/OKvS3h0jC5fknC6C5Kcz8ip/ZqDN0PPR+G8H6eBucCgFrOE2Q
         ChZpj9MTQ6YtA==
Date:   Mon, 16 Mar 2020 17:54:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Baoquan He <bhe@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200316175454.0e14673e@canb.auug.org.au>
In-Reply-To: <20200316171326.7ee3eebd@canb.auug.org.au>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
        <20200316045804.GC3486@MiWiFi-R3L-srv>
        <20200316171326.7ee3eebd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d87vcSoy9WboTxLE=nYu4ga";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d87vcSoy9WboTxLE=nYu4ga
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Mar 2020 17:13:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Baoquan,
>=20
> On Mon, 16 Mar 2020 12:58:04 +0800 Baoquan He <bhe@redhat.com> wrote:
> >
> > I made a patch to fix these warnings, the reason has been told in the
> > log. Or just drop below patch. Both is fine to me.
> >=20
> > mm-sparsec-move-subsection_map-related-functions-together.patch
> >=20
> > From 273196eeb7bbc4af93bef18f594af91541e3ce8a Mon Sep 17 00:00:00 2001
> > From: Baoquan He <bhe@redhat.com>
> > Date: Sat, 14 Mar 2020 17:01:01 +0800
> > Subject: [PATCH] mm/sparse.c: move functions into CONFIG_MEMORY_HOTPLUG
> >  ifdeffery scope =20
>=20
> I have applied this to linux-next today to see how it goes.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # compile tested

--=20
Cheers,
Stephen Rothwell

--Sig_/d87vcSoy9WboTxLE=nYu4ga
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5vIr4ACgkQAVBC80lX
0GxduggAkhNm4JGG6vOfZZDVA/SpSv6LCy7/8JJbea6JxT5nhr0O4l3JfDoCpx5R
9v4ZojpZuP2QbwpYuet2lbrJNEI7igRlzX9l2mVmnCAELoJ3V4uk049RClYUQhd2
InrTSRgdrQtE2HNYoBgxhC73NsVE2pO3HLsFfJXv/FzlY8IRbp154CnS0dH0i1pS
pIimXE6SPhLDgGBIaYhtQpiUFc7X27SZvPzKSMQFsi6uqVVYSbbavvIIUag4NpBn
aF6x/bZH1D/l9E6Vk9d2P96km0MgKDXrWAZTtUApbpymfk50XJwMZwoKZJc+u8q6
5BU/TxWwrq0o014gzCi2i5atMRlnMA==
=pmCZ
-----END PGP SIGNATURE-----

--Sig_/d87vcSoy9WboTxLE=nYu4ga--
