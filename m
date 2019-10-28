Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68113E7949
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 20:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbfJ1Tfx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 15:35:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44632 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbfJ1Tfx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 15:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NDY5AH4p+bLAbpsvUbEjoqi5MI8sSoQUy+3LKF6BLu8=; b=V94Ht2Ih0GepVbT+BKXO9h9/h
        GnxOoQ+mNCXZRWzQGf8uxSCP4Tfg6iAVBSxn37xK/GuYJURNJh4MnrGbqEDTMKM7BPxDlD21xMeZJ
        /hXHte4Kf6IvSkWdr8+OZ9ScZMCSmwMtBII+5u7DpzyHxX8sArfkzHld8AzNtoEJzcb15RZCfH2hZ
        9Z3OiavEwYh/W/zIX0dy5xJhZpoTgJtkYsXLdFjWeu2Fmge4evV7cpwxlhGDP8Blrzi2rE7TFywJH
        G3Gpvkv8HmzfnBNStwSKwh+oHq1y0OXUaQnB25zfpMuf1t17fGHh+OB2InJYszDBgElNxC828V+ET
        7uOYuStTA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPAnw-0005TA-VN; Mon, 28 Oct 2019 19:35:53 +0000
Subject: Re: linux-next: Tree for Oct 28 (objtool)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20191028195154.4b6651dd@canb.auug.org.au>
 <b7c7bb28-1810-88e5-1899-a90123d26627@infradead.org>
 <20191028160215.ruzhvlwqaumw4krm@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cc9c0f83-ce06-19a3-eb07-5fe19e5ca2f2@infradead.org>
Date:   Mon, 28 Oct 2019 12:35:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028160215.ruzhvlwqaumw4krm@treble>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/28/19 9:02 AM, Josh Poimboeuf wrote:
> On Mon, Oct 28, 2019 at 08:31:28AM -0700, Randy Dunlap wrote:
>> On 10/28/19 1:51 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20191025:
>>>
>>
>>
>> on x86_64:
>>
>> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction
>>
>> .o file is attached.
> 
> Silly GCC.  Does this fix it?

Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> index 4b1c3b664f51..d58587391b96 100644
> --- a/include/linux/sched/task.h
> +++ b/include/linux/sched/task.h
> @@ -83,7 +83,7 @@ static inline void exit_thread(struct task_struct *tsk)
>  {
>  }
>  #endif
> -extern void do_group_exit(int);
> +extern void __noreturn do_group_exit(int);
>  
>  extern void exit_files(struct task_struct *);
>  extern void exit_itimers(struct signal_struct *);
> diff --git a/kernel/exit.c b/kernel/exit.c
> index f2d20ab74422..bdc4122d904d 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -894,7 +894,7 @@ SYSCALL_DEFINE1(exit, int, error_code)
>   * Take down every thread in the group.  This is called by fatal signals
>   * as well as by sys_exit_group (below).
>   */
> -void
> +void __noreturn
>  do_group_exit(int exit_code)
>  {
>  	struct signal_struct *sig = current->signal;
> @@ -931,7 +931,6 @@ SYSCALL_DEFINE1(exit_group, int, error_code)
>  {
>  	do_group_exit((error_code & 0xff) << 8);
>  	/* NOTREACHED */
> -	return 0;
>  }
>  
>  struct waitid_info {
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 543c068096b1..97919469c787 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -135,6 +135,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  		"__stack_chk_fail",
>  		"panic",
>  		"do_exit",
> +		"do_group_exit",
>  		"do_task_dead",
>  		"__module_put_and_exit",
>  		"complete_and_exit",
> 


-- 
~Randy
