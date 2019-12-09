Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 829E3117054
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2019 16:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfLIPYv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 10:24:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48055 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726197AbfLIPYv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Dec 2019 10:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575905090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nB6ZHawHDOXURarJ90WDoWMg8/PhBTAdpkSRqi1R6OI=;
        b=G4hMm2/oJLyvMSiIOoP4DEVHMmVzt8jROnJ7At6877YpTscrciLpj5Rb0RpyRTVdAiIN6W
        r3obEQfE9ngPvG+oNLrBq9rmRz0nIMAmpWJpLB0+rGyEI6k7U2ucW8X7edqOexv+2Wzwmc
        6o+qCDakB6+ISKp2ooXp3HuL2zb3QaM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-MBcjnJN8MBS-FQ2DPpatBg-1; Mon, 09 Dec 2019 10:24:48 -0500
Received: by mail-qk1-f197.google.com with SMTP id a6so10156277qkl.7
        for <linux-next@vger.kernel.org>; Mon, 09 Dec 2019 07:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=23mTn2Hsu8HBM40Dn4qvKK+XQePiYEyO60VZuaQCZLw=;
        b=esu6rBkDmNSXFItBx43v8oQHYuHjNtZ1o2xoaqOj4aCLtPPHmer+N5Y8KR8xmK9a2i
         +b70I5aD5pX2R73afZ4fCY7mPklLaSNpmEDrS9vMTXsdubzX1ABPXF5YAxQ2NQqHs7V5
         S0W+zt8/v3U1/5o9L1LwzOMnCLmV95OwrFjCKoz2OQhybv9CR/OYPpHmKhC684HgfBoH
         asDABFYbMvWNJ2K+vlqAw8tDMW1W7+TndE5XmfJNIhDnuKehKY8N7tGQ3OAicPlq02k6
         1ftlUTfit3pC03ZXf7HfQf+E5o31ImLoYpTHxaQVohyzx3R2RQnzOy89kXRogX4RLhXs
         c3yw==
X-Gm-Message-State: APjAAAUwH9RfhXwcRos4r+tm8LY/ZB2v1YhZs1NmDSLwjfTedorBqhZt
        +M7/CX1irUbcs9p8wPyBhw6KJWZ2rmBEHFoeoEO9rMHncvRUmDTeajLQ+ip/HUDQP0EDDRye/rn
        nk0U6uu+/FyvmwYj8/TZlwQ==
X-Received: by 2002:a05:620a:1307:: with SMTP id o7mr4424854qkj.312.1575905087930;
        Mon, 09 Dec 2019 07:24:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZHxF+oTtQnreR9C126/PGX/qNFYXwsWmTdGq2+iQI5uui3YJebhgNx7HlagBKLnY7YJzz+Q==
X-Received: by 2002:a05:620a:1307:: with SMTP id o7mr4424792qkj.312.1575905087254;
        Mon, 09 Dec 2019 07:24:47 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
        by smtp.gmail.com with ESMTPSA id p126sm8967524qke.108.2019.12.09.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 07:24:46 -0800 (PST)
Date:   Mon, 9 Dec 2019 10:24:42 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20191209102431-mutt-send-email-mst@kernel.org>
References: <20191204142404.56631d84@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20191204142404.56631d84@canb.auug.org.au>
X-MC-Unique: MBcjnJN8MBS-FQ2DPpatBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 04, 2019 at 02:24:04PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: error: initialization o=
f 'void (*)(struct net_device *, unsigned int)' from incompatible pointer t=
ype 'void (*)(struct net_device *)' [-Werror=3Dincompatible-pointer-types]
>  2889 |  .ndo_tx_timeout  =3D atlx_tx_timeout,
>       |                     ^~~~~~~~~~~~~~~
> drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: note: (near initializat=
ion for 'atl1_netdev_ops.ndo_tx_timeout')
>=20
> Caused by commit
>=20
>   29fd1db09264 ("netdev: pass the stuck queue to the timeout handler")
>=20
> I applied the following patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 4 Dec 2019 14:13:18 +1100
> Subject: [PATCH] netdev: another fix for "netdev: pass the stuck queue to=
 the
>  timeout handler"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/atheros/atlx/atlx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/atheros/atlx/atlx.c b/drivers/net/ether=
net/atheros/atlx/atlx.c
> index 505a22c703f7..0941d07d0833 100644
> --- a/drivers/net/ethernet/atheros/atlx/atlx.c
> +++ b/drivers/net/ethernet/atheros/atlx/atlx.c
> @@ -183,7 +183,7 @@ static void atlx_clear_phy_int(struct atlx_adapter *a=
dapter)
>   * atlx_tx_timeout - Respond to a Tx Hang
>   * @netdev: network interface device structure
>   */
> -static void atlx_tx_timeout(struct net_device *netdev)
> +static void atlx_tx_timeout(struct net_device *netdev, unsigned int txqu=
eue)
>  {
>  =09struct atlx_adapter *adapter =3D netdev_priv(netdev);
>  =09/* Do the reset outside of interrupt context */
> --=20
> 2.24.0
>=20
> Then I got another build failure:
>=20
> drivers/net/ethernet/natsemi/ns83820.c: In function 'ns83820_tx_watch':
> drivers/net/ethernet/natsemi/ns83820.c:1606:3: error: too few arguments t=
o function 'ns83820_tx_timeout'
>  1606 |   ns83820_tx_timeout(ndev);
>       |   ^~~~~~~~~~~~~~~~~~
> drivers/net/ethernet/natsemi/ns83820.c:1552:13: note: declared here
>  1552 | static void ns83820_tx_timeout(struct net_device *ndev, unsigned =
int txqueue)
>       |             ^~~~~~~~~~~~~~~~~~
>=20
> At this point, I just used the vhost tree from next-20191203 ...
> --=20
> Cheers,
> Stephen Rothwell


fixed up now, thanks!

--=20
MST

