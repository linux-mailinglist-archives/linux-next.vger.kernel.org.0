Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1401B1B22
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 03:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDUBN2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 21:13:28 -0400
Received: from ozlabs.org ([203.11.71.1]:34497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbgDUBN1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 21:13:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495lts6DPFz9sSK;
        Tue, 21 Apr 2020 11:13:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587431606;
        bh=dPLdUU6B3q3e7weGYN/l6fTkNPcitkapNLbDdk9hS2I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f0/t3PwiSnG4Z4mxgD4U23KOdoc2klHs0HOdMjWOtyFi83//2y4l6HP7cyjYn+yc+
         FDSBbBzYlwxvNvDgn4jJU5L5tn5eetOEThh3n/5SXwg3yyJISrX1sN3/GHQyXuDEaj
         Icm7KAGzs9+eisZcP/rCE8A8BxrL0ipZQjqsPp/gH2TdSg7WPubApFAHpOYT0WfWoM
         yBziEgp4P63KhEsbUc2lAWR1v9HRsM+/aZl5KTrbglw0gD+QhzDODnohdHTPRioZY8
         Bt/jgRkZjpcx6ZQTpnsL/1l/tLIZ1kQVOE7se3qy/ZI64I2h2hXzorXJdatvvGkmxI
         x+WHfYMRseQcw==
Date:   Tue, 21 Apr 2020 11:13:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Qu Wenruo <wqu@suse.com>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20200421111324.2148fe05@canb.auug.org.au>
In-Reply-To: <9aee72df-9140-c86b-cf37-568a546d8b76@suse.com>
References: <20200421102520.53623f09@canb.auug.org.au>
        <9aee72df-9140-c86b-cf37-568a546d8b76@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p9G0coIntvCeCcbLD=hlS5p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p9G0coIntvCeCcbLD=hlS5p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Qu,

On Tue, 21 Apr 2020 08:40:45 +0800 Qu Wenruo <wqu@suse.com> wrote:
>
> On 2020/4/21 =E4=B8=8A=E5=8D=888:25, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the btrfs tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from <command-line>:32: =20
>=20
> Any extra info?

That is a build test of the uapi headers to make syre that they are
self contained.

> It builds fine in my environment, with older HEAD though.
>=20
> Is there any new commits which changed <linux/types.h> header?
> As it should includes u8 typedef.

My understanding is that you should only use the __ versions of the
kernel types in uapi headers to avoid namespace contamination.

--=20
Cheers,
Stephen Rothwell

--Sig_/p9G0coIntvCeCcbLD=hlS5p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6eSLQACgkQAVBC80lX
0GylAAf+Pbc5JPUVWIFuqVc1h/bxLOhn9LPODn35FOrDWfvxe72qFXz2Yb/EpfWK
HCGvm6IGlyR2aC50hUczOyGJyAhgd4jQHPmkJJkueRfkzTXx1zu86Q5tLvFAcSDG
CjM7k0iLLUO8gUD9G9xPFr34WZ6awv78gN2MqlJPGbgNJTxFyAcYYOR8cJZJUw98
YZTj4n4wSWgafH20rPNsSaxU0V3vuazOhmjbAi99M+pegxbFgD7IHqNonv8pcjBh
hNjt4efBJmMHyTnWBMMkmAhNCbP5zSv6ZUIG/5+SlI8hG8nSi3NU/TS85Ru4NAl4
kV6gpAzPMmpkNj6SJqfqybs1huTWKA==
=OkMp
-----END PGP SIGNATURE-----

--Sig_/p9G0coIntvCeCcbLD=hlS5p--
