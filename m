Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3942A5E12
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfIBXXY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 19:23:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbfIBXXY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:23:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MmNT2GNSz9sDB;
        Tue,  3 Sep 2019 09:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567466601;
        bh=tM4Se0ghU6EvfG5YHXW6xz3e3rrwbr86sW5Qju0/BtY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KoWsN6L8RI1PXhIKccv7M5MaWPwXcNDz7bXRpkvUi21nthdPkRfKjjSvHEsSUhE/h
         rBG7SkXTsH7D3AhJpgNi2Ppjjfp5lLNtFff5r703PunJZGFDEcVumN52QO/dDwvT4x
         Od3kzLcjxUrb2ZamKlFSfcMqyOuKzOHuxW2Eqsnowh7z0wz9VtDAfHkH7pfwAL8slF
         GH2hfjtUbRLWZ6ocdqZMKWajv+kOroeCXjcF89wRpsU/0vstbJQLxaJhVQzhtmF3ho
         dMacAOpjINrykUKPOGK/LTkrZgkR/IL8WVIK0Z2Gey2FQnkinqXkG1vMJSMcOM2Sr8
         KoFDwxEI56Jkw==
Date:   Tue, 3 Sep 2019 09:23:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the fuse tree
Message-ID: <20190903092317.3a3da7e1@canb.auug.org.au>
In-Reply-To: <20190902153004.GD1131@ZenIV.linux.org.uk>
References: <20190830130119.446e7389@canb.auug.org.au>
        <CAJfpeguxmJvCV+PXr=wz5HXONKv4RDmZ1LpYNEqAtvw_smP5Ag@mail.gmail.com>
        <CAJfpegsijOi6TdRcObGSAJ+tS0JiZky=v6Wqh5u8RZTzi6tkjA@mail.gmail.com>
        <20190902153004.GD1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i6q79=0Faehytbw16uzTHyt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i6q79=0Faehytbw16uzTHyt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Mon, 2 Sep 2019 16:30:04 +0100 Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> ... originals cheerfully dropped; will be gone in today's push to
> vfs.git#for-next.

Not pushed out yet?

--=20
Cheers,
Stephen Rothwell

--Sig_/i6q79=0Faehytbw16uzTHyt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1tpGUACgkQAVBC80lX
0Gz6WAgAghQIissRjjPYmc1lfjIUFBTS7rwhUfdPLnntq0SBfKBvoUQtenVyUzHr
TF/AVeRU09F7bWd5YsSRd40tEpoN9luo3AW49iRcdDn7roKvVfMTydgrhzdE7Rf0
mToD17OHyow3L9w3wpT6Mp1W6De0aXadsxDrDeTabcLePEXrYxL2k0XZyafw33xm
zPAK4NIwLG3QMooJ/YHsnJZJiQHQSyGyOJxxw/cd0M4hwthcSonlh2cUehUEdpgg
8K5VoRc2v+NQKAiw5FdQvgOYMsDE7gB4G7g7Gqkk5HIZQM8HPV8VRBu8Ye7Qyr7R
APY644IpVKDvVnznE/2Xx0iZJf1nvg==
=Z8ck
-----END PGP SIGNATURE-----

--Sig_/i6q79=0Faehytbw16uzTHyt--
