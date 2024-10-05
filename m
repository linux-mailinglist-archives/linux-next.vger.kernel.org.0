Return-Path: <linux-next+bounces-4116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451869914E7
	for <lists+linux-next@lfdr.de>; Sat,  5 Oct 2024 08:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781B628369B
	for <lists+linux-next@lfdr.de>; Sat,  5 Oct 2024 06:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E4F487A5;
	Sat,  5 Oct 2024 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJFq6zqP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61FC27452
	for <linux-next@vger.kernel.org>; Sat,  5 Oct 2024 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110235; cv=none; b=JcgNbeM80id1Gi2fMm0Yzoky78tq7PSTyEiM+gavLR0Zc8rocHydKC/wYdyShEcDGfm75etmRHNVWU7MzDmb2j+8KdrH6x4S/g3vQHyLYUInp2Hn/gQNMLYXe40JlvxhZI1j8WC3JkKV8c1+kiAYroCmgB6aKDt6+YMyTftG+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110235; c=relaxed/simple;
	bh=Kfq9W6c5xv/mI5TqB8XQGgObcyeDLAzhgGwnoF+3ThA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/nMPO3G7z0jcbzdkhWgZsqilvol8ETqB1h7r0AI5Su4xpYOg2Fd4q6ejTrifKin1IG5R01loxOgAFMQiaO7YBUxkzJZdhq2RjCdJvVlIwKnhjVXDZ0OhcTd1Jc1wr5mNCtES/hetJOX4WB+a9Sd7PcgyA+13bOBPQs+NiEVLM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJFq6zqP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86e9db75b9so393424666b.1
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2024 23:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728110232; x=1728715032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMKqJAZgoLXfzf5KxVRjXaCYCmlH66oyR89zPc8ghac=;
        b=RJFq6zqP7zP+TECNUFhOQvhmYRV2dCNmQvu6yhoBHQA8sE1cm9ef89TO2T911YaWa7
         CWDJfxGnwOLeRTvpDPeN4EXU8K5c5iH9oHmCEaAs+MD1aMR019KAl3KB5NvF3qxAdw3W
         ZyVd1zaJ/J81FP0EUaiWsgT8KqMBYObaqfDH8i2bfkOUbnjR5N73BZ85yqtaREp4j9Qy
         xetzwC8ywd8EHly0ke2/Cg5510AiurnrJ9X1CqtqbVcpeG0hczK9PBC9Bczl7uShmqrq
         Byn7fKQ8xjkuy2l1hKhSZ5HeWQkh4w68bs84jG5UawT+vlMJ2sBYDJg17rDJ7SAgvP8V
         64dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728110232; x=1728715032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMKqJAZgoLXfzf5KxVRjXaCYCmlH66oyR89zPc8ghac=;
        b=SlO5b/zBGkSVt6WWX/yMCFjrxsCtPd69l7EKprYkStnuWWuqpKBKx7Shiy9iX+i9yI
         JDX9ElhWGAdM1pO763JwjK2bNgdzOFforjuTURy87THHg1AC3bSEOcrKCp+1nfD32Lw0
         deNd+Z5rh7PYLuQFVv4utvMOSV70nvL3NttLpT9Ws4xMO+qyjkiAlD/HhQFzT/k5krsK
         1f0JfiNraz5/obwEC+KG3HsuGrbp4VPLx1WwSuCg5nkZsud2/wlOGo25gW3mVrxdGMuH
         E8NxJoI6EpgQtOGJ/1XjPp0+eoD0pHvG2H/Gl0K22//l3xKlhUtGbn+wsB4FlNbXmfDj
         L1ug==
X-Forwarded-Encrypted: i=1; AJvYcCWlhXx7WzUCcNvgmY/ym94Rug8yH6/FRMnnywV67ntnle93gBQtXOQwo1aHa6pCA84DwC1pvb2AihlM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yqySHaoGM1O314e6DJRjiX9JkDh94KX6LeG8YFDBbFEug1HC
	RBy/qm6bFf5HIgxzEQeTl0hFslT6coGgHXOevA6sgveXKk2yzpTX
X-Google-Smtp-Source: AGHT+IFoxK+mPMUstnFYFzPJNFoGViJYzAvBr9Y6CAiIKURG0ST0iNkul7cLZn2vUUZwN78UhLTP1A==
X-Received: by 2002:a17:907:97d5:b0:a99:3eae:87f3 with SMTP id a640c23a62f3a-a993eae8b86mr53390866b.47.1728110231717;
        Fri, 04 Oct 2024 23:37:11 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a992e7e254dsm91171666b.209.2024.10.04.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 23:37:11 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	gorcunov@openvz.org,
	linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: [PATCH v3 1/1] fs/proc: Fix build with GCC 15 due to -Werror=unterminated-string-initialization
Date: Sat,  5 Oct 2024 12:07:00 +0530
Message-ID: <20241005063700.2241027-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004145804.57278eac01c2601abb20c671@linux-foundation.org>
References: <20241004145804.57278eac01c2601abb20c671@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

show show_smap_vma_flags() has been using misspelled initializer in
mnemonics[] - it needed to initialize 2 element array of char and it
used NUL-padded 2 character string literals (i.e. 3-element
initializer).

This has been spotted by gcc-15[*]; prior to that gcc quietly dropped
the 3rd eleemnt of initializers. To fix this we are increasing the size
of mnemonics[] (from mnemonics[BITS_PER_LONG][2] to
mnemonics[BITS_PER_LONG][3]) to accomodate the NUL-padded string
literals.

This also helps us in simplyfying the logic for printing of the flags as
instead of printing each character from the mnemonics[], we can just
print the mnemonics[] using seq_printf.

[*]: fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
  917 |                 [0 ... (BITS_PER_LONG-1)] = "??",
      |                                                 ^~~~
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
...

Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
---
 fs/proc/task_mmu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..e52bd96137a6 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -909,8 +909,15 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 {
 	/*
 	 * Don't forget to update Documentation/ on changes.
+	 *
+	 * The length of the second argument of mnemonics[]
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
@@ -987,11 +994,8 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 	for (i = 0; i < BITS_PER_LONG; i++) {
 		if (!mnemonics[i][0])
 			continue;
-		if (vma->vm_flags & (1UL << i)) {
-			seq_putc(m, mnemonics[i][0]);
-			seq_putc(m, mnemonics[i][1]);
-			seq_putc(m, ' ');
-		}
+		if (vma->vm_flags & (1UL << i))
+			seq_printf(m, "%s ", mnemonics[i]);
 	}
 	seq_putc(m, '\n');
 }
-- 
2.46.2


