Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064824BF1D8
	for <lists+linux-next@lfdr.de>; Tue, 22 Feb 2022 07:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiBVF55 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Feb 2022 00:57:57 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbiBVF54 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2022 00:57:56 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E408B7D011
        for <linux-next@vger.kernel.org>; Mon, 21 Feb 2022 21:57:31 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bg10so39435524ejb.4
        for <linux-next@vger.kernel.org>; Mon, 21 Feb 2022 21:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p/PmgnBMBE+a+LwnMw7RC+TxwSBL0sVYbhSV1c+Rplg=;
        b=HlroeRgk73cYJrya57IgoHaHYLeOQRZ8CFTKMyFrCQHZQft9rOKWBt3CMXGj8Hwp9y
         OGy7sNphB9Uqe6NWrSnzVQST3fDo8GycVwSxApBKE3AyeyubM14vpJoCdrwaTkK5kp7n
         cQyH7ksBDdcAQf+va82zEfbNiMIfQ7/cIXkVCcOwQbjxF1f5sLftHexJzTNZLmjXJvrQ
         WTVOPvI57wSmoZTTx1AVEgdWqYkpSr6ypiNnPHrvNh6daYJjvApt9/Ud15DRX8oTYctF
         MPEysQxdr7jBz9rTvY+DeVJw5EiPD0hc4QIeTMefTCLu+iCc3VWzd2Og153uAUiWlD09
         0APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p/PmgnBMBE+a+LwnMw7RC+TxwSBL0sVYbhSV1c+Rplg=;
        b=tZAQEUsG3a2pFeaimYdNPIp8zwwFsopuCYWI4R31epc+cDX443fGYoAdlsKvJKKlTs
         nICD1b1GiGU2NvQ6fy840a+hEO1+6aT++5j5wzaRB6h23xEmoUW1XvAMeFeHY72+Wa4t
         K6DX9+eCtfd0yMSKg/LE4YEL0iyJiQt7oEZCd1lX0FuT/ssUjPNwVsHEG1iS2ouR1dl0
         mZR93bThOWZYLRdbQ0Got0hsz90hVpX6sCVYlGn9v2dds0zmI/HXEyNPxCiaRIY0i8a6
         spk1BUwKjSaoUtSB632St8LKJeDyqkGk64Ne/ZN9sQzVrS4/cHw25dijnCd15Oa1LFH4
         Sf6Q==
X-Gm-Message-State: AOAM530B4ctzgOehco+DtlLJdne3iLZ1zqS2zHzFixxcEHO2MsHdupK8
        P8kkXJ341Ik0CiVId/G9rNiqAvfvns7uYX1rjVT5aw==
X-Google-Smtp-Source: ABdhPJz8UvpHNGjwosxt0eNuD825WY1Yan8kUpAgvw5cnK0YhJVzisH6PHoeBKC7hmKBNTUEoKrxFSkN0+HDrNt/e8M=
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id
 p1-20020a170906b20100b006b558c8e43cmr17564278ejz.441.1645509450470; Mon, 21
 Feb 2022 21:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20220221215911.2948692-1-broonie@kernel.org>
In-Reply-To: <20220221215911.2948692-1-broonie@kernel.org>
From:   Jinpu Wang <jinpu.wang@ionos.com>
Date:   Tue, 22 Feb 2022 06:57:19 +0100
Message-ID: <CAMGffEm_J9WcP2eoopwX8eEnRz9n4EycWxwgzP4c+NFr0eYXkw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the block tree
To:     broonie@kernel.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Christoph Hellwig <hch@lst.de>, Gioh Kim <gi-oh.kim@ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Md Haris Iqbal <haris.iqbal@ionos.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 21, 2022 at 10:59 PM <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/block/rnbd/rnbd-clt.c
>
> between commit:
>
>   448025c103938 ("block/rnbd: client device does not care queue/rotationa=
l")
>
> from the block tree and commit:
>
>   e8e9884730b36 ("scsi: rnbd: Remove WRITE_SAME support")
>
> from the scsi-mkp tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
Hi Broonie,

Thanks for fixing it up, it looks good. We will pay attention on this next =
time!

Regards!
Jinpu Wang
>
> diff --cc drivers/block/rnbd/rnbd-clt.c
> index 1f63f308eb394,dc192d2738854..0000000000000
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@@ -1606,13 -1607,13 +1603,13 @@@ struct rnbd_clt_dev *rnbd_clt_map_devi=
c
>         }
>
>         rnbd_clt_info(dev,
> -                      "map_device: Device mapped as %s (nsectors: %zu, l=
ogical_block_size: %d, physical_block_size: %d, max_write_same_sectors: %d,=
 max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, s=
ecure_discard: %d, max_segments: %d, max_hw_sectors: %d, wc: %d, fua: %d)\n=
",
>  -                     "map_device: Device mapped as %s (nsectors: %zu, l=
ogical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, di=
scard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segme=
nts: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
> ++                     "map_device: Device mapped as %s (nsectors: %zu, l=
ogical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, di=
scard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segme=
nts: %d, max_hw_sectors: %d, wc: %d, fua: %d)\n",
>                        dev->gd->disk_name, dev->nsectors,
>                        dev->logical_block_size, dev->physical_block_size,
> -                      dev->max_write_same_sectors, dev->max_discard_sect=
ors,
> +                      dev->max_discard_sectors,
>                        dev->discard_granularity, dev->discard_alignment,
>                        dev->secure_discard, dev->max_segments,
>  -                     dev->max_hw_sectors, dev->rotational, dev->wc, dev=
->fua);
>  +                     dev->max_hw_sectors, dev->wc, dev->fua);
>
>         mutex_unlock(&dev->lock);
>         rnbd_clt_put_sess(sess);
