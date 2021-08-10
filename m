Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBFF3E56E4
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 11:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhHJJcO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 05:32:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhHJJcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 05:32:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkSQG2Pg2z9sX5;
        Tue, 10 Aug 2021 19:31:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628587910;
        bh=kt+lDBI95xg3muQJf27gUpQkKk4gUz8MoNnRohL5jXU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wq8Y1QsXKb59ll3embjvZtmw22fZMKdXeLL3SF2Pn4stnBW7Rw145+LBQH7FeCxcv
         Fkd7M7IX7rQaOOobsIMQr8gT78/IPFkXD+A2fmUar4f6GlUUgK6x7R75EpFckqSoU2
         DTEI3EVa5GkPeOcx4C5WTHrlVQl+G7o2gE8XsfL0CUTAB+OsVx4u38KSOpL8FsWJt4
         xjLPT/EbkR9sUM57ge/btGYNmag5ZQ++c3mdCWdFced1HfgJp6locGIk+wf7MtXCFn
         zSLw6Minef9c1tgTGOlBDtn6SpbzcY3qNHrg7wke6eXyOA7+q4Tob4z9D/6BoJADFL
         feyCMlSeQWf7A==
Date:   Tue, 10 Aug 2021 19:31:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Tushar Sugandhi <tusharsu@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20210810193149.4ad4714a@canb.auug.org.au>
In-Reply-To: <20210721173432.3dce9ce3@canb.auug.org.au>
References: <20210721173432.3dce9ce3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qlCnOwipGmXBF4/fgyixnVv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qlCnOwipGmXBF4/fgyixnVv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Jul 2021 17:34:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the device-mapper tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/admin-guide/device-mapper/dm-ima.rst:29: WARNING: Unexpecte=
d indentation.
> Documentation/admin-guide/device-mapper/dm-ima.rst:52: WARNING: Definitio=
n list ends without a blank line; unexpected unindent.
> Documentation/admin-guide/device-mapper/dm-ima.rst:109: WARNING: Unexpect=
ed indentation.
> Documentation/admin-guide/device-mapper/dm-ima.rst:129: WARNING: Unexpect=
ed indentation.
>=20
> Introduced by commit
>=20
>   e820ba87f9d1 ("dm: add documentation for IMA measurement support")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/qlCnOwipGmXBF4/fgyixnVv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESR4UACgkQAVBC80lX
0GxZBwf/RxA2iB5oW/nzVSNgh69cikClXqvDkEUoyHm+pnI5uBTQcNQoU9hq1Q3x
1z3AwCc8TuXp36dS3cDBiUh4jejkA3vORVw0xJXgS0JjiY3UECFGRnFfd747jJsR
Bg/QtVcNnqEg58FxhUdlt/1SwY6aI5QisC+KnQnWsYscoda3rmugvbghcx/0mL9S
oI425CYTcXWDXV3QcOFxoZOXjWoeKoc9KeHdWaaaMkOoErlqNgKjuO4i9LWgchJe
dOyoIKXLmVzA5p1dwzOw0vBxbPj1Fe+Rn2uTD75Oj9X+XU+AaQf62iLsC6qtWwSW
BhI0JfwQj89mTHoN32MXOgiehRk0Lw==
=N8Pv
-----END PGP SIGNATURE-----

--Sig_/qlCnOwipGmXBF4/fgyixnVv--
