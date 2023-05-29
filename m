Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EF7714209
	for <lists+linux-next@lfdr.de>; Mon, 29 May 2023 04:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjE2C2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 May 2023 22:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjE2C2J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 May 2023 22:28:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BFDA4;
        Sun, 28 May 2023 19:28:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B2FF61FDE;
        Mon, 29 May 2023 02:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D29C433EF;
        Mon, 29 May 2023 02:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685327287;
        bh=zaQEgsNb7VsT1nrBSD3Ey6kxLqM9FgUVmMfBoiyUd4s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Y/luRC5UuQ/lIFxIEQdaTG22YtW/Fo9ccgSkb1dxmoPebyF5wIaNA3fmQu+67TxS2
         1qk0Z6oyEzNuqKY8R6knjmXPGAFEuHPVuquAX65UTbSTrvQZGNuvWaL7DCw6NnijzE
         DSNT1QX8EHlZbFtengUj2IUiALIhXRDBiNAy5KPWVTau3ZAGdFh/kxHn4TreuhFR4N
         0raLR6mEgw1/GUKggZAbtFadGFdFa0UyrEaJmLjf488Y15Mo4guW9B7Z9Pf/6/grWt
         wOxVqsW2iWm9RM7znVoJV0TZkRdei81jvTOiJfNgW3n5kN4EmADvk4DnmCkVZhZrR+
         Asz3Aew8MXDGQ==
Message-ID: <036846b9-c757-450b-2612-6a649b901888@kernel.org>
Date:   Mon, 29 May 2023 11:28:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
To:     Murphy Zhou <jencce.kernel@gmail.com>
Cc:     linux-block@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
References: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
 <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org>
 <CADJHv_uXXVdog0GsFCTd+eouVAuX_wT9NRKJeUUqfZNvz34b0w@mail.gmail.com>
Content-Language: en-US
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CADJHv_uXXVdog0GsFCTd+eouVAuX_wT9NRKJeUUqfZNvz34b0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Jens

and also +Jan as he did some work on ioprio previously.

On 5/27/23 09:02, Murphy Zhou wrote:
> On Fri, May 26, 2023 at 3:42 PM Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>> On 5/26/23 16:27, Murphy Zhou wrote:
>>> Hi Damien,
>>>
>>> Since these commits:
>>>
>>>   scsi: block: Introduce ioprio hints
>>>   scsi: block: ioprio: Clean up interface definition
>>>
>>> go into linux-next tree, ioprio_set can take the value of 8
>>> as the PROCESS CLASS_BE ioprio parameter, returning
>>> success but actually it is setting to 0 due to the mask roundup.
>>>
>>> The LTP test case ioprio_set03[1] covers this boundary value
>>> testing, which starts to fail since then.
>>>
>>> This does not look as expected. Could you help to take a look?
>>
>> Before the patches, the ioprio level of 8 could indeed be set, but that was
> 
> Before the patches, it can't be set to 8 because the check in
> ioprio_check_cap refused it.
>    >= IOPRIO_NR_LEVELS
> Before the patches, the value can be greater than 8, so it takes effect.
> After the patches, the value is limited to [0..7], this check always passes.
> 
>> actually totally meaningless since the kernel components that use the priority
>> level all are limited to the range [0..7]. And why the level value 8 could be
>> seen, the effective level would have been 0. So at least, with the changes, we
>> are not lying to the user...
>>
>> I am not sure what this ioprio_set03 test is trying to check.
> 
> I guess it is trying to make sure boundary values do not cause uncertaining.
> The test case can be updated according to intended kernel changes. So does
> other user space applications that may depend on this, or there is none of
> them to worry about.

The checks before the patch was using IOPRIO_PRIO_DATA() to get the
level value, and that macro was doing a mask with IOPRIO_PRIO_MASK (1 <<
13). So if the application was doing:

IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 8192 + 1)

then the ioprio value would end up being the same as:

IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 0)

which is a valid ioprio value. So ioprio_check_cap() would not detect
that case either. The fact that class and level are combined into a
single value essentially prevents us to be exhaustive with the checks in
ioprio_check_cap().

I am not sure if this is worth fixing. as no matter what we do, the
above problem remains: we cannot catch all bad cases and end up with a
valid value which will prevent the user from seeing an error and
catching his/hers invalid use of the ioprio values...

We could do something like shown below, but I am not sure if it is worth
it as their are no guarantees that the user is actually using the
definitions in include/uapi/linux/ioprio.h
(/usr/include/linux/iorprio.h). E.g. see fio code which redefines the
values and macros locally.

diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 607c7617b9d2..c09cfbee9117 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -6,15 +6,13 @@
  * Gives us 8 prio classes with 13-bits of data for each class
  */
 #define IOPRIO_CLASS_SHIFT	13
-#define IOPRIO_CLASS_MASK	0x07
+#define IOPRIO_NR_CLASSES	8
+#define IOPRIO_CLASS_MASK	(IOPRIO_NR_CLASSES - 1)
 #define IOPRIO_PRIO_MASK	((1UL << IOPRIO_CLASS_SHIFT) - 1)

 #define IOPRIO_PRIO_CLASS(ioprio)	\
 	(((ioprio) >> IOPRIO_CLASS_SHIFT) & IOPRIO_CLASS_MASK)
 #define IOPRIO_PRIO_DATA(ioprio)	((ioprio) & IOPRIO_PRIO_MASK)
-#define IOPRIO_PRIO_VALUE(class, data)	\
-	((((class) & IOPRIO_CLASS_MASK) << IOPRIO_CLASS_SHIFT) | \
-	 ((data) & IOPRIO_PRIO_MASK))

 /*
  * These are the io priority classes as implemented by the BFQ and
mq-deadline
@@ -73,15 +71,6 @@ enum {
 #define IOPRIO_PRIO_HINT(ioprio)	\
 	(((ioprio) >> IOPRIO_HINT_SHIFT) & IOPRIO_HINT_MASK)

-/*
- * Alternate macro for IOPRIO_PRIO_VALUE() to define an IO priority with
- * a class, level and hint.
- */
-#define IOPRIO_PRIO_VALUE_HINT(class, level, hint)		 \
-	((((class) & IOPRIO_CLASS_MASK) << IOPRIO_CLASS_SHIFT) | \
-	 (((hint) & IOPRIO_HINT_MASK) << IOPRIO_HINT_SHIFT) |	 \
-	 ((level) & IOPRIO_LEVEL_MASK))
-
 /*
  * IO hints.
  */
@@ -107,4 +96,22 @@ enum {
 	IOPRIO_HINT_DEV_DURATION_LIMIT_7 = 7,
 };

+/*
+ * Return an I/O priority value based on a class, a level and hints.
+ */
+static inline u16 ioprio_value(int class, int level, int hint)
+{
+	if (class < 0 || class >= IOPRIO_NR_CLASSES ||
+	    level < 0 || level >= IOPRIO_NR_LEVELS ||
+	    hint < 0 || hint >= IOPRIO_NR_HINTS)
+		return USHRT_MAX;
+	return (class << IOPRIO_CLASS_SHIFT) |
+	       (hint << IOPRIO_HINT_SHIFT) | level;
+}
+
+#define IOPRIO_PRIO_VALUE(class, level)			\
+	ioprio_value(class, level, IOPRIO_HINT_NONE)
+#define IOPRIO_PRIO_VALUE_HINT(class, level, hint)	\
+	ioprio_value(class, level, hint)
+
 #endif /* _UAPI_LINUX_IOPRIO_H */

-- 
Damien Le Moal
Western Digital Research

