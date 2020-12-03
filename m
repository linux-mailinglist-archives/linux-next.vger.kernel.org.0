Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF3E2CCDAA
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 04:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgLCD6Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 22:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbgLCD6P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 22:58:15 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A66C061A4D;
        Wed,  2 Dec 2020 19:57:35 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cmhqv627Gz9sT5;
        Thu,  3 Dec 2020 14:57:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606967853;
        bh=Ebk9NTXJeBR3VNzbERK43Lbken/T5duu1b6F5A4LySA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cdMIhsZ6unNX9nybG/UZCwhy2aMvb0ZmJ1qPhia44GEQ/frrZlnDLuX/mZW6S2XcM
         0t4r7ZeFFbIqWBnkyuYAflbXy9qBJk6bSlcsglk8ocvkkX2/0nCFRe+FsO4/0irneT
         gTpB8zI8TL04EM5GR2u75q3SbiQPO53ySylinv7crJ1bKPGuy3luDFI0LV+rzhWlIL
         gra5ZWaPXuUqdeltNVQd1dqA8hWf7i002lqBXYEwZnzP4kgIDdPN1dl7rB73nNNT1r
         uM3ncjx2RJDhwUpoAARg7/FIZ/C5TQtRbt8vSm2RpptcA2WNEr9rhXTpTEzvFhBkWJ
         JQbaF0/mUx22g==
Date:   Thu, 3 Dec 2020 14:57:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the f2fs tree
Message-ID: <20201203145731.1894ec90@canb.auug.org.au>
In-Reply-To: <20201203144348.70f139a9@canb.auug.org.au>
References: <20201203144348.70f139a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=1bMG=H84QhTOnL5l.E88d9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=1bMG=H84QhTOnL5l.E88d9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Dec 2020 14:43:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --cc fs/f2fs/checkpoint.c
> index 14ba1519639e,54a1905af052..000000000000
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@@ -1385,27 -1385,6 +1385,26 @@@ static void commit_checkpoint(struct f2
>   	f2fs_submit_merged_write(sbi, META_FLUSH);
>   }
>  =20
>  +static inline u64 get_sectors_written(struct block_device *bdev)
>  +{
> - 	return bdev->bd_part ?
> - 		(u64)part_stat_read(bdev->bd_part, sectors[STAT_WRITE]) : 0;
> ++	return (u64)part_stat_read(bdev, sectors[STAT_WRITE]) : 0;
                                                             ^^^^
Clearly, that should have been removed - I have done that now.

--=20
Cheers,
Stephen Rothwell

--Sig_/=1bMG=H84QhTOnL5l.E88d9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IYisACgkQAVBC80lX
0GzA0Af9EVTFd6o4vzJy7V5wrgoxVwrEz7vZl+Ck4cc4P0kjILMQfxjd4eFbV4yI
kcdigSNERQkmgEW8ctraHxoF77P+59FIV7IgdGSBDxYrXP06BAoezjzbYlpBxtGe
px97p2lCByi9vY1wBGab+fd7hAso/OR7KV4HuteYjdNnuC55In5R7bcNIPujcKdw
Em5YhcFR7Z5Y8/SNdD/uvU23kscVY6bzvIIPwpuU6BjW/omHVm6DPIW1MvrEtpMG
W/Qt5UA49BDoIWg+ND/8CB0t03f6RQFSg1LDoRml9+MBaHWaSspPOaLjcEhZYIKI
FCP9ImwwMZXfato1/WR9QbAfGHkaGw==
=pMwz
-----END PGP SIGNATURE-----

--Sig_/=1bMG=H84QhTOnL5l.E88d9--
