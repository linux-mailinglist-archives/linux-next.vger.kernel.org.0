Return-Path: <linux-next+bounces-7657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFFB0C067
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 11:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC1817AB23
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B1E28BAAF;
	Mon, 21 Jul 2025 09:35:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382028A71C
	for <linux-next@vger.kernel.org>; Mon, 21 Jul 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753090533; cv=none; b=tC/G73y9RfTtKcSW/As8bHcN3aPUeoNwgPIfSkuKiUqHgNUXfKRH6a8PGmf7xhv/EQcbizJaT+PFl3VcTd+VJceyt2flT7sCt47FfdzPMv0P2eHb7jBQM7RMhOp8q1GtInJeKybfPPAGFT307ZPWLdqlgTRvpRRBUES5neGGcPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753090533; c=relaxed/simple;
	bh=IKWSUoc2lmCa1ZM8P6Cy7IVnFLEsLv+kUIyNaVjpkDk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WG07naO85ak1aLZtrqNhT/n3aCBoBYVsE5ZsJRutQHwFKzd0tVIaslJ/WYsnHw4FWIVocFAt4UZJECMEWGNkKnnXNERIFQE09uwbjwZNdu5ayHZIu/z0dMMI4cPCdjTdWHKC0CCD52hI76xwSNacpvO2nZKpzerVbnQrDLrG6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-87c24b196cbso157245739f.2
        for <linux-next@vger.kernel.org>; Mon, 21 Jul 2025 02:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753090531; x=1753695331;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYc/vDtNMTkmIow0Px2oZm6vbRSlAyud1JI5Tp027Wk=;
        b=dry8U+MkUtuQEZPUauIitOhavlu2qhLNz9AQNE489Q0g/5zPxNQcn3zS71kvL5dc3W
         U40rt8ee9QR3nrazPfdIreL/PdWqlnXbBZHLfo8BCF0KnVnyoAH3yNQSvnqGZIchRBtB
         UVx1idkfi9bEg3uY6fHUbJnCjfI+rIZyPu61Zr+BqkaJJNArPlWOnoh/2fVonp/eZuIR
         8aMIIIWychLyIi8nlgyA7npElK3MX4y9Wl7MbSz4Nm0G1ILhyUyi7zO5NIVP+zTI1M0s
         4ok912mHIyYO2WVvwita/rKJgIPXWYwYyWR/8hXrTQ79yfeKRetU+Fx0WRyvjfUAqiGr
         td4A==
X-Forwarded-Encrypted: i=1; AJvYcCXh8icmqPBJc1qnX/EuS6K0xxe55PyujSfuxNA7Yu5NLOD295qVFTenugJucqj9sB6gTkHAiuYzMox5@vger.kernel.org
X-Gm-Message-State: AOJu0YysYyeL5C8OvbdRu7I+FtIy+f1yJS8n8wReJCwF2VBBSUJyC0AA
	zL105gBFjmluIbkjjH669ifVFCulTkTM8TyEf0I69RUmo58Xu1aRnr1MxZgfPvlrAQO5wuBoYSQ
	Mip9cpgdAs9SvwGL2Pc66T6jpawfQeOw3xuFv5RypmL9l/r9C8QfXK/31rSs=
X-Google-Smtp-Source: AGHT+IE36MNzd0e64f6m1+Tts8MfnrEcPlLa/PxmLnThU6J0DiYR17Mzo8OX7AtvIC3BO5/vjSetMa49v6BW0mV1BOW9UYSiKaVX
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:400e:b0:87c:1542:8abc with SMTP id
 ca18e2360f4ac-87c15428e5cmr1298312539f.4.1753090531132; Mon, 21 Jul 2025
 02:35:31 -0700 (PDT)
Date: Mon, 21 Jul 2025 02:35:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
Subject: [syzbot] [apparmor?] linux-next test error: WARNING in apparmor_unix_stream_connect
From: syzbot <syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com>
To: apparmor@lists.ubuntu.com, jmorris@namei.org, john.johansen@canonical.com, 
	john@apparmor.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    979875200256 Add linux-next specific files for 20250721
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13bf7f98580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9baac92c2ceb707
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dcd38ee04bcb3866b0=
c6d
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-=
1~exp1~20250616065826.132), Debian LLD 20.1.7

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bf2232f3c8e/disk-=
97987520.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ae51e7da64a4/vmlinux-=
97987520.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e05ecb1741a9/bzI=
mage-97987520.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com

------------[ cut here ]------------
AppArmor WARN apparmor_unix_stream_connect: ((({ typeof(*(new_ctx->label)) =
*__UNIQUE_ID_rcu2213 =3D (typeof(*(new_ctx->label)) *)({ do { __attribute__=
((__noreturn__)) extern void __compiletime_assert_2214(void) __attribute__(=
(__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((si=
zeof((new_ctx->label)) =3D=3D sizeof(char) || sizeof((new_ctx->label)) =3D=
=3D sizeof(short) || sizeof((new_ctx->label)) =3D=3D sizeof(int) || sizeof(=
(new_ctx->label)) =3D=3D sizeof(long)) || sizeof((new_ctx->label)) =3D=3D s=
izeof(long long))) __compiletime_assert_2214(); } while (0); (*(const volat=
ile typeof( _Generic(((new_ctx->label)), char: (char)0, unsigned char: (uns=
igned char)0, signed char: (signed char)0, unsigned short: (unsigned short)=
0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int=
: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long=
)0, unsigned long long: (unsigned long long)0, signed long long: (signed lo=
ng long)0, default: ((new_ctx->label)))) *)&((new_ctx->label))); }); ;=20
WARNING: security/apparmor/lsm.c:1211 at apparmor_unix_stream_connect+0x5fa=
/0x650 security/apparmor/lsm.c:1211, CPU#0: udevadm/5318
Modules linked in:
CPU: 0 UID: 0 PID: 5318 Comm: udevadm Not tainted 6.16.0-rc7-next-20250721-=
syzkaller #0 PREEMPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 05/07/2025
RIP: 0010:apparmor_unix_stream_connect+0x5fa/0x650 security/apparmor/lsm.c:=
1211
Code: 1c 3b fd 48 89 ef e8 35 4d 00 00 e9 09 fe ff ff e8 ab 1c 3b fd 90 48 =
c7 c7 40 31 fd 8b 48 c7 c6 2a 2e c7 8d e8 07 a4 fe fc 90 <0f> 0b 90 90 e9 2=
7 fe ff ff e8 88 1c 3b fd be 02 00 00 00 eb 0a e8
RSP: 0018:ffffc90003367c38 EFLAGS: 00010246
RAX: 5674fa5d0d24c800 RBX: 1ffff1100fad97d0 RCX: ffff888026cd5a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: ffff88801ba8f8f8 R08: ffff8880b8624253 R09: 1ffff110170c484a
R10: dffffc0000000000 R11: ffffed10170c484b R12: ffff88807d6cbe80
R13: 1ffff1100fbc1bc8 R14: 0000000000000000 R15: 000000000000002f
FS:  00007f8de3bff880(0000) GS:ffff8881257a6000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8de347ae00 CR3: 000000007fc96000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 security_unix_stream_connect+0xcb/0x2c0 security/security.c:4540
 unix_stream_connect+0x8fc/0x1010 net/unix/af_unix.c:1753
 __sys_connect_file net/socket.c:2086 [inline]
 __sys_connect+0x313/0x440 net/socket.c:2105
 __do_sys_connect net/socket.c:2111 [inline]
 __se_sys_connect net/socket.c:2108 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2108
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8de34a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc =
74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 0=
0 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffc79327430 EFLAGS: 00000202 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f8de3bff880 RCX: 00007f8de34a7407
RDX: 0000000000000013 RSI: 000055d4ba7cf948 RDI: 0000000000000003
RBP: 000000000000001e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffc79327490
R13: 0000000000000000 R14: 0000000000000007 R15: 0000000000000000
 </TASK>


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

