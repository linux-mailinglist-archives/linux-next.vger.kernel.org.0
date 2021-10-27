Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62B743C8C0
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 13:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhJ0LpB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 07:45:01 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43453 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbhJ0LpA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 07:45:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfRd46p0tz4xbq;
        Wed, 27 Oct 2021 22:42:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635334954;
        bh=G7vtBzdtwJ7fjHZiICFxjEO1GioPBcOgVhByiF5L4N8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZQH2CM0Yx0m2OsXP3gcECvHlLOSKOUhcV7r8OecVM7lakviKoU8gI9sfyug6FiJ1i
         Fwm1aWia1kWI7+QT8xfldklaca91zM77suHPabimlpPlepR1AtHKFK8P1EiDSjH70r
         UHMdSl7x2B6smXypKjSnp6wX5hHA/8WK5ieskcED5J7EBPAKUvEdw67R4p8+AHKeqp
         7+xiStsQUNI3VTUolx+IgxbbdeQ+P3DhU2aEFrko4SYjMQpBFY0ffjr2CEqn+Iyuak
         kDweAciHurf/ftDRgCTXIZEG7ZdJXlTQd6SQkjGpSp9LfnU60VtypcguCpoDG2djqg
         i/OrqC4b74XzQ==
Date:   Wed, 27 Oct 2021 22:42:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: linux-next: Tree for Oct 25
Message-ID: <20211027224231.1634cc6c@canb.auug.org.au>
In-Reply-To: <20211025204921.73cb3011@canb.auug.org.au>
References: <20211025204921.73cb3011@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5iKOjd.5EWHPwSYHxwsDRT=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5iKOjd.5EWHPwSYHxwsDRT=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> There seems to be something amiss with cnosole output in today's release
> (at least on my ppc qemu boot tests).

The console output seems to be back today.  I assume its repair had
something to do with commit

  60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_chars()"")

--=20
Cheers,
Stephen Rothwell

--Sig_/5iKOjd.5EWHPwSYHxwsDRT=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5OycACgkQAVBC80lX
0GzIrAf/QPJ8D+knDQ0Jx+Y2x0hUU0+jZa8xexb5q6jbM9ZRTBenGtEbgnuGRzMV
BeOWQ6OoBM/lfNbD1IJ3WI/pBRIjezUUJqbrxOL54XL6Lb5EW3Kyuzl17kfiR9xi
j92l37j66FGDopiqBsjrg+wZKmaRdyGbvn4f8oJ6G+qcX2ZbsN1GbSB3y47wps8i
kTHZUezRDjNg6anbUb4AUMa4fDWnQefHlEnnZfqf/ZKZbqDUFxc942QY/BpC/Ngr
7AktCWgS8CBWcvh+Hq20B7sAuzKe1RUIKH9MqV43tzofA3r5U3TUhrBPC/+G+S2Y
RR0amaYQ0Wms0YtjNYHtNwuDUE+BAg==
=ZngI
-----END PGP SIGNATURE-----

--Sig_/5iKOjd.5EWHPwSYHxwsDRT=--
