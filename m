Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186A130A2A7
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 08:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhBAH16 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 02:27:58 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:47978 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229613AbhBAH16 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 02:27:58 -0500
X-Greylist: delayed 563 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Feb 2021 02:27:58 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612164453; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YFhkbxmF5LNHM/rrVU1Xq31OkCey+XkdwO4Mft4xJSM=; b=emczd+Ggsdxp7wdT9cRGWEehyXJqrNvDQKgPGWiqIvCyr5vZfoXvaioBVlrQ3SAo3XlSttFh
 3bVkh8N+BuN2FUPPlXkHna7MlJUUgQxXMnd5Ce3qCWRdT6a9eYegacpHpSlGkuvA8mPspgQX
 QN8FZyr0iYao7aHfgeWWA7U/z+o=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6017aa7e7a21b36a9d0fad72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Feb 2021 07:15:10
 GMT
Sender: vjitta=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68D83C43462; Mon,  1 Feb 2021 07:15:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.105] (unknown [182.18.191.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vjitta)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68B7DC433CA;
        Mon,  1 Feb 2021 07:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68B7DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vjitta@codeaurora.org
Subject: Re: linux-next: build warning after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Vinayak Menon <vinmenon@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210128194631.13e14818@canb.auug.org.au>
From:   Vijayanand Jitta <vjitta@codeaurora.org>
Message-ID: <aa6b93c6-f4a7-add7-13ed-d60ae4e749ca@codeaurora.org>
Date:   Mon, 1 Feb 2021 12:44:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128194631.13e14818@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 1/28/2021 2:16 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> lib/stackdepot.c: In function 'is_stack_depot_disabled':
> lib/stackdepot.c:154:2: warning: ignoring return value of 'kstrtobool' declared with attribute 'warn_unused_result' [-Wunused-result]
>   154 |  kstrtobool(str, &stack_depot_disable);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   b9779abb09a8 ("lib: stackdepot: add support to disable stack depot")
> 
> Interestingly, we have 2 declarations of kstrtobool - one in
> linux/kernel.h (which has __must_check) and one in linux/strings.h
> (which doesn't).
> 

I have sent out the fix to lkml, Copied it below for your reference.
Please Feel free to apply or squash it to the original commit.

Thanks,
Vijay

--
From: Vijayanand Jitta <vjitta@codeaurora.org>

fix the below ignoring return value warning for kstrtobool
in is_stack_depot_disabled function.

lib/stackdepot.c: In function 'is_stack_depot_disabled':
lib/stackdepot.c:154:2: warning: ignoring return value of 'kstrtobool'
declared with attribute 'warn_unused_result' [-Wunused-result]

Fixes: b9779abb09a8 ("lib: stackdepot: add support to disable stack depot")
Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
---
 lib/stackdepot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index cc21116..49f67a0 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -151,8 +151,10 @@ static struct stack_record **stack_table;

 static int __init is_stack_depot_disabled(char *str)
 {
-	kstrtobool(str, &stack_depot_disable);
-	if (stack_depot_disable) {
+	int ret;
+
+	ret = kstrtobool(str, &stack_depot_disable);
+	if (!ret && stack_depot_disable) {
 		pr_info("Stack Depot is disabled\n");
 		stack_table = NULL;
 	}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of Code Aurora Forum, hosted by The Linux Foundation
