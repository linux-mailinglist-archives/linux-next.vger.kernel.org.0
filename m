Return-Path: <linux-next+bounces-5531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6617A40CE5
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 07:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 560CE7A5986
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 06:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C9828691;
	Sun, 23 Feb 2025 06:02:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38358C1E
	for <linux-next@vger.kernel.org>; Sun, 23 Feb 2025 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740290547; cv=none; b=n+mr/iq7OW6MU+QSWbXbz7UZg6DXcXyXJniHbNZVMz7Zf4eERdiLq/sWZJYcXSp6AxmZ63YDsdiGrbEbcdvs9TT3pjolgvjE4JREmjK704aQaJkb+qrgtP/10pb22xRYhuiRPkKoQt4NgmJxOdxd5bL+jsS1UoUldT2KQRmqxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740290547; c=relaxed/simple;
	bh=OAtn2xTdO+cgvKJBjCddRRYCUOnG9EQgRwoUJf3hThM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Rvg9oeE79vO1AA9H1eMr+5wK1Ue+TLotVnpHY3b4RDI85aVLW61Wkez7KW75kIdXk+R85vjrwaXdrgC45LaxiXonteA756gc/O/mL1UqaYZLsfbWTzLFdP8smett/KMpyiX8NuhACzE9vXjmF8d99bs6vhynR9hCz1hTlM0RieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d2a6102c1aso76255865ab.0
        for <linux-next@vger.kernel.org>; Sat, 22 Feb 2025 22:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740290545; x=1740895345;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpCKX5dC6Lp03zGCSnuSFhesEWR5oKdS40nv7EcsF7k=;
        b=So/HUhGsqglfyYaBGGA0MK2mpvS88PedPZVbGLUU1IjU2EbC0xvM08eed9xJu7oOao
         T1r1KF31OU8Rg8Z0n+FSPyFlyErCe7OvfIVHEeN/CjbgIREEMskUGdEaQE4gvh2NdBA/
         8iNZ0uXyj3qWOKvXvAtaYMAIZ+Mme/JQbnubCrI/R8hn4WPF/KW8D4DjEm6aJIa2wRBf
         bgUSVE/Fr1PUjaSjLbFvIGMvUo1vnhOuauUWbwdw5/Sf2l0wdk99RcSJ7Ot7dkdQoOQS
         CtiTQWezEqG0Vltc8yvkoreZ2i2DmErUHjNhD0+LGEA2xsjzAOk+19VQvhJb3TSjBo6q
         M+zw==
X-Forwarded-Encrypted: i=1; AJvYcCWd8irJvN8jykqWzu6fLcA06xkP+Xw11LE70IY9gsIUYjahLMXJpVRMYKruhq+9lgZl9ww67Ps2GDuW@vger.kernel.org
X-Gm-Message-State: AOJu0YwkgJyZKP0Lh79itB3JEW2EapBqS6lKicVtwP2oPM7r0IKeunFB
	NnCaIVJikkomjTYZ5uMid1W60oSeFMU5vlhvK4h9qGdtZEyX/aU6ohLW2Y5QNpyRO2rusXYIoFq
	WvSk1L+Kam/v753Q/E4DDfn9dfFausfWwkk68sVGKulUeSLz696QAbFs=
X-Google-Smtp-Source: AGHT+IF1suL4fPIdAP6uDdEQd8QQfsV1EO4MxtkXzNB9QUmDwwTG6JcFwL+uxWOqvUqLKWGRSG5z5oQSZu13CiwBPJq7RTBUqgYJ
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3113:b0:3d2:b509:af44 with SMTP id
 e9e14a558f8ab-3d2cae6c9damr96832965ab.8.1740290544831; Sat, 22 Feb 2025
 22:02:24 -0800 (PST)
Date: Sat, 22 Feb 2025 22:02:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com>
Subject: [syzbot] linux-next build error (20)
From: syzbot <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d4b0fd87ff0d Add linux-next specific files for 20250221
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17a5bae4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d7299d72819017
dashboard link: https://syzkaller.appspot.com/bug?extid=06fd1a3613c50d36129e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com

<stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'

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

