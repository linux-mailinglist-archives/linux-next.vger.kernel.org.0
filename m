Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3752AC06E
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 17:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbgKIQDy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 11:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729658AbgKIQDy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 11:03:54 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8E8C0613CF;
        Mon,  9 Nov 2020 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=K2Kxt5KmEmdb5ARR7kIK67gNBKigcb3wIs0zorwZEqY=; b=yvGf2Rz70gHkCMdw2AK6+RqAj4
        73LGA31guTTeHrHM6hDpaS7lvlv/YNI0pufqP/BduzbiiWX9UJsdUtk78u26kep9TZJBI2S9ZkLWu
        +rrCn9oiYnepvTqDTkEp2nLjlxORJD8rzacXmgvAFFOChCJMIISVYoicFzYSqZ8qiwXtYGdjyDaUh
        Xq+DEqFWmuXM0iL+3OuhwSnTHMNmyyPw9vnbbKx6fFfPTzdyaV2sT+xmyDtTUWHrcMKMxRzr9bzHb
        LxeCXQ1m7mIcICqvqhcn7qkO6jdTVjvVa+qKZuP1vSUF7KojiLTayJ3LmLZ1pVOKb9m1fMKqYnCmb
        MCaNB1RQ==;
Received: from [2601:1c0:6280:3f0::662d]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kc9e1-0006IZ-HR; Mon, 09 Nov 2020 16:03:49 +0000
Subject: Re: linux-next: Tree for Nov 9 (cpumask_parse)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
References: <20201109181725.37498b25@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b8e51a4b-1b82-6dbe-af74-3c680f43557f@infradead.org>
Date:   Mon, 9 Nov 2020 08:03:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109181725.37498b25@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/8/20 11:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201106:
> 

on x86_64:
# CONFIG_SMP is not set

ld: arch/x86/kernel/cpu/resctrl/rdtgroup.o: in function `rdtgroup_cpus_write':
rdtgroup.c:(.text+0x35f0): undefined reference to `cpulist_parse'
ld: kernel/sched/isolation.o: in function `housekeeping_setup':
isolation.c:(.init.text+0x1f): undefined reference to `cpulist_parse'
ld: kernel/taskstats.o: in function `parse':
taskstats.c:(.text+0xa8): undefined reference to `cpulist_parse'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
