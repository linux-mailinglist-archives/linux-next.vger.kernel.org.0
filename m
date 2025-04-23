Return-Path: <linux-next+bounces-6354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC0A988A2
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 13:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128515A2F83
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2C426C3B0;
	Wed, 23 Apr 2025 11:33:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDEC2701C0
	for <linux-next@vger.kernel.org>; Wed, 23 Apr 2025 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408013; cv=none; b=Y6irZzoY68utoNog7hL+II0gSRW8MuSzmQJkKD0Xo4LWaiF1SkIArhoaWcPLIzOPSUrlxIQKUuM04explRZhP96B0bZ4uwrrtvAGNg1tNujpyt5Kk51skqdl0dQKwl14tjJPXhbuPItQ/0kI0Wj8wAexKniAF+cv0KFR0H7JLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408013; c=relaxed/simple;
	bh=uBwNBy6e2qho9b1KDPMVFZUc5qPXPIPJiqNey/PPKps=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YaqInVq4WMvy8HH2dbYEGea0+csDOOCU9t+ux3dsNLKiOQhHCOaAdIgFqCqk2TkIL61eJSEB5h2Qf3hXVigxuxI7KvX9PjWSNRSMPlUFh4wBjMzx1eLrlJT1U+gK3haiAvD0jUqykLMLMzfREMeDC14yRnxwdpfUPT04NEMxX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d81b9bb1b3so59446955ab.1
        for <linux-next@vger.kernel.org>; Wed, 23 Apr 2025 04:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408011; x=1746012811;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=by7DrroduhU0kTQwwybJNFfys8OUAmHf0NUzuH2xjiY=;
        b=ZZ5XSsWE/XACslJGiTz4/h24KBAbULUCpGrWXcq9+anRreWo0sZBicMP4y8+UMiBdh
         h36pESiGgcktBClYo7yeTbikkoXU8ocO7+HvHi+IrZzYQyCQi4/vbTt2mskFGm2oti2Q
         AeW9p/BQZ6uOKVzJFTErzCZHDTOXX7F8q52aXmFkAt/U/I+7cTqyxOzTaGoGC+ruVzDC
         eQFnhOqhnQSU2MC4QiBAz92OFfeeSE876Iy8335lzp6RMOjVDc/VIg8G90GjwsjCSdQJ
         yRkHHvXk/IvjyuFvGREUf+cm5f2vMYH3PVTivRCA/wBJ52krgIzVW+c9xPNwqC1w26lg
         bVow==
X-Forwarded-Encrypted: i=1; AJvYcCXcLJLps0uQWqjXX2JcN2yUhQuY+0zmS99WJIQI6X9vMBnY1YttNa17dFe5H9saWzvL11NfrvVZnPck@vger.kernel.org
X-Gm-Message-State: AOJu0YxE29p0DvTu+ZGrP3nLDKDz5bNM7FdE/pNWkRJWNXXgNiBu+7Td
	7a2bqs40q+mQThzkAdZSj2x2Cos2Xw8jqpHO0X6dJYMlHRyglNc6EJIIYCdvEdAhK89wgJcLmmw
	dlvrhZXcScgIMbjsj5BLZGayTf13W5iyhkHlat3RzkQPily2KCdDuFcY=
X-Google-Smtp-Source: AGHT+IH8Z1AWTNurHAyBR3YCwTMX3e7pCDleTcSFSfT+ZBs0txTVUHOkllnBcX+UFTr7EU3+sYzIxheCCwniFk01/8NLkRZS0xBN
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr150959195ab.9.1745408011006; Wed, 23 Apr 2025
 04:33:31 -0700 (PDT)
Date: Wed, 23 Apr 2025 04:33:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6808d00a.050a0220.7184a.0010.GAE@google.com>
Subject: [syzbot] linux-next build error (21)
From: syzbot <syzbot+19396db90a543f153fad@syzkaller.appspotmail.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6ac908f24cd7 Add linux-next specific files for 20250423
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=160e9a6f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3bf8ea2b5f8ef14
dashboard link: https://syzkaller.appspot.com/bug?extid=19396db90a543f153fad
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+19396db90a543f153fad@syzkaller.appspotmail.com

kernel/dma/coherent.c:410:1: error: static assertion expression is not an integral constant expression
kernel/dma/contiguous.c:497:1: error: static assertion expression is not an integral constant expression
drivers/clk/clk-fixed-rate.c:197:1: error: static assertion expression is not an integral constant expression
drivers/clk/clk-fixed-factor.c:379:1: error: static assertion expression is not an integral constant expression

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

