Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020C243AB8B
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbhJZFKP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhJZFKO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 01:10:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94394C061745;
        Mon, 25 Oct 2021 22:07:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdfw551Ypz4xbW;
        Tue, 26 Oct 2021 16:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635224869;
        bh=InKQ0DK/m1dZfRPN8DerRTzYLI1WiyY3zGlp9Yut7As=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bqpgZkdonVqQ9WvlveH6I8pLt/sWtqANV6rLx8ixHl1Pa0NW7vE4xvrEaSQZHcG4f
         kh6JrANEFPreXkzo33evFxd4Uc5huPXy1SVvWJO8CY0/Fa0GtFLOOWwFoPBCibGSQ4
         MSdRYamIj7BbH/gFL0pLuwYkPdYvFcPyEFIUTrPz3giZsbGuIGiskoA6+2VV0sWu4i
         VrAVeJsBHLqacOewJ0s8eZGbNNG19me3JIjahxctdUxAQDv4wsFaTSeb4SCiZpakle
         jyvgRNmlnAvSiA1NMMo51CS17SzFdT+9KqnCHgHknPN3jV9jbnp1zkGfZlrQguWWdi
         eA8mxjHQGBBVQ==
Date:   Tue, 26 Oct 2021 16:07:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Qing Wang <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dmaengine tree
Message-ID: <20211026160748.67012c44@canb.auug.org.au>
In-Reply-To: <20211026160657.63ceb380@canb.auug.org.au>
References: <20211026160657.63ceb380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xmJHXYVMWXDNa8FrbnMkdC.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xmJHXYVMWXDNa8FrbnMkdC.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 26 Oct 2021 16:06:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the dmaengine tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

drivers/message/fusion/mptbase.c: In function 'PrimeIocFifos':
drivers/message/fusion/mptbase.c:4446:35: error: passing argument 1 of 'dma=
_set_mask_and_coherent' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
 4446 |    if (!dma_set_mask_and_coherent(&ioc->pcidev, DMA_BIT_MASK(32))) {
      |                                   ^~~~~~~~~~~~
      |                                   |
      |                                   struct pci_dev **
In file included from include/linux/pci-dma-compat.h:8,
                 from include/linux/pci.h:2443,
                 from drivers/message/fusion/mptbase.c:56:
include/linux/dma-mapping.h:442:60: note: expected 'struct device *' but ar=
gument is of type 'struct pci_dev **'
  442 | static inline int dma_set_mask_and_coherent(struct device *dev, u64=
 mask)
      |                                             ~~~~~~~~~~~~~~~^~~
drivers/message/fusion/mptbase.c:4454:31: error: passing argument 1 of 'dma=
_set_mask_and_coherent' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
 4454 |     dma_set_mask_and_coherent(&ioc->pcidev, DMA_BIT_MASK(64));
      |                               ^~~~~~~~~~~~
      |                               |
      |                               struct pci_dev **
In file included from include/linux/pci-dma-compat.h:8,
                 from include/linux/pci.h:2443,
                 from drivers/message/fusion/mptbase.c:56:
include/linux/dma-mapping.h:442:60: note: expected 'struct device *' but ar=
gument is of type 'struct pci_dev **'
  442 | static inline int dma_set_mask_and_coherent(struct device *dev, u64=
 mask)
      |                                             ~~~~~~~~~~~~~~~^~~
drivers/message/fusion/mptbase.c:4590:33: error: passing argument 1 of 'dma=
_set_mask_and_coherent' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
 4590 |      !dma_set_mask_and_coherent(&ioc->pcidev, ioc->dma_mask))
      |                                 ^~~~~~~~~~~~
      |                                 |
      |                                 struct pci_dev **
In file included from include/linux/pci-dma-compat.h:8,
                 from include/linux/pci.h:2443,
                 from drivers/message/fusion/mptbase.c:56:
include/linux/dma-mapping.h:442:60: note: expected 'struct device *' but ar=
gument is of type 'struct pci_dev **'
  442 | static inline int dma_set_mask_and_coherent(struct device *dev, u64=
 mask)
      |                                             ~~~~~~~~~~~~~~~^~~
drivers/message/fusion/mptbase.c:4614:33: error: passing argument 1 of 'dma=
_set_mask_and_coherent' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
 4614 |      !dma_set_mask_and_coherent(&ioc->pcidev, DMA_BIT_MASK(64)))
      |                                 ^~~~~~~~~~~~
      |                                 |
      |                                 struct pci_dev **
In file included from include/linux/pci-dma-compat.h:8,
                 from include/linux/pci.h:2443,
                 from drivers/message/fusion/mptbase.c:56:
include/linux/dma-mapping.h:442:60: note: expected 'struct device *' but ar=
gument is of type 'struct pci_dev **'
  442 | static inline int dma_set_mask_and_coherent(struct device *dev, u64=
 mask)
      |                                             ~~~~~~~~~~~~~~~^~~

> Caused by commit
>=20
>   981b43434b28 ("message: fusion: switch from 'pci_' to 'dma_' API")
>=20
> I have used the dmaengine tree from next-20211025 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/xmJHXYVMWXDNa8FrbnMkdC.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3jSQACgkQAVBC80lX
0GzvjAf/ZN7x/gv4ks6TVZgBNPwlsGl9fT7DaauwWkFhev0k4xxjsmNgFRvJLua/
YHUuzpurWtQebU9ebgZctYWhbEfMcENPHZme/Tb3oTWFnsrgU+M91sN11XRbHKdP
twOKJofLCNbezLJFgrsVj8qDsGy4Bj29lom9IwCdQhaeqqwXuzxr1dlZ0YE066nq
x9+O1Jpmbki0w0rdcEeBneIDwtkwRRPwC1BxCtTRjLzuId86BkiVju4UP3bXy062
YKHY+4J7zw/YOE+uDHILX8L7zG+awDUEQWa9T33X1wWUE/MQpwsK3IGxtcVUD9UU
j4iYv77utNa7HwfLl75xeTYY5SD/rA==
=yIZs
-----END PGP SIGNATURE-----

--Sig_/xmJHXYVMWXDNa8FrbnMkdC.--
