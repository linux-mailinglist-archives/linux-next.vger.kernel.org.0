Return-Path: <linux-next+bounces-7557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C3B0594B
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 13:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 374007B86AD
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 11:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488C02D8DCF;
	Tue, 15 Jul 2025 11:51:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9F2DAFBF
	for <linux-next@vger.kernel.org>; Tue, 15 Jul 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580296; cv=none; b=jOSByB6w6UR0SZLZRFV5wJLrAKw/3WyKU4pwPU4mdLy3sjbtVOPvCOdrWsTMhcCfKg0sqao4k8764KEvR+RHO9gIm0cPvK3qDNFTO+wK1YIy3ucGxsdVX+wOQ3W4tHqkjwGMCo/jFm4XwA1D+pCsUfIlG1vP1oiWmlMMK7qATwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580296; c=relaxed/simple;
	bh=GmhpCEG4qUMfW8RoxleRuA3W4lkoGRHoCBsyS8bZRbY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oRRqyrsxQsakel8fBKPsxlf7M5noJg/wz4CM4VX2mpOz5CJ5hK+V9gE5s5V1doeQcIv0spuKDzEChJDYtMBAg6tq8e4f/QZMbTvNyYUSAfDyHIbl3NpJ/MTPacfmR8DTgt6amIqsUrdpqwv8ubeakFnRgMAjwevKC/CoSPvZWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cfccca327so1092852739f.2
        for <linux-next@vger.kernel.org>; Tue, 15 Jul 2025 04:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752580293; x=1753185093;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uO2uDfrQRAWL30TgZ7ybfHbshDOPcxV7R2jrKHhQH8U=;
        b=fxxR2sDhqqAAdOGr+uSuj0QJz9u8swu1q4UhbKI8VWCWdHbFS3onl81B1Mm52Ba+TR
         P0hq4RAPZkWVHUBJx82onlzxdbcS0gIPzdIGriSPuSLq6SH3myHBx42jA/TN8LdK/1Fc
         +PutblwxQhXCgztyVNbuI9w/7hzzokaesODkYFvWeEznkSE6nXKdWrtCzXGNQbMXhtvm
         ntQ6jvhUCaAJSqRF/O0fJ/t3GpIMgSbWtyTR4A/svrPT09I3Hz1gRDbeXdAGeKSerSpm
         KDepwNfsTH1rxP3K5xP84bfi+0LN7YTgSQIOG+Pru8L2uDLn2HJifjv0En8IfeYPVs2K
         3d1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiUaPb9nkGxszO4FhHHNE9Vxxb2DA5vfEHhcrfATJfYrBwVjpZ3GC95k68mgCNZRWsNWaZ3xhSC/cN@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8w4w+tL2elF8DtwU52n1McQrK5Pa3A9KDZvIDOEp697y+jpr
	M/sPPz374sNkD+vitmi2QeE4IcQ6Id/e2cqVu4T7onbY7pFCgzowytydxfew+1O275eE+ECI3wV
	i8QJvmDuFWnzbjIX8s7twkU0SiqRMCVm4F7sHvu7qvdI0fionksWz/d65o7o=
X-Google-Smtp-Source: AGHT+IHRXFdwr2RFwIpq5oGU17cei1FMTKfw0mOwWO/Njr7Z/T2o1MMZQLb1h1xA+MZUXQfnK6S/eMaF2sbRQoPltze3NUoXn30R
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d8c:b0:876:5527:fe2a with SMTP id
 ca18e2360f4ac-879b0b31a9cmr291756939f.11.1752580293516; Tue, 15 Jul 2025
 04:51:33 -0700 (PDT)
Date: Tue, 15 Jul 2025 04:51:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687640c5.a00a0220.3af5df.0004.GAE@google.com>
Subject: [syzbot] linux-next build error (22)
From: syzbot <syzbot+1bcef6d2f176c7d376fa@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f2b1f6a9f382 Add linux-next specific files for 20250715
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1057698c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7b0e60e17dc5717
dashboard link: https://syzkaller.appspot.com/bug?extid=1bcef6d2f176c7d376fa
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1bcef6d2f176c7d376fa@syzkaller.appspotmail.com

fs/bcachefs/super.c:2269:3: error: cannot jump from this goto statement to its label

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

