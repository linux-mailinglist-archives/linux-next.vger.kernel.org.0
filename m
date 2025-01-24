Return-Path: <linux-next+bounces-5320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41401A1AE14
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 02:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31003A67E3
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 01:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048041D516D;
	Fri, 24 Jan 2025 01:05:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C5846D
	for <linux-next@vger.kernel.org>; Fri, 24 Jan 2025 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737680707; cv=none; b=OkE5cK2/nbGi5UF3daxJ1kcPWVIk8dtxL0WX2/9brw8vx9EO3Fw61KfLlR9F8VfL7dnph8d6sd4MAeMQngrsdpslYuGvvM2dWYo3lt0/QXuv13jZeBuoTXqdt6xACgM3HDerVSQq2ZCRdfz2MuCzEeEsvYtKBNjZe2IvGJ3iFe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737680707; c=relaxed/simple;
	bh=5n2UF7YRFnf03Ob9UbfeJcQBrbpV5T8h5GH+CfYGw2g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SoiV/XVVdQxNqKNGj1WgVD5yhT7yosywLCYhOq1Sm9yg3hGSpub4AF+BGpkKkPQe/h8bNbO4t9vp9cyt5IVQaLYdIHLhfMjy3c4wAhcyI9IhMSDMaah8GjPf5417iA5XUwHIw9hIwr4P/DTCGu5RZy7JmMtb6U6doEuSG1Qkdsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-84cdae60616so105391439f.3
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 17:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737680704; x=1738285504;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnKvFaFjTe8h96vEhXOTTIMabXuYO8T43twYxRKmYwE=;
        b=M57ldK5QnBvzR9FmhKLhOP/g6ESi2oXYu17a3qJEabLNfQ5yFRwItfQ8eV3iNLz1Xl
         BDe0v4+X213Wo5jDe+israYVHkO2HTi9K+3/L9hjuaCz9516rboCRrqHXO+DjuLcHAUl
         jeHT7WMbgCvsqOacgR8+wroIeqGXwQFDrMV2DupgcE1xbDwAw2X24KddPNmNfIipwa4o
         igrTa5Huda5cqg80HlDcSXY68XiM9RkxaPDeRCOxJAo2yqkasV7u2kmFhJYPXS5A/VT+
         NgTzJw6qdbBMLswuyXSpI7GIesqsT0hqrVX3PhvVpbnq42IdALsMUt7veHtVNxGbQePZ
         qqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD1XvdBBe8C+vJMIQ05VFxoufIk/PrcK13n2owFMV0EYkAIFjFqsdOYe8e7jbyreRW5i2ILjSDUp2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxPAR6yDRXpEHJGEtLwvkD5lu4lR3gEWFcN0/Plmcxmu9npUDsj
	sZTlutjSIu7EIT90rjWSJHfhCddGF29LLeZmSpkY3pAvpwgOycfojM5IwJ0EwhlUc+tnW5woLN3
	M5xsCIUkBJSBFTC2UbYmqITv7WrC9+HHnEaOKCIpk1daLizl53/M9Ir0=
X-Google-Smtp-Source: AGHT+IGuczncQwfCe9HqD/JNzILm4cM+iF+Sc+8gaPQHcK2rO+KdYsGoKPKhcRBJWGztSTIkN2A+hCdUUWydN2oKbpWJod5/OjbY
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4811:b0:3cf:b2ca:39cb with SMTP id
 e9e14a558f8ab-3cfb2ca3ad8mr79189405ab.22.1737680704229; Thu, 23 Jan 2025
 17:05:04 -0800 (PST)
Date: Thu, 23 Jan 2025 17:05:04 -0800
In-Reply-To: <Z5Lcvf02wNt_CHsD@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6792e740.050a0220.3ab881.0003.GAE@google.com>
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
From: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	dualli@google.com, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, maco@android.com, 
	sfr@canb.auug.org.au, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com
Tested-by: syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com

Tested on:

commit:         970b9757 ntsync: Fix reference leaks in the remaining ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ef5646cab25e74a
dashboard link: https://syzkaller.appspot.com/bug?extid=7015dcf45953112c8b45
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17e5e5df980000

Note: testing is done by a robot and is best-effort only.

