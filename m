Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CCF76EB7E
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 16:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbjHCOBG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 10:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbjHCOAo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 10:00:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE4C19B9
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=2Xpi4ZqmCeynJ4lcqdp3xxoe3kaM0oHZG/+3MATVEuo=; b=fUTHou9jpSW0dU4FeppQbhZP13
        VsAtFBKYtLFshJ1pdalwyF8SHCRH/ZmZ28ITHWhVgq7jStO155jmLkyZM93PoLqBTrcY+Gz4IK9pF
        JyVUwvb2mADvoiyc56LkY+qzPPC/TJydJcVazM5VBaLR6sdaxDxS/O8ETunlP11RSnYczQvcw+sCj
        GB2voenNkLbVZYbzqvaqPkrca1Ay2+8rXxWvCYDcUi/T2Jg71qsfHrCaZMreZwmXmgRq/xK1zSept
        73GCs/f+FWA3zNsgdxi28HRZb9ECPfGzCzja8XGwbEWJFminQHDisIurGGSD5qlubViMJFTRPo9bU
        tDj9c23Q==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qRYsH-009LkC-2Y;
        Thu, 03 Aug 2023 14:00:22 +0000
Message-ID: <f8262c02-ba63-040b-17e4-d0cb202ce7f5@infradead.org>
Date:   Thu, 3 Aug 2023 07:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] tools/testing/selftests:Fixed spelling errors in
 comments
Content-Language: en-US
To:     GuokaiXu <xuguokai@ucas.com.cn>, linux-next@vger.kernel.org
References: <803778AC500E556D+20230803060557.GA6671@xgk8823>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <803778AC500E556D+20230803060557.GA6671@xgk8823>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 8/2/23 23:05, GuokaiXu wrote:
> From 844784381c30373524346d342003952aeec73a16 Mon Sep 17 00:00:00 2001
> From: GuokaiXu <xuguokai@ucas.com.cn>
> Date: Thu, 3 Aug 2023 13:26:59 +0800
> Subject: [PATCH 2/2] Fixed some spelling errors in comments.
> 
> Signed-off-by: GuokaiXu <xuguokai@ucas.com.cn>
> ---
>  tools/testing/selftests/arm64/pauth/pac.c              | 2 +-
>  tools/testing/selftests/bpf/progs/test_subprogs.c      | 2 +-
>  tools/testing/selftests/sync/sync_stress_parallelism.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
> index b743daa772f5..b236d181feef 100644
> --- a/tools/testing/selftests/arm64/pauth/pac.c
> +++ b/tools/testing/selftests/arm64/pauth/pac.c
> @@ -289,7 +289,7 @@ TEST(single_thread_different_keys)
>  
>  /*
>   * fork() does not change keys. Only exec() does so call a worker program.
> - * Its only job is to sign a value and report back the resutls
> + * Its only job is to sign a value and report back the results
>   */
>  TEST(exec_changed_keys)
>  {
> diff --git a/tools/testing/selftests/bpf/progs/test_subprogs.c b/tools/testing/selftests/bpf/progs/test_subprogs.c
> index a8d602d7c88a..ad68697c3c91 100644
> --- a/tools/testing/selftests/bpf/progs/test_subprogs.c
> +++ b/tools/testing/selftests/bpf/progs/test_subprogs.c
> @@ -39,7 +39,7 @@ static __noinline int sub4(int w)
>  	return w + sub3(5) + sub1(6);
>  }
>  
> -/* sub5() is an identitify function, just to test weirder functions layout and
> +/* sub5() is an identify function, just to test weirder functions layout and

                   identity
maybe. I think. maybe.

>   * call patterns
>   */
>  static __noinline int sub5(int v)
> diff --git a/tools/testing/selftests/sync/sync_stress_parallelism.c b/tools/testing/selftests/sync/sync_stress_parallelism.c
> index e6c9be671dfc..6ce56ca204c4 100644
> --- a/tools/testing/selftests/sync/sync_stress_parallelism.c
> +++ b/tools/testing/selftests/sync/sync_stress_parallelism.c
> @@ -87,7 +87,7 @@ int test_stress_two_threads_shared_timeline(void)
>  
>  	/*
>  	 * Use a single timeline to synchronize two threads
> -	 * hammmering on the same counter.
> +	 * hammering on the same counter.
>  	 */
>  
>  	pthread_create(&a, NULL, (void *(*)(void *))

-- 
~Randy
