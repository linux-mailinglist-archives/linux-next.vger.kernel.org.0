Return-Path: <linux-next+bounces-7933-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23643B2439D
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 10:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF7016F3B6
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 08:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3631448E3;
	Wed, 13 Aug 2025 08:00:41 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8819293C71
	for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072041; cv=none; b=EK2bZLqCqzpQrY/4/fHq8Inieiys1XXKYsfW34cGtgAE603T+mgE9K+ZTgdSMhSjrrTSyR/6hDXLDHmoQHuJ+lmCWCFb0PVX50zUrHD2Qm5qGAj4pKVL7ozMG3xs5tzJKWk01gscNgJvcoCUXPolxU4euVFNOsMfCpK4/K5l62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072041; c=relaxed/simple;
	bh=Cy1GWWDMHLkePeNdZmg6sD8ncrhXRngMBR8t6TyJxqQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Thz5QbKG/6aZbRROniLgnToAl3KbzeJG7RkFl6ZcHGgWfQ35YRV/cecaGYtpk4fIMx1dNcW+JBUWrETyPGrrikdr39ZBKLgMkGGWkYa+UyjLWr1myxTTJUa0Lk3AxCtO5OCCy+wmgtfjNh0rCdtwE0tuCFReA2SF08kwtS2WvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-8760733a107so708121339f.3
        for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 01:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755072038; x=1755676838;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9SyPMIf9WPm9Uar843pT5BCzaWI4QvvZ1WxW3gzybo=;
        b=sQcWBg/jAFffpLrsQiHMBiYWiH6MyEaI5ds+2bJC7XJAXXiIFDV089Z3BwQMnLfSci
         e9Pw8WM+ewM+ySWgzwohRVQHlc8Usw/WHYeWGfLXkuFDI3Wtqw7Pby1Hq9OeZ6Xv9plp
         HDm5VwGyPz+yYPJvvphM78zwwl5HwdIiXUdWSVoGGlYnbnvoME0hmzpSaAWi2JJMiaYh
         i8HRT0SMs3+9jtkoiyD5IQmqgMcSRTOVTCwOgEhjj3soAsy5LzEbC1VbPp/e5rHsjHwV
         aWlxQXCSsvD7GHzs28PP0Ebg4RCrR4znUrPk4cz+ZJKE+uEjhhJ7z23e4ArgtMSQo7dT
         FMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVR/o8JXehw4HR79PrugL0vH7a7y2cnLCVM/M/yecGQcNeXYhrjNB2GBNgCKsfMGlowPox/KUETkIHo@vger.kernel.org
X-Gm-Message-State: AOJu0YyulTodbzXKUCB/7Dx/2RCebX+4LUzs6mclZXu5sxgZLGBBQZsu
	Uz+ECdwaMaOGyfHHH6bEehKz7Q2lBoBUCwq8WloCPT4m/J1MKJ8M44ur3opPdvw4m7+z4F1iFp9
	ixjFykx3hW7KXvcRDJhOusAf/BPJYJltyN1tNeC1WI7XEXBGlBChpvlhiJi0=
X-Google-Smtp-Source: AGHT+IGdX9TMmhxEPvNIz33M/FJrkfOa4Q7jVayiBfHHVLr/b+W9lr7z7vpufAEqxahUoiHAhC8rsyEpxI+78FeOGD8fiMCbeujU
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4f10:b0:876:19b9:1aaa with SMTP id
 ca18e2360f4ac-88429694fe9mr325900939f.9.1755072037972; Wed, 13 Aug 2025
 01:00:37 -0700 (PDT)
Date: Wed, 13 Aug 2025 01:00:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <689c4625.050a0220.51d73.00ba.GAE@google.com>
Subject: [syzbot] [sound?] linux-next test error: general protection fault in snd_seq_oss_midi_check_new_port
From: syzbot <syzbot+51c1105d06b79f38316d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-sound@vger.kernel.org, perex@perex.cz, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    43c3c17f0c80 Add linux-next specific files for 20250813
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10c02c34580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c9952dc295dad7ea
dashboard link: https://syzkaller.appspot.com/bug?extid=51c1105d06b79f38316d
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8911961a91d3/disk-43c3c17f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d2f0ab430eb7/vmlinux-43c3c17f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1a0d0d7fc76a/bzImage-43c3c17f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+51c1105d06b79f38316d@syzkaller.appspotmail.com

device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
device-mapper: multipath round-robin: version 1.2.0 loaded
device-mapper: multipath queue-length: version 0.2.0 loaded
device-mapper: multipath service-time: version 0.3.0 loaded
Bluetooth: HCI UART driver ver 2.3
Bluetooth: HCI UART protocol H4 registered
Bluetooth: HCI UART protocol BCSP registered
Bluetooth: HCI UART protocol LL registered
Bluetooth: HCI UART protocol Three-wire (H5) registered
Bluetooth: HCI UART protocol QCA registered
Bluetooth: HCI UART protocol AG6XX registered
Bluetooth: HCI UART protocol Marvell registered
usbcore: registered new interface driver bcm203x
usbcore: registered new interface driver bpa10x
usbcore: registered new interface driver bfusb
usbcore: registered new interface driver btusb
usbcore: registered new interface driver ath3k
Modular ISDN core version 1.1.29
NET: Registered PF_ISDN protocol family
DSP module 2.0
mISDN_dsp: DSP clocks every 80 samples. This equals 1 jiffies.
mISDN: Layer-1-over-IP driver Rev. 2.00
0 virtual devices registered
usbcore: registered new interface driver HFC-S_USB
intel_pstate: CPU model not supported
VUB300 Driver rom wait states = 1C irqpoll timeout = 0400
usbcore: registered new interface driver vub300
usbcore: registered new interface driver ushc
iscsi: registered transport (iser)
SoftiWARP attached
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
usbcore: registered new interface driver es2_ap_driver
comedi: version 0.7.76 - http://www.comedi.org
comedi comedi4: comedi_test: 1000000 microvolt, 100000 microsecond waveform attached
comedi comedi4: driver 'comedi_test' has successfully auto-configured 'comedi_test'.
usbcore: registered new interface driver dt9812
usbcore: registered new interface driver ni6501
usbcore: registered new interface driver usbdux
usbcore: registered new interface driver usbduxfast
usbcore: registered new interface driver usbduxsigma
usbcore: registered new interface driver vmk80xx
greybus: registered new driver hid
greybus: registered new driver gbphy
gb_gbphy: registered new driver usb
asus_wmi: ASUS WMI generic driver loaded
gnss: GNSS driver registered with major 493
usbcore: registered new interface driver gnss-usb
usbcore: registered new interface driver hdm_usb
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1-next-20250813-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:snd_seq_oss_midi_check_new_port+0x4a9/0x770 sound/core/seq/oss/seq_oss_midi.c:196
Code: 2d 4c 51 d3 10 4c 8b 2c 24 4c 89 e8 48 c1 e8 03 48 bb 00 00 00 00 00 fc ff df 0f b6 04 18 84 c0 0f 85 7f 02 00 00 45 89 65 00 <0f> b6 03 84 c0 0f 85 8e 02 00 00 4c 63 3c 25 00 00 00 00 bf 20 00
RSP: 0000:ffffc90000067038 EFLAGS: 00010046
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88801ce90000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000001f
RBP: 0000000000000001 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff5200000cde4 R12: 0000000000000000
R13: ffff88802e92b400 R14: 0000000000000a02 R15: ffff88802e92b438
FS:  0000000000000000(0000) GS:ffff888125d10000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000df36000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 receive_announce+0x22f/0x300 sound/core/seq/oss/seq_oss_init.c:132
 __snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:599 [inline]
 _snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:645 [inline]
 snd_seq_deliver_single_event+0x8dd/0xc90 sound/core/seq/seq_clientmgr.c:660
 __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:707 [inline]
 deliver_to_subscribers sound/core/seq/seq_clientmgr.c:735 [inline]
 snd_seq_deliver_event+0x538/0x9c0 sound/core/seq/seq_clientmgr.c:785
 snd_seq_kernel_client_dispatch+0x2c0/0x400 sound/core/seq/seq_clientmgr.c:2407
 snd_seq_system_broadcast+0x11d/0x170 sound/core/seq/seq_system.c:88
 snd_seq_ioctl_create_port+0x733/0x950 sound/core/seq/seq_clientmgr.c:1313
 create_port+0x258/0x360 sound/core/seq/seq_dummy.c:146
 register_client+0x5d/0x190 sound/core/seq/seq_dummy.c:198
 do_one_initcall+0x233/0x820 init/main.c:1281
 do_initcall_level+0x104/0x190 init/main.c:1343
 do_initcalls+0x59/0xa0 init/main.c:1359
 kernel_init_freeable+0x334/0x4b0 init/main.c:1591
 kernel_init+0x1d/0x1d0 init/main.c:1481
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:snd_seq_oss_midi_check_new_port+0x4a9/0x770 sound/core/seq/oss/seq_oss_midi.c:196
Code: 2d 4c 51 d3 10 4c 8b 2c 24 4c 89 e8 48 c1 e8 03 48 bb 00 00 00 00 00 fc ff df 0f b6 04 18 84 c0 0f 85 7f 02 00 00 45 89 65 00 <0f> b6 03 84 c0 0f 85 8e 02 00 00 4c 63 3c 25 00 00 00 00 bf 20 00
RSP: 0000:ffffc90000067038 EFLAGS: 00010046
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88801ce90000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000001f
RBP: 0000000000000001 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff5200000cde4 R12: 0000000000000000
R13: ffff88802e92b400 R14: 0000000000000a02 R15: ffff88802e92b438
FS:  0000000000000000(0000) GS:ffff888125d10000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000df36000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	2d 4c 51 d3 10       	sub    $0x10d3514c,%eax
   5:	4c 8b 2c 24          	mov    (%rsp),%r13
   9:	4c 89 e8             	mov    %r13,%rax
   c:	48 c1 e8 03          	shr    $0x3,%rax
  10:	48 bb 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbx
  17:	fc ff df
  1a:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
  1e:	84 c0                	test   %al,%al
  20:	0f 85 7f 02 00 00    	jne    0x2a5
  26:	45 89 65 00          	mov    %r12d,0x0(%r13)
* 2a:	0f b6 03             	movzbl (%rbx),%eax <-- trapping instruction
  2d:	84 c0                	test   %al,%al
  2f:	0f 85 8e 02 00 00    	jne    0x2c3
  35:	4c 63 3c 25 00 00 00 	movslq 0x0,%r15
  3c:	00
  3d:	bf                   	.byte 0xbf
  3e:	20 00                	and    %al,(%rax)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

