Return-Path: <linux-next+bounces-2940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0A92E30E
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 11:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC1A282064
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 09:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE232153517;
	Thu, 11 Jul 2024 09:05:25 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78F155325
	for <linux-next@vger.kernel.org>; Thu, 11 Jul 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720688725; cv=none; b=D8+WYvQKnzHn7VtVlJ/DOpHhcdf5tdhwcQRgVdSxr7jcTQDzU+1Z0c7EHsReCDTp+k2SMBqqfPREuhN8e/SOFM71lBdH8ET17r6pLaibtKu9agVspjua1xmJV/MfFras8i9BApbafnt1a31xQchntexLH5gBUNS1O6hjpm2ZO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720688725; c=relaxed/simple;
	bh=XYxlmIIxPz02XwPaWacMEo7iOd1/ezQpDI9Rfq2LOeY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZkvEpw6wo4QDaj0++sdyj8TDAgWABvv4zZ5c6WrkNvmSKu/G/vPOBDw2wv4YGmZdENtCc9F3WddRcQaiQHwHJQxQE1pWvbEq786i/1+qzNzMg0CNsPXffC6dgwL6g/thehdEFJhSXLB5a3aO0eWqd2NxzPqtMUewy6pWCwNqpmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-802d5953345so71905039f.3
        for <linux-next@vger.kernel.org>; Thu, 11 Jul 2024 02:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688723; x=1721293523;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7aYs+p+RfqCU0uhnQSbRHQOaf5R4fG7X9jEJfO0KnE=;
        b=IJOX/giG/4uNIMs8+g8+g7TfFUZ0n0TGxu2auAsSSf52+hrwWReEsCdJXafG664yw+
         rJgIMn0CgEP10rtaXoRBhjsP8xKBSTrkeZnAnY/kcTUkcRVyPRKHCofB7MOicO/Q0KFj
         NRYmnfLyURvOIOZd9Hm05LvCkLwTyFqQzv+hmmeNK8rvB8gVArAFSQM/SjfDnv87oM5p
         zyMcJw/Yk1SNwk7rSyyjpWqzPI1Z8b44XuV/KkocFaE2XkKfF8ujpoIzsblHv0eXHoys
         q7zytzFdOPAFUXu5XyU/Yvs11sshoLu8eVRwHwC7RlhUc/1Y0TMzT0O4pb3SA3peWJsk
         LGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4qUWG0CBlzv1BDBdZ7n9OuEh6LJRwonrUK8/wFVaNmndfu3iem/7mSJExE+72u4tAJ1O6gJP1uWhTXvtuJf9FVeddQ/bmlDfUA==
X-Gm-Message-State: AOJu0YwDgnQ16Qri56boTdl+23oUXRe50H/EG2Bkv8BQHGifhx/HbD8D
	44+luXzqVF05pwSvH8AFQzf6F1jI5zCrEMMaxoz+Q2EyWCKt2h11x5cTQxXaO+aWzL/L0qfZy3j
	JavLZAzy03RzyesRO2K3PrpKzktNLwuARRs1EzaayT7BtlDaxOvo0+GY=
X-Google-Smtp-Source: AGHT+IGYtCi/ADkFom8VByt8aL2zMv7xDwr+t6sNcKBkUPajUBIpF2U/zImfTaCTNjapCrHef8rySWSDepf9miD8zk9mcuTGKkOQ
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:16c1:b0:4c0:9a3e:c26e with SMTP id
 8926c6da1cb9f-4c0b2505225mr478967173.0.1720688723580; Thu, 11 Jul 2024
 02:05:23 -0700 (PDT)
Date: Thu, 11 Jul 2024 02:05:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000236b8d061cf510dc@google.com>
Subject: [syzbot] linux-next build error (17)
From: syzbot <syzbot+96c36598b73a9d3f3e25@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f477dd6eede3 Add linux-next specific files for 20240711
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1634d47e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98dd8c4bab5cdce
dashboard link: https://syzkaller.appspot.com/bug?extid=96c36598b73a9d3f3e25
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+96c36598b73a9d3f3e25@syzkaller.appspotmail.com

drivers/bluetooth/hci_qca.c:2501:10: error: label at end of compound statement: expected statement

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

