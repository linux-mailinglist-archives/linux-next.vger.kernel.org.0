Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02D8197AE0
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 13:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgC3LfT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 07:35:19 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45530 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgC3LfS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 07:35:18 -0400
Received: by mail-il1-f193.google.com with SMTP id x16so15384018ilp.12;
        Mon, 30 Mar 2020 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=STJoDQnNxyxtNOLGstObx+rrMyRlmYWEbAqvXTqhttE=;
        b=vGNB9mRlNrfqMzj5IVsAL3VvF1HanMFINy5IeVKBxINJJU8bwp84QKkff5z0BG2kPm
         gA94RZSEIX/Q59LOO2bS5NE+d5iI1GWzP1uAQne47447kVmzLT0SRgUMhg7J7wt+vfGZ
         iDvvKduOAJbrYuoIquLSisbo4NIBw4Dmzo5VFIefDn7NgD+qdWoc1X77QU0RkEnJkuJU
         04epD4YNKd3ezf1+olSVJ5bTi0EenESNu/YFadSrczcRdoTFeVcQRQyihnMms4L2GWbw
         L0Z0cUYMlrtHNWCggr0nSqQ51UMczv9vFKL/xgGLOTdcIN073fOgeA1Ud15pfZKJ6imY
         Medw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=STJoDQnNxyxtNOLGstObx+rrMyRlmYWEbAqvXTqhttE=;
        b=IQJaswTnva5XppY9TngIdfWHPBzAzsw7GRf5E5/DnobKgkPCQq1w5loaI+XRTJ4eqP
         Gi8/f8AOiSMpyc3wP8JGzkl/qpZ8lR2Zmi9hUGxE1ksmQd3ryic0wpliVraDn/m1IRzC
         kugbGK1lcNapwsqpCfnxnBIWbN5gvkVGjWikoR0cedo4HyMdZSvBCO7hkhcawyB9D1Yf
         YXfqLpZ9mzZdtqgwthZonLCruoinb79WffKqK6IJkpV3xQciyty2E2lsfBWqKPuqtSIf
         APgPJpUlONpW3xbyLlDfEd24JTdYjibei6zO+GYnIqaSbvoEopBktbS5AEY+6ab3AlJx
         0E+A==
X-Gm-Message-State: ANhLgQ1Kijf7a3XGT29+VH3FeeniSxwjaNn31WMKa06mKmx/2nAeKo/0
        FUZZnyBRwLwH/V9/Xp8Vn/C3DuYy8WamAPOtOgkZYw==
X-Google-Smtp-Source: ADFU+vsWtPyrwdqj71KtushyxMZ54QOSOtZLLcDf9wnU8XhfOES+G0fFINdp0iDYMhAPUprrWNtm7nOT6zRn2IKZrz8=
X-Received: by 2002:a92:c00a:: with SMTP id q10mr10679625ild.151.1585568117885;
 Mon, 30 Mar 2020 04:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200330143529.4dafeb34@canb.auug.org.au> <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
 <20200330150819.7f0199a2@canb.auug.org.au> <20200330074823.GA14624@zn.tnic>
 <87wo72uv3z.fsf@mpe.ellerman.id.au> <20200330081652.GB14624@zn.tnic>
In-Reply-To: <20200330081652.GB14624@zn.tnic>
From:   "H.J. Lu" <hjl.tools@gmail.com>
Date:   Mon, 30 Mar 2020 04:34:42 -0700
Message-ID: <CAMe9rOqCEtn7e2NaKfnX97HUjcN54y481YGN28GfkwWHs8CfcQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Borislav Petkov <bp@suse.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 30, 2020 at 1:17 AM Borislav Petkov <bp@suse.de> wrote:
>
> On Mon, Mar 30, 2020 at 07:04:16PM +1100, Michael Ellerman wrote:
> > Or just squash the hunk Stephen posted into the commit, which is what I
> > thought would happen to begin with.
> >
> > You can have my ack for it:
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Thanks but considering how this is not really urgent stuff and it can
> take its time and get some wider testing before getting upstream, I'd
> prefer to delay it.

Skip my commit will also delay other commits since they depend on my
commit.

-- 
H.J.
