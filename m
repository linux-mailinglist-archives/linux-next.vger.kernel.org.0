Return-Path: <linux-next+bounces-5344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5FA22D94
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 14:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5FDB16806D
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020781E47D9;
	Thu, 30 Jan 2025 13:20:24 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B301E3DC9
	for <linux-next@vger.kernel.org>; Thu, 30 Jan 2025 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243223; cv=none; b=gnoTFe134KpIxd7sh85+RgKJROXu1cJMCX/RpoeTtAITkUyMa5k51cbWbdmQdSxV/CVe2LqGpEWtb4jbSwNH661npcUDWlYcJGwmIe6MMfJDd2YeZahGeA4D033t6LDexA6yRgvtgpx/ckHkXMMfynqqyZEj5qX51vAXu5HPp38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243223; c=relaxed/simple;
	bh=gfNrwLh31RJ+nqCVy/pGNDN/uYfgux1yzAMDandeUvg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QpTsqU5NqQ6vjtr76EWXU9HhWmP4mbIsHwf0bn4v78TtObhtxDZRIAIrc/UNjyCyqFc8EO9jqo9JUbi04LA0FrWGrk6W7tLiI2Y819pr7GGcZJ/CEgsC7t7Xng8aNLiwLeWGPnb7+lo5eAc26IpVGYWbRPJK/0+1UQVC3JcybPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8498a21afc2so47487039f.1
        for <linux-next@vger.kernel.org>; Thu, 30 Jan 2025 05:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243221; x=1738848021;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wo5+/q+lEeJCbAsUCbSQ6PYEetiAqRpvHNIHfpexH7U=;
        b=LXteM/pTgAe6/DtOj5072aXMX429WXYIZNSclUmmh+IwdfibbLZI5kOGAdMX2DAJ/7
         eink3GNWcecPds1pQTXTclUJQpakqZmLzkYxo2jYe8Wh3FKrMAgMzAXUUxZRNdMtTfEb
         8DzJIcY85WMqgZrCCjUxsJTkdFpTu2UFuL5cwbfzPX7eYDaonJT6/rLT6vZXa0K0OpJp
         E3oO6SXthzJ8rC5d7vikjelSBXPKgrFauNpRu0nAi5j7gdZL7IiZXtVZDSKbbFqpqqSX
         RAjnOjJ0ux0Jm/Y6HW9yeeRlACyQtMnv9IH590S0gSSgkZAEMiwX6SQawN9YVUnwkp/1
         H6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFO4PXkEIJr7zaFISFUKGvimoxd1oEPBxYjGLGy0NtSrMMPQAUTk2VqCA2WJ9vpvxHeJIEa//8GwYc@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhD8drh21VZMIL/ZGKmSLx2uRUpk0GYBAeuSspuyrmKyCztmX
	CCaWeXtZnaB7aAmS8NeB19AubQvoJ0dX+1A2kkJLYg4+yXJZ9mje88yT6hxjHXNs8wgole3Gts/
	NC9YnTDtXfiZhciD0lZUmjcUVisc1krAjo1Fux8CReFTZB/DBcTLUq5I=
X-Google-Smtp-Source: AGHT+IHViKgfvzY1lTUxx5aoCaO55RBgNQZZD/mrRkMpBCCo5X1rpdex8BU1V+tHAnGxZUyINIEsHIo7xLys7ZnK/MTLsOYfYmjE
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c84:b0:3cf:c92e:b3a9 with SMTP id
 e9e14a558f8ab-3cffe6b8499mr62911605ab.22.1738243221306; Thu, 30 Jan 2025
 05:20:21 -0800 (PST)
Date: Thu, 30 Jan 2025 05:20:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679b7c95.050a0220.d7c5a.0014.GAE@google.com>
Subject: [syzbot] linux-next build error (19)
From: syzbot <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org, 
	samitolvanen@google.com, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a13f6e0f405e Add linux-next specific files for 20250130
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10221ddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3445081dab63716c
dashboard link: https://syzkaller.appspot.com/bug?extid=62ba359e1dfec1473c57
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com

scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No such file or directory

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

