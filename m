Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5BD1D26D8
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 07:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgENFzX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 01:55:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgENFzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 01:55:23 -0400
Received: from localhost (unknown [213.57.247.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6375205CB;
        Thu, 14 May 2020 05:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589435723;
        bh=Gefkr/r0GHwqvUeH8jI0ZEqLMmeQpo78dIsv6zpJkSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCCr6Hz8L3mbvGDqVFfuIoxfA0tcFlEXAJMz5spHXGVmws2miwZ8zbJx09bUlDikV
         nm59qlRHX1A079MvMQkUW9Gqc5JMG/3LYu0VD0hOGYsgOaj6pL6PVV7K/5P40r19pF
         GC4JDsRPuFfHhER7apa2ZpBBnfLcI/mWw9/LJZQs=
Date:   Thu, 14 May 2020 08:54:53 +0300
From:   Leon Romanovsky <leon@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maor Gottlieb <maorg@mellanox.com>
Subject: Re: linux-next: manual merge of the mlx5-next tree with the rdma tree
Message-ID: <20200514055453.GB4814@unreal>
References: <20200514125920.2c9a6509@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20200514125920.2c9a6509@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 12:59:20PM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the mlx5-next tree got a conflict in:
>
>   drivers/infiniband/hw/mlx5/main.c
>
> between commit:
>
>   2be08c308f10 ("RDMA/mlx5: Delete create QP flags obfuscation")
>
> from the rdma tree and commit:
>
>   14c129e30152 ("{IB/net}/mlx5: Simplify don't trap code")
>
> from the mlx5-next tree.
>
> I fixed it up (the latter change included the former) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thanks Stephen,

The mlx5-next branch was merged to rdma-next tonight and this conflict
will disappear in next the linux-next.

Thanks

>
> --
> Cheers,
> Stephen Rothwell



--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT1m3YD37UfMCUQBNwp8NhrnBAZsQUCXrzdKAAKCRAp8NhrnBAZ
sVp5AQCWsaVBheeQlJl3R/ExXhcUFhY6e0UK+ZtM+y2Zrn0f+AD/Wsb7L9MFNTqu
yTlb2xUeHe65os1kUqjxcCWtYhIdvQA=
=1tUC
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
