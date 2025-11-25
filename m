Return-Path: <linux-next+bounces-9207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4FC84069
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 09:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222C03AFEC7
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4882DAFB5;
	Tue, 25 Nov 2025 08:37:41 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2682DAFDA
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059861; cv=none; b=Jb1uuFt+H4wxHnGQL+Knrv5KcNeNdBb6/NqILZl4yQTImRwJ+Ti/M1JupowIj4Wy2wVPk4/iQ23ifjEKlg0w7miiHyM6lZAUX6wH7UlqYD3XtY+bz9z++5J4r4e+yhB8oLUFb/8pmk6Pd+jQGRtKlG3lsORxHFOhfTZ/Mpw5FQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059861; c=relaxed/simple;
	bh=5Hu+Fja2D4hdNo3wayotM/qt3DMYYSUdsxZHNUlelCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nstr9Wzy9aNLee9OjFzqJOTU/O1Um/oZkXOfpsxhcQdul5aUh2RtjWBSafqHwsyx4ZqeyNe1XY1jGGvC/zxoPTWbkVzH4hYImYzPd/CsngSAT2gGmF/8F7We/AZNKvXTIQqN88hhF/1SAoepLdpLcsHTQuRKIgRaNgi2QsT6XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3669937137.1
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 00:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764059859; x=1764664659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uJHFyLiLHfadZlEWcGwwmXmF26j/zMQnT5CQzlxQbw=;
        b=CqWhC3IHF9eXklmTXvX5DWbgO2yk3Kcmi8guqOH/YGs4OwhoxPf9+oMzCqyTJ9QgZx
         1WIQmnvxDV7fiSjE3Wx1e8n5vvMFpoMgNIvRT3QoRDupn7WhAk+hsk9bfH8un36XAHic
         wZhl9J51WCfs9drs9M+T0qeOIdQNsC0OVgIvVqkX2pug0b6zQOH11lPUgIyxk1mBvzZQ
         9pc5Gg0jTrG2ovGI3rpCnUNpHMk5W6p/n47BO19fMfr9fORQn9la8V+nBphRG/HPxjAT
         daQI4pFEHTnB6xse4+QOqXc3igtSzj740mnsLRkv15eJly8/QIQJzk934DKfTWl8NgoO
         eCIg==
X-Forwarded-Encrypted: i=1; AJvYcCX+NWPHvNRZ0K17HjChHdg4+qwXKArwhp7s9mzfvRvnPrwMtkaUvr5vN8UWUsv3me6sz+Tisy8W5hUm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7oJ5Ndu+07a5YgAF0Nb9S+kZnXP2H4vzQ7ayLnT77XZiRblE
	Psr/uGRMGGJ5NkCfjwK5S9YvUEwlTXVy+ixRbpYsAOnzwr67UD7l9rjWxeO2/u+0Z0Y=
X-Gm-Gg: ASbGncs48zYMFNBPmIIOw2Hedbf404o1ax9i+LOgZX4Jh7udoBPmxB68e41Q6rfQcOw
	IAJupSvZ99/YZ23LR2gnuFHkPKfGlWakZ/nvO1jUHuRAy5YqDDJjkEbkKRph7j+mPXrdFwqkEn6
	+7wqo8rd1mWzrMTTrH/Onbf9KzKz0d2hJ6Xh57i233ACiCKpoUuwvuqbEG5WcqnGEOcu9uaEEMx
	BOog4O6Waq+1QrQ0mZMWjPectVvYYMShLyjZ8+v6lgQsN/UYKD1UgC/syl0+umktkhAw75Rlklj
	Ad0q4VN8+8rv89O9fE1CGNrjWg3zIQCT9SSHbAKnm9piVjg6uh3Z/iYqfKXh6K9PP3rKrH5Tila
	lJL+y2jb5r4/gulwe2BmhRVBBUHe2TJ5T9alfGjl89WTbR64oOGbAfAP8Cyt6fsaUbvpBqfZp67
	7PBJEF1sxaiJNYEjT5FciAyu/9srbnQIJInWrBfygXUqyhoMg8R+9IJtTzxNEpPxg=
X-Google-Smtp-Source: AGHT+IG+X1/m84RqsfVxyKLH3JkzmSCP4Rml4fMZKTLdqNzk2iAr3H4ob4AVyYHx37WGewM8qwpipQ==
X-Received: by 2002:a05:6102:2ac1:b0:51c:77b:297c with SMTP id ada2fe7eead31-5e1de272e7fmr5492745137.27.1764059858731;
        Tue, 25 Nov 2025 00:37:38 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c561c4c2asm6303339241.2.2025.11.25.00.37.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:37:37 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55982d04792so3896380e0c.1
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 00:37:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA1K5BNRIG1//Ow4wVMpXv8gp8d8h/xK2ONE4Nuz5aoRUEKMDR8jWq95NcZx0b1dJrP5kwqjvk8w3d@vger.kernel.org
X-Received: by 2002:a05:6122:3c50:b0:55b:14ec:6faf with SMTP id
 71dfb90a1353d-55b8d7d7a70mr4951834e0c.16.1764059856643; Tue, 25 Nov 2025
 00:37:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125182442.49ddb53a@canb.auug.org.au> <CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
 <87ldjuy0ln.fsf@bootlin.com>
In-Reply-To: <87ldjuy0ln.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Nov 2025 09:37:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDa0Fxxg=O2MiC2oM=unn9679g=JtPBQEOpZx4Y9nKgg@mail.gmail.com>
X-Gm-Features: AWmQ_blLW11ZgkxXyBntbkq7HGMgFxzwmwOitwNlGW8Y-UODxoOEqUaBu2TqpFg
Message-ID: <CAMuHMdWDa0Fxxg=O2MiC2oM=unn9679g=JtPBQEOpZx4Y9nKgg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the bitmap tree
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Yury Norov <yury.norov@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Tue, 25 Nov 2025 at 09:31, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >>  /* non compile-time field get/prep */
> >> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> >> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> >> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> > See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
> > field_{get,prep}() before local definition"[1] and follow-up
> > "[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
> > field_{get,prep}() helpers"[2].
> > The former unfortunately didn't make it into the nand tree yet...
> >
> > [1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305.1762435376.git.geert+renesas@glider.be
> > [2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874d7c7.1762435376.git.geert+renesas@glider.be/
>
> It wasn't clear to me when/if I could effectively pull these, nor if
> they would make it for this release. Were you (or someone else) supposed
> to carry these on your own? Or, can I just apply these two now?

The first one you can apply now, to fix the build issue.
The second one has to wait until the changes to <linux/bitfield.h>
are in your tree.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

