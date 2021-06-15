Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD38F3A8C96
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 01:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhFOXge (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 19:36:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229898AbhFOXge (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 19:36:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4PmJ58Blz9sWQ;
        Wed, 16 Jun 2021 09:34:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623800067;
        bh=lQtc2x7Rh4AHu/IUpmiEi/JQeUlvvr0kX8hNOKZGzYc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FN2JY0g7acv2zSNUbzouZpgO2F7oprdphW8MILnz3QnFeEUnB5J1fXA9MrJ2cvM46
         +s1Dj6INl0KZ7gbSqwBFPZOtjEfeohrkQyrswTF2L4aAESGVQOPatezBCmLycAElui
         kPafKm4+f2sUPUqzDLAocB9ux5lsSNl4xw8+NOBzhy8TnZUSz+We8IQUj73MIp8vIU
         YyYRB8C8MhzXONoF5PEoXzicttkMCOb9jHYoSRUGwQ6QOp+PCIZH3An8DDQOupYjIo
         gMMbdko9ahb2yNCRk5p7kNACmHJXErg7izNajuDoE7bqp97IuygXZRUQtpyfvfNGiV
         nK0yMWo3g4+Ig==
Date:   Wed, 16 Jun 2021 09:34:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Qian Cai <quic_qiancai@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alistair Popple <apopple@nvidia.com>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
Message-ID: <20210616093422.31270f1e@canb.auug.org.au>
In-Reply-To: <YMj9vHhHOiCVN4BF@linux.ibm.com>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
        <20210615124745.GA47121@C02TD0UTHF1T.local>
        <20210615131902.GB47121@C02TD0UTHF1T.local>
        <076665b9-9fb1-71da-5f7d-4d2c7f892103@quicinc.com>
        <YMj9vHhHOiCVN4BF@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DtR4FonmnT/mKaEeFXLn3BZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DtR4FonmnT/mKaEeFXLn3BZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Jun 2021 22:21:32 +0300 Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Jun 15, 2021 at 10:50:31AM -0400, Qian Cai wrote:
> >=20
> > On 6/15/2021 9:19 AM, Mark Rutland wrote: =20
> > > Looking some more, it looks like that's correct in isolation, but it
> > > clashes with commit:
> > >=20
> > >   5831eedad2ac6f38 ("mm: replace CONFIG_NEED_MULTIPLE_NODES with CONF=
IG_NUMA") =20
> >=20
> > Just a data point. Reverting the commit alone fixed the same crash for =
me. =20
>=20
> Yeah, that commit didn't take into the account the change in
> pgdat_to_phys().
>=20
> The patch below should fix it. In the long run I think we should get rid =
of
> contig_page_data and allocate NODE_DATA(0) for !NUMA case as well.
>=20
> Andrew, can you please add this as a fixup to "mm: replace
> CONFIG_NEED_MULTIPLE_NODES with CONFIG_NUMA"?
>=20
>=20
> diff --git a/mm/sparse.c b/mm/sparse.c
> index a0e9cdb5bc38..6326cdf36c4f 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -347,7 +347,7 @@ size_t mem_section_usage_size(void)
> =20
>  static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
>  {
> -#ifndef CONFIG_NEED_MULTIPLE_NODES
> +#ifndef CONFIG_NUMA
>  	return __pa_symbol(pgdat);
>  #else
>  	return __pa(pgdat);

Added to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DtR4FonmnT/mKaEeFXLn3BZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDJOP4ACgkQAVBC80lX
0Gwvfwf/YixMUZJCuQBbmrJVUsBfG8dmEZFa/OYgYQX2Riv//8RQGxX25K7aD5nZ
C35SPhEzfkH8aeB4Cgap679QDBB1Ds4IJ1V/nkiOLU4/qzEZXLKfd5PHEYt5CsIY
x6WD4Qu/5o7BjaCqaQsyAXyzaM8kdysb3JXlUvPVcM5vusSbzERDFo7RoFXchody
zRHaM88nA1oVuTGJdPlIuiSfeU278NOU8YKxhsbVYGt/OhPgJHNh/c2fh1HyXa+B
ZaEcLS95uEHdflq4Uzkb9D3+X9hWpCbjc4UyME1LuvRkHR44vCOy6WGjQ4M7R3w7
D0DqEO6s+/otsRuqov3u4LupNJTOUg==
=K0mT
-----END PGP SIGNATURE-----

--Sig_/DtR4FonmnT/mKaEeFXLn3BZ--
