Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3FEF130EAC
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 09:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgAFIbe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 03:31:34 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36891 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFIbd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 03:31:33 -0500
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MAORp-1iz5IW2Uqh-00Bu9v; Mon, 06 Jan 2020 09:31:31 +0100
Received: by mail-qk1-f177.google.com with SMTP id 21so38814060qky.4;
        Mon, 06 Jan 2020 00:31:31 -0800 (PST)
X-Gm-Message-State: APjAAAXf7U5Y9BdtI0ve1ah9eoBXvrGr3L6Vgm2v+UiGzDcMDxuUedkk
        hHivoLSRkovs7jSZ9G6p7NPiE6XIurTAdBGZp04=
X-Google-Smtp-Source: APXvYqxZsWU2QLf/FdzNbSOSla44PrYp9XSNZI8cNfhlDw976ItL50JNJsm2jDVDGm34SSZ4jtTSThjQmfmA8BiElbo=
X-Received: by 2002:a37:2f02:: with SMTP id v2mr79153504qkh.3.1578299490385;
 Mon, 06 Jan 2020 00:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20200106152440.05a36767@canb.auug.org.au>
In-Reply-To: <20200106152440.05a36767@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jan 2020 09:31:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ackxPwQxb-yeQ1pgJ5Hbh44NXDUCSfROc94kmmtx89A@mail.gmail.com>
Message-ID: <CAK8P3a2ackxPwQxb-yeQ1pgJ5Hbh44NXDUCSfROc94kmmtx89A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the vhost tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:o0lL4PYCfDlclo7MpjY2ToHdxN7jVTkQ4upu/0ib5d+awm9fpnj
 11x34rp5JE75YqLPyqo1XMQ1z+bnSPmRTNakkipZ4Z+Mfe8QoQr8syEFaMff99DE+arSCIV
 I2n6UcUaE4NVhkq4t31X95f8g3sUDsYebNwJU1FaZW429BDRWU7ldnk1pbMAkTdXxvdZCIh
 OaFCPtmvrvHPUKxCJjmtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wj16PETHAdg=:hJAYZWt/5E2e1W3OdCfF2B
 vYjfoJ+P5vz3CtOeBXUooR7h6jMcPylGprruVFJ30YVxVqLP3aAJ8EbxNFq6qhLjEgDLdIsef
 fEGguDgqm8Czsn1H4T3HAHCNkn0aYYFA3H83Ci5K5DbaJYFPZCRz66afrv5HWwdwn4MOxsS5n
 AaR3IAKCCiWKJmn9XldszvS9HX3QZfuERUMKyWhmsZDACKhQrfakZYndSdLCYgkG89ocVoEGr
 u3uAhc2n1E1p5BsYDJanNFgn112OEJa0lflKSAJB4/Ll7myaT2H1aeQ+7UpAATPhh+MtkgCbW
 XVAW7mVATKMx/BOzAkp2Jz73MoVqFH7LzJQGUcfw6Rs87NJsu7D+PqEOcu6vZOGOSn0zFpAHb
 yerH8KELomm5iUWepXX36xlKKN+jXJ74CVHPNNvb4/bQJDdU/eZLZq1zbsqKDX7kmDPFGUH+x
 6u+O1oBguAimuXXG0RW4nP1be1iOwkzyvLc+yNvZ0toQslVvsM8R3cmgr2vmMONsJvvVS2nbi
 WiEygSzxOSzUuRLM2B1b9NKApY6dl5zLDXtwifS2Jlsy3gO94U4A/2rqK3dLD9ooMP3XiGTyP
 63wFlsjfx4cfEALQPERKn0PLmCqRY4DF6X2XOWDBWpt8avWotXmn948kJXnd4v4yCNGdTvMoV
 EzUaSKS08J+KDRjHzgVXvl1nml/UsQZw6qoprlRSNVZEpUrCkyv8hII+ANxmRcfmAalNKgP5n
 OxNsPYnA6xkDeO/TwHnhG6N8/FCs44Cyq8nCYTDyW3pgU983HY7yZZXGLY3xwvPQXryuN7tlX
 Sa8/kfcYOzZ0lKM3pA5t4ykpXuvAFbc7RvbfoxQsh8+u17CxlRHAVbSwovkPzJJjBg3psb2nE
 bR4k0FDTqA0A/sAn63zg==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 6, 2020 at 5:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the y2038 tree got a conflict in:
>
>   drivers/block/virtio_blk.c
>
> between commit:
>
>   d1281e3a562e ("virtio-blk: remove VIRTIO_BLK_F_SCSI support")
>
> from the vhost tree and commit:
>
>   d320a9551e39 ("compat_ioctl: scsi: move ioctl handling into drivers")
>
> from the y2038 tree.
>
> I wonder if this driver needs a compat_ioctl entry at all any more?

It doesn't. The rules used to be fairly complicated, but not
(after my patches) basically any driver that has an .ioctl
function must have a .compat_ioctl function and vice versa.

> index 54158766334b,fbbf18ac1d5d..000000000000
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@@ -310,6 -404,10 +310,9 @@@ static int virtblk_getgeo(struct block_
>   }
>
>   static const struct block_device_operations virtblk_fops = {
>  -      .ioctl  = virtblk_ioctl,
> + #ifdef CONFIG_COMPAT
> +       .compat_ioctl = blkdev_compat_ptr_ioctl,
> + #endif
>         .owner  = THIS_MODULE,
>         .getgeo = virtblk_getgeo,
>   };

Removing it would be better, but this version is not wrong.

        Arnd
