Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5981E87D8
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 21:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgE2Tba (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 15:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgE2Tb0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 15:31:26 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404B7C03E969
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 12:31:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q2so609888ljm.10
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHD8TmCoQhuoCHpObwNDm6CdH7YyaMO9+wxjMxR+Oh8=;
        b=GfHFxtgln7yqSB1se2pJ14wo3yKSKifw0tK/O3YykA6cZk6SnwfwCdJUoPGoBPoiuq
         hvt32o1ueibjeP164cZ8R3sMzIvfIcIo3+4N7mAY1YnFWCZTz7Mto7uPHUpOdH/n6kSA
         PX8IEjgVF+Qcx1Pu1z4J/EywIHY1OR/5PBRqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHD8TmCoQhuoCHpObwNDm6CdH7YyaMO9+wxjMxR+Oh8=;
        b=YPPH6wmdMS6/Ny2cxVGeBEreD2b5OsFkkZ+oVKGVGccKgpIpPZWXPz1lrIRBmjDfsL
         nvp91Qdi32BDOQMfZuQ52Yy701cJMjP8+wTZq9Kae+dY2NBVDsY0uEzYFYzFPM5sozLj
         Sf0VnxyfonEZgE26gB8IrA3B779h2C20Ftcj2+lVKlXDPChpdm3Xwmn/n7Uj+FwjfrCO
         3WmIdy6zEGeCJCN4a2n+c6++dErDsOoX34kkSkHphm9PheAaP+ptS7Bg+sBu2c5vAYon
         KrAu4d9WMWa7/epsrgnSj6FK4xxFP6bdcYDJr1y8avbrxaSSnIXr2+VzSa+O2EEPOItG
         blBg==
X-Gm-Message-State: AOAM532sImE5R8ucnV90cFDVnsXLnjAC/z/yD8OQH31/lLapWK2BiESs
        C8Gy+OnjL01zC4vBWTMyhWBYZBUfmLU=
X-Google-Smtp-Source: ABdhPJzV/+7HaEE6RhSc88Xvn4CDKrn2PbLTRMFCGRGWYPKZKsR02x+MNzs5CwwS3Vkt1ppncWPITg==
X-Received: by 2002:a2e:9716:: with SMTP id r22mr5186289lji.293.1590780683814;
        Fri, 29 May 2020 12:31:23 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id x5sm1489889ljd.123.2020.05.29.12.31.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 12:31:21 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id z22so392137lfd.0
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 12:31:20 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr5203392lfn.10.1590780680343;
 Fri, 29 May 2020 12:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200514033104.kRFL_ctMQ%akpm@linux-foundation.org>
 <611fa14d-8d31-796f-b909-686d9ebf84a9@infradead.org> <20200528172005.GP2483@worktop.programming.kicks-ass.net>
 <20200529135750.GA1580@lst.de> <20200529143556.GE706478@hirez.programming.kicks-ass.net>
 <20200529145325.GB706518@hirez.programming.kicks-ass.net> <20200529153336.GC706518@hirez.programming.kicks-ass.net>
 <20200529160514.cyaytn33thphb3tz@treble> <20200529161253.GD706460@hirez.programming.kicks-ass.net>
 <20200529165011.o7vvhn4wcj6zjxux@treble>
In-Reply-To: <20200529165011.o7vvhn4wcj6zjxux@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 29 May 2020 12:31:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7xda+zM=iRGXWbU9i8S7kbNaSfPhXVXR-vK6uEFNx_w@mail.gmail.com>
Message-ID: <CAHk-=wi7xda+zM=iRGXWbU9i8S7kbNaSfPhXVXR-vK6uEFNx_w@mail.gmail.com>
Subject: Re: mmotm 2020-05-13-20-30 uploaded (objtool warnings)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Christoph Hellwig <hch@lst.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michal Hocko <mhocko@suse.cz>, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 9:50 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> From staring at the asm I think the generated code is correct, it's just
> that the nested likelys with ftrace profiling cause GCC to converge the
> error/success paths.  But objtool doesn't do register value tracking so
> it's not smart enough to know that it's safe.

I'm surprised that gcc doesn't end up doing the obvious CSE and then
branch following and folding it all away in the end, but your patch is
obviously the right thing to do regardless, so ack on that.

Al - I think this had best go into your uaccess cleanup branch with
that csum-wrapper update, to avoid any unnecessary conflicts or
dependencies.

             Linus
