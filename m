Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC7118AC67
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 06:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgCSFnG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 01:43:06 -0400
Received: from ozlabs.org ([203.11.71.1]:46601 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgCSFnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 01:43:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48jbRC4tDWz9sPk;
        Thu, 19 Mar 2020 16:43:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584596584;
        bh=y84bblK27nWKwmaC9KF1aLCcYU/Cn/0VfU66+sQZemo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JGyPSjhJjcMZ5dcpgAmSThijGM/bjpPdOLdQOsFrBIQcl/Rexay7OY6ocIhtdIQct
         MPoqauXaHFo1R+DSUf0NBVXX7+19GcH5TkW18cHuQ8HSWkJjVNN6kf1xr4ioo8vAl7
         dWNeoLmDIOmO0LhWH/3SKthgVmVMIxebp7TlN4Ojeh4nkDTL605pkxUh2PljGGQWA0
         9gn/owPz1YRVj8maFpaAZVO434rguC5iYVqFdwrJr5xJwj4mKj/u9LgaR8ZcBMbg/u
         ogqSzMlLezNa2oBAe7aAiAP8ywheJToDNUrTLezQEzzksgHmbHHwuETBYRwarVMLES
         29S9+d3ZyharA==
Date:   Thu, 19 Mar 2020 16:42:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Message-ID: <20200319164259.34a3df52@canb.auug.org.au>
In-Reply-To: <20200318231837.4041cd8f@canb.auug.org.au>
References: <20200317185252.3cfeecde@canb.auug.org.au>
        <20200318224458.1980e10c@canb.auug.org.au>
        <ddc7ae33-1b82-ae48-5a7e-e78144fb2a8b@canonical.com>
        <20200318231837.4041cd8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pgc07lYg4LlrlRQi0UWj2DK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pgc07lYg4LlrlRQi0UWj2DK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, 18 Mar 2020 23:18:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Colin,
>=20
> On Wed, 18 Mar 2020 11:52:00 +0000 Colin Ian King <colin.king@canonical.c=
om> wrote:
> > =20
> > > This was fixed today (by including linux/ioh), but the latest update =
to
> > > the pm tree has removed that include again.
> > >    =20
> > Hopefully it won't be reverted from linux-next? =20
>=20
> Linux-next just contains what its constituent trees contain each day ...

I have had to revert commit

  08c07cefb304 ("ACPI: sysfs: copy ACPI data using io memory copying")

again.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pgc07lYg4LlrlRQi0UWj2DK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5zBmMACgkQAVBC80lX
0GzN8wgAoInnlFPbWqojFwNMHvNURO+rmiw6bWgvKSq4l0b9FtcWI6ZgT/tNXKnc
CHGaVkNlkkNckJ1O/ebarikuuBSm80gFH8K7Z4tZX65MD8EI+Vn/yFTguT++eeFC
WWVx8DVB8vOfawqAdoTI9d5Ytv0F5vrk1KUFgNLwD24F3DTzOpxNMakeCMiSlaJS
XcbdelrLnN8W9pWEQqGmG92EXaSSSB9l36L46Glrvu9ktcI4Yw/nY98Ms6ifMd/2
ciM/3n5yCHoKMYVY5oFldg++hBqqnQaclHgh/N8MIYjuOy7ri6JM9YrGSTsdHSFV
OEKEc4ZSp1IFK8J1br5EwrjEZrNnHg==
=oXci
-----END PGP SIGNATURE-----

--Sig_/Pgc07lYg4LlrlRQi0UWj2DK--
