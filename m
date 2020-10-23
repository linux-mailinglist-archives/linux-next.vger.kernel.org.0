Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89DB29694A
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 07:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505848AbgJWFCR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 01:02:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:4872 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505392AbgJWFCQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Oct 2020 01:02:16 -0400
IronPort-SDR: Jf0YhBaQQqxLKqsa97Wa7X6tlTHlN3RWMjDF3mpkPSBFpSPaP46k8gSLia/dFZJD7b7Ri6mrrQ
 2B+svKdop7eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="229263728"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="229263728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 22:02:15 -0700
IronPort-SDR: 7Day5D5KPL2/noKOCrxgfsCyMurAxXkzfTj5J0GV0BS3bePPACh7pdn5rGhilSEUDVqYQNYw7j
 kzNa5DgChLHA==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="466940929"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.160])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 22:02:15 -0700
Date:   Thu, 22 Oct 2020 22:02:14 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
Message-ID: <20201023050214.GG23681@linux.intel.com>
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 22, 2020 at 08:05:05PM -0700, Linus Torvalds wrote:
> On Thu, Oct 22, 2020 at 6:36 PM Daniel Díaz <daniel.diaz@linaro.org> wrote:
> >
> > The kernel Naresh originally referred to is here:
> >   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/
> 
> Thanks.
> 
> And when I started looking at it, I realized that my original idea
> ("just look for __put_user_nocheck_X calls, there aren't so many of
> those") was garbage, and that I was just being stupid.
> 
> Yes, the commit that broke was about __put_user(), but in order to not
> duplicate all the code, it re-used the regular put_user()
> infrastructure, and so all the normal put_user() calls are potential
> problem spots too if this is about the compiler interaction with KASAN
> and the asm changes.
> 
> So it's not just a couple of special cases to look at, it's all the
> normal cases too.
> 
> Ok, back to the drawing board, but I think reverting it is probably
> the right thing to do if I can't think of something smart.
> 
> That said, since you see this on x86-64, where the whole ugly trick with that
> 
>    register asm("%"_ASM_AX)
> 
> is unnecessary (because the 8-byte case is still just a single
> register, no %eax:%edx games needed), it would be interesting to hear
> if the attached patch fixes it. That would confirm that the problem
> really is due to some register allocation issue interaction (or,
> alternatively, it would tell me that there's something else going on).

I haven't reproduced the crash, but I did find a smoking gun that confirms the
"register shenanigans are evil shenanigans" theory.  I ran into a similar thing
recently where a seemingly innocuous line of code after loading a value into a
register variable wreaked havoc because it clobbered the input register.

This put_user() in schedule_tail():

   if (current->set_child_tid)
           put_user(task_pid_vnr(current), current->set_child_tid);

generates the following assembly with KASAN out-of-line:

   0xffffffff810dccc9 <+73>: xor    %edx,%edx
   0xffffffff810dcccb <+75>: xor    %esi,%esi
   0xffffffff810dcccd <+77>: mov    %rbp,%rdi
   0xffffffff810dccd0 <+80>: callq  0xffffffff810bf5e0 <__task_pid_nr_ns>
   0xffffffff810dccd5 <+85>: mov    %r12,%rdi
   0xffffffff810dccd8 <+88>: callq  0xffffffff81388c60 <__asan_load8>
   0xffffffff810dccdd <+93>: mov    0x590(%rbp),%rcx
   0xffffffff810dcce4 <+100>: callq  0xffffffff817708a0 <__put_user_4>
   0xffffffff810dcce9 <+105>: pop    %rbx
   0xffffffff810dccea <+106>: pop    %rbp
   0xffffffff810dcceb <+107>: pop    %r12

__task_pid_nr_ns() returns the pid in %rax, which gets clobbered by
__asan_load8()'s check on current for the current->set_child_tid dereference.
