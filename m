Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB9B296853
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 03:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374324AbgJWBgh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 21:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374330AbgJWBgf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 21:36:35 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6279CC0613CE
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 18:36:34 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id f19so870091oot.4
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2+Di+znLFc6X0mmr/arvC7SPhODWgxA/Sv6sSuj9bqc=;
        b=VYQTEVIOqQWsX5Mq3WbLsZxZK5MRofX6FbIgt7EebqFOXsTst6SUQJb/SOFGrZ9Fk7
         g6wUxJv4V1O9+DhOoeQqKX0b4/QkpmBF/+9WJ3MjaMkCWKCR1kPx38KM1krPc1OSw0H9
         T0u9sOnKS4q9YYelIhHVq/He/9kLkiewOCLyV5Sj/AxTN3xcEh5H3HUfSZ0VxYPMJNOW
         DM2DSvaiVreY7axSWmMarBTKVW/89vqPhLnvU6JmFJYHczBct0Ohw/785EdZyMcBLDWM
         684XoTzf/gfNoSlISp7R+T0jT9N6xQioOVRkEGinpyyrEvq3sOlis83KrGLN1WqhUgb4
         FWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2+Di+znLFc6X0mmr/arvC7SPhODWgxA/Sv6sSuj9bqc=;
        b=NsB2qyGW6xfXSvK+E2xTmkcmAVEinlwjAiBZmvwBwZNCdJtzPl1S0iocHjY3on17Zi
         MpFIbAIU6Onb93VReq7TfgoAQBxcku5C90jwBl6O9zesiO9obPygitwLMK4Dr55FNd/J
         qMCsetv5ochoqp2I+zze+bpB/RzG7o3Xch4ppJ9Fe8nAk8tdKM+snHiC17zFITHJFdP8
         81tFMS0w+ySd9D2kH5BF9GPZQ8OQqy04QJo+BibPiyUVm/CJIXW0o9srrb+HYCkwDLOs
         SJUf3rV4CodkTaklzjoSJxe8QrqyxgBPiX7wYd7ulWqFinE+1jCWNovISZKLG5PuBQFz
         6CiA==
X-Gm-Message-State: AOAM5318IefM+kdGj3msK6276RXe+eYJoSedR90If+Z5mI14k4Z3NKj6
        apc+kwi2KOyDlgFu5OSPrREzGPe/oYzNg5IjNLEi/w==
X-Google-Smtp-Source: ABdhPJy2Umftcs6NECfqd9UPMpnYb51vSnZ889L+ct7DPy7sTA2/XxzHtfMg3tXe4O1Q8OHKBE3RGCkEV09bvv0HETc=
X-Received: by 2002:a05:6820:1055:: with SMTP id x21mr3955751oot.6.1603416993655;
 Thu, 22 Oct 2020 18:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com> <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
In-Reply-To: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
From:   =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date:   Thu, 22 Oct 2020 20:36:22 -0500
Message-ID: <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

On Thu, 22 Oct 2020 at 19:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Oct 22, 2020 at 4:43 PM Linus Torvalds
> Would you mind sending me the problematic vmlinux file in private (or,
> likely better - a pointer to some place I can download it, it's going
> to be huge).

The kernel Naresh originally referred to is here:
  https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
