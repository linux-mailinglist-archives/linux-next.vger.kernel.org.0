Return-Path: <linux-next+bounces-5319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD2A1ADE3
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 01:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB8C7A3614
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 00:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B48634C;
	Fri, 24 Jan 2025 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v5yr/a6U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC386332
	for <linux-next@vger.kernel.org>; Fri, 24 Jan 2025 00:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737678020; cv=none; b=Ns0xWfnLM/exYL7Lu47YpRrBuCx0UGb46Y9KROlTYbvQ+WrHC0DEu7+kw02vwnZg4tgvw5N+daaC4/zx13wptUHQmFUtk78uhmoTbSysDBCsF1J6nD3YsVDymiVHgZy32MvaLJuj3dqBE/44kKrVkE4pSrAcuUazGCZwMa3JwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737678020; c=relaxed/simple;
	bh=gCrvOk6jJjGGdqrncEhK0F22qM4eBClCHpzHo1HLaYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1O/v++IOBLQtnhPXzQtBE3PgOdeHEMmBYQJKYDc9yAP4DGviSJf7tVDMpL14Pr8w6xZUCmOsYNLD/W+eFePyCQDixPsK4elSBiodCwf/Gm+u23ZttsBsO77mFJ2FEzTsglwaL1+nbLHcToe2dpDCD2axkBEzI2INs3WFX8lWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v5yr/a6U; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215740b7fb8so66695ad.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 16:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737678017; x=1738282817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJFcaGlmjy0dmMltSgbDUy2jlbWnS2q5949Np8OSwEg=;
        b=v5yr/a6U322GfKvITgeh/NDDom+Aqni5Osrv3sTXCVjMcaaN9Cc7mNduOb2pf4aS+p
         diYtkXK8vmeWgNsYhnPMGkO3VlTIl6sad3iJlp9gwOhh2d/WamsGv3wUCCPTNX1JuLOL
         kXg6NHBX5PQiN/mE0KG4oBV5JZAiNcWGyjeMMJtzARYAznV7CQGKjnko+uUhjRs6sPWx
         0NgIG26l1ZAs24n7jr+LlJpEEfyiJiXogVsPgh57LICNDRcdxStSFKcxnMwk2ueJ1ARL
         wJV3+7Tsaej8vqSqD78/1POmJWwVdcmUuj0PaQjciXzCuSVIxIutTaJosap/DM7g96uW
         1DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737678017; x=1738282817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJFcaGlmjy0dmMltSgbDUy2jlbWnS2q5949Np8OSwEg=;
        b=DERiymz5MXkjI8swaaEk2DwgYFOf5IQzXZ3RYX3pwqnO6jPrh1mqaANvXN4TfGJyOy
         s3ZTuH+S6bXOjHSaWv4SqUSv+SSmukPqspTk0UoGFsf03gcuwiNpg7cdTaNYUMixRtGq
         zfbKYd6iyJPOhVOzJUMliHg2D2U7IfPT6BrNAA1BisUEfvyXsGIzAU9gVpNm3/Gsct4A
         fUE1spEVHGcoLz85b3bB+OkcVEx5CTfMncQMmCb4RhVt8HcAdHWGjZej4E8kawbXWiPS
         H3KcuQ5xFSJajDceoHAbaKV7cPoblBX0S3LmQeMuIMLVCtTog7ywfnUKY6D5aXK+uIk5
         Xd5w==
X-Forwarded-Encrypted: i=1; AJvYcCWKeCt4nqJ/kQadwbbUht+YJRJbiVxCC8UQMa0xiwHekT3ZhuDCzf2O/6GMAA9cW+B3WLJAccHV92BX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs+YT3srJqihkk2P7d6EoldJxyj7OivHg3UAAkFCdK0dS9a8O
	wLK69J+nwnLlUOps+wYlCs+xVJMPuU7YXtVRik63kaK8gUGI43sGH//TjOjnaA==
X-Gm-Gg: ASbGncsaV5fRfC6SdCovcQeiIptoSDBCnPj/7zXgRtxInkQMocLw5L/pozEt+Ni4C+V
	Wp68ROgVNz2w3FAFjkQtNmK7pb2vJsVFTXQS4XZ1NmMeydhjFeL3ReAV0moDxD0v6vkb+Yspw6c
	AtsaAuETK9UJe2Wbus4nUWNtHdFaALYvOvZsknXB4IJsmYF2qI0Lfk6tcHYjXIXR0MLBPQqbIfV
	WO2i82A8eXAy1uy5tyURn0xSakzjiP9vRHFku3ywFrMeqL/Jj3a+FZPG1Q1fBv0J8cW8h9pPs+M
	dTAyC3ndSGO2DCkgbaLWuUSm6KDmmvzIh7CWWUMezDU=
X-Google-Smtp-Source: AGHT+IE8EWJVCBJSV6XMWLUp70zFMbVBiO796VdbII+rnU4TXB66XkjLNGjKwiyhZQB5SsVt7cJNIQ==
X-Received: by 2002:a17:902:cf43:b0:215:7152:36e4 with SMTP id d9443c01a7336-21d9ad4d3a3mr3874955ad.27.1737678017400;
        Thu, 23 Jan 2025 16:20:17 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa76f3bsm331007a91.33.2025.01.23.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:20:16 -0800 (PST)
Date: Fri, 24 Jan 2025 00:20:13 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joel@joelfernandes.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, maco@android.com, sfr@canb.auug.org.au,
	surenb@google.com, syzkaller-bugs@googlegroups.com,
	tkjos@android.com, dualli@google.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
Message-ID: <Z5Lcvf02wNt_CHsD@google.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next

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

