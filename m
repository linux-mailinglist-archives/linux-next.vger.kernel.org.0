Return-Path: <linux-next+bounces-3727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA79735F3
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 13:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6444228548D
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 11:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62780184555;
	Tue, 10 Sep 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="ImRinner"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49423A6;
	Tue, 10 Sep 2024 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966711; cv=none; b=Yi4uphs+9rGs1J4ckW30O6b/eHf2aBseDwVSDtFun6NKQVnorZgWtTWZVCSun7a8xwpEhL+rKNHpt/Ru7mDSBTWuwIQhlW3KBEGs3xomQcP/fbgJg46zBQ3sidsGoUPqEoF4l+H1Rw5iW5Pp0eCmYSOAvpFGhv9CYkoTi+fgs84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966711; c=relaxed/simple;
	bh=dKGsu04wmqVU30SvhAM9QE4Cbn2l7TDK+gysW625Vlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDESYOu6xmqqke7kZVajaCieEjgg8BmYM9DEc6cL2gUiZnDL5IfrGdTmdSc9aN+YbHpDgxORO3ib3aZQ4McOlWtymQZISxK6wXMti5htG7owwuTS21GEntHU1y7QZ2VtGjk07I5vYPG92GMd1TX6TlPzqKSdz0qZFi1SBUuM3q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=ImRinner; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725966674; x=1726571474; i=spasswolf@web.de;
	bh=FYYypT0rX7sJqm9LWIsSWHALn5SKENN+zLb2A2D419Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ImRinnervhu/TGu4lOOLULuiAu5v4WOXEa84x+6pt5DBs31d8Zo99VZwj+rpD7af
	 zoYh+yWO7+DoGZoSSiFFU3bItt6zKG1TnBlEqO18m91tl1n0iSlKtib8qE2MffsPa
	 oAxXqDmgiFPXvBg73lQhCutOFJtusMGWpGanXGjn/RYGzxneKL6ccI8J3c17z5Fva
	 6ouiGIxczfLjpKKpgiEDmcj7/W6QkVmenuab8RB58rR/i4hx9kOx8ZkwDEIQ3AtHa
	 QDDrjqhHKQN4bXMlvhiyTDXwkFpf3ueuvWp9Wm9lYVBVIjwXkwJgF+fp6k/tS8qNR
	 knk9nfnkqPLihpRH0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MpCqh-1sEclZ00BL-00Zev9; Tue, 10 Sep 2024 13:11:14 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	"Darrick J . Wong" <djwong@kernel.org>,
	x86@kernel.org,
	chandanbabu@kernel.org,
	willy@infradead.org
Subject: commit de752774f38bb causes fatal error on boot
Date: Tue, 10 Sep 2024 13:11:09 +0200
Message-ID: <20240910111111.2591-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 875xsc4ehr.ffs@tglx
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K/y73RUPV6T3co4YPdUsoHpBejFt1XTLJjz3C1V3Nl5aNseKcJF
 3Wtlq5qWGoP+/IKJCj/UCQKaxAC+JPE2CmzxxYhtcDRoHbD2qKbVOeGrlQRRwwkiizMbcf+
 p7EpbtNtAF6E45B0Kim67ZOv880C4W1S6Td7yXGh2CgFmCVBC7EVZ/x8qr5fpfs+U6CDWFl
 0WjSa/NLPli74dF6fa7pQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lvuyHA8hM2c=;NUXlDphdQj94xbgLjCsT54dvtct
 G5bCjwBUJbwWV5ZXXof97kUOvOVzd/3B6Ztb4iFzHFy9SpXagdbeduJFnztI2sbvkhivRdBTX
 m8pPLoVQ3mEBO3WQ64jctc1HAFadJqG9R2vXrVf0AZDpQZlQOsQaQ+pCSrksA3eYcgFYoG8Y4
 FjQL6p/mXInGF3JxRCYJBl60+jmITIjH9do/CbMT6yVg3vbexMWjT25mib9u4OL2aPEJWntM4
 3/QvO0Fzq6eTvre4l3rMuouY0qxDwF36zvl7ET5xsgGxZWMcuFkeN0kC9nmbwG8vvik3+wHbE
 IOFxM1dHhW29Aj6PniErZX8aYnZrOrdgLEE+llRFZ6jXZLFzDhDgHdQKUY6UD1ezMGenQwvJj
 WdQsj7nxJgmEUyLF5fVvJ/VQzWW7ppFymqAS9PrirB15wdxM4tE8s6NkWeD2GsaSr4+jDF1pc
 T4nlv9Bwz5OmnFjh+lCCUcIDvQmPKApSjYiaITjy03cXLzAEmfqnMDmbsLqZfKa8FAXpzeK73
 yL4SEpkH8gD2AuonaxdvLYd7lqu3j1WXm4LKEhAtdKcBVp5nB/EsGgcBxAEYujZNFkSbuLqEn
 g9zzu/7g53ik5F6iKGGhJ/LwK32O3jPIuxU6JCvtKurrf5cu8pmx/LiGG62v7CLx3FD9MgAsR
 b3w3ewYAcShS/mvsC+7fONmgy7A1rhz0yi8Qofpmancv+lVt51d4ObZ8rCX5V/MC4caaKrVN8
 /wXCglKTZbNeKecYJurfovvJYVQVtubzW49QEt6blulSegT+wHPsHuKIpyS+5Vgz0o8yGrAhK
 Xsf/DDCRVsWzq3gWRMqeQ/YA==

When booting linux-next-20240910 on my MSI alpha 15 Laptop running debian =
sid (amd64),
I get dropped to a shell and get the folllowing error in dmesg. I bisected=
 this to
commit de752774f38bb ("jump_label: Fix static_key_slow_dec() yet again").

Error message:
[    5.156254] [  T228] jump_label: Fatal kernel bug, unexpected op at mem=
_cgroup_sk_alloc+0x4/0xa0 [00000000ec1ab76c] (eb 05 e9 e0 2b !=3D 66 90 0f=
 1f 00)) size:2 type:1
[    5.156289] [  T228] ------------[ cut here ]------------
[    5.156291] [  T228] kernel BUG at arch/x86/kernel/jump_label.c:73!
[    5.156305] [  T228] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[    5.156318] [  T228] CPU: 2 UID: 0 PID: 228 Comm: kworker/2:1 Not taint=
ed 6.11.0-rc7-next-20240910-master #413
[    5.156335] [  T228] Hardware name: Micro-Star International Co., Ltd. =
Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.107 11/10/2021
[    5.156351] [  T228] Workqueue: cgroup_destroy css_free_rwork_fn
[    5.156366] [  T228] RIP: 0010:__jump_label_patch.cold+0x24/0x26
[    5.156380] [  T228] Code: 84 e9 af 39 73 ff 48 c7 c3 68 34 08 85 41 55=
 45 89 f1 49 89 d8 4c 89 e1 4c 89 e2 4c 89 e6 48 c7 c7 60 9c ca 84 e8 c5 8=
9 00 00 <0f> 0b 4c 89 ca 48 83 ce ff bf 10 00 00 00 e8 72 bb 01 00 53 48 c=
7
[    5.156403] [  T228] RSP: 0018:ffffa6b400623d80 EFLAGS: 00010246
[    5.156415] [  T228] RAX: 0000000000000090 RBX: ffffffff84a01aa1 RCX: 0=
000000000000000
[    5.156428] [  T228] RDX: 0000000000000000 RSI: ffff95bd2e6977c0 RDI: f=
fff95bd2e6977c0
[    5.156441] [  T228] RBP: ffffa6b400623db0 R08: 0000000000000000 R09: f=
fffa6b400623c20
[    5.156454] [  T228] R10: ffffffff84e81f88 R11: 0000000000000003 R12: f=
fffffff84091524
[    5.156467] [  T228] R13: 0000000000000001 R14: 0000000000000002 R15: 0=
000000000000000
[    5.156480] [  T228] FS:  0000000000000000(0000) GS:ffff95bd2e680000(00=
00) knlGS:0000000000000000
[    5.156495] [  T228] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.156506] [  T228] CR2: 000055c651a32170 CR3: 0000000788018000 CR4: 0=
000000000750ef0
[    5.156520] [  T228] PKRU: 55555554
[    5.156528] [  T228] Call Trace:
[    5.156538] [  T228]  <TASK>
[    5.156545] [  T228]  ? __die+0x51/0x92
[    5.156556] [  T228]  ? die+0x29/0x50
[    5.156566] [  T228]  ? do_trap+0x105/0x110
[    5.156577] [  T228]  ? do_error_trap+0x60/0x80
[    5.156587] [  T228]  ? __jump_label_patch.cold+0x24/0x26
[    5.156599] [  T228]  ? exc_invalid_op+0x4d/0x70
[    5.156610] [  T228]  ? __jump_label_patch.cold+0x24/0x26
[    5.156622] [  T228]  ? asm_exc_invalid_op+0x1a/0x20
[    5.156634] [  T228]  ? mem_cgroup_sk_alloc+0x4/0xa0
[    5.156646] [  T228]  ? __jump_label_patch.cold+0x24/0x26
[    5.156658] [  T228]  ? arch_jump_label_transform_queue+0x32/0x80
[    5.156671] [  T228]  ? __jump_label_update+0x3d/0xf0
[    5.156683] [  T228]  ? __static_key_slow_dec_cpuslocked+0x4c/0x60
[    5.156694] [  T228]  ? static_key_slow_dec+0x1e/0x40
[    5.156705] [  T228]  ? mem_cgroup_css_free+0x9d/0xa0
[    5.156716] [  T228]  ? css_free_rwork_fn+0x45/0x370
[    5.156728] [  T228]  ? process_one_work+0x161/0x270
[    5.156740] [  T228]  ? worker_thread+0x2ea/0x420
[    5.156751] [  T228]  ? rescuer_thread+0x4e0/0x4e0
[    5.156762] [  T228]  ? kthread+0xcd/0x100
[    5.156772] [  T228]  ? kthread_park+0x80/0x80
[    5.156782] [  T228]  ? ret_from_fork+0x2f/0x50
[    5.156793] [  T228]  ? kthread_park+0x80/0x80
[    5.156803] [  T228]  ? ret_from_fork_asm+0x11/0x20
[    5.156816] [  T228]  </TASK>
[    5.156824] [  T228] Modules linked in: mt7921e(+) mt7921_common mt792x=
_lib mt76_connac_lib mt76 mac80211 libarc4 cfg80211 rfkill msr nvme_fabric=
s fuse efi_pstore configfs efivarfs autofs4 ext4 crc32c_generic mbcache jb=
d2 usbhid amdgpu i2c_algo_bit drm_ttm_helper xhci_pci ttm drm_exec drm_sub=
alloc_helper xhci_hcd amdxcp drm_buddy hid_sensor_hub hid_multitouch usbco=
re nvme gpu_sched mfd_core i2c_piix4 hid_generic crc32c_intel psmouse drm_=
display_helper i2c_smbus amd_sfh nvme_core usb_common r8169 crc16 i2c_hid_=
acpi i2c_hid hid i2c_designware_platform i2c_designware_core
[    5.156938] [  T228] ---[ end trace 0000000000000000 ]---
[    5.278455] [  T228] RIP: 0010:__jump_label_patch.cold+0x24/0x26
[    5.278461] [  T228] Code: 84 e9 af 39 73 ff 48 c7 c3 68 34 08 85 41 55=
 45 89 f1 49 89 d8 4c 89 e1 4c 89 e2 4c 89 e6 48 c7 c7 60 9c ca 84 e8 c5 8=
9 00 00 <0f> 0b 4c 89 ca 48 83 ce ff bf 10 00 00 00 e8 72 bb 01 00 53 48 c=
7
[    5.278462] [  T228] RSP: 0018:ffffa6b400623d80 EFLAGS: 00010246
[    5.278465] [  T228] RAX: 0000000000000090 RBX: ffffffff84a01aa1 RCX: 0=
000000000000000
[    5.278466] [  T228] RDX: 0000000000000000 RSI: ffff95bd2e6977c0 RDI: f=
fff95bd2e6977c0
[    5.278467] [  T228] RBP: ffffa6b400623db0 R08: 0000000000000000 R09: f=
fffa6b400623c20
[    5.278468] [  T228] R10: ffffffff84e81f88 R11: 0000000000000003 R12: f=
fffffff84091524
[    5.278469] [  T228] R13: 0000000000000001 R14: 0000000000000002 R15: 0=
000000000000000
[    5.278470] [  T228] FS:  0000000000000000(0000) GS:ffff95bd2e680000(00=
00) knlGS:0000000000000000
[    5.278472] [  T228] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.278473] [  T228] CR2: 000055c651a32170 CR3: 00000001445b8000 CR4: 0=
000000000750ef0
[    5.278474] [  T228] PKRU: 55555554

Reverting commit de752774f38bb ("jump_label: Fix static_key_slow_dec() yet=
 again")
in next-20240910 fixes the issue for me.

Bert Karwatzki

