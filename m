Return-Path: <linux-next+bounces-9205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C53C83E30
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 09:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA28734D046
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0142D8390;
	Tue, 25 Nov 2025 08:06:04 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B692C326F
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057964; cv=none; b=d3OHqDLW/mSKUqqgA5cxDhkNSPPadW7VbuJSymQ0QcucQzfrGIggkpLu27ZL9+Mg8rzBYZD+lXCmOgzFCZv75AORHtEAhLrigzYV8Cs84OXxLZ2lq/V9pprxlpgqNwGvW2+nlmUOa+oJyO8cT1pBafRl2HLJYVZnyTQrVxDPejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057964; c=relaxed/simple;
	bh=dEABZGVOWvvL+AQhRjaYxSnCZ3XxxmgKnWHpjb/zodM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1z16He9m9ko2fMlL5HMuHcKNNJzEaUeuJKpxC+BcTo+dOPVFRp8Ut5n6QFj79z+s2YRj4pdo8su2usk8IZKs0xww3YLWoth1zomLdOZEOSl75kubvUhWPBggiV7sJ7HyDOt0FX9/QwoH4GZ8HcIuiATm/XscwDkz3TUlii2adM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-559748bcf99so4129297e0c.3
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 00:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764057961; x=1764662761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pi6ITUJbmwJqzAoXHDaN06ivvhGw5siLKn9vzfVEiW0=;
        b=i5SGgXPtPwYdF7iieMQ0/VpwAtFhcz/uHp7YwECUXmplyBrvYLZMd2CZskzbHx8QzB
         RLim0bo/qxIEzHIPkMoHwbw9OoZcCp38Cgcjs9SUhpaVtdLUlhXl+BjwttDcEKJVsC7G
         CIZXEsrsB4QxwRi4+O1JCqd2qD+g1tbO7XQI9rehHAHiRf3ee3EnyhuvKbv/Eakig6g9
         SUux7jEN6nMs6dStgLgtvlzzcY2m7+sBTr9SLdwfum/rnxGvOT+/W8jZsKN9v2GKlc9u
         pVtaOoMlKf7R241AT/NlD/ims03G3ND5hMqpUgegBO7wnyhIghD+uecJHnM/Wn1AnyUI
         rO6A==
X-Forwarded-Encrypted: i=1; AJvYcCXQs1elCf5aT6uAX92PJ8TkJOWWZ5mA/AmAQk/iJUld2wDcVGCMVwA0jjY5oyw2vMjxeEoes/awn5Q2@vger.kernel.org
X-Gm-Message-State: AOJu0YwiM5La0RCRpceyHA7UBjygniNfFp/jS5RkXEHePGQUVWPrDPCT
	vhVWbO/ctHqmMUg0xcsX1gh2r8/BAVHGFtORWDIjcHDIQtvarBn5m4/PLfmpPtaIuNw=
X-Gm-Gg: ASbGncuXg7lnV9vXPqpdqa5KazQspDDVFcJ8444o3lMYKhzk3//I/mf5CyZAMS9cPmb
	gct60OdP8eA6tw8lSPR726zG5WOr47kKQZcb4Wx4dHI8LdvilM362Cu670zz/nOt0w5d3NG4XwE
	0+mCtncjer5Ci3ZPbvH/ioR1c9AFuzegpnwDHSxyfTyLViXIGmmfDLhdEUPbQnxDdYJQADhKXzC
	f4gRUQZjsUbe5nwMTNmBJQYkTqvCRR5afhsVPdCR8t03kWtuqKoNCY3E6LPpLTiOiWJYfY3cMRl
	YhXFBxm2V8pH41fxmw7EzqmDIOKBtBP7tlyeFQ4LEhm/9k2cnQmMb+UrYJrFaonNJcXfwz7jRNk
	XYMXNVkNrM5IJ2L655EsxwVJ30JdtB9Rwe1ruoVZMPE9PnHjtwbSH4P9Gz+EQaUexDg7i8tl+3d
	QGdF4EfujcbSikBbHH0fTy3JIeg8oA5zQ6E4ALdJZFR69JKMSs
X-Google-Smtp-Source: AGHT+IF7Uu1yxKF/oNPwLepLwiH39BCAthdqq9rBm6s8gyreZ2vt2Z+PQVtlEpr6n2rtSK6+Tv8Olg==
X-Received: by 2002:a05:6122:20a9:b0:559:85d5:bfbe with SMTP id 71dfb90a1353d-55cd76e2796mr542344e0c.15.1764057961148;
        Tue, 25 Nov 2025 00:06:01 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7749fesm6539093e0c.12.2025.11.25.00.06.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:06:00 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso2560011241.1
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 00:06:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWm5jwh4C5llPm+M3JD7ycDL6RfMDfBPzl4a7M6Q9XUqURHLw4xFLGhw1Olxw9lNionvKjN+ojrdOzG@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:5dd:8a21:4abe with SMTP id
 ada2fe7eead31-5e22423f1d1mr422570137.8.1764057960083; Tue, 25 Nov 2025
 00:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125182442.49ddb53a@canb.auug.org.au>
In-Reply-To: <20251125182442.49ddb53a@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Nov 2025 09:05:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmTX86GmGWtNTvDI4lvroi2dg2up8XGQbsD2LhIVxd8Q6UdlK6ra2aAghA
Message-ID: <CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the bitmap tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yury Norov <yury.norov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Tue, 25 Nov 2025 at 08:24, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the bitmap tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/mtd/nand/raw/sunxi_nand.c:33:9: error: "field_get" redefined [-Werror]
>    33 | #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
>       |         ^~~~~~~~~
> In file included from include/linux/fortify-string.h:5,
>                  from include/linux/string.h:386,
>                  from include/linux/bitmap.h:13,
>                  from include/linux/cpumask.h:11,
>                  from arch/x86/include/asm/paravirt.h:21,
>                  from arch/x86/include/asm/cpuid/api.h:57,
>                  from arch/x86/include/asm/processor.h:19,
>                  from include/linux/sched.h:13,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/dma-mapping.h:5,
>                  from drivers/mtd/nand/raw/sunxi_nand.c:16:
> include/linux/bitfield.h:298:9: note: this is the location of the previous definition
>   298 | #define field_get(mask, reg)                                            \
>       |         ^~~~~~~~~
> drivers/mtd/nand/raw/sunxi_nand.c:34:9: error: "field_prep" redefined [-Werror]
>    34 | #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
>       |         ^~~~~~~~~~
> include/linux/bitfield.h:278:9: note: this is the location of the previous definition
>   278 | #define field_prep(mask, val)                                           \
>       |         ^~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   c1c6ab80b25c ("bitfield: Add non-constant field_{prep,get}() helpers")
>
> interacting with commits
>
>   d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps")
>   6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")
>
> from the nand tree.
>
> I have applied the following hack for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 25 Nov 2025 17:47:46 +1100
> Subject: [PATCH] fix up for "bitfield: Add non-constant field_{prep,get}()
>  helpers"
>
> interacting with commits
>
>   d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps")
>   6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")
>
> from the nand tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 031ab651c5a8..b940eb5cf79a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -30,8 +30,8 @@
>  #include <linux/reset.h>
>
>  /* non compile-time field get/prep */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))

See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
field_{get,prep}() before local definition"[1] and follow-up
"[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
field_{get,prep}() helpers"[2].
The former unfortunately didn't make it into the nand tree yet...

[1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305.1762435376.git.geert+renesas@glider.be
[2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874d7c7.1762435376.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

