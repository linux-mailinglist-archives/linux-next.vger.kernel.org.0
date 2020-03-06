Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B510317BC8C
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 13:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgCFMSF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 07:18:05 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35428 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgCFMSE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 07:18:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id c1so2340049oiy.2;
        Fri, 06 Mar 2020 04:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zCzopvBe5pClIDQDJUrJo6Mdp8tlxa91qM1CJIBUoZU=;
        b=pmAH3Nl0rCv4tpkxXRd/+418oHnQ3rfDMD/Q/nM3HfFppl2u0zX4yqCzMSUyMek1gq
         TIwmFGSpfHgBoSb6GU2GA9OQFklG7TSB5fK9C7ArCqWDgy77FD6GmnFBXNGW4ylxSsd6
         1LEzlalcl2XpHDLFSveXEsY4ji0C2uvC3wzNJtzWwjiYV5k45X79MqT5aw3n0Wzh6YGW
         K/vzooN38qK1lY8OccEIgxfAT2+EDvQaZ4LFByU7OR7uoKCMXsv5J3/wkPilpuregi/J
         cxfo3jfV1jloDLsfcsn0VwX5JivCT6LKPNJBGcZ5uLzTz1+e25D3/SJl2u6YhQMI3Cpw
         pJ9A==
X-Gm-Message-State: ANhLgQ1VeaVoIN/Al9grAWokWspS6suIF7uxOBnJcT4c2yVXMF5aJuYu
        XV9UbotuK1bd781243svRoHlZUGBfFlb3PnGo+o=
X-Google-Smtp-Source: ADFU+vv2jlvbLhAc6REVXuwMcnoIkqf+yF7o6TIX59QZjp7iyI4Ry7WdpVGYuGOEEDGnsDWTufmFHi8kMV3eEpcMQTg=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2240414oia.148.1583497083839;
 Fri, 06 Mar 2020 04:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20200305175528.5b3ccc09@canb.auug.org.au> <fabd49c7-d72e-a5a2-7f2c-47a8bd6c36a1@infradead.org>
In-Reply-To: <fabd49c7-d72e-a5a2-7f2c-47a8bd6c36a1@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 13:17:52 +0100
Message-ID: <CAMuHMdUs00Qtm0CMBTougPyTZxS_cN+x8QWezs_OtPFWB0B2Pw@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 5 (sound/soc/codecs/wcd934x.o)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Thu, Mar 5, 2020 at 5:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/4/20 10:55 PM, Stephen Rothwell wrote:
> > Changes since 20200304:
> >
>
> on x86_64:
>
> CONFIG_MFD_WCD934X=m
> CONFIG_SND_SOC_WCD934X=y
>
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> wcd934x.c:(.text+0x754): undefined reference to `slim_stream_prepare'
> ld: wcd934x.c:(.text+0x768): undefined reference to `slim_stream_enable'
> ld: wcd934x.c:(.text+0x797): undefined reference to `slim_stream_unprepare'
> ld: wcd934x.c:(.text+0x7ab): undefined reference to `slim_stream_disable'
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> wcd934x.c:(.text+0x4c6c): undefined reference to `of_slim_get_device'
> ld: wcd934x.c:(.text+0x4cd4): undefined reference to `slim_get_logical_addr'
> ld: wcd934x.c:(.text+0x4cfe): undefined reference to `__regmap_init_slimbus'
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> wcd934x.c:(.text+0x6027): undefined reference to `slim_stream_allocate'

This is fixed by:
https://lore.kernel.org/linux-doc/20200302062340.21453-1-masahiroy@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
