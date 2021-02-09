Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAAB315990
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 23:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbhBIWcR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 17:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbhBIWPM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 17:15:12 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735FEC08EBAC;
        Tue,  9 Feb 2021 13:55:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZxR030Hxz9sVF;
        Wed, 10 Feb 2021 08:50:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612907452;
        bh=G0Ed/dJfXtLx7tzqS8Qox4C6pVjikZuLoNdBUJ+Rhdo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GB11Ad7cEkGMbSJSxvjhz/zMnO2zeqVIVA+YhZegFXyZC52QbYqMu+DFZhuoZZkdV
         AmuM6WUb4qtE80OZweD5WMV9qnc3xovmZ/cMHC2R4pfAIri/6VvjYEMU4HlYWwvd76
         WNQlEDqi+0HrQP86fyR/ssTfeLCpAkClQCAB+Vnls7wd5esiRb0pDkgFrA7k5d4VC4
         WwomBdtvvleerFdXU/FWmNOdwPXnEakSf9KcuH9015WsQQCh+Z5Adwd1qU+mOem5Eo
         XWxdmE2NlI9sCBluUew4H1GRua3Zt2UMrroN6id9DYr3l2ipOdEig77jZW5CUp1hL5
         B9n0IqtX4y+hg==
Date:   Wed, 10 Feb 2021 08:50:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20210210085051.7fb951d1@canb.auug.org.au>
In-Reply-To: <YCKnRPRTDyfGxnBC@gunter>
References: <20210209210843.3af66662@canb.auug.org.au>
        <YCKnRPRTDyfGxnBC@gunter>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mF5sT4DfCLMx5cOaN5Q+QBj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mF5sT4DfCLMx5cOaN5Q+QBj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jessica,

On Tue, 9 Feb 2021 16:16:20 +0100 Jessica Yu <jeyu@kernel.org> wrote:
>
> Hmm, these errors don't look like it's related to that particular commit.=
 I was

I found this commit by bisection and then tested by reverting it.

Before this commit, CONFIG_TRIM_UNUSED_KSYMS would not be set in the
allyesconfig build because CONFIG_UNUSED_SYMBOLS was set.  After this
commit, CONFIG_TRIM_UNUSED_KSYMS will be set in the allyesconfig build.

> able to reproduce these weird autoksym errors even without any modules-ne=
xt
> patches applied, and on a clean v5.11-rc7 tree. To reproduce it,
> CONFIG_TRIM_UNUSED_KSYMS needs to be enabled. I guess that's why we run i=
nto
> these errors with allyesconfig. I used a gcc-7 ppc64le cross compiler and=
 got
> the same compiler warnings. It seems to not compile on powerpc properly b=
ecause
> it looks like some symbols have an extra dot "." prefix, for example in
> kthread.o:
>=20
>     168: 0000000000000318    24 NOTYPE  GLOBAL DEFAULT    6 kthread_creat=
e_worker
>     169: 0000000000001d90   104 FUNC    GLOBAL DEFAULT    1 .kthread_crea=
te_worker
>     170: 0000000000000330    24 NOTYPE  GLOBAL DEFAULT    6 kthread_creat=
e_worker_on_cpu
>     171: 0000000000001e00    88 FUNC    GLOBAL DEFAULT    1 .kthread_crea=
te_worker_on_cpu
>     172: 0000000000000348    24 NOTYPE  GLOBAL DEFAULT    6 kthread_queue=
_work
>     173: 0000000000001e60   228 FUNC    GLOBAL DEFAULT    1 .kthread_queu=
e_work
>=20
> So I suppose this dot prefix is specific to powerpc. From the ppc64 elf a=
bi docs:
>=20
>      Symbol names with a dot (.) prefix are reserved for holding entry po=
int
>      addresses. The value of a symbol named ".FN", if it exists, is the e=
ntry point
>      of the function "FN".
>=20
> I guess the presence of the extra dot symbols is confusing
> scripts/gen_autoksyms.sh, so we get the dot symbols in autoksyms.h, which=
 the
> preprocessor doesn't like. I am wondering how this was never caught until=
 now
> and also now curious if this feature was ever functional on powerpc..

Which feature?

--=20
Cheers,
Stephen Rothwell

--Sig_/mF5sT4DfCLMx5cOaN5Q+QBj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjA7sACgkQAVBC80lX
0Gzwlgf/ctA6cRjr3PycwX776JNl/lXhgq80w0pR7pFpO8OABd7QWDN+9Pb2blnZ
tfsyhdvSJdCqfF5+iTdZudJOHYLaG572NTep620O3VBxAa6EVOErqSzH4tDlXC8h
bj4cfZEzd63xGnNh+F/c5szn9k0A5tEJG3fFP/XKYUUbEI74Uu0nzJu/8NhuDPeJ
kV+9lbT29f4x+OnBGW8Fw/NomyikgMSmxl+ogiqhtDols++QljYLBiHgMqzZoD6v
F7tydwMWr50nO+0+su30kk08cnW0qivaqxLJzdaGiDk8Px03eGCs5+NUk0kJFGg6
01/1bjeGuD752z9qVqXE1HixU1CNrw==
=RQeI
-----END PGP SIGNATURE-----

--Sig_/mF5sT4DfCLMx5cOaN5Q+QBj--
