Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E972E28EF97
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 11:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388951AbgJOJut (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 05:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388789AbgJOJus (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 05:50:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2B4C061755;
        Thu, 15 Oct 2020 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=X6WtDwQI9pv5ISxRL8BEr06/otlXfo3aEhfWWy8pCcM=; b=DJYonpNAeLFOXNmxtlrqNH3zT6
        F4uNLAQwDF5UjG9XdetkJpwCIZT6OdV2+1zHoSSVVk+Hssiw8mhxutCESvtmfcg2jLPFPCwI25lXF
        u4smw8ezsSa747F0sr96Z8Je/fWcMYAxbdHdkhe0oEyYbllZrdzGf/wWWYm0+pwiGxB+fhLxQKYVR
        DXOIMpGyxeQTy5mWIo+tEtyVpKhQuFesWlJ2AQ5VI/XQNHjYnh6oQOjQLqTTozffJMMikY/R1zzxl
        VWLZ8P5JhrnxiYgkgqSdVtdKlCoGqygNG/mBeeVT9WRMEc/146VkhqKGKVeOu7CJC6tQbjjmO78Nx
        RFAtatlg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSzu6-0006Dh-49; Thu, 15 Oct 2020 09:50:34 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7B6E530504E;
        Thu, 15 Oct 2020 11:50:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6D927235F4439; Thu, 15 Oct 2020 11:50:33 +0200 (CEST)
Date:   Thu, 15 Oct 2020 11:50:33 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015095033.GS2651@hirez.programming.kicks-ass.net>
References: <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
 <20201015094926.GY2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015094926.GY2611@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1143,13 +1143,15 @@ bool rcu_lockdep_current_cpu_online(void
>  	struct rcu_data *rdp;
>  	struct rcu_node *rnp;
>  	bool ret = false;
> +	unsigned long seq;
>  
>  	if (in_nmi() || !rcu_scheduler_fully_active)
>  		return true;
>  	preempt_disable_notrace();
>  	rdp = this_cpu_ptr(&rcu_data);
>  	rnp = rdp->mynode;
> -	if (rdp->grpmask & rcu_rnp_online_cpus(rnp))
> +	seq = READ_ONCE(rnp->ofl_seq) & ~0x1;
> +	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rnp->ofl_seq))
>  		ret = true;
>  	preempt_enable_notrace();
>  	return ret;

Also, here, are the two loads important? Wouldn't:

	|| READ_ONCE(rnp->ofl_seq) & 0x1

be sufficient?
