Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D822F966C
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 00:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbhAQXtF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 18:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbhAQXsw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2021 18:48:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D044C061575;
        Sun, 17 Jan 2021 15:48:12 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id md11so8331250pjb.0;
        Sun, 17 Jan 2021 15:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmCHmedBg9aRizqqRS6XhjxGld3VF0s5zIWola8U/lA=;
        b=OeD10PE2Mtfp075FZt/mPkAa9M73J7nW2oESa7M87ZvxLwc1hPCGn3Jh3j3nBm3zMP
         K6qZp4O2mvgagpyadKsgz8o+eieDtNk+fbG7/HxYfMhEI8fcPGFfPtz/lEKJPsCQR1om
         Gqi8BAUWQM3Nq/cw0eiic96keMoSQJY4VVkF3Y7p0HFyOBQnZgsuqchX4IU6mQ3lw6Ho
         +IMPgq4Pe1/tDvsq5q7+02rZwssc7GW+fbKuElwKycKxAKSOuC6qTAx2i0poZph4lFNn
         M6BkggOIoiSpHnRA1hPN+F3kTKh382F1AFlWBLfEC6Et+jGPwxzb7mW5x32lk3pF7P3C
         pttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmCHmedBg9aRizqqRS6XhjxGld3VF0s5zIWola8U/lA=;
        b=XayUWzj88RnQQP16mKUQAEHYVDsTlfhb3qyTSXVRC2I/5KenPD6FwCh8rpJ7ez6Iku
         fxKEmg1DW22WH3reTbY0Ls+NfHZ4U6zj+U3mWfUs6fDx3LAtmjMBqMPyIwAmHSxappsO
         s7tdsEzuAUmje705SUGqdI6mLZyU0aBCF9d0RBzCUvsmaAyvhon5t7WmnWB284yphFns
         WlUTmdpSaJRlm4nG0K2krUKm5RQbCHkm4TcLCFvOWEIj4BoJLOxqdajWPPwl2hV1iZrD
         ltPCY4qUBz04gM7xyDHH6Ap5xlupdDzBSA6TGd++2oeB1Kg8BIGXJUD/XFYzbes1gDTM
         BBgg==
X-Gm-Message-State: AOAM533IXbqyjrqN4BReEbivzjFHtQMm0TG5S6ZXB1YZm8NpWvnCBW27
        wiIFPFY2EIZ3P7wG0cj3Cz/XGhVEuu0=
X-Google-Smtp-Source: ABdhPJwownJ25eQ4nDOqZMN5rJcNq6v11z0e0Q3pTP1NZPlhVz4cbSChG+9U+gcljpxZpJr2W4E8ew==
X-Received: by 2002:a17:90a:9ac:: with SMTP id 41mr23334109pjo.46.1610927291611;
        Sun, 17 Jan 2021 15:48:11 -0800 (PST)
Received: from sol (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id c5sm14507363pgt.73.2021.01.17.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:48:10 -0800 (PST)
Date:   Mon, 18 Jan 2021 07:48:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the gpio-brgl-fixes tree
Message-ID: <20210117234806.GA6731@sol>
References: <20210118082109.725aff1a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118082109.725aff1a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 18, 2021 at 08:21:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   ec6c3364b816 ("tools: gpio: fix %llu warning in gpio-watch.c")
> 
> Fixes tag
> 
>   Fixes: commit 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected
> 
> In commit
> 
>   56835f1c14bc ("tools: gpio: fix %llu warning in gpio-event-mon.c")
> 
> Fixes tag
> 
>   Fixes: commit 03fd11b03362 ("tools/gpio/gpio-event-mon: fix warning")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected
> 

Damn - not sure why I started doing that - it is in one of my selftest
patches as well, and checkpatches.pl doesn't pick it up :-(.

Cheers,
Kent.


