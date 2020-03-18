Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A509018A028
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 17:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCRQFN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 12:05:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:58384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgCRQFN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 12:05:13 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F76120658;
        Wed, 18 Mar 2020 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584547512;
        bh=iYm+XrLGPpBG6OmW2elcoqf/kFwshX1w4/P0pPZlh6c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Mj+rGrfUYKD6JnA+l4Si8cxXzR3IWQt+Z28Ua3MCbHSKVDA/7qPFWI6WESe2d5xlM
         561V8xbEgHo8aHzJOpDpL5cLeAISmNWyPc4KCipNbwze3l6U3W38d+MtD9p4HNbjnv
         edFCA4jZf/61/bxgOJKJeuRBk0H57cZqwEkP1cg0=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 7056735204E4; Wed, 18 Mar 2020 09:05:12 -0700 (PDT)
Date:   Wed, 18 Mar 2020 09:05:12 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        rcu@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        josh@joshtriplett.org, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        Joel Fernandes <joel@joelfernandes.org>,
        lkft-triage@lists.linaro.org
Subject: Re: =?utf-8?B?a2VybmVsL3JjdS90YXNrcy5oOjEw?=
 =?utf-8?B?NzA6Mzc6IGVycm9yOiDigJhyY3VfdGFza3NfcnVkZeKAmQ==?= undeclared
Message-ID: <20200318160512.GT3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYsT2B0WFPV0uohH=QT+CU09OscZvsUV3pnhG-xjPF+OqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYsT2B0WFPV0uohH=QT+CU09OscZvsUV3pnhG-xjPF+OqA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 09:26:01PM +0530, Naresh Kamboju wrote:
> The arm64 build failed on linux-next master branch.
> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
> aarch64-linux-gnu-gcc" O=build Image
> 
> In file included from ../kernel/rcu/update.c:562:
>  ../kernel/rcu/tasks.h: In function ‘show_rcu_tasks_gp_kthreads’:
>  ../kernel/rcu/tasks.h:1070:37: error: ‘rcu_tasks_rude’ undeclared
> (first use in this function); did you mean ‘rcu_tasks_qs’?
>   1070 |  show_rcu_tasks_generic_gp_kthread(&rcu_tasks_rude, "");
>        |                                     ^~~~~~~~~~~~~~
>        |                                     rcu_tasks_qs
>  ../kernel/rcu/tasks.h:1070:37: note: each undeclared identifier is
> reported only once for each function it appears in
> 
> Ref:
> https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/476084417

Good catch, but kbuild test robot beat you to it.  A fix is on its
way, and thank you for your testing efforts!

							Thanx, Paul
