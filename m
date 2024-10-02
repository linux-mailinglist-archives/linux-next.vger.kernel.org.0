Return-Path: <linux-next+bounces-4060-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543E98CE59
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD1E284B81
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 08:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED90084A40;
	Wed,  2 Oct 2024 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfvyCCQA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C946BA
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856359; cv=none; b=Hmuz+7iuE7i+13OoMehKCSoC1NQXpfAudrH7aFyqeev7gnOYHgC6zX/pDny7zX4Y86EIfjQ8odVloktQeFLOmFql4i7ficbaWv61yIf10ZEW2ytvppGdXWNSJwzd9crjadNAsD2Hx0QQcmSbr1lSUHqAGh8DiwHL/yDgSl6xO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856359; c=relaxed/simple;
	bh=29Ciwt1y2PHUI4MgjJX1PDt+jGdUsEk3EUsmSZjubaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rm8YdxVEky6EHJT3divjGpc3Y3LE+qeAJ0xIN9FmWMb2B2i0u4DGcW4MzAKMLcR2XE7tSnFuPgN7yFPK/5p2xISwrjCEfSN9g4o6HybJ0cqzTsw/IakYnJNavSpCKQOm2DlzfUFFNQpdVXkJsawSPYI6HwzVzOpE6811VDWgiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfvyCCQA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so3025274a12.2
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2024 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727856356; x=1728461156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PToPppG1HFTHlEOvYGRDUqJIo2vtPI094rrHVaAX33E=;
        b=WfvyCCQA/aa8zfwa1j9N2pzmDQO7kWn91/Mn1LugOJcmPyF/GY3ZM7a7Zjc69jjHFH
         YqWL/fZI864PRgXuAJCGBucTsAiGOO0tNMN1YLtI23C0ZhC4peiMs/iiuKw0iMVV9dQl
         uohFnWVTAteuLwbFDMrcLVWqAqUM1rwUBB+u4oil80DFIhis0fCcEkor/8W+AwADJ3d3
         RDweUXXrDj6rSgJVd6LW2riwTmud6kQ/Mie6oKwee1R0zb4UghHLAZ6q4ORXxaStsRQI
         EzSeuXG/H7YBx3uVQ+DKDtpBjL1Y/0FmIgd0SwWHYB22eOx03zklcdu/8qpEgpeKJh/M
         uEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727856356; x=1728461156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PToPppG1HFTHlEOvYGRDUqJIo2vtPI094rrHVaAX33E=;
        b=IC1UHaQQnHNgUMDbc3Lm3WwR77AeFW2zyRx3DvZHJWASGd4Di9V/L/KtDZrXSAwQL1
         D55nqlG8YgM/bZHTYJk74qsrzSlbYol8cBm/J2f0knVdvRf3pYGsMUj6B07B9uRC7pKQ
         89/XqatFYaCth3bDrLzU0Yu661/V13Qwtq+hbe6dM7mqoLZ8xLjTUG8kHJ0KPjlb4k60
         f/l2+vMRs592tZTD4HswOVe4HjED0P6kkJdxbTQnX7Asc5RL/jP/KcDaGQOZXjBjPWl2
         eguzUEY2OWtdbtAdRUtGFQWhZNRCsk2eb6JelKNCbsotISBAUMgbZlXEjzq10hSCErt9
         ayhg==
X-Gm-Message-State: AOJu0YxKneB9Lljj+Qn18j2fM/gqEV8bsUcVRM2n+PrJR95SSBoVUH9G
	/EBzbwa6ccMK3BsVyPO3deQ8IPE9vHRe9TfyeGbAXvHDsXGruaDzeCfOZ49EMnw=
X-Google-Smtp-Source: AGHT+IGhZBucBtRvwzHkxRyNP2FiTIx+xNm0Dlh0twQBeiRyN9KkYwx1B3CMeyY5HYi+Rjmz3MCkdA==
X-Received: by 2002:a05:6402:2744:b0:5c8:8208:2924 with SMTP id 4fb4d7f45d1cf-5c8b1b6fe26mr1331662a12.22.1727856356288;
        Wed, 02 Oct 2024 01:05:56 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245e990sm7212460a12.52.2024.10.02.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:05:56 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	gorcunov@openvz.org
Cc: linux-next@vger.kernel.org
Subject: [PATCH 1/1] fs: proc: Fix build with GCC 15 due to -Werror=unterminated-string-initialization
Date: Wed,  2 Oct 2024 13:35:34 +0530
Message-ID: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
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
  917 |                 [0 ... (BITS_PER_LONG-1) + 1] = "??",
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


