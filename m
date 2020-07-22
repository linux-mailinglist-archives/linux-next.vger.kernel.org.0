Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A75229B4E
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 17:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732760AbgGVPZI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 11:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732742AbgGVPZH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 11:25:07 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DD7C0619DE
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:25:07 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id i80so1525097lfi.13
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=ZZVwlxeqmX6G0EA/Mr693geGtRjCRxDovI8UeX3tF/E=;
        b=C5QgKmMNi+duOmChNMdNcV7BGLjrPc3dfMM+ZXrRADwRwk9gQmIk9fyldZ8raTbfsY
         +OoZL6gEZ+O+mW/cguLPp4m+bFPF2MyxCw8213plzO16nE+FM2d/mwgx1v89BPTVDE0A
         onNVGJZK10OLklPw6MDZurhbTKsl32XQFTgDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=ZZVwlxeqmX6G0EA/Mr693geGtRjCRxDovI8UeX3tF/E=;
        b=itN7n1MDVx23gtUfM8PWyKayBIpKOlbSVQGxD3eqhZcYmm5n6zZ+mlSyi8G8diXs6q
         XJoOTqVFMmIDax5dv6tsEzsdv1+Vp+y7tfDEOlBnusY1a9THZVOZkC0pzTEcVDpL3PgC
         CZWbeM59MH1QYF4WHO8a71JTPlJZhcJBCNUegKaqSfD74J8u4Q1BMC1JuFEONHiq37VS
         WBum+SpScTN0EM5dDV3bpOYMhVRBVVBKjVIPaEiwNKhtTcarbU1KeS7zeZdVIQWugVvr
         5J4UhMqDaQ26uoaxN+4Wle2RLcfGh6yoI724HvUksjzsdvV2DCf96FK6U/1c+4R3ohGM
         ZZLQ==
X-Gm-Message-State: AOAM5318/0tlf3Z9Ph2vMR2ePWlBDhReHYSBMm1stKbIZAg6KlxG5VyC
        jnlhlrOr7bkdNEUfNOr1i9g/jg==
X-Google-Smtp-Source: ABdhPJytm/cO+POWytM1rrXYfKAEreT3hfBCxb11O1PqsNQPR1Eago6islkfmq8GEVq+PzNlx90VdA==
X-Received: by 2002:ac2:4158:: with SMTP id c24mr16372289lfi.109.1595431505679;
        Wed, 22 Jul 2020 08:25:05 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id h21sm194610ljk.31.2020.07.22.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 08:25:05 -0700 (PDT)
References: <87wo2vwxq6.fsf@cloudflare.com> <20200722144212.27106-1-kuniyu@amazon.co.jp> <87v9ifwq2p.fsf@cloudflare.com> <CA+FuTScto+Z_qgFxJBzhPUNEruAvKLSTL7-0AnyP-M6Gon_e5Q@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.3
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>,
        kernel-team <kernel-team@cloudflare.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
In-reply-to: <CA+FuTScto+Z_qgFxJBzhPUNEruAvKLSTL7-0AnyP-M6Gon_e5Q@mail.gmail.com>
Date:   Wed, 22 Jul 2020 17:25:04 +0200
Message-ID: <87tuxzwp0v.fsf@cloudflare.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 05:05 PM CEST, Willem de Bruijn wrote:
> On Wed, Jul 22, 2020 at 11:02 AM Jakub Sitnicki <jakub@cloudflare.com> wrote:
>>
>> On Wed, Jul 22, 2020 at 04:42 PM CEST, Kuniyuki Iwashima wrote:
>> > Can I submit a patch to net tree that rewrites udp[46]_lib_lookup2() to
>> > use only 'result' ?
>>
>> Feel free. That should make the conflict resolution even easier later
>> on.
>
> Thanks for the detailed analysis, Jakub.
>
> Would it be easier to fix this wholly in bpf-next, by introducing
> reuseport_result there?

Did you mean replicating the Kuniyuki fix in bpf-next, or just
introducing the intermediate 'reuseport_result' var?

I'm assuming the former, so that the conflict resolving later on will
reduce to selecting everything from bpf-next side.

TBH, I don't what is the preferred way to handle it. Perhaps DaveM or
Alexei/Daniel can say what would make their life easiest?
