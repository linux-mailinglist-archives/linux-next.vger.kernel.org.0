Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6ACD1059AA
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 19:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfKUShW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 13:37:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44827 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726880AbfKUShW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Nov 2019 13:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574361440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wEMwsmsZ/juHdne/TJ39MbTp+BFkJkSc6k7UlQcJDDQ=;
        b=fvS01kmZa/5IrNq3MqELHPjOPqr3eBTTEOC2De4Vs2Kidb5BBR6/OwwsOxlizqcPNTsnQY
        8RHua7Haa9PJGMEXN0gu7qA1046kNQvsD4eGhRnhC2mTo9mxjAmn01y35LpxUHffbITWMe
        rjPLoVOLvauG9RNNtVVP4yceTeHD10M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-S48D8N2TO6KW0k3f1yc76Q-1; Thu, 21 Nov 2019 13:37:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8E6107ACC5;
        Thu, 21 Nov 2019 18:37:15 +0000 (UTC)
Received: from treble (ovpn-124-31.rdu2.redhat.com [10.10.124.31])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8041F6106F;
        Thu, 21 Nov 2019 18:37:13 +0000 (UTC)
Date:   Thu, 21 Nov 2019 12:37:11 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Marco Elver <elver@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Nov 20 (kcsan + objtool)
Message-ID: <20191121183711.w2qnysscwnbxocc4@treble>
References: <20191120203434.2a0727b3@canb.auug.org.au>
 <58708908-84a0-0a81-a836-ad97e33dbb62@infradead.org>
 <CANpmjNOHTyTRCeo3oxEPTY__TCjAQ8nMvcqDSZ6Otfs7vVESSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANpmjNOHTyTRCeo3oxEPTY__TCjAQ8nMvcqDSZ6Otfs7vVESSA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: S48D8N2TO6KW0k3f1yc76Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 20, 2019 at 08:48:41PM +0100, Marco Elver wrote:
> On Wed, 20 Nov 2019 at 17:18, Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 11/20/19 1:34 AM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20191119:
> > >
> >
> > on x86_64:
> >
> > kernel/kcsan/core.o: warning: objtool: kcsan_found_watchpoint()+0xa: ca=
ll to kcsan_is_enabled() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read1()+0x13: call to fin=
d_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write1()+0x10: call to fi=
nd_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read2()+0x13: call to fin=
d_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write2()+0x10: call to fi=
nd_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read4()+0x13: call to fin=
d_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write4()+0x10: call to fi=
nd_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read8()+0x13: call to fin=
d_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write8()+0x10: call to fi=
nd_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read16()+0x13: call to fi=
nd_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write16()+0x10: call to f=
ind_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_read_range()+0x13: call t=
o find_watchpoint() with UACCESS enabled
> > kernel/kcsan/core.o: warning: objtool: __tsan_write_range()+0x10: call =
to find_watchpoint() with UACCESS enabled
> >
> > kernel/trace/trace_branch.o: warning: objtool: ftrace_likely_update()+0=
x361: call to __stack_chk_fail() with UACCESS enabled
> >
> >
> > Full randconfig file is attached.
>=20
> Thanks.
>=20
> This is due to CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy. It seems the compiler
> decides to not even inline small static inline functions. I tried to
> make this go away by adding __always_inline, but then we're also left
> with atomic64_try_cmpxchg which never gets inlined.
>=20
> The optimized build simply inlines the small static inline functions.
> We certainly do not want to add more functions to the objtool
> whitelist, especially those that are private to KCSAN.
>=20
> We could fix it by either:
>=20
> 1. Adding __always_inline to every function used by the KCSAN runtime
> outside user_access_save + also fix atomic64_try_cmpxchg
> (atomic-instrumented.h).
>=20
> 2. Just not compile KCSAN with -Os, i.e. have the Makefile strip -Os
> and replace it with -O2 for kcsan/core.c. #2 is the simpler option,
> and would probably make KCSAN more effective even with -Os. Although
> it might violate the assumption of whoever decided they want both
> CC_OPTIMIZE_FOR_SIZE and KCSAN. It might also mean that future
> compilers that have a new inlining algorithm will have the same
> problem.
>=20
> What do people think is better?

I haven't had a chance to look at this yet, and probably won't be able
to do so until at least Monday...

Adding PeterZ who's the objtool uaccess expert.

--=20
Josh

