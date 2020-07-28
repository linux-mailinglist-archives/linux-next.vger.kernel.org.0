Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF2B22FF8A
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 04:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgG1CYI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 22:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgG1CYI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 22:24:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1CDC061794;
        Mon, 27 Jul 2020 19:24:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG0qB2bQ5z9sPf;
        Tue, 28 Jul 2020 12:24:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595903046;
        bh=QYrh6JuegVXs91CocDLskgRYXIAujIO6EJFuR5xiVLE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lhwRCRZXh9BxJhb4EuPO9hNBOAWGd0Z69GH/kua/gPpLqLLM3Jyt9HE78tbysoSn3
         kEyIdu0nzNkTiEKqzM7VJQW7ou3C7h6A2SozN5aDGET8rfMVyeuVPMVD+pq95mtpYq
         f87lvSeyAUg7v/q0gqNtPhRMayqh8PF7g2bseGa98hN85v8UwTo4ZBZzFq+DcjRprR
         sr+AsrJGRVXbfYjCDVwSN7wDYJDgObw3qGsvyOuHPwpaNofQGc2SpAWd2iCSwXZAfM
         zN5UjjSmIASjTbTQnQ8QGwNFuBLbWavIn3VAToEnougLNwEnhNyF5Wkm80wOElDCPh
         OirFZ7EF3mMiw==
Date:   Tue, 28 Jul 2020 12:24:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200728122405.338efd5a@canb.auug.org.au>
In-Reply-To: <20200728015408.GA1296462@jagdpanzerIV.localdomain>
References: <20200728114927.4590731f@canb.auug.org.au>
        <20200728015408.GA1296462@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5UA1WCnIQWn5qG15w/WzNGI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5UA1WCnIQWn5qG15w/WzNGI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Tue, 28 Jul 2020 10:54:08 +0900 Sergey Senozhatsky <sergey.senozhatsky@g=
mail.com> wrote:
>
>> Sorry about that. This will be fixed for tomorrow's build. The problems
> is that we have commit dependency between printk and locking tree. So I
> pulled the
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dl=
ocking/core&id=3Dc935cd62d3fe985d7f0ebea185d2759e8992e96f
>=20
> into printk/for-next.

OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/5UA1WCnIQWn5qG15w/WzNGI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fjEUACgkQAVBC80lX
0GxnbQf/Ww514Pxz0skSGmh5AgxHTJeB3jAbOoenAEFYOFtnBZ7blBWyCdStiYnd
8T0TTDwQfRS1OpV42UFpcn8r92m2BirFwLDJsnJlrEdGhwf0+meudGVQVS9Uu0n6
9PAau3UUB7g7Wag7e2479X5iUNMzpK2cwqmoOPcuv6DfEaCxcDCxEMscukJ6nOeH
Ol3CaSdaBs9vf+5ozrPqjMd3QoTWatAksDRGTFZfjjYATnl9OHXCWUnOLud+Nuj7
5QG0lq4Zo6ckmu02DnE9r4swVpsIME81WphBfCql5+TaGbzW6PDnmu9ulgwTuG24
Su6pQ359K+BUjGFXA43gc7kKBMnt5A==
=T7Es
-----END PGP SIGNATURE-----

--Sig_/5UA1WCnIQWn5qG15w/WzNGI--
