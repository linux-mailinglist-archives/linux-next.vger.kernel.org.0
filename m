Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E978D6FB0
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 08:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfJOGqs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 02:46:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42038 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJOGqs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 02:46:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so22279886wrw.9;
        Mon, 14 Oct 2019 23:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1D5BNf7xXmUCNM3AxBUssRSS1OVYajR36F9GifIvR1I=;
        b=Ip2jE3zIq4TaPSh8//NQPy3L2FxPMrEFnJaqH81XFa2FXV2NuqpUcheSZZfB1bbxT9
         Vz7ivNQLLGwswNtWa9ihM2uAMkblZ23OpDsE5IrM1tbmx+z7xZ33QSI6tMV3Gv8F39HU
         l0512ASCzGx2p/D03dPW9zuSKFTggkB0YJJzl/3aYjIwacNzukZhHFKCHjVJ1se1sK7r
         jqJXyU8ASyc6IPoSHqUdQKbZQqzDOnTHYrV3g6gUGMSs/pCn6HidONlW1i7lWtZEZ+e7
         VNkseLve1I1qxjzV/1G92xYDrgmvqj9mUYE8U6XccN4Uymy/nZxZAkpHYuKisR7VAtHP
         s9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1D5BNf7xXmUCNM3AxBUssRSS1OVYajR36F9GifIvR1I=;
        b=Fe7XufR4YvcP882Th+Q4MtftBpsie/fQq3g4kD0bucHRyUmi/d00nT0QovIs3lcNQq
         G4bZQtPXZpIoFxSagBoz2fPSKKkypz7LrcEh7gI1p4CvgvPVXjAS/kWwC4m5ErUJIv0a
         CgnFJjN+U+RdIGNPtJC732XvBXmVbYgwH2f+TPjrre3lFb+3B2TCRJbXgt/C7fTJ22Ow
         t9RtvhIR8eL14O4JLAAzxL+NAY+j29K5Hxg19xoF5P43q/ZTpKshtOu0gohUB2iinYe7
         A6y3GmqNrW30yNMFIymOicerLg/eMzcQ9qw3Y3ssJgbjamgtd2D+ws5KILr5EIewZlDu
         Xd4A==
X-Gm-Message-State: APjAAAUn7k8vw6RT0K0SNu6D2LFTo3Q25JqsEkdkP0UiEylKNXrSZH4a
        jzlbKizRUBJCX7TWte5JLISmeS7zmuCQjaiIuWDUgaLM
X-Google-Smtp-Source: APXvYqxYHgsW6AU1zv7iOrGXS79KJdYrWtjUmUDEhqJflfSuKkb1L6dMoARCpxwmPq8EBOm/HfH/pSWOiz3G3JkKYmw=
X-Received: by 2002:a5d:4ace:: with SMTP id y14mr17671304wrs.131.1571122005276;
 Mon, 14 Oct 2019 23:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191011110149.79d529c4@canb.auug.org.au>
In-Reply-To: <20191011110149.79d529c4@canb.auug.org.au>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Tue, 15 Oct 2019 09:46:33 +0300
Message-ID: <CAEnQRZDONh-HcPnKPV_ieTNqVKJkxfNZ_7hd+KEut85tY=BMcQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Oct 11, 2019 at 3:04 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from include/sound/sof/dai-imx.h:11,
>                  from <command-line>:
> include/sound/sof/header.h:125:2: error: unknown type name 'uint32_t'
>   125 |  uint32_t size;   /**< size of structure */
>       |  ^~~~~~~~
> include/sound/sof/header.h:136:2: error: unknown type name 'uint32_t'
>   136 |  uint32_t size;   /**< size of structure */
>       |  ^~~~~~~~
> include/sound/sof/header.h:137:2: error: unknown type name 'uint32_t'
>   137 |  uint32_t cmd;   /**< SOF_IPC_GLB_ + cmd */
>       |  ^~~~~~~~
> include/sound/sof/header.h:146:2: error: unknown type name 'int32_t'
>   146 |  int32_t error;   /**< negative error numbers */
>       |  ^~~~~~~
> include/sound/sof/header.h:160:2: error: unknown type name 'uint32_t'
>   160 |  uint32_t count;  /**< count of 0 means end of compound sequence */
>       |  ^~~~~~~~
> include/sound/sof/header.h:167:2: error: unknown type name 'uint32_t'
>   167 |  uint32_t arch;  /* Identifier of architecture */
>       |  ^~~~~~~~
> include/sound/sof/header.h:168:2: error: unknown type name 'uint32_t'
>   168 |  uint32_t totalsize; /* Total size of oops message */
>       |  ^~~~~~~~
> include/sound/sof/header.h:175:2: error: unknown type name 'uint32_t'
>   175 |  uint32_t configidhi; /* ConfigID hi 32bits */
>       |  ^~~~~~~~
> include/sound/sof/header.h:176:2: error: unknown type name 'uint32_t'
>   176 |  uint32_t configidlo; /* ConfigID lo 32bits */
>       |  ^~~~~~~~
> include/sound/sof/header.h:177:2: error: unknown type name 'uint32_t'
>   177 |  uint32_t numaregs; /* Special regs num */
>       |  ^~~~~~~~
> include/sound/sof/header.h:178:2: error: unknown type name 'uint32_t'
>   178 |  uint32_t stackoffset; /* Offset to stack pointer from beginning of
>       |  ^~~~~~~~
> include/sound/sof/header.h:181:2: error: unknown type name 'uint32_t'
>   181 |  uint32_t stackptr; /* Stack ptr */
>       |  ^~~~~~~~
> In file included from <command-line>:
> include/sound/sof/dai-imx.h:18:2: error: unknown type name 'uint16_t'
>    18 |  uint16_t reserved1;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:19:2: error: unknown type name 'uint16_t'
>    19 |  uint16_t mclk_id;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:20:2: error: unknown type name 'uint32_t'
>    20 |  uint32_t mclk_direction;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:22:2: error: unknown type name 'uint32_t'
>    22 |  uint32_t mclk_rate; /* MCLK frequency in Hz */
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:23:2: error: unknown type name 'uint32_t'
>    23 |  uint32_t fsync_rate; /* FSYNC frequency in Hz */
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:24:2: error: unknown type name 'uint32_t'
>    24 |  uint32_t bclk_rate; /* BCLK frequency in Hz */
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:27:2: error: unknown type name 'uint32_t'
>    27 |  uint32_t tdm_slots;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:28:2: error: unknown type name 'uint32_t'
>    28 |  uint32_t rx_slots;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:29:2: error: unknown type name 'uint32_t'
>    29 |  uint32_t tx_slots;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:30:2: error: unknown type name 'uint16_t'
>    30 |  uint16_t tdm_slot_width;
>       |  ^~~~~~~~
> include/sound/sof/dai-imx.h:31:2: error: unknown type name 'uint16_t'
>    31 |  uint16_t reserved2; /* alignment */
>       |  ^~~~~~~~
>
> Caused by commit
>
>   b4be427683cf ("ASoC: SOF: imx: Describe ESAI parameters to be sent to DSP")
>
> I added the following fix for today (include/sound/sof/header.h
> probably should have something similar):

Thanks for doing this! Is this patch in linux-next already? I couldn't find it.

For include/sound/sof/header.h Morimoto-san sent a patch to alsa-devel.

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 11 Oct 2019 10:56:46 +1100
> Subject: [PATCH] ASOC: SOF: dai-imx.h needs linux/types.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/sound/sof/dai-imx.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/sound/sof/dai-imx.h b/include/sound/sof/dai-imx.h
> index e02fb0b0fae1..31ccb87a8273 100644
> --- a/include/sound/sof/dai-imx.h
> +++ b/include/sound/sof/dai-imx.h
> @@ -8,6 +8,7 @@
>  #ifndef __INCLUDE_SOUND_SOF_DAI_IMX_H__
>  #define __INCLUDE_SOUND_SOF_DAI_IMX_H__
>
> +#include <linux/types.h>
>  #include <sound/sof/header.h>
>
>  /* ESAI Configuration Request - SOF_IPC_DAI_ESAI_CONFIG */
> --
> 2.23.0
>
> --
> Cheers,
> Stephen Rothwell
