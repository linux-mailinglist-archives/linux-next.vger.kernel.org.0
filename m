Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478B71E1BA4
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 09:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgEZHAa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 03:00:30 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:39550 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731341AbgEZHA2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 03:00:28 -0400
Received: by mail-oo1-f68.google.com with SMTP id x17so46031oog.6;
        Tue, 26 May 2020 00:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7HEh2Qh/gNFg6DnLQdsmCP6n/1RILXfo9NFJFD3qnQ=;
        b=LPmXsbZ4qE6gw4F62062TnNmJHiOFC+QnCO3B+acxJEEaY5UM6snMrQCPou/uZ0enI
         mQqplcNl6mEGTNjUuJs3Qb/eQH+ST2PUc2k4toJa+mXrs9vPbPDi/N5w6vR6Fm7gJDM4
         U4vn3P+f29is2SGzyXuxAN0V7wMMDWWhopXl+YiKb3veh3lSmx2y3ndIbXOQkfga8+BW
         6+qgh7Ht2lIVVyNk9Vfz6VUhesQmkjKUf4RV9FsM3P5W6b0YEjYfJFLR88vuUtnl5B3B
         Uz7NRnt8Is+yd5TJcKP01+AxuVJYXngKXMRZBdNu0WXCGxR02/2CLpdm7Y/Ta9NuMe7n
         FM3w==
X-Gm-Message-State: AOAM5317HRhu7obaj6xHzuHC0qBz8CmP3TOMayh1yjQRXKjGNipm1PD4
        wS7Z4e9nOlHyIjKdkQNKVMEcRC6LqxSOZSHfeDMsQw==
X-Google-Smtp-Source: ABdhPJyw+nIAs5rr1vxFWa7FBC7gJPo2bdxtgHW5ZEX+SGXAzHr+xd4hMylc6CuqtwwWf48Cu7aL8IgdRSopyZpZi/s=
X-Received: by 2002:a4a:95d0:: with SMTP id p16mr15838848ooi.40.1590476427408;
 Tue, 26 May 2020 00:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200526152015.60b5bfd9@canb.auug.org.au>
In-Reply-To: <20200526152015.60b5bfd9@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 May 2020 09:00:16 +0200
Message-ID: <CAMuHMdWZhpUghStL3PR4Xwp6CHjSYDj2Ap-YCPzRoKeChu8U-Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the watchdog tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Wim Van Sebroeck <wim@iguana.be>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, May 26, 2020 at 7:20 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
>
> between commit:
>
>   ff1ee6fb276c ("dt-bindings: watchdog: renesas,wdt: Document r8a7742 support")
>
> from the watchdog tree and commit:
>
>   d0941cfb9fa8 ("dt-bindings: watchdog: renesas-wdt: Convert to json-schema")
>
> from the devicetree tree.
>
> I fixed it up (I removed the file and added the patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 26 May 2020 15:15:51 +1000
> Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: fix up for yaml conversion
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 27e8c4accd67..572f4c912fef 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -24,6 +24,7 @@ properties:
>
>        - items:
>            - enum:
> +              - renesas,r8a7742-wdt      # RZ/G1H
>                - renesas,r8a7743-wdt      # RZ/G1M
>                - renesas,r8a7744-wdt      # RZ/G1N
>                - renesas,r8a7745-wdt      # RZ/G1E

Thank you, looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
