Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDFACF457
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbfJHH4g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 03:56:36 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46433 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730309AbfJHH4g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2019 03:56:36 -0400
Received: from [IPv6:2001:983:e9a7:1:a406:d42:889e:ff00] ([IPv6:2001:983:e9a7:1:a406:d42:889e:ff00])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HkMBiUPk8op0AHkMCiKhZ0; Tue, 08 Oct 2019 09:56:34 +0200
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191008103045.2d4711e2@canb.auug.org.au>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <225b19dd-a0bb-37a0-afbd-14acd5067521@xs4all.nl>
Date:   Tue, 8 Oct 2019 09:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008103045.2d4711e2@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNHyCzjZ5wPea/gAo1szz4vcI4XTrIQTlvprro1WK/gbn2HoolZbxpzQpvlFraBU2vkc7+nASMtkUdwCbT7DAIgJeju6qmqsvdJOR6Rreu9wHkHHzfgv
 Ya8JLTzXp+JldA4phq6VLCGKCverlqvgHwLNSpOlUS4zRgmCQmFgPfpIrUQKb8PNhLGznZjL3rd6LjyAAdgQ/aAS30o13V1WfBF5A1tmmSJRANRrjSyhMRPK
 w46UIZ5aqONCtdaZW13yu86Gut4PdizoYl5HOOCugY9Gmr9a8E71R7c+9we8ukMSh/DAAO3we+sMBH1mfd6x2IIVaOf+r6kHaH2YoRBX8IEKwFPsW6vpxFpd
 LpKTsBseU97LaiZk0PwIAY16x8w41nBzOLOjetu6vF6Ml/K69GNtTRm+nVufE9DgmNYPBoWJ1oQk9I+DW7LZ6SdLmyOIL1co9aRgw01zi5ck1KvEvzVTLQaG
 rxQYPAGHP5yLSD5vXEhWVgX3JAc+TA37z8sCzQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/8/19 1:30 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> 
> Caused by commit
> 
>   10d8f308ba3e ("cec: add cec_adapter to cec_notifier_cec_adap_unregister()")
> 
> interacting with commit
> 
>   7e86efa2ff03 ("media: cec-gpio: add notifier support")
> 
> form the v4l-dvb tree.
> 
> I have applied the following merge fix patch.

That's the correct fix, thank you!

Regards,

	Hans

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Oct 2019 10:26:05 +1100
> Subject: [PATCH] cec: fix up for "cec: add cec_adapter to
>  cec_notifier_cec_adap_unregister()"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/platform/cec-gpio/cec-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/platform/cec-gpio/cec-gpio.c
> index 7be91e712c4a..42d2c2cd9a78 100644
> --- a/drivers/media/platform/cec-gpio/cec-gpio.c
> +++ b/drivers/media/platform/cec-gpio/cec-gpio.c
> @@ -259,7 +259,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
>  	return 0;
>  
>  unreg_notifier:
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  del_adap:
>  	cec_delete_adapter(cec->adap);
>  	return ret;
> @@ -269,7 +269,7 @@ static int cec_gpio_remove(struct platform_device *pdev)
>  {
>  	struct cec_gpio *cec = platform_get_drvdata(pdev);
>  
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
>  	return 0;
>  }
> 

