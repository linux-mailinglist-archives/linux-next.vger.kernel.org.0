Return-Path: <linux-next+bounces-8145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A894B3D3E0
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 16:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24D5418946DA
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 14:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D312826560A;
	Sun, 31 Aug 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="sKiKVBXB"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36332238149;
	Sun, 31 Aug 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756649700; cv=none; b=QPguIS280wLlnUqImSCA59zhVmGgMJu03OPC5bjq1qivuynOmQTUm59X53zW9HMQjwnKWxKDPrr2FNWrZmyeGFTNG4ovTpdBG4z8z832XeJn2BHpzxSjOMFNBdGIh/dBEjy6Jb8YXU7l6O6TDMMEEP26V0f/hvctQXaRUpeenXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756649700; c=relaxed/simple;
	bh=bsfeFc8DO+1aZdOY8UihG9zL3TN5g1pccXZPe4ujiLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnIblqX/+DpGCB0PFV5pdMKs9ayn/NkZXdZlUm1tt611rzrTUL/KXgdyGKdsxhwxSSh/FON4RbbfZDZpirRik5PO2/HKuK4IWyF70gjY2O3hPb4fxnnWHNIp4WN5sD6tr8e6ylC1VscKDsbGVoUBg+jmpxEbWvD8NJW73pVKuUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=sKiKVBXB; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756649670; x=1757254470; i=spasswolf@web.de;
	bh=znelu1ABa/ePmYGTuCcgfSawGm4pqiWrYry8U6aHm3w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sKiKVBXBan8T1xWn0tfBBcO8kz22Alg3poWy29HS0YNYOPUtaFyc7BuRpbOc0xqb
	 FHHwXmjCu9PEjFRsxESZEKudAU+ueNlDRjlnZlzQzpjPU0X9Q/NlEAJ+Omo/wLWvz
	 DdIyD1/cy9dzzSZmhdSMD4kSPu5iGUTip4ytqL/iIw+7qwvonteN8F+5n0wWsExgm
	 trpU1wJCkKr02zmxZr0mNPAUze6m/9njXKIxB6DOwSWQ4EFR1k5rxVJP+cRoEwjQV
	 yvFWAYndbGITA7qg1qUPCedDRZA+AxAx5IhC9vF0ioYENFpmZU6VwDYRqs9xxXFO1
	 UUxL8PzPiPb9cNl5Pw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MfKtb-1uIGQ23Lkx-00ew6J; Sun, 31 Aug 2025 16:14:29 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: seanjc@google.com
Cc: Bert Karwatzki <spasswolf@web.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	Jakub Kicinski <kuba@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	torvalds@linux-foundation.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de
Subject: (Re)boot hangs and refcount errors on next-20250829
Date: Sun, 31 Aug 2025 16:14:24 +0200
Message-ID: <20250831141426.2786-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: aKz38QetUrDfKP8P@google.com
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N9VWeXH/Ywm44VaLkfiHeYXYHbgqPMcH5yoloQuzS+EC3UicwwM
 8EAqfHDCld52zS01oQS2DYO4wmf9grgq2Rs0rPmduSHdipol+SCfeAHy3QqJaE8xOM1N6DX
 FYC7XLGrx8QvbQa/cDcSLtZWWpSet9rJCELUtWUB+ghFKmBk/sE5odE5d70sbiFPDf9CCm6
 d8Ikj9iKbpBbMGBwjNAoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nQR6TZfz6h0=;RNYHEh8IN/jwqMcq43fl7Kh2CCK
 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
 F5vjKhMSVv

I think I hit the the same error (and some more ...) when booting next-2025=
0829
on my amd64 laptop (no VMs and no kexec were used here):

When I try booting next-20250829 on my debian stable(trixie) amd64 system t=
he boot
process hangs every few attempts (without any log messages recorded). When =
the
boot process succeeds the following error message appears in dmesg:

[    8.337248] [     T44] ------------[ cut here ]------------
[    8.337250] [     T44] WARNING: kernel/futex/core.c:1604 at futex_ref_rc=
u+0xe8/0x100, CPU#6: rcuc/6/44
[    8.337257] [     T44] Modules linked in: snd_seq_dummy snd_hrtimer snd_=
seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm bnep =
nls_ascii nls_cp437 vfat fat snd_hda_codec_generic snd_hda_codec_atihdmi sn=
d_hda_codec_hdmi snd_hda_intel btusb snd_intel_dspcfg snd_soc_dmic snd_acp3=
x_pdm_dma snd_acp3x_rn snd_hda_codec btrtl uvcvideo snd_soc_core btintel sn=
d_hda_core btbcm videobuf2_vmalloc btmtk videobuf2_memops snd_hwdep uvc vid=
eobuf2_v4l2 snd_pcm_oss bluetooth videodev snd_mixer_oss snd_pcm snd_rn_pci=
_acp3x snd_acp_config videobuf2_common snd_soc_acpi msi_wmi ecdh_generic ec=
c mc sparse_keymap snd_timer edac_mce_amd wmi_bmof snd snd_pci_acp3x k10tem=
p ccp soundcore battery ac button joydev hid_sensor_gyro_3d hid_sensor_acce=
l_3d hid_sensor_prox hid_sensor_als hid_sensor_magn_3d hid_sensor_trigger i=
ndustrialio_triggered_buffer kfifo_buf industrialio amd_pmc hid_sensor_iio_=
common evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211=
 libarc4 cfg80211 rfkill msr fuse nvme_fabrics efi_pstore configfs
[    8.337310] [     T44]  efivarfs autofs4 ext4 mbcache jbd2 usbhid amdgpu=
 drm_client_lib i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks =
drm_exec drm_suballoc_helper drm_buddy gpu_sched xhci_pci amdxcp xhci_hcd h=
id_sensor_hub psmouse drm_display_helper mfd_core hid_multitouch hid_generi=
c drm_kms_helper i2c_hid_acpi serio_raw usbcore amd_sfh i2c_hid r8169 cec n=
vme hid crc16 nvme_core i2c_piix4 usb_common i2c_smbus i2c_designware_platf=
orm i2c_designware_core
[    8.337337] [     T44] CPU: 6 UID: 0 PID: 44 Comm: rcuc/6 Not tainted 6.=
17.0-rc3-next-20250829-master #215 PREEMPT_{RT,(full)}=20
[    8.337340] [     T44] Hardware name: Micro-Star International Co., Ltd.=
 Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
[    8.337342] [     T44] RIP: 0010:futex_ref_rcu+0xe8/0x100
[    8.337344] [     T44] Code: be ff ff ff ff ff ff ff 7f 48 89 b3 88 01 0=
0 00 c7 00 01 00 00 00 48 8d bb 78 01 00 00 5b 48 c7 c6 70 d7 b4 a5 e9 78 7=
a fd ff <0f> 0b eb ab 0f 0b e9 31 ff ff ff 0f 0b eb c6 66 0f 1f 84 00 00 00
[    8.337346] [     T44] RSP: 0018:ffffb438402dfdb0 EFLAGS: 00010286
[    8.337348] [     T44] RAX: 7fffffffffffffff RBX: ffff8aab87fa1900 RCX: =
0000000000000010
[    8.337350] [     T44] RDX: ffffffffffffffff RSI: ffffffffffffffff RDI: =
000000000000000f
[    8.337351] [     T44] RBP: ffff8aab80958000 R08: 0000000000000000 R09: =
0000000000000006
[    8.337352] [     T44] R10: 0000000000220021 R11: 0000000000000000 R12: =
ffff8aae5e7a2300
[    8.337353] [     T44] R13: ffffb438402dfdf0 R14: 0000000000000016 R15: =
0000000000000000
[    8.337354] [     T44] FS:  0000000000000000(0000) GS:ffff8aaeb79bc000(0=
000) knlGS:0000000000000000
[    8.337356] [     T44] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.337357] [     T44] CR2: 00007fbce40135f8 CR3: 0000000108b48000 CR4: =
0000000000750ef0
[    8.337358] [     T44] PKRU: 55555554
[    8.337359] [     T44] Call Trace:
[    8.337361] [     T44]  <TASK>
[    8.337363] [     T44]  rcu_do_batch+0x1b6/0x540
[    8.337366] [     T44]  ? rcu_do_batch+0x156/0x540
[    8.337369] [     T44]  rcu_core+0x141/0x250
[    8.337371] [     T44]  ? rcu_cpu_kthread+0x22/0xe0
[    8.337373] [     T44]  rcu_cpu_kthread+0x85/0xe0
[    8.337375] [     T44]  ? sort_range+0x20/0x20
[    8.337378] [     T44]  smpboot_thread_fn+0xd8/0x1d0
[    8.337381] [     T44]  kthread+0xe9/0x1e0
[    8.337383] [     T44]  ? kthreads_online_cpu+0x100/0x100
[    8.337385] [     T44]  ? kthreads_online_cpu+0x100/0x100
[    8.337387] [     T44]  ret_from_fork+0x18e/0x1c0
[    8.337391] [     T44]  ? kthreads_online_cpu+0x100/0x100
[    8.337392] [     T44]  ret_from_fork_asm+0x11/0x20
[    8.337398] [     T44]  </TASK>
[    8.337398] [     T44] ---[ end trace 0000000000000000 ]---

Rebooting (normal reboot no kexec) also hangs sometimes and using netconsol=
e I could capture the following
error message:

T124;------------[ cut here ]------------
T124;percpu ref (css_release) <=3D 0 (-1) after switching to atomic
T124;WARNING: lib/percpu-refcount.c:197 at percpu_ref_switch_to_atomic_rcu+=
0x194/0x1a0, CPU#11: rcuc/11/124
T124,ncfrag=3D0/1022;Modules linked in: netconsole ccm snd_seq_dummy snd_hr=
timer snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device rf=
comm bnep nls_ascii nls_cp437 vfat fat snd_hda_codec_generic snd_hda_codec_=
atihdmi snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_acp3x_pdm_dma=
 snd_soc_dmic snd_acp3x_rn btusb snd_hda_codec btrtl uvcvideo snd_soc_core =
btintel snd_hda_core btbcm videobuf2_vmalloc btmtk snd_hwdep videobuf2_memo=
ps snd_pcm_oss uvc videobuf2_v4l2 bluetooth snd_mixer_oss videodev snd_pcm =
snd_rn_pci_acp3x snd_acp_config videobuf2_common snd_timer msi_wmi snd_soc_=
acpi ecdh_generic ecc sparse_keymap mc snd wmi_bmof edac_mce_amd soundcore =
k10temp snd_pci_acp3x ccp ac battery button joydev hid_sensor_gyro_3d hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_als hid_sensor_prox hid_sensor=
_trigger industrialio_triggered_buffer kfifo_buf industrialio amd_pmc hid_s=
ensor_iio_common evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt7=
6=20
T124,ncfrag=3D956/1022;mac80211 libarc4 cfg80211 rfkill msr fuse nvme_fabri=
cs efi_pstore
T124; configfs efivarfs autofs4 ext4 mbcache jbd2 usbhid amdgpu drm_client_=
lib i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks drm_exec drm=
_suballoc_helper drm_buddy gpu_sched xhci_pci amdxcp drm_display_helper xhc=
i_hcd hid_sensor_hub hid_multitouch mfd_core hid_generic usbcore i2c_hid_ac=
pi psmouse amd_sfh drm_kms_helper nvme i2c_hid hid serio_raw nvme_core cec =
r8169 i2c_piix4 usb_common crc16 i2c_smbus i2c_designware_platform i2c_desi=
gnware_core
T124;CPU: 11 UID: 0 PID: 124 Comm: rcuc/11 Tainted: G        W           6.=
17.0-rc3-next-20250829-master #215 PREEMPT_{RT,(full)}=20
T124;Tainted: [W]=3DWARN
T124;Hardware name: Micro-Star International Co., Ltd. Alpha 15 B5EEK/MS-15=
8L, BIOS E158LAMS.10F 11/11/2024
T124;RIP: 0010:percpu_ref_switch_to_atomic_rcu+0x194/0x1a0
T124;Code: c0 83 f8 03 0f 8f 12 ff ff ff e9 a8 25 ba ff 48 8b 53 e0 48 8b 7=
3 e8 48 c7 c7 f0 1c 8c 8e c6 05 ec 7c a7 00 01 e8 3c a9 c1 ff <0f> 0b eb c4=
 0f 1f 84 00 00 00 00 00 41 55 41 54 55 48 89 fd 53 48
T124;RSP: 0018:ffffb86540587da0 EFLAGS: 00010282
Aug 31 12:01:07 localhost 4,1297,74466412,-,caller=3DT124;RAX: 000000000000=
0000 RBX: ffff893620a67c60 RCX: 0000000000000027
T124;RDX: ffff8938de8d6d48 RSI: 0000000000000001 RDI: ffff8938de8d6d40
T124;RBP: 8000000000000001 R08: 0000000000000f15 R09: 00000000ffffffff
T124;R10: 0000000000000001 R11: 0000000000000008 R12: ffff893620a67c40
T124;R13: ffffb86540587df0 R14: 000000000000001c R15: 0000000000000000
T124;FS:  0000000000000000(0000) GS:ffff89394f8fc000(0000) knlGS:0000000000=
000000
T124;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
T124;CR2: 00007fa2fc9b8b60 CR3: 0000000107e89000 CR4: 0000000000750ef0
T124;PKRU: 55555554
T124;Call Trace:
T124; <TASK>
T124; rcu_do_batch+0x1b6/0x540
T124; ? rcu_do_batch+0x156/0x540
T124; rcu_core+0x141/0x250
T124; ? rcu_cpu_kthread+0x22/0xe0
T124; rcu_cpu_kthread+0x85/0xe0
T124; ? sort_range+0x20/0x20
T124; smpboot_thread_fn+0xd8/0x1d0
T124; kthread+0xe9/0x1e0
T124; ? kthreads_online_cpu+0x100/0x100
T124; ? kthreads_online_cpu+0x100/0x100
T124; ret_from_fork+0x18e/0x1c0
T124; ? kthreads_online_cpu+0x100/0x100
T124; ret_from_fork_asm+0x11/0x20
T124; </TASK>
T124;---[ end trace 0000000000000000 ]---
T124;percpu_ref_switch_to_atomic_rcu: percpu_ref_switch_to_atomic_rcu(): pe=
rcpu_ref underflow slab kmalloc-64 start ffff893620a67c40 pointer offset 0 =
size 64
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -2
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1
T153;unregister_netdevice: waiting for lo to become free. Usage count =3D -1

Both errors messages occur with and without PREEMPT_RT.

I bisected this (between v6.17-rc3 and next-20250829) using the first error
(WARNING: kernel/futex/core.c:1604) as signal for a bad commit. During the
bisection some additional and more severe errors occured, I do not know yet
if or how all these errors are linked:

At commit e255111fdcae a NULL pointer dereference happened:

[    8.612505] [    T159] BUG: kernel NULL pointer dereference, address: 00=
00000000000020
[    8.612508] [    T159] #PF: supervisor read access in kernel mode
[    8.612509] [    T159] #PF: error_code(0x0000) - not-present page
[    8.612511] [    T159] PGD 0 P4D 0=20
[    8.612513] [    T159] Oops: Oops: 0000 [#1] SMP NOPTI
[    8.612517] [    T159] CPU: 8 UID: 0 PID: 159 Comm: kworker/u64:14 Taint=
ed: G        W           6.17.0-rc3-bisect-00614-ge255111fdcae #219 PREEMPT=
_{RT,(full)}=20
[    8.612521] [    T159] Tainted: [W]=3DWARN
[    8.612522] [    T159] Hardware name: Micro-Star International Co., Ltd.=
 Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
[    8.612523] [    T159] Workqueue: events_unbound flush_memcg_stats_dwork
[    8.612528] [    T159] RIP: 0010:css_rstat_flush+0xe7/0x510
[    8.612532] [    T159] Code: 48 01 d0 48 89 04 24 4d 63 fc 48 8b 3c 24 e=
8 00 02 31 00 48 89 c6 48 85 c0 74 69 48 89 00 48 8b 70 08 4a 8b 0c fd 80 2=
c 74 82 <48> 8b 46 20 48 8b 96 b8 00 00 00 48 83 7c 01 08 00 48 8d 3c 08 74
[    8.612534] [    T159] RSP: 0018:ffffa8ef806abdf8 EFLAGS: 00010282
[    8.612536] [    T159] RAX: ffffc8ef7fbde7b0 RBX: ffff9ce2c0261380 RCX: =
ffff9ce61ba00000
[    8.612537] [    T159] RDX: ffffc8ef7fbde7b0 RSI: 0000000000000000 RDI: =
ffff9ce59e7e7488
[    8.612538] [    T159] RBP: 0000000000000007 R08: ffff9ce59e7a7478 R09: =
ffff9ce2dbd30d00
[    8.612539] [    T159] R10: 0000000000000028 R11: ffff9ce59e7a6e80 R12: =
0000000000000007
[    8.612540] [    T159] R13: ffff9ce59e7e7490 R14: ffffffffffffffff R15: =
0000000000000007
[    8.612541] [    T159] FS:  0000000000000000(0000) GS:ffff9ce61ba40000(0=
000) knlGS:0000000000000000
[    8.612542] [    T159] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.612544] [    T159] CR2: 0000000000000020 CR3: 00000001d5e22000 CR4: =
0000000000750ef0
[    8.612545] [    T159] PKRU: 55555554
[    8.612545] [    T159] Call Trace:
[    8.612547] [    T159]  <TASK>
[    8.612550] [    T159]  flush_memcg_stats_dwork+0x37/0x60
[    8.612552] [    T159]  process_one_work+0x17b/0x290
[    8.612557] [    T159]  worker_thread+0x2ca/0x400
[    8.612560] [    T159]  ? rescuer_thread+0x4f0/0x4f0
[    8.612562] [    T159]  kthread+0xe9/0x1e0
[    8.612564] [    T159]  ? kthreads_online_cpu+0x100/0x100
[    8.612566] [    T159]  ? kthreads_online_cpu+0x100/0x100
[    8.612568] [    T159]  ret_from_fork+0x18e/0x1c0
[    8.612571] [    T159]  ? kthreads_online_cpu+0x100/0x100
[    8.612573] [    T159]  ret_from_fork_asm+0x11/0x20
[    8.612578] [    T159]  </TASK>
[    8.612579] [    T159] Modules linked in: snd_seq_dummy snd_hrtimer snd_=
seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm bnep =
nls_ascii nls_cp437 vfat fat snd_hda_codec_generic snd_hda_codec_atihdmi sn=
d_hda_codec_hdmi btusb snd_hda_intel btrtl snd_intel_dspcfg btintel uvcvide=
o snd_hda_codec btbcm btmtk snd_soc_dmic snd_acp3x_pdm_dma snd_acp3x_rn vid=
eobuf2_vmalloc snd_soc_core snd_hda_core videobuf2_memops uvc snd_hwdep vid=
eobuf2_v4l2 bluetooth snd_pcm_oss videodev snd_mixer_oss snd_pcm snd_rn_pci=
_acp3x snd_acp_config videobuf2_common snd_timer snd_soc_acpi msi_wmi ecdh_=
generic ecc sparse_keymap mc snd wmi_bmof edac_mce_amd k10temp soundcore cc=
p snd_pci_acp3x battery ac button hid_sensor_gyro_3d hid_sensor_accel_3d hi=
d_sensor_prox hid_sensor_magn_3d hid_sensor_als joydev hid_sensor_trigger i=
ndustrialio_triggered_buffer kfifo_buf industrialio amd_pmc evdev hid_senso=
r_iio_common mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211=
 libarc4 cfg80211 rfkill msr nvme_fabrics fuse configfs efi_pstore
[    8.612632] [    T159]  efivarfs autofs4 ext4 mbcache jbd2 usbhid amdgpu=
 drm_client_lib i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks =
drm_exec drm_suballoc_helper amdxcp drm_buddy xhci_pci gpu_sched xhci_hcd d=
rm_display_helper hid_sensor_hub hid_multitouch mfd_core hid_generic i2c_hi=
d_acpi psmouse usbcore drm_kms_helper nvme amd_sfh i2c_hid hid serio_raw ce=
c i2c_piix4 nvme_core r8169 i2c_smbus usb_common crc16 i2c_designware_platf=
orm i2c_designware_core
[    8.612658] [    T159] CR2: 0000000000000020
[    8.612660] [    T159] ---[ end trace 0000000000000000 ]---
[    8.733174] [    T159] RIP: 0010:css_rstat_flush+0xe7/0x510
[    8.733174] [    T159] Code: 48 01 d0 48 89 04 24 4d 63 fc 48 8b 3c 24 e=
8 00 02 31 00 48 89 c6 48 85 c0 74 69 48 89 00 48 8b 70 08 4a 8b 0c fd 80 2=
c 74 82 <48> 8b 46 20 48 8b 96 b8 00 00 00 48 83 7c 01 08 00 48 8d 3c 08 74
[    8.733174] [    T159] RSP: 0018:ffffa8ef806abdf8 EFLAGS: 00010282
[    8.733174] [    T159] RAX: ffffc8ef7fbde7b0 RBX: ffff9ce2c0261380 RCX: =
ffff9ce61ba00000
[    8.733174] [    T159] RDX: ffffc8ef7fbde7b0 RSI: 0000000000000000 RDI: =
ffff9ce59e7e7488
[    8.733174] [    T159] RBP: 0000000000000007 R08: ffff9ce59e7a7478 R09: =
ffff9ce2dbd30d00
[    8.733174] [    T159] R10: 0000000000000028 R11: ffff9ce59e7a6e80 R12: =
0000000000000007
[    8.733174] [    T159] R13: ffff9ce59e7e7490 R14: ffffffffffffffff R15: =
0000000000000007
[    8.733174] [    T159] FS:  0000000000000000(0000) GS:ffff9ce61ba40000(0=
000) knlGS:0000000000000000
[    8.739103] [    T159] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.739103] [    T159] CR2: 0000000000000020 CR3: 00000001d5e22000 CR4: =
0000000000750ef0
[    8.739103] [    T159] PKRU: 55555554

At commit 4d8bb6e8f4a2 a bad rss-counter state appeared (CCing akpm due to =
the rss-counter state):

[    7.370238] [     T84] BUG: Bad rss-counter state mm:000000007094a157 ty=
pe:MM_FILEPAGES val:-14 Comm:rcuc/1 Pid:84
[    7.370244] [     T84] BUG: Bad rss-counter state mm:000000007094a157 ty=
pe:MM_ANONPAGES val:1 Comm:rcuc/1 Pid:84
[    7.384238] [    T100] BUG: Bad rss-counter state mm:000000007369ddda ty=
pe:MM_FILEPAGES val:-11 Comm:rcuc/5 Pid:100
[    7.384241] [    T100] BUG: Bad rss-counter state mm:000000007369ddda ty=
pe:MM_ANONPAGES val:-28 Comm:rcuc/5 Pid:100
[    7.396237] [     T76] BUG: Bad rss-counter state mm:0000000088a6974c ty=
pe:MM_FILEPAGES val:-3 Comm:rcuc/14 Pid:76
[    7.396241] [     T76] BUG: Bad rss-counter state mm:0000000088a6974c ty=
pe:MM_SWAPENTS val:48 Comm:rcuc/14 Pid:76
[    7.396243] [     T76] BUG: Bad rss-counter state mm:0000000088a6974c ty=
pe:MM_SHMEMPAGES val:-1 Comm:rcuc/14 Pid:76
[    7.414298] [    T108] ------------[ cut here ]------------
[    7.414300] [    T108] percpu ref (cgroup_bpf_release_fn) <=3D 0 (-1) af=
ter switching to atomic
[    7.414309] [    T108] WARNING: CPU: 7 PID: 108 at lib/percpu-refcount.c=
:197 percpu_ref_switch_to_atomic_rcu+0x194/0x1a0
[    7.414315] [    T108] Modules linked in: rfcomm bnep nls_ascii nls_cp43=
7 vfat fat snd_hda_codec_generic snd_hda_codec_atihdmi snd_hda_codec_hdmi s=
nd_hda_intel snd_intel_dspcfg btusb snd_hda_codec btrtl btintel uvcvideo bt=
bcm snd_acp3x_pdm_dma snd_soc_dmic snd_acp3x_rn snd_hda_core btmtk snd_soc_=
core snd_hwdep videobuf2_vmalloc videobuf2_memops snd_pcm_oss uvc videobuf2=
_v4l2 bluetooth snd_mixer_oss videodev snd_pcm snd_rn_pci_acp3x snd_acp_con=
fig snd_timer videobuf2_common snd_soc_acpi msi_wmi ecdh_generic ecc sparse=
_keymap mc wmi_bmof edac_mce_amd snd snd_pci_acp3x k10temp soundcore ccp ba=
ttery ac button joydev hid_sensor_accel_3d hid_sensor_gyro_3d hid_sensor_al=
s hid_sensor_prox hid_sensor_magn_3d hid_sensor_trigger industrialio_trigge=
red_buffer kfifo_buf amd_pmc industrialio hid_sensor_iio_common evdev mt792=
1e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 libarc4 cfg80211 =
rfkill msr fuse nvme_fabrics efi_pstore configfs efivarfs autofs4 ext4 mbca=
che jbd2 usbhid amdgpu drm_client_lib i2c_algo_bit drm_ttm_helper ttm
[    7.414370] [    T108]  drm_panel_backlight_quirks drm_exec xhci_pci drm=
_suballoc_helper amdxcp xhci_hcd drm_buddy hid_multitouch gpu_sched hid_sen=
sor_hub mfd_core hid_generic drm_display_helper i2c_hid_acpi nvme amd_sfh i=
2c_hid drm_kms_helper usbcore psmouse hid nvme_core r8169 cec serio_raw i2c=
_piix4 usb_common i2c_smbus crc16 i2c_designware_platform i2c_designware_co=
re
[    7.414390] [    T108] CPU: 7 UID: 0 PID: 108 Comm: rcuc/7 Not tainted 6=
.17.0-rc3-bisect-00368-g4d8bb6e8f4a2 #222 PREEMPT_{RT,(full)}=20
[    7.414393] [    T108] Hardware name: Micro-Star International Co., Ltd.=
 Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
[    7.414394] [    T108] RIP: 0010:percpu_ref_switch_to_atomic_rcu+0x194/0=
x1a0
[    7.414397] [    T108] Code: c0 83 f8 03 0f 8f 12 ff ff ff e9 08 77 ba f=
f 48 8b 53 e0 48 8b 73 e8 48 c7 c7 a8 ef 2b b8 c6 05 0c cd a7 00 01 e8 fc e=
b c1 ff <0f> 0b eb c4 0f 1f 84 00 00 00 00 00 41 55 41 54 55 48 89 fd 53 48
[    7.414399] [    T108] RSP: 0018:ffff9fff804ffda0 EFLAGS: 00010282
[    7.414401] [    T108] RAX: 0000000000000000 RBX: ffff8df6a5583660 RCX: =
0000000000000027
[    7.414402] [    T108] RDX: ffff8df95e7d6d48 RSI: 0000000000000001 RDI: =
ffff8df95e7d6d40
[    7.414403] [    T108] RBP: 7ffffffffffffffe R08: 0000000000000dcb R09: =
00000000ffffffff
[    7.414405] [    T108] R10: 0000000000000001 R11: 0000000000000008 R12: =
ffff8df6a5583640
[    7.414406] [    T108] R13: ffff9fff804ffdf0 R14: 00000000000000b4 R15: =
0000000000000000
[    7.414407] [    T108] FS:  0000000000000000(0000) GS:ffff8df9a5e00000(0=
000) knlGS:0000000000000000
[    7.414408] [    T108] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.414409] [    T108] CR2: 000055a8070e5908 CR3: 0000000101a48000 CR4: =
0000000000750ef0
[    7.414411] [    T108] PKRU: 55555554
[    7.414411] [    T108] Call Trace:
[    7.414413] [    T108]  <TASK>
[    7.414415] [    T108]  rcu_do_batch+0x1b6/0x540
[    7.414420] [    T108]  ? rcu_do_batch+0x156/0x540
[    7.414424] [    T108]  rcu_core+0x141/0x250
[    7.414426] [    T108]  ? rcu_cpu_kthread+0x22/0xe0
[    7.414428] [    T108]  rcu_cpu_kthread+0x85/0xe0
[    7.414431] [    T108]  ? sort_range+0x20/0x20
[    7.414432] [    T108]  smpboot_thread_fn+0xd8/0x1d0
[    7.414434] [    T108]  kthread+0xe9/0x1e0
[    7.414437] [    T108]  ? kthreads_online_cpu+0x100/0x100
[    7.414438] [    T108]  ? kthreads_online_cpu+0x100/0x100
[    7.414441] [    T108]  ret_from_fork+0x18e/0x1c0
[    7.414444] [    T108]  ? kthreads_online_cpu+0x100/0x100
[    7.414446] [    T108]  ret_from_fork_asm+0x11/0x20
[    7.414451] [    T108]  </TASK>
[    7.414452] [    T108] ---[ end trace 0000000000000000 ]---
[    7.414453] [    T108] percpu_ref_switch_to_atomic_rcu: percpu_ref_switc=
h_to_atomic_rcu(): percpu_ref underflow slab kmalloc-64 start ffff8df6a5583=
640 pointer offset 0 size 64
[    8.255241] [    T124] ------------[ cut here ]------------
[    8.255243] [    T124] WARNING: CPU: 11 PID: 124 at kernel/futex/core.c:=
1604 futex_ref_rcu+0xe8/0x100
[    8.255249] [    T124] Modules linked in: snd_hrtimer snd_seq_midi snd_s=
eq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm bnep nls_ascii nls_=
cp437 vfat fat snd_hda_codec_generic snd_hda_codec_atihdmi snd_hda_codec_hd=
mi snd_hda_intel snd_intel_dspcfg btusb snd_hda_codec btrtl btintel uvcvide=
o btbcm snd_acp3x_pdm_dma snd_soc_dmic snd_acp3x_rn snd_hda_core btmtk snd_=
soc_core snd_hwdep videobuf2_vmalloc videobuf2_memops snd_pcm_oss uvc video=
buf2_v4l2 bluetooth snd_mixer_oss videodev snd_pcm snd_rn_pci_acp3x snd_acp=
_config snd_timer videobuf2_common snd_soc_acpi msi_wmi ecdh_generic ecc sp=
arse_keymap mc wmi_bmof edac_mce_amd snd snd_pci_acp3x k10temp soundcore cc=
p battery ac button joydev hid_sensor_accel_3d hid_sensor_gyro_3d hid_senso=
r_als hid_sensor_prox hid_sensor_magn_3d hid_sensor_trigger industrialio_tr=
iggered_buffer kfifo_buf amd_pmc industrialio hid_sensor_iio_common evdev m=
t7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 libarc4 cfg80=
211 rfkill msr fuse nvme_fabrics efi_pstore configfs efivarfs autofs4
[    8.255293] [    T124]  ext4 mbcache jbd2 usbhid amdgpu drm_client_lib i=
2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks drm_exec xhci_pci=
 drm_suballoc_helper amdxcp xhci_hcd drm_buddy hid_multitouch gpu_sched hid=
_sensor_hub mfd_core hid_generic drm_display_helper i2c_hid_acpi nvme amd_s=
fh i2c_hid drm_kms_helper usbcore psmouse hid nvme_core r8169 cec serio_raw=
 i2c_piix4 usb_common i2c_smbus crc16 i2c_designware_platform i2c_designwar=
e_core
[    8.255314] [    T124] CPU: 11 UID: 0 PID: 124 Comm: rcuc/11 Tainted: G =
       W           6.17.0-rc3-bisect-00368-g4d8bb6e8f4a2 #222 PREEMPT_{RT,(=
full)}=20
[    8.255317] [    T124] Tainted: [W]=3DWARN
[    8.255317] [    T124] Hardware name: Micro-Star International Co., Ltd.=
 Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
[    8.255318] [    T124] RIP: 0010:futex_ref_rcu+0xe8/0x100
[    8.255321] [    T124] Code: be ff ff ff ff ff ff ff 7f 48 89 b3 88 01 0=
0 00 c7 00 01 00 00 00 48 8d bb 78 01 00 00 5b 48 c7 c6 f0 c5 74 b7 e9 f8 7=
a fd ff <0f> 0b eb ab 0f 0b e9 31 ff ff ff 0f 0b eb c6 66 0f 1f 84 00 00 00
[    8.255322] [    T124] RSP: 0018:ffff9fff80587db0 EFLAGS: 00010286
[    8.255324] [    T124] RAX: 7fffffffffffffff RBX: ffff8df6a02bbe80 RCX: =
0000000000000010
[    8.255325] [    T124] RDX: ffffffffffffffff RSI: ffffffffffffffff RDI: =
000000000000000f
[    8.255326] [    T124] RBP: ffff8df680b4a000 R08: 0000000000000000 R09: =
0000000000000005
[    8.255327] [    T124] R10: 0000000000200017 R11: 0000000000000000 R12: =
ffff8df95e8e2300
[    8.255327] [    T124] R13: ffff9fff80587df0 R14: 0000000000000007 R15: =
0000000000000000
[    8.255328] [    T124] FS:  0000000000000000(0000) GS:ffff8df9a5f00000(0=
000) knlGS:0000000000000000
[    8.255330] [    T124] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.255331] [    T124] CR2: 0000561aa64a1020 CR3: 00000001209dd000 CR4: =
0000000000750ef0
[    8.255331] [    T124] PKRU: 55555554
[    8.255332] [    T124] Call Trace:
[    8.255334] [    T124]  <TASK>
[    8.255335] [    T124]  rcu_do_batch+0x1b6/0x540
[    8.255339] [    T124]  ? rcu_do_batch+0x156/0x540
[    8.255342] [    T124]  rcu_core+0x141/0x250
[    8.255344] [    T124]  ? rcu_cpu_kthread+0x22/0xe0
[    8.255345] [    T124]  rcu_cpu_kthread+0x85/0xe0
[    8.255347] [    T124]  ? sort_range+0x20/0x20
[    8.255349] [    T124]  smpboot_thread_fn+0xd8/0x1d0
[    8.255351] [    T124]  kthread+0xe9/0x1e0
[    8.255354] [    T124]  ? kthreads_online_cpu+0x100/0x100
[    8.255355] [    T124]  ret_from_fork+0x18e/0x1c0
[    8.255358] [    T124]  ? kthreads_online_cpu+0x100/0x100
[    8.255360] [    T124]  ret_from_fork_asm+0x11/0x20
[    8.255364] [    T124]  </TASK>
[    8.255365] [    T124] ---[ end trace 0000000000000000 ]---

The result of the bisection was this as the first bad commit:
1b708b38414d ("futex: Move futex_hash_free() back to __mmput()")

I reverted commit 1b708b38414d in next-20250829 and all the errors disappea=
red,
but do not know yet how all these errors are linked.

Bert Karwatzki

