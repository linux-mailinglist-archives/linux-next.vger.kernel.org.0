Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C26435D7A
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 10:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhJUI7v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 04:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhJUI7v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 04:59:51 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC97CC06161C;
        Thu, 21 Oct 2021 01:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=F0ALBF+1p83gjfV7jzVs8ne7iN/HhXB719IxtXC1tHI=; b=JydPvZI+zx+NpZzY+Ofd6SUkwt
        aihbwTK/1iDxecR3g8qYsZQtiOh9/ZZEyiveSqDcRiB53rgQ/aj4wkWu3rsM5IEJyaWb91MtuqM6m
        KyowXgdv/G5HRU3t+ZB2N0m6eC2VYrAkPaTYSSgZ8ggO8+01rGEWLj07+hgp9wr3lwMMwTFUYIF/P
        XkGSwWSjICRIzDoELgXewNGCM8Uh4D5kA/KL5/fxIptGdX1bQsL5HCizX1gdP6XWQdKmID7PzMUtk
        Lgxj7zesPAzfFCC5iYwLtO6c/GPvFmcjofOmOOHC6emWSynrQn2YR29a8BpVQSkwwpIsuHYYBXRo4
        6H+RZoUA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mdTt0-00BGjF-H1; Thu, 21 Oct 2021 08:57:20 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D167A300221;
        Thu, 21 Oct 2021 10:57:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4926E2D4101EF; Thu, 21 Oct 2021 10:57:17 +0200 (CEST)
Date:   Thu, 21 Oct 2021 10:57:17 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        jgross@suse.com
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YXErbb3TGDwUJXHw@hirez.programming.kicks-ass.net>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
 <20210920113809.18b9b70c@canb.auug.org.au>
 <20211021140340.139eab65@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021140340.139eab65@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 21, 2021 at 02:03:40PM +1100, Stephen Rothwell wrote:
> vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count_add() leaves .noinstr.text section
> vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_add() leaves .noinstr.text section

https://lkml.kernel.org/r/20210922103102.3589-1-jgross@suse.com

Juergen, where are we with those patches?

