Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC6A2CDFBF
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 21:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLCUdh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 15:33:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:46106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgLCUdg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 15:33:36 -0500
Date:   Thu, 3 Dec 2020 12:32:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1607027575;
        bh=gEGaFy/MPP9aLCzSG99SHu4NetEFmu4fXcNmm4eN/p8=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZoueEGZDNKqyvpXYqrfF2MDP39N38sJ4YSqH1EVKBHrW+Doo1/f2OEbTbHvxIaLFw
         QIn9s/f4JjpZ2vWWZOGSUkQ6t1bI+nEgCSbNh7MXZOybVt4iA3Q6yVIjBQ4eMBQeVo
         MS9B1+sqaAW1U/J4668eFz8AIjX0YKBE0Kyvazjc=
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vjitta@codeaurora.org, Minchan Kim <minchan@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ylal@codeaurora.org,
        vinmenon@codeaurora.org, kasan-dev <kasan-dev@googlegroups.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <qcai@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
Message-Id: <20201203123253.c00767545ad35c09dabd44ef@linux-foundation.org>
In-Reply-To: <55b7ba6e-6282-2cf6-c42c-272bdd23a607@arm.com>
References: <1606365835-3242-1-git-send-email-vjitta@codeaurora.org>
        <7733019eb8c506eee8d29e380aae683a8972fd19.camel@redhat.com>
        <CAAeHK+w_avr_X2OJ5dm6p6nXQZMvcaAiLCQaF+EWna+7nQxVhg@mail.gmail.com>
        <ff00097b-e547-185d-2a1a-ce0194629659@arm.com>
        <55b7ba6e-6282-2cf6-c42c-272bdd23a607@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 3 Dec 2020 17:26:59 +0000 Vincenzo Frascino <vincenzo.frascino@arm.com> wrote:

> 
> 
> On 12/3/20 4:34 PM, Vincenzo Frascino wrote:
> > Hi Andrey,
> > 
> > On 12/3/20 4:15 PM, Andrey Konovalov wrote:
> >> On Thu, Dec 3, 2020 at 5:04 PM Qian Cai <qcai@redhat.com> wrote:
> >>>
> >>> On Thu, 2020-11-26 at 10:13 +0530, vjitta@codeaurora.org wrote:
> >>>> From: Yogesh Lal <ylal@codeaurora.org>
> >>>>
> >>>> Add a kernel parameter stack_hash_order to configure STACK_HASH_SIZE.
> >>>>
> >>>> Aim is to have configurable value for STACK_HASH_SIZE, so that one
> >>>> can configure it depending on usecase there by reducing the static
> >>>> memory overhead.
> >>>>
> >>>> One example is of Page Owner, default value of STACK_HASH_SIZE lead
> >>>> stack depot to consume 8MB of static memory. Making it configurable
> >>>> and use lower value helps to enable features like CONFIG_PAGE_OWNER
> >>>> without any significant overhead.
> >>>>
> >>>> Suggested-by: Minchan Kim <minchan@kernel.org>
> >>>> Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
> >>>> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
> >>>
> >>> Reverting this commit on today's linux-next fixed boot crash with KASAN.
> >>>
> >>> .config:
> >>> https://cailca.coding.net/public/linux/mm/git/files/master/x86.config
> >>> https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config
> >>
> >> Vincenzo, Catalin, looks like this is the cause of the crash you
> >> observed. Reverting this commit from next-20201203 fixes KASAN for me.
> >>
> >> Thanks for the report Qian!
> >>
> > 
> > Thank you for this. I will try and let you know as well.
> > 
> 
> Reverting the patch above works for me as well, and the problem seems to be the
> order on which the initcalls are invoked. In fact stackdepot should be
> initialized before kasan from what I can see.

Thanks, all.  I'll drop
lib-stackdepot-add-support-to-configure-stack_hash_size.patch.

