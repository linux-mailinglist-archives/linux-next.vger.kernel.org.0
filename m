Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77B222BC22
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 04:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgGXCuc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 22:50:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgGXCub (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jul 2020 22:50:31 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E01BE206C1;
        Fri, 24 Jul 2020 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595559031;
        bh=UlRguDF9F93X6TAdHSl8oLCte1cdlF12zQGSwWi7QTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J9LYxuQT2CyH+cQDZMp7VSIuYSbIuNmXZXem2iy9NXOlF3SZeFnv0iK9MjvrvjFa9
         dpvYZLBP3S+QCotHljNSEMQVMPsQxFYdbHbMEoaSWiYt2grGnK2pbUyJ39HHWErOC0
         Hm8kpcuBAOAO3z6jXWS94KXfSXwp/B1KFsJAL3hA=
Date:   Thu, 23 Jul 2020 19:50:29 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Uladzislau Rezki <urezki@gmail.com>
Cc:     Qian Cai <cai@lca.pw>, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        luto@kernel.org, mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        x86@kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        lpf.vector@gmail.com, Uladzislau Rezki <urezki@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Pengfei Li <lpf.vector@gmail.com>,
        Shakeel Butt <shakeelb@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Hocko <mhocko@kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Joerg Roedel <jroedel@suse.de>, Roman Gushchin <guro@fb.com>,
        Dennis Zhou <dennis@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
Message-Id: <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org>
In-Reply-To: <20200722144650.GA19628@pc636>
References: <000000000000588c2c05aa156b2b@google.com>
        <0000000000003cdc6c05aae24652@google.com>
        <20200720200618.GA9501@pc636>
        <20200722142759.GB4041@lca.pw>
        <20200722144650.GA19628@pc636>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 22 Jul 2020 16:46:50 +0200 Uladzislau Rezki <urezki@gmail.com> wrote:

> > > I can check further, but it can be it was not correctly reverted,
> > > because everything should work just fine even with the revert,
> > > though i i do not understand a reason of reverting.
> > 
> > Vlad, how sure are you about this? We also start to trigger this now on
> > linux-next, but the reverting patch surely looks like doggy without any useful
> > information in the commit description.
> >
> Hello, Andrew, Qian.
> 
> I am not aware of reason of the revert, though i tried to get through Ingo.
> I can send out a patch that fixes the revert. Another option to drop the
> revert, but it is up to Andrew and Ingo.
> 
> Andrew, could you please comment on?

All a bit mysterious.  I think it's best that we revert this from
linux-next until we hear from Ingo.  I queued a patch - I expect
Stephen will see and grab it, thanks.


