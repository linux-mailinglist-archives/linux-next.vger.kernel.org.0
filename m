Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B02F3AAD7A
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 09:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFQH0n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 03:26:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230146AbhFQH0n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 03:26:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FF946135C;
        Thu, 17 Jun 2021 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623914676;
        bh=kYpRoCitoYvT/w7g/xkzemT/VH7zaHQLehAHc215/n0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u9nXki9XryJ0w2TIGZbHhR0OzLjq+ljjJL32qKnh1KhUhq3I1Qivim3Bv2fRyJJmR
         Yq/h2/ofn67jCzAb0f15vDFYV9S6UC75P5E88t0YL5fzQZ6hci6niRglzQfR7VZRik
         6ZZC30PBLFCPSQYv7F2QbzI1M6Aac8tmKU6dEYEv///jLTpOpC+A0VluUGjZtQeM3M
         nFpBq+en+IkO1K7Ca+k3ihTF1Eju8W7Tyc64I82s8C+Nlx7fw4XlB3RJOleEQtHfU1
         dWjk9YlMw7tSlK6pAjbHvtjYgKeUSe6+N2S3NZO7pGSfF64oC+g22KfnEh4LbFZJ+X
         qAkZjR8r7murA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ltmO9-0001Av-JK; Thu, 17 Jun 2021 09:24:33 +0200
Date:   Thu, 17 Jun 2021 09:24:33 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pho Tran <pho.tran@silabs.com>, Stefan Agner <stefan@agner.ch>,
        Tung Pham <tung.pham@silabs.com>
Subject: Re: linux-next: manual merge of the usb-serial tree with Linus' tree
Message-ID: <YMr4sYHUNiGrjB8P@hovoldconsulting.com>
References: <20210617150224.19213166@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ryjozJGk4o7WYpH/"
Content-Disposition: inline
In-Reply-To: <20210617150224.19213166@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--ryjozJGk4o7WYpH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 03:02:24PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the usb-serial tree got a conflict in:
>=20
>   drivers/usb/serial/cp210x.c
>=20
> between commit:
>=20
>   6f7ec77cc8b6 ("USB: serial: cp210x: fix alternate function for CP2102N =
QFN20")
>=20
> from Linus' tree and commit:
>=20
>   8051334e901f ("USB: serial: cp210x: add support for GPIOs on CP2108")
>=20
> from the usb-serial tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, looks good.

Johan

--ryjozJGk4o7WYpH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYMr4qQAKCRALxc3C7H1l
CGrNAQCwkFz1f3N3MP+mkAJVHqoOIzGaGYlbA5RR/omLbW91kwEAnJX4plxwldbT
XfshzbSvSlPH5yLf9N9ypudASw8AzA8=
=Ngpi
-----END PGP SIGNATURE-----

--ryjozJGk4o7WYpH/--
