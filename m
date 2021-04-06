Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E803552A0
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 13:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbhDFLq2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 07:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhDFLq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 07:46:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3928C06174A;
        Tue,  6 Apr 2021 04:46:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF5MX6Tj4z9sRK;
        Tue,  6 Apr 2021 21:46:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617709577;
        bh=+Wm34ejyav+nZTgQTO8sx0zmXJDuiB/juUfnoDNVFwY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bzq8ynUPK0rP/AEtvz2CHIuT88WTc9U3O18HEFW8mJs2kjdvV0aMCOdZpH5L0lVxs
         PMkA9kfMaCL1amg7IrzuWW0x6HqmNZL7xAHZq/CB8d0cjTzAx0V2I53D57aBrdV2K7
         tWa1bhGxCWSGjLfTvud1OCn6jRsECl7cMGzQte29EDnEPkkBYilDkHh+fpsT0i3HxB
         Xpzc1EMGpHTermsoCHLxCAkUyIoTBwhZqtyUTZQJWhGohZU4gQp4xcf2Ni0x8IIE5R
         wWEncZc0IFEfNtBiKLOwwUJKV0rsBltCQrj1vfBm2pDs/5PtPOQH+ioNvI3SLdgd7r
         ukeIkfSmrXHJw==
Date:   Tue, 6 Apr 2021 21:46:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Message-ID: <20210406214615.40cf3493@canb.auug.org.au>
In-Reply-To: <20210406214441.5744648c@canb.auug.org.au>
References: <20210406214441.5744648c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gaL=GBrvSlPtm+Zv8YVMNpG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gaL=GBrvSlPtm+Zv8YVMNpG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Apr 2021 21:44:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the char-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected inde=
ntation.
> Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected inde=
ntation.
> Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote end=
s without a blank line; unexpected unindent.
> Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected inde=
ntation.
> Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected inde=
ntation.
> Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote end=
s without a blank line; unexpected unindent.
> Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected inde=
ntation.
>=20
> Introduced by commit
>=20
>   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-xd=
ata-pcie driver")

Also:

Documentation/misc-devices/dw-xdata-pcie.rst: WARNING: document isn't inclu=
ded in any toctree

--=20
Cheers,
Stephen Rothwell

--Sig_/gaL=GBrvSlPtm+Zv8YVMNpG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsSgcACgkQAVBC80lX
0GzJQQgAkzuGr7f8+7nUfOzf0QJ9c7+tfyEZ/DWUiCSnk55a2c2zKpY4oueGMpmf
Z2MQmO+F3YnWE2kDqZq3NeKhuQsDH8RpW/8aB+NeRq0dpxbMoz2ZhryrJmHhaZqD
qbYgroXZCxmT1+SuZYsFJAAUywY+QxM2GxQ6YoWSds0ft0ua6zmLHSOqiJQRsXaA
YtlxRHj1y2gaovtn4FqVa/+y9pVa4YQ+uTb1qdvNXRlyriEalRj9jYiBXiS93WKY
B536EcIM4v7XpTQ7uBqb4uPVkWHMEB+jceDGFy0iqk5nXJ1VbiwcLNx63shywJHm
ltTyxL0s6YjnzS0fHhqsCkCxYu3FRw==
=JmDz
-----END PGP SIGNATURE-----

--Sig_/gaL=GBrvSlPtm+Zv8YVMNpG--
