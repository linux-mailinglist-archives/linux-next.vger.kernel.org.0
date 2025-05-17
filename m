Return-Path: <linux-next+bounces-6826-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A75ABAB4A
	for <lists+linux-next@lfdr.de>; Sat, 17 May 2025 19:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581C417FB76
	for <lists+linux-next@lfdr.de>; Sat, 17 May 2025 17:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFC4207A25;
	Sat, 17 May 2025 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lI4R0Ttv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934C8632E
	for <linux-next@vger.kernel.org>; Sat, 17 May 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502187; cv=none; b=TPJ8JEG9KuaX6ElEWvnsbyXjyLGWIM4QkmHVCh71jJpLANSV2CivkOJhY902NbChExig6M2i+7alXjT6JuTKPc3zdOOwe39a2kwGxippiGaHoYRDi2pkKGykw0JAJ0MzxZUItujQsSS6JeFJVfqRtdb8OqhCmnoUa9Yg1oKY/cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502187; c=relaxed/simple;
	bh=9Yzm10CwF95SdEp6HZeRuq2YqwK9KCVypv6FFXSxmII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMd+3Snu0Ov01i0eY0F/dRBYBJIwJZ5+LI3IK/1XlJNCNIjUMf5Xz/8il7wcX6YYiHz7mhkJFueif5UlrfQ7wx/xxfZdcwLxtTEikhccfViMl9iByVaPD/T9yeOubte6O1HOS40iAOlDgzQZvBlJVF32X9+uJMSvc28aiT2gx6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lI4R0Ttv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231f6c0b692so121775ad.0
        for <linux-next@vger.kernel.org>; Sat, 17 May 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747502185; x=1748106985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oECJK4EhKG9tEX+cHzZsFBNImVK6Jq7EaOv6UW/zHFM=;
        b=lI4R0TtvIGD75fsqrSgXmIFSAkO2up5GxvxL9t+0JHgWxumaU5T68/Cf80aY7M8UzL
         m8upeud/P81Ztc2dIf7DuKB09gOFmNX7wMt+t9yWbRS3NtVYweL8BXkdNlf+8tatgki0
         TYPO+79RU+1/cP6U/9xNRJB8Hrl3xchUT8vqdIz2mjxlOFVzidYR0uj8JJCwy3TSfCdy
         8316CATac8ZdUXBDMvZFDLjQVV/LuAS5HxVVUs9W1WAERh9/rT8TIrxxLyM2G2X1s85r
         YQuFOlYfFM1CC22z03wIgCFQpC4vtHdvx6sENkZkyfQhdFrC3RVbRxaWodQ10HDLun+v
         Gw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502185; x=1748106985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oECJK4EhKG9tEX+cHzZsFBNImVK6Jq7EaOv6UW/zHFM=;
        b=HCHyLF25eIYRQUk/Zo+zxjkbbsnIiSkQECuZErHgV7DLVGZz0WfoUsW7ne/8PvCN4o
         Grk1EnmYNClc3aIYBt5ph/PK5ai3xBe6YckrGRlt9IAT5w17cA3P07I4gfgtaNSGZnLi
         BxluH7eEOW0YoQkExq8lmEbw27hv6xUiy1xsPWXoBzouaYGkLMO+x3zXBOyxYKmzMCOb
         t45cp8VXoKFDM1+HXWeX+MxcgzAuCbdS9YrfRC9OvugVBxFuiDuIgLE2FvYX3WkLnJGD
         C3g3LmbkSJcfe6Ok1FOaGvWB+UKWwXtGStqT9R2NBjd0MSj4yvc+Dms5PaOqpDhjwJiQ
         sqtw==
X-Forwarded-Encrypted: i=1; AJvYcCV0P/XYDrLA5pF0W/YfSvJiVFkeBFkSD0TUwTdfLxEZ7PzSewcNTHO7bhn8OdGPjwEqjhwxNstVECsl@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUu2qpM3e84natlWuFpLASLkKAiV3fc+Dc2zULji1gnITuLNw
	lDIMDjzF23KpYWcpQdeyquZx+V/kxOGw8hClPfhFfM83RUh44ek2ek4N0xcKeYK5dw==
X-Gm-Gg: ASbGncvspGAgyHv+COrcvuN7I2OPuWgvBAOV2rQt3J9lxjICsHk68ll+USxrp3WuTOa
	TDaIuSeZijPWjqzHanlNczmbdWH/kyy826fkhHRiXeWTCjDDrTc3CzRcIk9xJ7zj0xNe3tm62yA
	F3yp0LGbybva4r0GfXjFRRquzYyeyX2WJFtrzdD5EqmJwSEHqJXlBKIKMI6kff5s7S4oaFqZI6h
	biO4oMCZDM1vm/gaqXrWRNzCjzkbPV3LrkB/UOWU4JmMufTr6WcEevDB+uSPiAMnHqTEOrQULQw
	xMsk9Oqujng+UcKXzIkLQuBibBjot9uRYoEYyIDtjPr0NGycSTbtfFI3mJ0NS+09LN3PalLhQJP
	C0IRCwhdn
X-Google-Smtp-Source: AGHT+IHCzf2+CRo3mSqfC+qoKsF+v8pV5dFUA1q/UEvjV0QSvMCIsf9UZncP3X3FcZbBm9pBKEF2yg==
X-Received: by 2002:a17:903:2ace:b0:231:e069:6188 with SMTP id d9443c01a7336-231ffc4c0efmr2243365ad.0.1747502185056;
        Sat, 17 May 2025 10:16:25 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97de4sm32692085ad.144.2025.05.17.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 10:16:24 -0700 (PDT)
Date: Sat, 17 May 2025 17:16:19 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joelagnelf@nvidia.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, maco@android.com, sfr@canb.auug.org.au,
	surenb@google.com, syzkaller-bugs@googlegroups.com,
	tkjos@android.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binderfs_evict_inode
Message-ID: <aCjEY1X85xUne3Ix@google.com>
References: <6827b414.a70a0220.38f255.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6827b414.a70a0220.38f255.0008.GAE@google.com>

On Fri, May 16, 2025 at 02:54:28PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8566fc3b9653 Add linux-next specific files for 20250516
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10b776f4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=aa3444b6d01e5afb
> dashboard link: https://syzkaller.appspot.com/bug?extid=c3763f82ee2ceaf93340
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ac394ca3c315/disk-8566fc3b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/170dd88bde87/vmlinux-8566fc3b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/c097fa83c7d7/bzImage-8566fc3b.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com
> 

#syz dup: upstream test error: KASAN: slab-use-after-free Write in binderfs_evict_inode

This is a dup for which Dmitry had sent out a fix for. However, Greg was
never cc'ed so the patch was left in limbo. v2 sent here:
https://lore.kernel.org/all/20250517170957.1317876-1-cmllamas@google.com/

