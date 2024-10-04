Return-Path: <linux-next+bounces-4114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F258991130
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 23:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169631F22098
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 21:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAA7142903;
	Fri,  4 Oct 2024 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP2761eQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADCE1339B1
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728076342; cv=none; b=qmhpGeg+/mQ1V4wHNeQ6y46ZvA7JkYC7MQx6NRWaXRBa0KqJoQsFoGB+hCfNWnqH4cl125K0vUqF+XpHNfIYG7q6NuSOIllsgBfsu2mxYYfb/b+MXEtfx9o8kRgQSM9+eLR4cNktY04yvs5hH693u/eBD+h1Fp/0XyGTa3Boc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728076342; c=relaxed/simple;
	bh=6HHJvFxpIpxDwc/eHXY5KzsQWxQ33qd5laytCKWwmqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX6OD8xq7erz4lSoPFp9dskYRhGVhjGwn8lfl0uVybAf3WzkLkeCjWpuaHK6qqcZHwc8pWpyaxUa4Gj70i2fGAVovCiBP8M821ri+Zp/2agab1/3XYK6l+3VmEo01xvBRZ6NcIJvS7uU9M89/spBhKjijnqM1cjCG+Gy56Oekho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP2761eQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d4093722bso358666266b.0
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2024 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728076339; x=1728681139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VbxUTtzYUwVqxxLg7D8rRSs88nPIzud+xXTPQgoMpM=;
        b=VP2761eQRPtHhTVRU1p36OyjbVvkEqY1Yb7drGycAPjEczlitHHS/l7ExcBFP3VDeY
         bDyViow66+NxXlEnv9IuQFL9utDrdUBdsMaKkB5P+Isny69qmPEq1/DbQt/h6t02TmVP
         rl7d8eROLzpkD682Nsa9uhA8wcmBfn5+AotkuUa8HvEe5KDU9gzyDUvFmanOrciAWdhc
         fnlkOuZjSmn6F0DbR3rT3LSW73sT7vzCRD0zd05MkiC/T8yc7u7XbHo5nbFHABHYBoZ8
         GTwn4l2eAtClhBAzJVFG2HB9cFjCMS0Fv4I+qRRj3dwV6R3yLLR9Po77b/YFd/v4deDC
         1Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728076339; x=1728681139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VbxUTtzYUwVqxxLg7D8rRSs88nPIzud+xXTPQgoMpM=;
        b=GquHPB6eOSlXkkWuZkrbhk5gePJ8M+pT2IlAz7SaE+kgrNlunmxvP/nQU000phFuKY
         eH6WslwWP4p2S46PZvPJ8LidPVXKyQu8vbcK9nCcQnbJ+PJLebtDweW7Pz2m+DVz7cul
         /XjVhzwkC8AYll13S2AQ0OcUw4yBSwr3THiLnvyTZB3YOpX44sbQrQzvqevhpNS1fLPA
         5gNVBs3LNSGZ5hd6Nx/2v8rw+EW0J1Xs7ZjwABJuqdSv9nLq5zmXBi///NcAHNdwJ+s5
         F4M1Pf+jZSGuc7+hpzo97SPwpznBL/K0qA4BqkurZyOzL/irSIoqs11/DaQHlmj+vbfN
         m55g==
X-Forwarded-Encrypted: i=1; AJvYcCXOlQXSeuaE93/8iDm8qw6rLtLuI2C7IC/EKsXYi68E0UGyIqcPaV77AiGYvjVjr9WR9tNpGl+ArBQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjB0JAw9kWFDOSrppeHZz/3Sq4ueRfoKS/Q12e3+U3EtBxCjr
	KYb84LeEuCtxmQ5vSSd3QMsU+YS1vEiaE7uIXdKLRpFLbH7kZnWX
X-Google-Smtp-Source: AGHT+IE2SRfnbFl3Zhnnb8gy3TlgSFA2LDBQrLDiAL77L3pBjdZ8Q3ljrghOB44g+L34V4t5tjAJvA==
X-Received: by 2002:a17:907:9288:b0:a8a:78bb:1e2 with SMTP id a640c23a62f3a-a991bd0572amr442147866b.6.1728076338873;
        Fri, 04 Oct 2024 14:12:18 -0700 (PDT)
Received: from gmail.com ([45.250.247.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e784ee4sm41204266b.105.2024.10.04.14.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:12:18 -0700 (PDT)
Date: Sat, 5 Oct 2024 02:42:12 +0530
From: Brahmajit <brahmajit.xyz@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-ID: <wdpe6qft3ucqxpd6gyvz6pol5ct44g64b3azmnjxtv7buemk3q@kgxvzoxdx6pm>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
 <20241002080914.841071-1-brahmajit.xyz@gmail.com>
 <20241002144806.255d62115286e173bbf42655@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002144806.255d62115286e173bbf42655@linux-foundation.org>

On 02.10.2024 14:48, Andrew Morton wrote:
> If we do remove the party trick (as you have done) then this:
> 
> 		if (vma->vm_flags & (1UL << i)) {
> 			seq_putc(m, mnemonics[i][0]);
> 			seq_putc(m, mnemonics[i][1]);
> 			seq_putc(m, ' ');
> 		}
> 
> can be simplified (and probably sped up) with
> 
> 		
> 		if (vma->vm_flags & (1UL << i))
> 			seq_printf(m, "%s ", mnemonics[i]);
> 
> yes?
> 

Hi Andrew, Hi Stephen,

With Andrew's suggestion I came up with something like this, would love
some feedback.

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..c7b6ce4f30c3 100644
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
@@ -985,13 +992,10 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 
 	seq_puts(m, "VmFlags: ");
 	for (i = 0; i < BITS_PER_LONG; i++) {
-		if (!mnemonics[i][0])
+		if (strcmp(mnemonics[i], "") == 0)
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
Regards,
listout

