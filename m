Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3B215CB2D
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 20:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgBMTcC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 14:32:02 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40929 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgBMTcC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2020 14:32:02 -0500
Received: by mail-oi1-f195.google.com with SMTP id a142so6963267oii.7;
        Thu, 13 Feb 2020 11:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5EM0RgnUTNWODqZzobMUi09w/3LfolH4SIDh9tQKPk=;
        b=rj6SFsL/etIgKWfEf5Scsvy+GgbkPx3a8/P59WS7nErLtQRZCXQo7egHGWFY4mDPBw
         ry6uffErajd3tuysCqnEjGkHn5IRwcH24ufvwRJflFs8ppUZwF8eKAYS4Sa35yhk49eH
         74+zp+L3GRzKKXdEpcnzSaw1D7wHtAkHZipBBn4RLncrlGKT2bo6enNnb9fuArU3NhJ0
         q2ar4bthJKK9RFbCgeWluPxtmNNbfbkhja10Azdh5O3xOIXcCyMaQOmyiXwPSdHpX8Ej
         bCJY+51Do8NQ158gavOo244av9QKLzahRSIcyDthpq1gkMM5H9wH7vv5kramgbesDpDv
         tFWA==
X-Gm-Message-State: APjAAAUikEBoXlz02DKCDJZwQTj3v69QfFvFwnvsDj91f6elQADhOjCC
        cszVmpPT0XhFP83+ToErBstvyr80TxJw/J32Jis=
X-Google-Smtp-Source: APXvYqx1aFT+mAkIsBCyJmbfRN6elDm/k7oARKr9GA9dIpi8l19F7unEfkZKEa+wTFDdd2Ywd5z6YOc6xOgMS4a0/2U=
X-Received: by 2002:a54:4707:: with SMTP id k7mr3807992oik.153.1581622321623;
 Thu, 13 Feb 2020 11:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20200213145240.2ff2b6a2@canb.auug.org.au> <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
 <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
In-Reply-To: <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Feb 2020 20:31:50 +0100
Message-ID: <CAMuHMdVLbVsgTC9R6qk=TOGKwmXpg+attNq=SYhR5y807L+DAA@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 13 (sound/soc/codecs/snd-soc-ab8500-codec)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Thu, Feb 13, 2020 at 6:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 2/13/20 9:06 AM, Randy Dunlap wrote:
> > On 2/12/20 7:52 PM, Stephen Rothwell wrote:
> >> Changes since 20200212:
 >
> > on x86_64:
> >
> > # CONFIG_ABX500_CORE is not set [this is in MFD]
> >
> > ERROR: "abx500_set_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> > ERROR: "abx500_get_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!

Yeah, commit d8dd3f92a6ba11f9 ("ASoC: Fix SND_SOC_ALL_CODECS imply misc
fallout") is in sound-asoc/for-next, but didn't make it in next-20200213.
I expect this to be fixed tomorrow.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
