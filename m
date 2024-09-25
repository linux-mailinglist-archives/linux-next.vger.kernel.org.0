Return-Path: <linux-next+bounces-3968-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64440986861
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 23:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7869A1C21E4F
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 21:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643C2145B2D;
	Wed, 25 Sep 2024 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="cejnQ6vN"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C5954767;
	Wed, 25 Sep 2024 21:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300248; cv=none; b=H4XN3UkQoaWgIq2aTFD6qoVp5yaAr9n8n65u8esV1kyF0oSLR7Id851pikqDQaPPwC3vUGGAIsd+vtcpyIJoHthc9ok4bcPHLsHj2/FpyvoQwKoN15SpfZGYG0Ku6XzT6TWrvHYWQlLd4skgRgKSuG+S1vTrmayOhlrMk3F/dy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300248; c=relaxed/simple;
	bh=W0LaluCuRJcqGS/YGtcZWasKra+tMpPMkbjnz0XWCAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKIMGbg4qQhdA0apfuIApiiKkwqx3Lkkbqoi/CMFqRFQAx90bokqmuvxW8IbgzGqp8F/xouER9eKELy7+xQKzz2FTjMUEicEATI12pT5c6opNXaeUMfWQLguaL4uarGXVgCU0GmyQsioTXQxxxiMhZvDAb/DbYqsEpMrxGYiUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=cejnQ6vN; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727300239; x=1727905039; i=spasswolf@web.de;
	bh=1YZHv23sKabJw+PV52kwhSEZgpFol4erC13jITfOSQ0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cejnQ6vNEzEeztao9wYefSUF18aS8P+pcrVRZW4KNfjIxhCXYjZM7rYWFqLwD3Dg
	 YgYLXTx1ZtgrC8ugm2990lQbfjeNdgeO+wtDWgoIRuRYGaXDISkcDRV4CsbY4J7EU
	 3YanFL+ECB1NP9d9FTVODz9JznBr5xabuOGyWZrGQn32wjKdLG9zLUN77ZMvydurE
	 BJW9MFv94Lp/Ch8EgIykIvkzH9Ghv4thoZJJ8L/k9BsLnKO/T/jldi/YPuqrEnGY+
	 jVs+C4Shk9u/G7JMzQ3D+ZGKdicBf44XIJaeYGFpHd8BSExpVNFTx4QFpcd1mS6jP
	 NjVvKvidkISVxK43sg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MDe2P-1skXQ93ET1-00BKqv; Wed, 25 Sep 2024 23:37:18 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
Date: Wed, 25 Sep 2024 23:37:16 +0200
Message-ID: <20240925213717.3555-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: a48564f002b31cb1a8db7680729aac91bc3d3b6b.camel@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Dt89xP3IfMD5VKMGDvTQ0cgzbebilNwKYcoSehr/Z67sV62EKI
 y9yk7eq/wzah3yLm7mH8sSBoc6O0jfm76F3HM7EBep4ukgG6A4hcr+ceUkoyZBXm7q+c4iB
 ZKgrEoDkehPzoLv9zE0DWdBNBRlVnZl/15s5vxY9mq33hOV2BnJwS/I53rNJliWCJ70J6tH
 bpCIo+9WXYImiSQ5uAl9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dtQJFzWcjR8=;rCMcgP53qVJb9PYfDazXDRa5SMM
 IBUAjbNNmB8NtpTk2813G+OAgjTRE5JwD1bh2iZVys9+YnlIqFZti6xHCkT5gr7SXzVzYZyHE
 qmIEw1WmlOimNmQ8SB8Fyv7e1PSjHOMu0bBWtGC+GbuVVvrDvFRFlV5ZGHaJFE8NPuOYax9rj
 NpV3tAWoXsqwxch+w3e2kPlQi9URDcMMXgXw4uMJolc71WA7Ah+VIn8ZeirxGpixpDjzfuHh+
 U5PYyubwZ/I28EVADz0fqcKDqzgEdHOcpKwFxkPZlXQOTPQrKqHIaJHwnRwTLyjPwJWKwuImR
 XLzo5ytahwqefuO7uYEVs7/pNMtrZfTHtV9GsJGBi+Q3Dtc+BOpZJs9LoZIZAA1ifgNre75ya
 Al/h6i58GsCd6RWdzC57GkRDHDAHFP1XNLiiVu1NWwzEoPAN+1WCvDENt+1doVfp7ui61LWhe
 M0dnRdPt7AcFD00WkFdtuiipM9HtQDzT8hUSEduwnaJy5G6fH/a6LCkRz2hkQedC1E9XkGavh
 sqBpqpC4d8+4z43izkaoMEMi4VykBTho/Je70ptlTUYiM1KqELBe9iMzfSHO8UwCnZAiCaGLi
 04fng3xy12HdsE4WimLpqwpAMe5+ikMHKeRaGWb5t99snL2W/mO4jokd3sEP+V0LuWgwSPMu2
 KlF8SplKHJVh0wnrJxwp2kFq9LAJe6QJYEtUN7tXJragfZKXWaimlStjTuqjXYLS8GAnh3oiL
 hXTMsr9+6vUQmEIx6pDniEZTS214UKwHjOx9vH4Ca8cQYqEfBgG8ek4HVxfNv7UIudxqBtEBY
 I6RMReUFQiOnLUYBTKTK1O0A==

I managed to get the complete lockdep output via netconsole:

T1;systemd-shutdown[1]: All filesystems unmounted.
T1;systemd-shutdown[1]: Deactivating swaps.
T1;systemd-shutdown[1]: All swaps deactivated.
T1;systemd-shutdown[1]: Detaching loop devices.
T1;systemd-shutdown[1]: All loop devices detached.
T1;systemd-shutdown[1]: Stopping MD devices.
T1;systemd-shutdown[1]: All MD devices stopped.
T1;systemd-shutdown[1]: Detaching DM devices.
T1;systemd-shutdown[1]: All DM devices detached.
T1;systemd-shutdown[1]: All filesystems, swaps, loop devices, MD devices a=
nd DM devices detached.
T1;systemd-shutdown[1]: Syncing filesystems and block devices.
T1;systemd-shutdown[1]: Rebooting.
T3113;psmouse serio1: Failed to disable mouse on isa0060/serio1#012 SUBSYS=
TEM=3Dserio#012 DEVICE=3D+serio:serio1

Here I was curious if the failed the psmouse message is related to the dea=
dlock.
I checked the locks and I had similar messages on an unaffected kernel
(commit 6ec41c442e55) and I had a deadlock in linux-next-20240920 without =
this
message.

T115;INFO: task systemd-shutdow:1 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0=
      flags:0x00004002
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; kernel_restart+0x35/0x60
T115; __do_sys_reboot+0x130/0x230
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; do_syscall_64+0x72/0x180
T115; entry_SYSCALL_64_after_hwframe+0x76/0x7e
T115;RIP: 0033:0x7f7d64977ff3
T115;RSP: 002b:00007ffea05ee178 EFLAGS: 00000206 ORIG_RAX: 00000000000000a=
9
T115;RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7d64977ff3
T115;RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
T115;RBP: 0000000000000000 R08: 0000000000000069 R09: 00000000ffffffff
T115;R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
T115;R13: 0000000000000000 R14: 00007ffea05ee4c8 R15: 0000000000000000
T115; </TASK>
T115;INFO: task kworker/u64:0:11 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:0   state:D stack:0     pid:11    tgid:11    ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:1:97 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:1   state:D stack:0     pid:97    tgid:97    ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:2:98 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:2   state:D stack:0     pid:98    tgid:98    ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:3:99 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:3   state:D stack:0     pid:99    tgid:99    ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:4:100 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:4   state:D stack:0     pid:100   tgid:100   ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:5:101 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:5   state:D stack:0     pid:101   tgid:101   ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:6:102 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:6   state:D stack:0     pid:102   tgid:102   ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:7:103 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:7   state:D stack:0     pid:103   tgid:103   ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;INFO: task kworker/u64:8:104 blocked for more than 61 seconds.
T115;      Not tainted 6.11.0-next-20240925-lockdep #478
T115;"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
T115;task: kworker/u64:8   state:D stack:0     pid:104   tgid:104   ppid:2=
      flags:0x00004000
T115;Workqueue: async async_run_entry_fn
T115;Call Trace:
T115; <TASK>
T115; __schedule+0x508/0x15c0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? lock_acquire+0xc5/0x2f0
T115; ? srso_alias_return_thunk+0x5/0xfbef5
T115; ? find_held_lock+0x2b/0x80
T115; ? schedule+0xdf/0x120
T115; schedule+0x35/0x120
T115; async_synchronize_cookie_domain+0xe8/0x130
T115; ? __pfx_autoremove_wake_function+0x10/0x10
T115; shutdown_one_device_async+0x24/0x140
T115; async_run_entry_fn+0x2d/0x110
T115; process_one_work+0x20c/0x580
T115; worker_thread+0x1ae/0x390
T115; ? __pfx_worker_thread+0x10/0x10
T115; kthread+0xd0/0x100
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork+0x2f/0x50
T115; ? __pfx_kthread+0x10/0x10
T115; ret_from_fork_asm+0x1a/0x30
T115; </TASK>
T115;Future hung task reports are suppressed, see sysctl kernel.hung_task_=
warnings
T115;\x0aShowing all locks held in the system:
T115;1 lock held by systemd-shutdow/1:
T115; #0: ffffffff90265288 (system_transition_mutex){+.+.}-{3:3}, at: __do=
_sys_reboot+0xac/0x230
T115;2 locks held by kworker/u64:0/11:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf180157e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:1/97:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804bbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:2/98:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804c3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:3/99:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804cbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:4/100:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804d3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:5/101:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804dbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:6/102:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804e3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:7/103:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804ebe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:8/104:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804f3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:9/105:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804fbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:10/106:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf180503e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:11/107:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf18050be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:12/108:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf180513e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:13/109:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf18051be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:14/110:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf180523e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:15/111:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf18052be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;1 lock held by khungtaskd/115:
T115; #0: ffffffff902dfc20 (rcu_read_lock){....}-{1:2}, at: debug_show_all=
_locks+0x3d/0x184
T115;4 locks held by kworker/7:2/343:
T115; #0: ffff91ea00050d48 ((wq_completion)events){+.+.}-{0:0}, at: proces=
s_one_work+0x4a4/0x580
T115; #1: ffffbaf182e07e58 ((work_completion)(&helper->damage_work)){+.+.}=
-{0:0}, at: process_one_work+0x1c7/0x580
T115; #2: ffffbaf182e07d00 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_at=
omic_helper_dirtyfb+0x47/0x280
T115; #3: ffff91ea13b80528 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_=
lock+0xbf/0x1b0
T115;2 locks held by kworker/u64:16/2740:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf186b0be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:17/2741:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190a0fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:18/2906:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf186afbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:19/2907:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1903a7e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:20/2908:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19073fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:21/2909:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19074fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:22/2910:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19076fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:23/2911:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf183ed7e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:24/2912:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf187b9fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:25/2913:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19079fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:26/2914:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1907afe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:27/2915:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf187427e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:28/2916:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf18780fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:29/2917:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1907cfe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:30/2918:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1907e7e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:31/2919:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1907f7e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:32/2921:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1907ffe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:33/2922:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19083fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:34/2923:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190867e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:35/3053:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19051fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:36/3054:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190587e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:37/3055:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190937e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:38/3056:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190357e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:39/3057:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1909dfe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:40/3058:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190c2fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:41/3059:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf187837e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:42/3060:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf182e8fe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:43/3061:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf183097e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:44/3062:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190a23e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:45/3063:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d63e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:46/3064:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1804b3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:47/3065:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d53e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:48/3066:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190a3be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:49/3067:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d6be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:50/3068:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d73e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:51/3069:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d7be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:52/3070:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d83e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:53/3071:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d8be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:54/3072:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d93e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:55/3073:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190d9be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:56/3074:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190da3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:57/3075:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dabe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:58/3076:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190db3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:59/3077:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dbbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:60/3078:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dc3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:61/3079:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dcbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:62/3080:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dd3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:63/3081:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ddbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:64/3082:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190de3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:65/3083:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190debe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:66/3084:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190df3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:67/3085:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190dfbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:68/3086:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e03e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:69/3087:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e0be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:70/3088:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e13e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:71/3089:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e1be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:72/3090:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e23e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:73/3091:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e2be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:74/3092:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e33e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:75/3093:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e3be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:76/3094:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e43e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:77/3095:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e4be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:78/3096:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e53e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:79/3097:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e5be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:80/3098:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e63e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:81/3099:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e6be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:82/3100:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e73e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:83/3101:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e7be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:84/3102:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e83e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:85/3103:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e8be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:86/3104:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e93e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:87/3105:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190e9be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:88/3106:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ea3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:89/3107:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190eabe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:90/3108:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190eb3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:91/3109:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ebbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:92/3110:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ec3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:93/3111:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ecbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:94/3112:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ed3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:95/3113:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190edbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:96/3114:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ee3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:97/3115:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190eebe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:98/3116:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ef3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:99/3117:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190efbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:100/3118:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f03e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:101/3119:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f0be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:102/3120:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f13e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:103/3121:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f1be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:104/3122:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f23e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:105/3123:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f2be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:106/3124:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f33e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:107/3125:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f3be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:108/3126:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f43e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:109/3127:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f4be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:110/3128:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f53e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:111/3129:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f5be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:112/3130:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f63e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:113/3131:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f6be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:114/3132:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f73e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:115/3133:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f7be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:116/3134:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f83e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:117/3135:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f8be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:118/3136:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f93e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:119/3137:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190f9be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:120/3138:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fa3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:121/3139:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fabe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:122/3140:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fb3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:123/3141:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fbbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:124/3142:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fc3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:125/3143:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fcbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:126/3144:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fd3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:127/3145:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fdbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:128/3146:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190fe3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:129/3147:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190febe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:130/3148:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ff3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:131/3149:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190ffbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:132/3150:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191003e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:133/3151:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19100be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:134/3152:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191013e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:135/3153:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19101be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:136/3154:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191023e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:137/3155:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19102be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:138/3156:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191033e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:139/3157:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19103be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:140/3158:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191043e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:141/3159:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19104be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:142/3160:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191053e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:143/3161:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19105be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:144/3162:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191063e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:145/3163:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19106be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:146/3164:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191073e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:147/3165:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19107be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:148/3166:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191083e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:149/3167:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19108be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:150/3168:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191093e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:151/3169:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19109be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:152/3170:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910a3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:153/3171:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910abe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:154/3172:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910b3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:155/3173:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910bbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:156/3174:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910c3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:157/3175:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910cbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:158/3176:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910d3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:159/3177:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910dbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:160/3178:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910e3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:161/3179:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910ebe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:162/3180:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910f3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:163/3181:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1910fbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:164/3182:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191103e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:165/3183:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19110be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:166/3184:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191113e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:167/3185:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19111be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:168/3186:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191123e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:169/3187:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19112be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:170/3188:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191133e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:171/3189:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19113be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:172/3190:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191143e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:173/3191:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19114be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:174/3192:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191153e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:175/3193:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19115be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:176/3194:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191163e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:177/3195:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19116be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:178/3196:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191173e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:179/3197:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19117be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:180/3198:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191183e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:181/3199:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19118be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:182/3200:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191193e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:183/3201:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19119be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:184/3202:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911a3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:185/3203:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911abe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:186/3204:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911b3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:187/3205:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911bbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:188/3206:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911c3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:189/3207:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911cbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:190/3208:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911d3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:191/3209:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911dbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:192/3210:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911e3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:193/3211:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911ebe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:194/3212:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911f3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:195/3213:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1911fbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:196/3214:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191203e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:197/3215:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19120be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:198/3216:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191213e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:199/3217:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19121be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:200/3218:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191223e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:201/3219:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19122be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:202/3220:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191233e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:203/3221:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19123be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:204/3222:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191243e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:205/3223:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19124be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:206/3224:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191253e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:207/3225:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19125be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:208/3226:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191263e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:209/3227:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19126be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:210/3228:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191273e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:211/3229:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19127be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:212/3230:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191283e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:213/3231:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19128be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:214/3232:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191293e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:215/3233:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19129be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:216/3234:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912a3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:217/3235:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912abe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:218/3236:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912b3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:219/3237:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912bbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:220/3238:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912c3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:221/3239:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912cbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:222/3240:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912d3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:223/3241:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912dbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:224/3242:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912e3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:225/3243:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912ebe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:226/3244:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912f3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:227/3245:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1912fbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:228/3246:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191303e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:229/3247:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19130be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:230/3248:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191313e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:231/3249:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19131be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:232/3250:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191323e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:233/3251:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19132be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:234/3252:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191333e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:235/3253:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19133be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:236/3254:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191343e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:237/3255:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19134be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:238/3256:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191353e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:239/3257:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19135be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:240/3258:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191363e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:241/3259:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19136be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:242/3260:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191373e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:243/3261:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19137be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:244/3262:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191383e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:245/3263:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190577e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:246/3264:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf190547e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:247/3265:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19138be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:248/3266:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf191393e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:249/3267:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf19139be58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:250/3268:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913a3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:251/3269:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913abe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:252/3270:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913b3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:253/3271:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913bbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:254/3272:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913c3e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;2 locks held by kworker/u64:255/3273:
T115; #0: ffff91ea00d39148 ((wq_completion)async){+.+.}-{0:0}, at: process=
_one_work+0x4a4/0x580
T115; #1: ffffbaf1913cbe58 ((work_completion)(&entry->work)){+.+.}-{0:0}, =
at: process_one_work+0x1c7/0x580
T115;
T115;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\x0a


Bert Karwatzki

