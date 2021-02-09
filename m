Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA2D315A0B
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 00:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbhBIXaU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 18:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234844AbhBIXXV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 18:23:21 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E29C061786;
        Tue,  9 Feb 2021 15:22:40 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id h26so119493lfm.1;
        Tue, 09 Feb 2021 15:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLVkJmH/X5jmp8ItjkzeXa024Cqkuu9q23CkCId3DqY=;
        b=GyA/OyRCuAIj4SeIaDJdkZe7GjfU89yGIM9Cn3on1qwsRJGD35hYydBcW+5T+Tub63
         bIalYcPRBUQCljddQsj8T4PZYH+SwtqD/1vcSJeQ/79gzBJGxV/KstbgPwJTcCbxFsry
         7FOswaOkcRHNJEsUbKd88vHZYaOX6F5BVM6d96WXZCGFqfgZUodNrfw6CmAvg2kXE/Sx
         NUS2QzPLjWe6Aud+VkLd8hau/jqtGI2wU8c5uCWwy5TN9K9/yBXfc92/HkYg0TJzLI84
         /LSh++hFKHEyDGUZ0n+tqG8bqu2SjFHas0lCILUmShkAyJqCZeqL5ZMhV2yLQKurkimH
         8kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLVkJmH/X5jmp8ItjkzeXa024Cqkuu9q23CkCId3DqY=;
        b=LefVemX7YiZlVhcEqQWZdWU9wUsfuWwQ4I5+jee2j85deGq/qa7cfPyMZDIhqxMfCt
         rOsRWqFirNQe5sHtd+BiQztS4UA5kHAtxICkbG0N7365jwdoeKarLOW/xGLKYgiOSv1O
         SkAa3xyJDInS/PuCSfqtBcTttgNDBTcoAu60+v1TW4+VRZMLJfEyN88Yb95JmF2qPQ+/
         3otX+JEPnhP9lJPSrH95+C4c5LcC0mwad4y2ZzI04X9eeXDqb7+ia5Tfm8ssqEYYzW/g
         7T7psi+Qw1MoNy19CfNkbxbOV+CAxLkzARoQxOO+WLnNf3YinAcaEFNhkxP8p5joAUU9
         AS0w==
X-Gm-Message-State: AOAM530Z11AHUhwHaTbFuHFPKBcMzGAo/ma15tEvFS+ZDe//GTLdxs7R
        21U96GBGEB9VPR0U7CL8f4Y=
X-Google-Smtp-Source: ABdhPJz76TnDiekTv9tyhFCdZeoFwdA5Zg+CUDvaOajZxx73wUpYFQ8zOXTItfVuxxLxaDjRMIYvug==
X-Received: by 2002:a19:e007:: with SMTP id x7mr172594lfg.280.1612912958700;
        Tue, 09 Feb 2021 15:22:38 -0800 (PST)
Received: from localhost.localdomain (109-252-130-105.dynamic.spd-mgts.ru. [109.252.130.105])
        by smtp.gmail.com with ESMTPSA id y2sm5599ljh.28.2021.02.09.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 15:22:38 -0800 (PST)
From:   Andrey Ryabinin <ryabinin.a.a@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kees Cook <keescook@chromium.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] ubsan: remove overflow checks
Date:   Wed, 10 Feb 2021 02:23:48 +0300
Message-Id: <20210209232348.20510-1-ryabinin.a.a@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <YCJCaDIzIaUZG27F@hirez.programming.kicks-ass.net>
References: <YCJCaDIzIaUZG27F@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Since GCC 8.0 -fsanitize=signed-integer-overflow doesn't work with -fwrapv.
-fwrapv makes signed overflows defines and GCC essentially disables
ubsan checks. On GCC < 8.0 -fwrapv doesn't have influence on
-fsanitize=signed-integer-overflow setting, so it kinda works
but generates false-positves and violates uaccess rules:

lib/iov_iter.o: warning: objtool: iovec_from_user()+0x22d: call to __ubsan_handle_add_overflow() with UACCESS enabled

Disable signed overflow checks to avoid these problems.
Remove unsigned overflow checks as well.
Unsigned overflow appeared as side effect of the commit
 cdf8a76fda4a ("ubsan: move cc-option tests into Kconfig"),
but it never worked (kernel doesn't boot). And unsigned overflows
are allowed by C standard, so it just pointless.

Signed-off-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
---
 lib/Kconfig.ubsan      | 17 -----------
 lib/test_ubsan.c       | 49 ------------------------------
 lib/ubsan.c            | 68 ------------------------------------------
 scripts/Makefile.ubsan |  2 --
 4 files changed, 136 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 3a0b1c930733..e5372a13511d 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -112,23 +112,6 @@ config UBSAN_UNREACHABLE
 	  This option enables -fsanitize=unreachable which checks for control
 	  flow reaching an expected-to-be-unreachable position.
 
-config UBSAN_SIGNED_OVERFLOW
-	bool "Perform checking for signed arithmetic overflow"
-	default UBSAN
-	depends on $(cc-option,-fsanitize=signed-integer-overflow)
-	help
-	  This option enables -fsanitize=signed-integer-overflow which checks
-	  for overflow of any arithmetic operations with signed integers.
-
-config UBSAN_UNSIGNED_OVERFLOW
-	bool "Perform checking for unsigned arithmetic overflow"
-	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
-	depends on !X86_32 # avoid excessive stack usage on x86-32/clang
-	help
-	  This option enables -fsanitize=unsigned-integer-overflow which checks
-	  for overflow of any arithmetic operations with unsigned integers. This
-	  currently causes x86 to fail to boot.
-
 config UBSAN_OBJECT_SIZE
 	bool "Perform checking for accesses beyond the end of objects"
 	default UBSAN
diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 5e5d9355ef49..7e7bbd0f3fd2 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -11,51 +11,6 @@ typedef void(*test_ubsan_fp)(void);
 			#config, IS_ENABLED(config) ? "y" : "n");	\
 	} while (0)
 
-static void test_ubsan_add_overflow(void)
-{
-	volatile int val = INT_MAX;
-	volatile unsigned int uval = UINT_MAX;
-
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
-	val += 2;
-
-	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
-	uval += 2;
-}
-
-static void test_ubsan_sub_overflow(void)
-{
-	volatile int val = INT_MIN;
-	volatile unsigned int uval = 0;
-	volatile int val2 = 2;
-
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
-	val -= val2;
-
-	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
-	uval -= val2;
-}
-
-static void test_ubsan_mul_overflow(void)
-{
-	volatile int val = INT_MAX / 2;
-	volatile unsigned int uval = UINT_MAX / 2;
-
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
-	val *= 3;
-
-	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
-	uval *= 3;
-}
-
-static void test_ubsan_negate_overflow(void)
-{
-	volatile int val = INT_MIN;
-
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
-	val = -val;
-}
-
 static void test_ubsan_divrem_overflow(void)
 {
 	volatile int val = 16;
@@ -155,10 +110,6 @@ static void test_ubsan_object_size_mismatch(void)
 }
 
 static const test_ubsan_fp test_ubsan_array[] = {
-	test_ubsan_add_overflow,
-	test_ubsan_sub_overflow,
-	test_ubsan_mul_overflow,
-	test_ubsan_negate_overflow,
 	test_ubsan_shift_out_of_bounds,
 	test_ubsan_out_of_bounds,
 	test_ubsan_load_invalid_value,
diff --git a/lib/ubsan.c b/lib/ubsan.c
index bec38c64d6a6..26229973049d 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -163,74 +163,6 @@ static void ubsan_epilogue(void)
 	}
 }
 
-static void handle_overflow(struct overflow_data *data, void *lhs,
-			void *rhs, char op)
-{
-
-	struct type_descriptor *type = data->type;
-	char lhs_val_str[VALUE_LENGTH];
-	char rhs_val_str[VALUE_LENGTH];
-
-	if (suppress_report(&data->location))
-		return;
-
-	ubsan_prologue(&data->location, type_is_signed(type) ?
-			"signed-integer-overflow" :
-			"unsigned-integer-overflow");
-
-	val_to_string(lhs_val_str, sizeof(lhs_val_str), type, lhs);
-	val_to_string(rhs_val_str, sizeof(rhs_val_str), type, rhs);
-	pr_err("%s %c %s cannot be represented in type %s\n",
-		lhs_val_str,
-		op,
-		rhs_val_str,
-		type->type_name);
-
-	ubsan_epilogue();
-}
-
-void __ubsan_handle_add_overflow(void *data,
-				void *lhs, void *rhs)
-{
-
-	handle_overflow(data, lhs, rhs, '+');
-}
-EXPORT_SYMBOL(__ubsan_handle_add_overflow);
-
-void __ubsan_handle_sub_overflow(void *data,
-				void *lhs, void *rhs)
-{
-	handle_overflow(data, lhs, rhs, '-');
-}
-EXPORT_SYMBOL(__ubsan_handle_sub_overflow);
-
-void __ubsan_handle_mul_overflow(void *data,
-				void *lhs, void *rhs)
-{
-	handle_overflow(data, lhs, rhs, '*');
-}
-EXPORT_SYMBOL(__ubsan_handle_mul_overflow);
-
-void __ubsan_handle_negate_overflow(void *_data, void *old_val)
-{
-	struct overflow_data *data = _data;
-	char old_val_str[VALUE_LENGTH];
-
-	if (suppress_report(&data->location))
-		return;
-
-	ubsan_prologue(&data->location, "negation-overflow");
-
-	val_to_string(old_val_str, sizeof(old_val_str), data->type, old_val);
-
-	pr_err("negation of %s cannot be represented in type %s:\n",
-		old_val_str, data->type->type_name);
-
-	ubsan_epilogue();
-}
-EXPORT_SYMBOL(__ubsan_handle_negate_overflow);
-
-
 void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
 {
 	struct overflow_data *data = _data;
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 0e53a93e8f15..9e2092fd5206 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -8,8 +8,6 @@ ubsan-cflags-$(CONFIG_UBSAN_LOCAL_BOUNDS)	+= -fsanitize=local-bounds
 ubsan-cflags-$(CONFIG_UBSAN_SHIFT)		+= -fsanitize=shift
 ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
 ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
-ubsan-cflags-$(CONFIG_UBSAN_SIGNED_OVERFLOW)	+= -fsanitize=signed-integer-overflow
-ubsan-cflags-$(CONFIG_UBSAN_UNSIGNED_OVERFLOW)	+= -fsanitize=unsigned-integer-overflow
 ubsan-cflags-$(CONFIG_UBSAN_OBJECT_SIZE)	+= -fsanitize=object-size
 ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
 ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
-- 
2.26.2

