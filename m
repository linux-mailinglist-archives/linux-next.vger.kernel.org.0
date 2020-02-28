Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCA4172D6D
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 01:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgB1AfE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 19:35:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54470 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbgB1AfD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 19:35:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id z12so1442608wmi.4
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 16:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+y+J6aBAVQm7+lBq+/zozG5JL2IvJJLjLrQfS4QdVQ=;
        b=AdYaaS+z+BmKy2R4hzS0e0h6MCTJzCLfwcVwFY72/idqQIjeHS5Wtnv/QRN0RvFf0L
         Un5qUTpREaru8OKagFadavE5NB2uGDKjRv4UvBNjALauBiwh9WMfJ7+eXNpDhTnmDfte
         bAl+kMgFgAi70PTn10seOYYcZbcfC4OjEoksSakPEmJ8pQRwKU/r8s41tLPGzmcYT7/7
         EEhndo0236jBuNhE3FW8I1fv8sZI+PjgUWlXEt9fCfabeHx5OUBudowQM+2l1m4smH55
         fZg9fZ5Wy0rQuuuI0IHLifpFccz+1hUk1BvyjFJjBfWLOObzXwCHJUOTIaaWEHGnzv92
         aj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+y+J6aBAVQm7+lBq+/zozG5JL2IvJJLjLrQfS4QdVQ=;
        b=FyhsNHFy5td97BJnwjpUYmjyzbqX+6V5wyCd7EvJTIpucfQ/vp/u6kQvpGwinr5XvN
         2Z+iKeELS5U54A87kTzQIoa/PHqfSW7pB7MQoRs72bhQUysua0vG7GfpkvyUMmFvVT5L
         zknXNC6UnWx3iqdxiUDW3IdFiWaR2kQv5fyeIdWlTDI8r/NjKMWYOF9moAnmEtxsRnED
         JrhbEfwyEyYP0LDZABbsvOaCWWsrvDmIHF01ijxn45ncCMGP2R0kYszuoyo7UFPdDW9d
         yrb6te3nBFsH5qs1BX+M9lDxilxGrVV3cmA/pvF6UndmR4l4A0BHL49wXA0/P5kB3Tz7
         jMbA==
X-Gm-Message-State: APjAAAVgR3yHZmhi0J58cUFtOSKb2gCIlf3NRDzo4azpuSN28gh6YfP0
        3ykcUeXFPwWJaq66zLEK5IVRx/Us7hv21lyA2GPuuw==
X-Google-Smtp-Source: APXvYqzCW1mGRZylyx23Rk8Wc+OsvoYXqbmKSb28ENyZ8D2cARNMUch6jMz915hBoo5e4HcHmmudR8qltx0UYXMUbAk=
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr1333343wme.125.1582850100078;
 Thu, 27 Feb 2020 16:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20200227151143.6a6edaf9@canb.auug.org.au> <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
 <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
 <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
 <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
 <CAOFY-A0icFrzHibVrUu04JaiBBqNoNoEDYVjHGi4eMgDT1Z2KQ@mail.gmail.com> <20200228082831.0149e354@canb.auug.org.au>
In-Reply-To: <20200228082831.0149e354@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Thu, 27 Feb 2020 16:34:48 -0800
Message-ID: <CAOFY-A0an+H=aP6vANr17rrv7v5F99azi4UVaYNTAcpRSRsHUA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Soheil Hassas Yeganeh <soheil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 27, 2020 at 1:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Arjun,
>
> On Thu, 27 Feb 2020 10:50:51 -0800 Arjun Roy <arjunroy@google.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 9:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Sounds good, thanks. I'll cook up a patch and send it along.
>
> You will need to keep the sparc64 patch to correct pte_index in this case.
>
Agreed on sparc64; I think the sparc32 patch ought to be reverted,
though (since pte_index may be meaningless to it).

Thanks,
-Arjun

> --
> Cheers,
> Stephen Rothwell
