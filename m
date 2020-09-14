Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC4C269886
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 00:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgINWEW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 18:04:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31071 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725986AbgINWEV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 18:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600121059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2GhyD/cWEPiSDHqjdfHCn89vNoA2JN0oKHsy5Yj9ms0=;
        b=F/dxBB+K7aeYBwqz6DPdmq9LHHrFgbUwk5UAgMNVGmWPzz2Btf3QVNtX37QpfU5EqR+NcQ
        PZy2askIjbpwKQbz/FcvBdbI3JIoaCrUiqdhhfqOUMzlqL9T8RlTsAf4IsOtHgtD19uCpy
        jKiFmsrMrLV9w8rdVaeE8a9+q7eKe3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Wvj6_w4WMWSq3SET62MF1Q-1; Mon, 14 Sep 2020 18:04:15 -0400
X-MC-Unique: Wvj6_w4WMWSq3SET62MF1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 302661005E67;
        Mon, 14 Sep 2020 22:04:13 +0000 (UTC)
Received: from ovpn-113-249.rdu2.redhat.com (ovpn-113-249.rdu2.redhat.com [10.10.113.249])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C46117BE76;
        Mon, 14 Sep 2020 22:04:08 +0000 (UTC)
Message-ID: <269479609d444b2caebdc4d5d156bd5438a1899e.camel@redhat.com>
Subject: Re: [RFC v7 12/19] lockdep: Add recursive read locks into
 dependency graph
From:   Qian Cai <cai@redhat.com>
To:     Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Date:   Mon, 14 Sep 2020 18:04:08 -0400
In-Reply-To: <9b9780715a62d22a5229e9baae7e66a7f19d83eb.camel@redhat.com>
References: <20200807074238.1632519-1-boqun.feng@gmail.com>
         <20200807074238.1632519-13-boqun.feng@gmail.com>
         <9b9780715a62d22a5229e9baae7e66a7f19d83eb.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-09-14 at 14:16 -0400, Qian Cai wrote:
> On Fri, 2020-08-07 at 15:42 +0800, Boqun Feng wrote:
> > Since we have all the fundamental to handle recursive read locks, we now
> > add them into the dependency graph.
> > 
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Reverting this patch and its dependency:
> 
> [14/19] lockdep: Take read/write status in consideration when generate
> chainkey
> 
> fixed a splat below. IOW, this patch introduced this new splat which looks 

Sorry, it turned out my previous reproducer was not so reliable, but now I found
a new reliable reproducer that could trigger this on both x86 and powerpc every
time which so far points out the culprit being the patchset:

"[PATCH v1 0/5] seqlock: Introduce PREEMPT_RT support" [1].

It also matched exactly the exact timing (today) between the issue showed up and
the patchset was merged into linux-next. I'll do a bit more confirmation and
report it there.

[1] https://lore.kernel.org/lkml/20200828010710.5407-1-a.darwish@linutronix.de/

