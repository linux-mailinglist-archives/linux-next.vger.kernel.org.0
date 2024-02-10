Return-Path: <linux-next+bounces-1108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076D8502A5
	for <lists+linux-next@lfdr.de>; Sat, 10 Feb 2024 06:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B8A1C2290A
	for <lists+linux-next@lfdr.de>; Sat, 10 Feb 2024 05:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C1210A16;
	Sat, 10 Feb 2024 05:30:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B1D297
	for <linux-next@vger.kernel.org>; Sat, 10 Feb 2024 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707543027; cv=none; b=WB6mO/3CptZWpBQuSd62QX50bH2E585hXr4nRET/rP13wPgGF4SCXV6GSLmjum9hGcy7jJgRSVePxXFc8lhaa/gbm7+xRurXQPxNQXev2apSAph3ZOL187zlfmiGrQO3LIleo/G9o/ShF95vopiLGu33y7byvSFXqHrTa7AlOXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707543027; c=relaxed/simple;
	bh=owtPcy00HdQtko1d6g+Zf5awi/yGVGZj3dIGwqg4URk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Tcc+hjFDQ1dpyyP+pk/FpLU57ga/C6ap+ZemlGHI8hW9lMeoHYt7roAKomJWIkJhZQWcpYXmL4WjVG+K86G0Z5emD/aZxsgYdTubwQeo4cbD8VXOjvajqgy7D6uyzzp7zaV7vhczE/F3SCaWe5oTG3plRs3TFyrBtOq4plhIeNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-363c6714987so16265415ab.3
        for <linux-next@vger.kernel.org>; Fri, 09 Feb 2024 21:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707543024; x=1708147824;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHWKdh7Wa8GhzhRTMvRN0DivpJuYWmSFR6gcwIVJhOo=;
        b=wLxdqwOfW+SVe1Dz/AN6ohot2mGuxo7tZpBzuDXWZm7vSUxPRnEmtQhUhKYHiZQffR
         fX359NggoVr7aGFGEAD96mEbmgeRMmbtUijrXKA7c6bkny7AofXnEI98PlXBealEvtxP
         GEkn/OE6X/i67Ye7N1g3e2vajNziEN82J4VUuy9j34bHjp5mEq81121/lRjQzDP5Hl9d
         JO+xgraXp4y86jpuyyvcpliKhjI4Bwl5KTbpUdZ7Jt1l653oUhVXwSi0SmJX9l1bucGF
         YWe19dsS8R9t6eJLTDzW0pgkjeVhhkRvZ6VGDAmpKDNkppsoXso8bndoorYPDfoqHRn2
         yejA==
X-Gm-Message-State: AOJu0Yxs6fQtj9vvyjfywAXHyLFWri7X8Bkoonm06GPtOXs960MSE63j
	rTHDMmP0x91MUOKSn+IJslPybZg21waJtNBGzzhgww7qOn8MJIEF1dfkl1D6WnFc2NqCF2aVoIj
	kLNDrDwnjTbQVDdBhu+bPmeqfHhDAdJeElDYkR7s7387zWHXPXYX5eMc=
X-Google-Smtp-Source: AGHT+IHbJKFFz6TBAGoOlimMT3VuP8oed8ZaOS+MmtOuz+VfWN1kZvoHKBOIJV8YMIP9sR/k8Lq/KlhqdDddLfGmRnNelbSIrUw5
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c265:0:b0:363:85de:452c with SMTP id
 h5-20020a92c265000000b0036385de452cmr119015ild.0.1707543024778; Fri, 09 Feb
 2024 21:30:24 -0800 (PST)
Date: Fri, 09 Feb 2024 21:30:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006e468c06110057ab@google.com>
Subject: [syzbot] [kernel?] linux-next boot error: kernel panic: VFS: Unable
 to mount root fs on unknown-block(NUM,NUM) (2)
From: syzbot <syzbot+fbd73dc34f8681ecb8c0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ac139fc7db67 Add linux-next specific files for 20240206
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12acdbffe80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b5fe6166ab1fa63
dashboard link: https://syzkaller.appspot.com/bug?extid=fbd73dc34f8681ecb8c0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7944e61925e3/disk-ac139fc7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5fcc1af6c7d/vmlinux-ac139fc7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/be76eb66afdf/bzImage-ac139fc7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fbd73dc34f8681ecb8c0@syzkaller.appspotmail.com

 (driver?)
1f00             128 mtdblock0 
 (driver?)
0800         2097152 sda 
 driver: sd
  0801         1048576 sda1 00000000-01

List of all bdev filesystems:
 reiserfs
 ext3
 ext2
 ext4
 cramfs
 squashfs
 minix
 vfat
 msdos
 exfat
 bfs
 iso9660
 hfsplus
 hfs
 vxfs
 sysv
 v7
 hpfs
 ntfs3
 ufs
 efs
 affs
 romfs
 qnx4
 qnx6
 adfs
 fuseblk
 udf
 omfs
 jfs
 xfs
 nilfs2
 befs
 ocfs2
 gfs2
 gfs2meta
 f2fs
 bcachefs
 erofs
 zonefs
 btrfs

Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(8,1)
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.8.0-rc3-next-20240206-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2e0 lib/dump_stack.c:106
 panic+0x349/0x860 kernel/panic.c:348
 mount_root_generic+0x3b5/0x3e0 init/do_mounts.c:234
 prepare_namespace+0xc2/0x100 init/do_mounts.c:489
 kernel_init_freeable+0x471/0x5d0 init/main.c:1555
 kernel_init+0x1d/0x2b0 init/main.c:1432
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:242
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


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

