Return-Path: <linux-next+bounces-5318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59FA1ADC4
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 01:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899023AD27A
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 00:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2F26AA1;
	Fri, 24 Jan 2025 00:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qjn1kMuU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E44C91
	for <linux-next@vger.kernel.org>; Fri, 24 Jan 2025 00:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677490; cv=none; b=EhmROSr9xUZnBRVAfIojQh0I4K0c3FLsqq8qCYSfxcachcFsUstmyW0mHZ5y4ewHLUvFylYMgKQ0u+kJrxD5iss0HpuKeBlfHm8F+uftP5rfWyY92DSZ31PaRWIshLKbKXnNnhCF3X5zE+/C0qhmfRhu1bY8ST+vOL8ibavrW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677490; c=relaxed/simple;
	bh=SYhD6O6RGDoCgQKW2y3MQQXdgD99A+4cBPBqwS9aJls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6rU/EAkDKcb3jGxY3Dg2kGS6+6DQKJyRDQ6IEor/5KAWjljDNJFKWLCHsPx6F0FmjOKW28vDeFv/e5bENTNFAbEwg4D6GbRAd+ffyCGN9roHF0+zQaoC2KLYfsM4f/SHiiVFcNWTxa9BWWqwRnZw2vdlZZhBnlB+sL47Kq/Aro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qjn1kMuU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215740b7fb8so65695ad.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 16:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737677488; x=1738282288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjkRRDA4hnNszEaflHVA0iwk48+fYjAf9dZcv5vcjpE=;
        b=Qjn1kMuUAnIEt37Itep1KtzeLfLjP1PI/ulDsUx7NddYaN40GoMTkNV2SAJugpNdzj
         6xUd5stxgzhxSnMy4BX+c+tspNWbNe6jTfr9o0fWZkHdD9ua9NM3DD4JMM9FVlEDbg5h
         xh2FujBHzPRcH19zDoaJELMm1ikZYmDG5ATSISGWj8J/5sbU08+PteNUV3adRApN8ydC
         rw7qa2WW4AVfUy4SJhQ22evP9XB1aiROgwjp9a9lyTBryKS6fIzpvaxjbV9KLUk0pg3H
         iG3kg4DDswUOj6b10PF3oiXDeHao73+f5flQpS88DVmzDrzwcuepANoZhythLKyAV/8j
         pCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737677488; x=1738282288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjkRRDA4hnNszEaflHVA0iwk48+fYjAf9dZcv5vcjpE=;
        b=VrBYhhjUOu0rOJcl2xUyOBc1sPE16ykACJcTI0Fz6ZmJdyazmeou5bjuhaH4AUXew2
         E8fmVOi+AMebM6tJsmq4H31ZmH05VLbmivMnXgW2WEEWF7py5B6Jgc4D1uJVu/x29oDD
         KcDPUMWTSdYA17v6rBh1A5DUGokXcRNy/mPpPucRfWT2Kyuyu5G4LuyPqQ8lmEQzEQZ9
         3QqKU0weMlhFTjvgPGVuyUeg0VDQkLX7qC6WjKRNT384TkTicXeZIuhXCwX3SSfv8vw2
         MK3GvtdyhPQQSNmCwT2K8+aWPw7qdDwlbq66LV4k8G2aSQemUX7D/GtJKMD9nJGymzN5
         nuag==
X-Forwarded-Encrypted: i=1; AJvYcCW8oRXE6SvlR73yJnSEm98srA8WYMWeug9IiKpQvqWSLXBrIPfYGCApOUqwbTGnLogp3Hmaf9ph1YvB@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTI8Skpn3wvZWDPHCnbS20tp8T+GtFejv2lJSpU7M7i3MRFE5
	y9hfesCJSp86Cl4ClF0zFpN5Xnd5QgKnII+AdTC/JVn/07d2B6+8cCdZ2hMDEg==
X-Gm-Gg: ASbGnctQezXTMI5rv73CKnHaTXDx34wQq9t/vLES6OzqjkQ4cfNipvR2KJkXmV7x0Ga
	3rM5H/64XkNvms+DxmsxVoR9BsViJT/ZIH4myVEqlCXYFQZXg4H4+1fYF96TBzOEOYGZsSxrdki
	Wj5BoVvUeaMW4VwZlaBAQyxQ3EQTkO2flouo8rq0WoyyViViTZnXyvbz/bOinQe+LogvOKKnsHp
	CaJDrUhLYRevnM7yJ21d4onNebJSb+0jzIgzle4GbMegbJfR3XrwG9AQIduz9yG7a3piq/zPPuU
	8mtruNVjJJVZ34aWC6HPmYdv16Htg7C4oEnpXFSahWk=
X-Google-Smtp-Source: AGHT+IETrKp4cY+9PRqEKuq00wickTAPduTpXnGBieIbfDJglLRtSgo8HbVq1V3fl2EjzeEpTHvNZQ==
X-Received: by 2002:a17:903:298f:b0:215:98fd:cb04 with SMTP id d9443c01a7336-21d9ad495b7mr3981615ad.25.1737677488396;
        Thu, 23 Jan 2025 16:11:28 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbcdb2sm452803a12.69.2025.01.23.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:11:27 -0800 (PST)
Date: Fri, 24 Jan 2025 00:11:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joel@joelfernandes.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, maco@android.com, sfr@canb.auug.org.au,
	surenb@google.com, syzkaller-bugs@googlegroups.com,
	tkjos@android.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
Message-ID: <Z5LarLkj50YumVD1@google.com>
References: <Z5KTGg7KXfBhHJZA@google.com>
 <6792a5db.050a0220.3ab881.0002.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6792a5db.050a0220.3ab881.0002.GAE@google.com>

On Thu, Jan 23, 2025 at 12:26:03PM -0800, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> 0][   T52]  ieee80211_unregister_hw+0x5d/0x2c0
> [   72.827744][   T52]  mac80211_hwsim_del_radio+0x2c4/0x4c0
> [   72.827761][   T52]  ? __pfx_mac80211_hwsim_del_radio+0x10/0x10
> [   72.827777][   T52]  hwsim_exit_net+0x5c1/0x670
> [   72.827790][   T52]  ? __pfx_hwsim_exit_net+0x10/0x10
> [   72.827802][   T52]  ? __ip_vs_dev_cleanup_batch+0x239/0x260
> [   72.827818][   T52]  cleanup_net+0x812/0xd60
> [   72.827831][   T52]  ? __pfx_cleanup_net+0x10/0x10
> [   72.827847][   T52]  ? process_scheduled_works+0x976/0x1840
> [   72.827861][   T52]  process_scheduled_works+0xa66/0x1840
> [   72.827882][   T52]  ? __pfx_process_scheduled_works+0x10/0x10
> [   72.827898][   T52]  ? assign_work+0x364/0x3d0
> [   72.827913][   T52]  worker_thread+0x870/0xd30
> [   72.827931][   T52]  ? __kthread_parkme+0x169/0x1d0
> [   72.827946][   T52]  ? __pfx_worker_thread+0x10/0x10
> [   72.827960][   T52]  kthread+0x7a9/0x920
> [   72.827975][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.827991][   T52]  ? __pfx_worker_thread+0x10/0x10
> [   72.828004][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.828019][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.828035][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.828057][   T52]  ? _raw_spin_unlock_irq+0x23/0x50
> [   72.828073][   T52]  ? lockdep_hardirqs_on+0x99/0x150
> [   72.828083][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.828099][   T52]  ret_from_fork+0x4b/0x80
> [   72.828115][   T52]  ? __pfx_kthread+0x10/0x10
> [   72.828130][   T52]  ret_from_fork_asm+0x1a/0x30
> [   72.828147][   T52]  </TASK>

Huh? it sounds like linux-next is broken right now. This is some
unrelated lockdep issue. Let me retry with char-misc tree instead.

