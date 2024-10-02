Return-Path: <linux-next+bounces-4061-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4F98CE6A
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 10:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FEA8B20E35
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 08:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE721946CD;
	Wed,  2 Oct 2024 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii/+94tG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2641946C9
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856569; cv=none; b=PNxmyFP8F/mxILjfikcqtAcKdOwasxVvx07qDMJLaEnwDxLNRSr66FcH8PFCkDAja8hOyXuab/bt8e9wH9t9oSPbbB3uObJlsV6zCq66IFZ8pfryIun7no1oDgPFD6GGW9aWJpdR8ZvYy8NkufFBrqoICdrWgbXk1B7nxNqaGRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856569; c=relaxed/simple;
	bh=8tWYWEqkh/d25IGU38691wC25bY7bb6lkkMc47nMjqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYAQilyf4Su+3MF1P8DrkSQpDnD0mXgqWlHoFZqQGApM3YjtfOc6sqkzynVXm86bqEurE54hkSfQ6Fghd4BkEN2M4kk7TQ8hNy2HJjuz7AG3THqeZ0qY3/DyIN0rfOuJGbkuWCmZBJx8ROMmy2hKpr4w4MuJO7hJntWX4e8L5fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii/+94tG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so1030134a12.1
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2024 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727856566; x=1728461366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHhoHRUeNXx2FgfA+6qj+1t8VuDvtBVzg5XIUZo/4QQ=;
        b=Ii/+94tGnfhlKxdpFhmbD8P5LIXb5WHV3mhm1o2OxNRowUaUgAufebnYeVSJMh19U0
         TQUIhFuSRCtCW9YCGQg578DLFmgy++eT+gIuG0h8DylMvr5ecb/eci6/WLOch8WACT4z
         ytfUw+5WT1qJNQ2cFKAB9TkStICC1PvyO0g/TgfAlH+557qNQmCIjwuBopoBe+eTSbBw
         4OicZ0S2rSBfVGQF+f+ZFRRM1xMVkIRO3IP49Dv/cMI9zb2y0/wqa1T6dXYcGIKKoBWn
         GRLLpekMOkVK4b1PtDQ+vKJhIPWW6L3mx3dWj0uwNBUJkQybeRh1aHNWiVd6wiPK9Nv8
         41NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727856566; x=1728461366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHhoHRUeNXx2FgfA+6qj+1t8VuDvtBVzg5XIUZo/4QQ=;
        b=fti5bNcXndnKJaDHhHpMKhecZ0q+smMvEm+SBhYD2ucKBSgSQ0+Qcn+BJ/E2WyODyz
         CE0Fqe1bo9+PuQvgdh8L4TJtppBB3FITTtRv2PJzgsKJU2sXXnG1UCtvr3JMSP9IhqCU
         u39c8kvCB2LBh7T6kR3/32d4/ZQeJzEINrWqyI2BRSRKlvtn9Ue1fb1OQKdKwO/feLNY
         G+VW01/Lss0DYcePSPPUQi/K0khg2TlhTEk6x1i2sVquSdYW4L/GzAhbdG1l07bpuGCN
         mHxBhgWEF0f/QY91wP4UmAZKMcae475UFz+Q/K+Tf5m6z033pA8fzrnWRdm8J3M/DgWr
         YVrg==
X-Gm-Message-State: AOJu0YzKlMg/bnur7oZPEThKJIKvTfEN8Ds7smYRLGnWXI3s1iwCfPW/
	tmEwt3WUFFlSwrUfmg6IHHFDNVN/EBcgxyxtpPEulS01So7OD6KP
X-Google-Smtp-Source: AGHT+IEMN/xchI1+AcrT8qdC0Fy+F4DbXNUNiixpRX/cn4DbrthdLxDek3ZZTPL7IiSHN+8PElbt2Q==
X-Received: by 2002:a05:6402:4004:b0:5c8:7be2:6a9e with SMTP id 4fb4d7f45d1cf-5c8a2a042bfmr7633173a12.5.1727856566132;
        Wed, 02 Oct 2024 01:09:26 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c8adadc6b6sm1751042a12.43.2024.10.02.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:09:25 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	gorcunov@openvz.org
Cc: linux-next@vger.kernel.org
Subject: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to -Werror=unterminated-string-initialization
Date: Wed,  2 Oct 2024 13:39:14 +0530
Message-ID: <20241002080914.841071-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 15 enables -Werror=unterminated-string-initialization by default.
This results in the following build error/s
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
  917 |                 [0 ... (BITS_PER_LONG-1)] = "??",
      |                                                 ^~~~
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
...

To fix this, the length of the second argument of arary mnemonics needs
to be 3 instead of previously set 2 (i.e. from [BITS_PER_LONG][2] to
[BITS_PER_LONG][3])

Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
---
 fs/proc/task_mmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..aa5780696fc1 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -909,8 +909,15 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 {
 	/*
 	 * Don't forget to update Documentation/ on changes.
+	 *
+	 * The length of the second argument of arary mnemonics
+	 * needs to be 3 instead of previously set 2
+	 * (i.e. from [BITS_PER_LONG][2] to [BITS_PER_LONG][3])
+	 * to avoid spurious
+	 * -Werror=unterminated-string-initialization warning
+	 *  with GCC 15
 	 */
-	static const char mnemonics[BITS_PER_LONG][2] = {
+	static const char mnemonics[BITS_PER_LONG][3] = {
 		/*
 		 * In case if we meet a flag we don't know about.
 		 */
-- 
2.46.2


