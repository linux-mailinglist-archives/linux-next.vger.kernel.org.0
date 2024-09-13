Return-Path: <linux-next+bounces-3840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F28019788D2
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A682811BF
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 19:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FDB13CAA5;
	Fri, 13 Sep 2024 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zBAdb5Yh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460184E11
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255251; cv=none; b=LflMijEFbTUmn6MU0UL94e3TO12P2HEcgSLNXWkC1vyjXJw0EqgC4osFWjwmI4j/MoIT0KYAPcWAnBCsIUTK85DRW5hL7QrIyUeTcMFuhyJ268Op9wm5qUIqzN0CyjywSN353jZ1fYIoJC0mXcBJk/wLnLO5zTqAqmHLKg5V9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255251; c=relaxed/simple;
	bh=ymlhcAQNHEBbDJjwaPc7aeCQGJlzv7MIqjOWsvgbkPA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KvD6m+bKtpgyny0SUcvS+EIf0p/bEHVueac3A1AzQM4jpTeZjpAaQXRrGpty5BU8Z3TN7fSp5R+GxUxGiH00IZ4/4dyIre8hhuDMQ/zam4bQz5dJkxUJnefQzdSR/QFVpuNDPpzg0auYjITESFQNmJ430TRFE7nq0ePifrX0hLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zBAdb5Yh; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d7124939beso25149157b3.2
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726255249; x=1726860049; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XyVwmJzFbJ/oT6rl4j6NoyNuLyObf2RLXKIfBjhIh5k=;
        b=zBAdb5YhPvpI1Lnmd2XkzhP52PF4x9RGuVKl5DZUwIi1dkQxzlu2amz2dAdh8Cy+EH
         +ITOfpBH223EchkFntIihO42oPzvfdD1gGGPrEsGv4WhC2DjkisxzGYoeHwZYL8yQ048
         SCEcMncePDCCI9drgggFchdfUOgqfsySKUvmfnLh5JpFJ2f1kOi1dyYAVmzkPC9YlXzb
         jJyrJqPEpLuCuNWOA8Gyf7zlkUDbKBIZlsc/3kZcY/oxn6ALUAPNBRa0AE5I0zBpnteY
         Z0PphiumZhmy8zVpFxqgdCx5v9nVzQAham+IDY4NAwPs4zsUdtdlbcy/cFIw86aZvU+q
         xJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726255249; x=1726860049;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyVwmJzFbJ/oT6rl4j6NoyNuLyObf2RLXKIfBjhIh5k=;
        b=q92mxVmXYOsq/gR2c5nBtsRPJdZoKWkoeKvDPA4f0C4W+BPo3BfSY9D3ls/Zx4BNHj
         3EupDrWBYDlemK1yD4/7ajAViQ0r5ihQpyVQ51rJaHKICVT7AfozCzjlLKsfLlSX2fX8
         zAiA3WLvteXfqmqFvvJOfI0j3aHoXLZwzFic626ryIvaDNitvZvHowgC/3pWzuw5yS4n
         A0qvytsZbhBxw0ywCWutSvpz2iDZ1b5tBQ+1/Yo4tHj7s8RqYMLnZlA470hC/mPmvO/h
         uOL+/luvS7rYXQjHIcLjt3W2Tg+6G5mxPCVbgq2Ac6MsqO21nSO/16bg+yWl3/QRg2vv
         FgEA==
X-Forwarded-Encrypted: i=1; AJvYcCVo81JhH4TB2TjTI1UPhSi2tihgpLv0UfF2GQ/1Bj39v2ieabxR1stafkb7kmT84cEhF3zIMnj4QqWl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nwTu6x9MNe9CunMvD7k5s320NzQFB2zhBNXjBsi73kM74/pP
	44hA9aai22D0agMQw/EfVvsM3yy6fbiN2buWOurtn92pNzVPAFlwiLWXEJ7qvmqgT8fOEx42L7B
	UpGHIq0OcSDbwV1BIWmzMEw==
X-Google-Smtp-Source: AGHT+IFDF32N4mQwATZNCLz25QLEOkKmOIRWCMujqX0ZzKlzsSNpONZ53k1X0A26W9ZzFOaKPw2IjNpPtPK3sfm+wg==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:7487:b0:6d5:df94:b7f2 with
 SMTP id 00721157ae682-6dbcc579a34mr1597487b3.5.1726255248865; Fri, 13 Sep
 2024 12:20:48 -0700 (PDT)
Date: Fri, 13 Sep 2024 19:20:36 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240913192036.3289003-1-almasrymina@google.com>
Subject: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Content-Type: text/plain; charset="UTF-8"

Building net-next with powerpc with GCC 14 compiler results in this
build error:

/home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
/home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
not a multiple of 4)
make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
net/core/page_pool.o] Error 1

Root caused in this thread:
https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

We try to access offset 40 in the pointer returned by this function:

static inline unsigned long _compound_head(const struct page *page)
{
	unsigned long head = READ_ONCE(page->compound_head);

	if (unlikely(head & 1))
		return head - 1;
	return (unsigned long)page_fixed_fake_head(page);
}

The GCC 14 (but not 11) compiler optimizes this by doing:

ld page + 39

Rather than:

ld (page - 1) + 40

Causing an unaligned read error. Fix this by bitwise operand instead of
an arthimetic operation to clear the pointer, which probably
communicates the intention of the code a bit better anyway.

Cc: Simon Horman <horms@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: David Miller <davem@davemloft.net>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

Suggested-by: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/linux/page-flags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5769fe6e4950..ea4005d2d1a9 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long head = READ_ONCE(page->compound_head);
 
-	if (unlikely(head & 1))
-		return head - 1;
+	if (unlikely(head & 1UL))
+		return head & ~1UL;
 	return (unsigned long)page_fixed_fake_head(page);
 }
 
-- 
2.46.0.662.g92d0881bb0-goog


