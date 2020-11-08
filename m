Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB44B2AADD0
	for <lists+linux-next@lfdr.de>; Sun,  8 Nov 2020 23:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgKHWV7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 17:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHWV7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 17:21:59 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56795C0613CF;
        Sun,  8 Nov 2020 14:21:59 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id ec16so3194149qvb.0;
        Sun, 08 Nov 2020 14:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MQVOKvYXN6L2Rzqbl1xOYIU3tjbqeVAG8M7oQVuJt1g=;
        b=dhwdS+QfDvqXT0Fgw9oRCbuSdPYbjJhrv4IPN/2BxwjApHV1HCr2bYLIvd8INrnRjp
         eFImd8nVyTwuwcPKcWByKdS2GLcSjiD9XsIi1fwXdd/CDsFC0R8Yn/3hlWUdiuSUfXvN
         Ee4oVKwvUpJl3YjyovaJfmPl5OgZIorGACpoqPkkbUPFxdNharOvviHdByuyf0Vud4TS
         xsBQmVOAsp4vYevn6CsTJKxq2ExMNwUdeTuiBHmKaalJjLtFR5fKdb1TUzJh6d08ctpc
         nYzmPUGaOv1Iib7udPIHYSPaRbagWUqtm6PnEI52GLyWL/hLJKdIbIHREbuO/OSOaSp9
         OGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MQVOKvYXN6L2Rzqbl1xOYIU3tjbqeVAG8M7oQVuJt1g=;
        b=S3Th5IMknKQ8ce5m+R44NveDqMFeVP3Ac2UdY1gKw/kR0U5NsC4vje3oZMJ1+bg46N
         oEh+Gr/6hAC/3q2I2BgLrWw+hxNAFOuYgAiHG7AP205Crqv59EQ7IS8i61lpPh+ybiwU
         c1aTZ/cUdv5KRKacX+6TglvLiilQ+T02+m4q/4IBuMQSwPUDD3lnbgQ7Zcg28Izw1Auv
         iO04TXsVN//TpsFB+zOfr+rxhW/Wak/MMd/ActaeEwd0tuRrLZCHF6u/RrfWbwV0N5jZ
         4SvZ5AphCiIVSSfAQTPYaupQJp0eDX2+k8anAcTLp2rjbqtxKugy+q4t2ON4BeWnz+XB
         c4cQ==
X-Gm-Message-State: AOAM531oEBVMfLW1hJxVLRmtNj9Dowfaju7qJ0LME3/vIYetBfeBi2ag
        +A9e+dA4oAcBsqVhdxL3sp4=
X-Google-Smtp-Source: ABdhPJwbtdBLF6YA6w31BbHg7WNyNB9VfZcAV7phnPFwWNueLIpZCodqx+6CezVOmZ5ifg6vynSGZA==
X-Received: by 2002:ad4:50a2:: with SMTP id d2mr11360069qvq.21.1604874118187;
        Sun, 08 Nov 2020 14:21:58 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id f21sm5008031qkl.131.2020.11.08.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 14:21:57 -0800 (PST)
Date:   Sun, 8 Nov 2020 15:21:56 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: next-20201105 - build issue with KASAN on ARM
Message-ID: <20201108222156.GA1049451@ubuntu-m3-large-x86>
References: <7021.1604774000@turing-police>
 <20201107200453.GA92349@ubuntu-m3-large-x86>
 <20201109091919.6e77162a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109091919.6e77162a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Nov 09, 2020 at 09:19:19AM +1100, Stephen Rothwell wrote:
> Hi Nathan,
> 
> On Sat, 7 Nov 2020 13:04:53 -0700 Nathan Chancellor <natechancellor@gmail.com> wrote:
> >
> > Because it builds fine if you check out Russell's branch. This build
> > error only happens because of a treewide change in -mm that was applied
> > after the ARM merge:
> > 
> > https://lore.kernel.org/linux-arm-kernel/20201106094434.GA3268933@ubuntu-m3-large-x86/
> > 
> > https://lore.kernel.org/linux-arm-kernel/20201106180929.GD2959494@ubuntu-m3-large-x86/
> > 
> > Stephen could apply that diff as a fixup for the -mm patch when he
> > builds -next or I can send it as a formal patch for him to apply.
> 
> I have applied the patch by hand today, but please send a patch to
> Andrew pointing out that it should go in his post -next series (or
> possibly he should also move
> treewide-remove-stringification-from-__alias-macro-definition.patch
> into the post -next series).

Ack, thank you for the guidance, as I am unsure how exactly contexual
changes like this are supposed to be handled when dealing with a quilt
series. I will send a formal patch soon.

Cheers,
Nathan
