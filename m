Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B532222FA
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 14:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgGPMz0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 08:55:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgGPMz0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 08:55:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B6vP75ygvz9sSt;
        Thu, 16 Jul 2020 22:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594904124;
        bh=b4ftUGwZVdgJ2MbMLvNenWR0160N3hTbmfvckH0eQgA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F6gJSOTvFnkWah6igwCrd+Q3MdNdmbervNyLrl8h3wFahu7jmbQTjhnZIe6Sc809N
         XAQ1kzSqBC3qFqZPDN4mIORMTZAUdfEYe0a38gNXjI+YGKcZg/va0PdDhzYgqn4ss2
         9962gC4mj3XCfmuaLbU2/mrhVXodomxL5pEZSeJxMMMn+V9pwN8w6kBUbjWNlch3Mm
         yhaFSITn5y/AIAPpQprVCadCw6pdlB8vh6dkXzkdtiCEynEo6wSPjqel3bi1V2S63n
         T99unNnhIn24BxNM+/1Bl8xbnlZtsC1L7rmQVrzRX648EOHgmsSRjpWHo525m4ZOJH
         Ll5Q5n/Cz/L8w==
Date:   Thu, 16 Jul 2020 22:55:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: failing to fetch the dmi tree
Message-ID: <20200716225522.208049f0@canb.auug.org.au>
In-Reply-To: <20200716132134.56cb4bc1@endymion>
References: <20200713091102.28d186ca@canb.auug.org.au>
        <20200715113743.6d54eefa@endymion>
        <20200716132134.56cb4bc1@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1YaoQc2H6Kp_nkUdHXhR/LL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1YaoQc2H6Kp_nkUdHXhR/LL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Thu, 16 Jul 2020 13:21:34 +0200 Jean Delvare <jdelvare@suse.de> wrote:
>
> On Wed, 15 Jul 2020 11:37:43 +0200, Jean Delvare wrote:
> > On Mon, 13 Jul 2020 09:11:02 +1000, Stephen Rothwell wrote: =20
> > > Jean, I don't suppose you would like to produce a git tree for me to
> > > fetch instead, as yours is the last quilt series I fetch (apart from
> > > Andrew's which is special).   =20
> >=20
> > Actually, feel free to suppose. While a quilt tree fits my current
> > workflow better, I don't want to be the guy who makes your life more
> > difficult. Let me give it a try. =20
>=20
> OK, so my old for-next branch in quilt format is still at:
>=20
> http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/
>=20
> and what should be a git equivalent of it is at:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git dmi-fo=
r-next
>=20
> If the latter works for you then I shall be ready to switch to it
> officially. If there's anything wrong, please let me know.

It all looks good to me.  I will use that from tomorrow if that is OK
with you.  I will not remove the parts of my process to cope with quilt
trees for a while just in case it becomes a burden for you.

> Will you curse me if I ever rebase this branch?

Not publicly :-)  Actually it only irritates me when it happens to
often for for no apparent reason, so feel free (many others do :-)).

Here is my normal spiel:

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/1YaoQc2H6Kp_nkUdHXhR/LL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8QTjoACgkQAVBC80lX
0Gwl+gf/SM3LLVYck7i5Sr5cMSeHGdHg+Wh9ARO9dvMTdpr3YsjW4dP8stXFgbkD
nmwSd9wT6vsXz3rE+91hG+xmtgDP6bs5zAXkp+mDO4fyVuagcvS8g+4nmghFrgqb
Qil6jtcTi9yJUKFZmSEpAQ42HQSdqi691aPAj1oPkkH9oRWcLvWDGbSqYqxbEOOH
Ur83IE+oN5pCSFt+jeDtZQjCjHKgYL5Ilpc7u5kTiKgzqc8XAdSSTSqmy9D93BZN
0xBFCqfPXCSvbtx6QVyxQuLzrfuHWy7Xz1VikL4xa7mkZBr5JcfwjG6waQ4Dxc+Y
CBUtSAK3RUhA6wB9kZE9n706RMdX0Q==
=J5Qz
-----END PGP SIGNATURE-----

--Sig_/1YaoQc2H6Kp_nkUdHXhR/LL--
