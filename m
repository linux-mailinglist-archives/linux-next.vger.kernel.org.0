Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA18335DAD4
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 11:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245293AbhDMJOx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 05:14:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhDMJOx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 05:14:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F31A60234;
        Tue, 13 Apr 2021 09:14:32 +0000 (UTC)
Date:   Tue, 13 Apr 2021 10:14:29 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20210413091429.GA15806@arm.com>
References: <20210413185936.5095cb11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413185936.5095cb11@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 13, 2021 at 06:59:36PM +1000, Stephen Rothwell wrote:
> diff --cc lib/test_kasan.c
> index 785e724ce0d8,bf9225002a7e..000000000000
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@@ -78,33 -83,30 +83,35 @@@ static void kasan_test_exit(struct kuni
>    * fields, it can reorder or optimize away the accesses to those fields.
>    * Use READ/WRITE_ONCE() for the accesses and compiler barriers around the
>    * expression to prevent that.
> +  *
> +  * In between KUNIT_EXPECT_KASAN_FAIL checks, fail_data.report_found is kept as
> +  * false. This allows detecting KASAN reports that happen outside of the checks
> +  * by asserting !fail_data.report_found at the start of KUNIT_EXPECT_KASAN_FAIL
> +  * and in kasan_test_exit.
>    */
> - #define KUNIT_EXPECT_KASAN_FAIL(test, expression) do {		\
> - 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&			\
> - 	    !kasan_async_mode_enabled())			\
> - 		migrate_disable();				\
> - 	WRITE_ONCE(fail_data.report_expected, true);		\
> - 	WRITE_ONCE(fail_data.report_found, false);		\
> - 	kunit_add_named_resource(test,				\
> - 				NULL,				\
> - 				NULL,				\
> - 				&resource,			\
> - 				"kasan_data", &fail_data);	\
> - 	barrier();						\
> - 	expression;						\
> - 	barrier();						\
> - 	if (kasan_async_mode_enabled())				\
> - 		kasan_force_async_fault();			\
> - 	barrier();						\
> - 	KUNIT_EXPECT_EQ(test,					\
> - 			READ_ONCE(fail_data.report_expected),	\
> - 			READ_ONCE(fail_data.report_found));	\
> - 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&			\
> - 	    !kasan_async_mode_enabled()) {			\
> - 		if (READ_ONCE(fail_data.report_found))		\
> - 			kasan_enable_tagging_sync();		\
> - 		migrate_enable();				\
> - 	}							\
> + #define KUNIT_EXPECT_KASAN_FAIL(test, expression) do {			\
>  -	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))				\
> ++	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&				\
> ++	    !kasan_async_mode_enabled())				\
> + 		migrate_disable();					\
> + 	KUNIT_EXPECT_FALSE(test, READ_ONCE(fail_data.report_found));	\
> + 	WRITE_ONCE(fail_data.report_expected, true);			\
> + 	barrier();							\
> + 	expression;							\
> + 	barrier();							\
> ++	if (kasan_async_mode_enabled())					\
> ++		kasan_force_async_fault();				\
> ++	barrier();							\
> + 	KUNIT_EXPECT_EQ(test,						\
> + 			READ_ONCE(fail_data.report_expected),		\
> + 			READ_ONCE(fail_data.report_found));		\
>  -	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS)) {				\
> ++	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&				\
> ++	    !kasan_async_mode_enabled()) {				\
> + 		if (READ_ONCE(fail_data.report_found))			\
>  -			kasan_enable_tagging();				\
> ++			kasan_enable_tagging_sync();			\
> + 		migrate_enable();					\
> + 	}								\
> + 	WRITE_ONCE(fail_data.report_found, false);			\
> + 	WRITE_ONCE(fail_data.report_expected, false);			\
>   } while (0)
>   
>   #define KASAN_TEST_NEEDS_CONFIG_ON(test, config) do {			\

Thanks Stephen. The resolution looks correct.

Andrew, if you'd rather I dropped the MTE async mode support from the
arm64 tree please let me know. Thanks.

https://lore.kernel.org/r/20210315132019.33202-1-vincenzo.frascino@arm.com/

-- 
Catalin
