Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAD72D3BF5
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 08:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgLIHHs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 02:07:48 -0500
Received: from ozlabs.org ([203.11.71.1]:33595 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbgLIHHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 02:07:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrSls3kbVz9sW9;
        Wed,  9 Dec 2020 18:07:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607497626;
        bh=y/7AxITvnZjCAk7hXsrFICRcD4MaIkQMcAoXL89bsy4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AbGdFvekqDdywfKyedVnYsS6DszF3DGKyEhnfrUaNxF7I85AhybRUQ7+GrmZ+Cu/u
         9dThE8/5mnORzUFIt2UKr1R99E4kBxVEPRgZr9gH5iqWG0SzxyY1Ofqk78gl4YVdUC
         MSki2Vzj6EVkCn+YM/WwUsIkxKnCzOgv8mk1lh8K1GfQstBWcY3//CvbghZZpztLvR
         97eTA6AuoyKFBbvJnIs+3HegHhhYcNZsywihOC27x8txYBcy7tpAWVq1oHLO+/ROzp
         c0AL0ObpZpgCd9OMnkCJrfzexfAvxPXkaboyKsm+YjfSo9pnCNh5rPkoUkwqfzXXlG
         7jDBrnELWuChg==
Date:   Wed, 9 Dec 2020 18:07:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Malaterre <malat@debian.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20201209180703.404eb4cb@canb.auug.org.au>
In-Reply-To: <87r1nzsi4s.fsf@mpe.ellerman.id.au>
References: <20201204210000.660293c6@canb.auug.org.au>
        <20201208230157.42c42789@canb.auug.org.au>
        <87r1nzsi4s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HLUhotdS6r8oYyBamqDPwLP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HLUhotdS6r8oYyBamqDPwLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 09 Dec 2020 15:44:35 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> They should really be in DATA_DATA or similar shouldn't they?

No other architecture appears t need them ...

--=20
Cheers,
Stephen Rothwell

--Sig_/HLUhotdS6r8oYyBamqDPwLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Qd5cACgkQAVBC80lX
0GyQKQf+IQ7APd2lQVndfNhpMSaNqgjyM50ktUG4sbEP9NurjHT7RytwNfLgSPds
Tw+WEUKkkQ3tavRvf1jai+OKM/hpY/B8hKH7Kbzsl7WcPuGptAe/mKmTa0NO7Esr
gwDQoZbyrZ5vRYik99t7ozP8w67KrARiYLqKNqZYLTMRUPndMQ+OLcj8Pqb2Tqyb
IbFJaVpHo7b6bjUl/ZB0dmoUvx/7ApKijNTlWnRfg22hmN5km6lig5QTX1Qy1NXZ
UvWPtoWMdnMziy8Bw7pu2vq2Kk3XhJa2rykkB395QKOcnDTHtS2sBu2G8PQ0xG1k
k7cJRMZxz2nBd6FCJ7uSmlMxYy/gWg==
=fQhx
-----END PGP SIGNATURE-----

--Sig_/HLUhotdS6r8oYyBamqDPwLP--
