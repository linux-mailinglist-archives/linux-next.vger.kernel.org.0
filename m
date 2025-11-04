Return-Path: <linux-next+bounces-8813-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA2C303F3
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 10:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FCC64E97FD
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 09:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAA031A56D;
	Tue,  4 Nov 2025 09:17:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0052C3247
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247851; cv=none; b=IaDsHyV9uYq2ejClCmo8AqlElX62thBML0vSfRY3wJpeR/whR8iC8eGXfcqmysGBd9TylS+/CZ+yAkoM5CIaFXQEvXQFWZne6Hr17/tVKjDsu75+E7a9GpPTKATl5lxCUmVyXI9q5jB1UKGTAidzGZ8qiEEPK3kKrg1PhgEqNSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247851; c=relaxed/simple;
	bh=x2N2Ao/VUOm5LHMgeVOcIdZt4S8Z8P71A7OBDYHROeo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=crHMDWebwVUvX69lbOoUOEMPXjuUXaG51CDvxYF8djvj8ZFDYyS96hxs/tv+o4DAgomRXp6msyRg0wqZaMlm55WrTgjCX/KJD0jQkRSbZ5JqUwn6lqUc3pcaaOlc5FWqHotIrJy1BHU2Ul3d1Vu9aU2W20bXCShC0vZHWwzhso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-432f8352633so147433845ab.0
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 01:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247849; x=1762852649;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0G+klVvNi3geMbF/DqTCZY2vlIqhu0rrXDM72V6APk=;
        b=ifbOhQxOuD0LF1AnIktf+qe+dkQGRVpulGsszBQIMzql0B/5NsKJ3xueaAdH1Ks+5I
         skRkBQvT/wpNxBTd1SU0hXM9tVQ93G/o9rdWbKFbsYkuPUmUjjUDks6xZqAssH+1I/Bm
         8koJudH46HoAVggxmy40OtnFTeJ7zIAO5tCzij0Hr325xiIEdphMbzwfKhVk+jL2hdjC
         OnegGYIgmvHnFJBkOljxyw8RJ4D+yz61rM35Z+LiLg8m5iMNXeZnOKkjkrUTJfFO26Ma
         gHFfpVV+q+Aarpe2c6dRiwnrLJTc4SCg03yv+ngJAST4UvD8onCX5VTb+JzZ8E+g7ePP
         XsYA==
X-Forwarded-Encrypted: i=1; AJvYcCWLCnqYMhyBI6mu5qBYsLkLJqEpBPI9WozWVF3Qnf349XkCHZQ3rpwuux4fo27qosedmj1J/gt7h/II@vger.kernel.org
X-Gm-Message-State: AOJu0YzCF+bsLLt+61oIik30OnX40T7d5UdlEqZQr4GmJctCVCGx2l9b
	mawL06qrPU2gQsLB74DFRilo5iCE38wJC601KIW0hBqz2injZHzhtghJT7qPt1o3xywl++N2qC4
	WBwXs7u/VEkZSNtSCOuF5LYe8mRgKFvFGEg8AHIRWojwEaXwu1bMg2IHayYM=
X-Google-Smtp-Source: AGHT+IENivPcLxYnYpgLYPv9zvCQyccHTCmdN4XNfgrF3nTOylMianJzqRB5o2G7ybt7oMVsfdpfOBtBrXK02tWuklnLrW4u6i97
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a28:b0:430:a14f:314c with SMTP id
 e9e14a558f8ab-4330d121e2cmr196825385ab.7.1762247849063; Tue, 04 Nov 2025
 01:17:29 -0800 (PST)
Date: Tue, 04 Nov 2025 01:17:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6909c4a9.050a0220.98a6.00a9.GAE@google.com>
Subject: [syzbot] linux-next build error (24)
From: syzbot <syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    982312090977 Add linux-next specific files for 20251103
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=110f817c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf6c387ad3e8e7a
dashboard link: https://syzkaller.appspot.com/bug?extid=c78a89917a1b7c0fa4c6
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com

error[E0599]: no method named `data` found for struct `core::pin::Pin<kbox::Box<T, Kmalloc>>` in the current scope

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

