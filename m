Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F36FCFA6
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 21:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfKNU2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 15:28:00 -0500
Received: from mail-yw1-f52.google.com ([209.85.161.52]:43399 "EHLO
        mail-yw1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfKNU2A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 15:28:00 -0500
Received: by mail-yw1-f52.google.com with SMTP id g77so2321095ywb.10;
        Thu, 14 Nov 2019 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gosnal9kN2eql1s5D44AG42b0F2sEZJ5o9XY9+CqiYA=;
        b=PzjKrL6+NtYpShE0wz+zoY5KXIXzF5xtBIF/4/oy2hzZP5HFYbzYdR+Go9vFiv06xZ
         zJSenwFilMhq2UAQZ3DZHfkEjTjb9LdiEebVK8E2JFJbvIw3+PtujoMQjXjfbGaNjGTD
         WUQdzjo57bxh8uQsEp0br8Yjr2Xluw+chU/9z739Kxk8lej0GtvT8Ysfu5+JOuGkT1Zh
         nVANma13htudxUG6rosrLVjUD1L2sgHbQqrt6HkfuGRGO8kGgW/iiVMobYj+m4JZN+Eo
         53zEtbEe+fdgJOiaxRTEcEBIGjken/T/+HAbGaJKiBZKZ9OIUtvdgCTBwbtZlsdy8Op5
         eZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gosnal9kN2eql1s5D44AG42b0F2sEZJ5o9XY9+CqiYA=;
        b=awkDfBDVi+S2vctnCgclol79rXZKjm0zfDI3h7CGBnwG1APaB8y6t/rxwgrVLCcuv5
         eQydKMhdfmtFDM2iW3rqM28zEBRbaYzw7YYT43YO4SpBWTB0IPWP+xuaHPrDjCrLMoHW
         YtfuAsZdRQZH2uJEImlK5T6LnLTf1KscaBCX1ammJKxRopiO2wxLAhe/OyL+zsT+jiyI
         Lw/7GPru8atACJtOLw73BX7EhKPFwor6emT/U5+U8nKHwGAkt/kW8g1Au7vZms/xknUa
         rJXID4dGOZK/wfgGxjnH3AfobqAJgpvxsBij8QSulK3VmMFN71wR20ZIcklsZ6g6YAuT
         vYxw==
X-Gm-Message-State: APjAAAW5UC5iSvgmoPe5rdKZGrHoQns2HBmLDmltGwjni0tJinRGQzm1
        wLGAVErZUtf/LEW/rgNZ7aZ6rkcB69qlf3zk9qZYMaHPVqw=
X-Google-Smtp-Source: APXvYqxTIj/kWS6wMWLhbvm//WPEF9tRDyOypt44M536RxAxRtlC7o7bsI86qeHS+DWhxdpAI9RSLA0dNIm9ZeclWkg=
X-Received: by 2002:a81:5794:: with SMTP id l142mr6854892ywb.107.1573763277722;
 Thu, 14 Nov 2019 12:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20191115070908.01d8e46d@canb.auug.org.au>
In-Reply-To: <20191115070908.01d8e46d@canb.auug.org.au>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Thu, 14 Nov 2019 12:27:45 -0800
Message-ID: <CAMo8Bf+9=0t+z6r=Mct358h8zDOjiVCYQiS7DxYgz6JcGTrYVg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the xtensa tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Nov 14, 2019 at 12:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit
>   29ba235590d1 ("xtensa: use MEMBLOCK_ALLOC_ANYWHERE for KASAN shadow map")
>
> Fixes tag
>   Fixes: f240ec09bb8a ("memblock: replace memblock_alloc_base(ANYWHERE)
> has these problem(s):
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.

Thanks for the tip, I've fixed up the 'Fixes' tag. Fixed version of this fix
is available as
00c04249bcbe ("xtensa: use MEMBLOCK_ALLOC_ANYWHERE for KASAN shadow map")

-- 
Thanks.
-- Max
