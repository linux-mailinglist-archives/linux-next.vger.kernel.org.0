Return-Path: <linux-next+bounces-5313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3BA1A9F6
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 20:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59FCC188168D
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 19:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7AA154C07;
	Thu, 23 Jan 2025 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuTqcFpk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CD13D882
	for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659171; cv=none; b=eTr2Xlm28vHm4xMjqfLHb5Jg2c2sfE5H1Itk7Z81jUM8T+N7639EDMFiPuQaFJOk10w+L9hru/xiOiegNbdPnw9pzXjf4wDmIA0eXd66/wmiD8uoM1zZo5JD26jNiXkK2W/La5CQeLbb6koxj91Fe1Sriv3l4hRAH2vTKZr1DH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659171; c=relaxed/simple;
	bh=V4+ZgIomQHCZCgrFq6esFXkkT8+hKsfIB1PjnT3Ajkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXelHE+Qw2U7PrAr43LEd6le5lIoTLO/1ZAnrpA/MISri5CfckdZPuW6p6eVx/K/k+nrj1gpdZsKnCKYdBcVimqjGNtIOGwayq0cGi9xsBP1SCa9lxbkU3npE4APihso4iSffR0lmJuann3l8pzzI4xLDDCP6wXzuawSNKlYpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuTqcFpk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21625b4f978so16405ad.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 11:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737659169; x=1738263969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Y6HyKHPeqjZZJ7xDrBN5PmyWjtjbgLSbz75PvB0bxU=;
        b=JuTqcFpkSm7nfILQqyZ+PDq3DMz5Bx6MLlHKY84GMLGhwqcFL0v+W1+W9hPEtgPFAJ
         uSNnSeuQLU/47JEKRdQJNT0Hplr+r3CAj+xZDGRra4Wttg8RPiVEE0+Rf1kWPvxfOG6P
         klHV/CF061DG+8Ggd/zkgy5F/Af4h8BnyVba2+09cVQa4OvWUly3o0bPmorDCr/utl0F
         LA9ZuSNH76nCxwwsJUnsezweWhHMjgK6uMRgmn25tOyLud9OCm4K8EMG0zITsvmpf7H4
         QOTYzChQpIjnV7/xo8+9fGcJLfDEghSoQwUwFDEx9vGDrlNXn7RdbtvDmf0R7cgG1A5U
         Lhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659169; x=1738263969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y6HyKHPeqjZZJ7xDrBN5PmyWjtjbgLSbz75PvB0bxU=;
        b=QhnD4kKT02ivY6PZq9b6Msa7PJtOtDwa7yPqLy1NdcJpOmbs2HGOMv25Szu7Bn+dVe
         lbNjxjgsi3NsEV4fOXYuXp8XHTxgScqTvOPro3GIA1csWpc8CslgR9RoLkm9a6AXq4yX
         qjCG6yw9uRd4g5PtXWJ/UqTjRWk8N13Hyyezm9RVvfHL3d7oxYdQD0kBZ/SVEAyz9ek2
         A3nyJJjV+EL1xhjXLzjcdIxGsTQ+cY18bD0OX2QZqjVOYc7kTBRCm+OhaOJX5vPHTWoR
         xvXQmDayqfy0c3BQpJe6+YRmvWr3uyx8/OwhaYma8UtE4xJF6jSj63m0RpCs3zBKOZ4c
         3wKw==
X-Forwarded-Encrypted: i=1; AJvYcCXqu/uJBhXIXhj9J1cuS1VEMTY8BG60YJSsTJge1VF737WfMC6WjmJf1IaDbOd3kEtkH01Bdta5fuUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+GaO/ROpsa+KmttVTFtTBoj48/agHYTNJZB2mvxrlzG6cjZY
	srKSn3c5GwTnLlHTMK9hN1U3alPGW37wgjasfJWt24Goa4xoptGk2j5IjpQ4OW5SUfRXh5l8DXo
	FUQ==
X-Gm-Gg: ASbGncsunxBMsD1+vAZL75fz0XD7Es5oBXjclDosFbJYNgWFO8K/4qAf4fuTzVW2ke4
	waaQO0ROXjql/LFLBJpzaI8SHgOvqmhiEFFPRgYJ3gU68hme67eLeb+AT2Af8vvPffIXzbZ2xeN
	n3PaQe4BYfGcKVoNCsayTMudMcDA0S4LzoJvOYEacf9EankGWRT8Hcs1jzqQ8ufeQ0gToYYErf/
	FFjj75so8HI3LGZIZ735UVSI3/46PzZruRBgusuEhuDFr8WqfwSBdGznW36RXzELAwUpcWocVKi
	1rhlk529jnIsTIIXyu6+X7Ciybgm9SZYPBPp6yWdIvo=
X-Google-Smtp-Source: AGHT+IHqixvMexxsG62HqWERRlioZpkbDI61GR3epSJb5OXSXK5+Px+zTcs99oM2L1pr22K8e7m+7g==
X-Received: by 2002:a17:903:251:b0:215:8232:5596 with SMTP id d9443c01a7336-21d99cb7ba0mr3592665ad.16.1737659168827;
        Thu, 23 Jan 2025 11:06:08 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78f13asm280236b3a.175.2025.01.23.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:06:08 -0800 (PST)
Date: Thu, 23 Jan 2025 19:06:02 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joel@joelfernandes.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, maco@android.com, sfr@canb.auug.org.au,
	surenb@google.com, syzkaller-bugs@googlegroups.com,
	tkjos@android.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
Message-ID: <Z5KTGg7KXfBhHJZA@google.com>
References: <6788e8a3.050a0220.20d369.0031.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6788e8a3.050a0220.20d369.0031.GAE@google.com>

On Thu, Jan 16, 2025 at 03:08:19AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b323d8e7bc03 Add linux-next specific files for 20250116
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=139dc9df980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=76ebc49148908d34
> dashboard link: https://syzkaller.appspot.com/bug?extid=7015dcf45953112c8b45
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/a529f1184b45/disk-b323d8e7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/08db885c938e/vmlinux-b323d8e7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2ff92778e2b7/bzImage-b323d8e7.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com

#syz test

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index bc6bae76ccaf..94c6446604fc 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -274,6 +274,7 @@ static void binderfs_evict_inode(struct inode *inode)
 	mutex_unlock(&binderfs_minors_mutex);
 
 	if (refcount_dec_and_test(&device->ref)) {
+		hlist_del_init(&device->hlist);
 		kfree(device->context.name);
 		kfree(device);
 	}

