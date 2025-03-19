Return-Path: <linux-next+bounces-5876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D52A68483
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 06:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE747189F262
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 05:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C5424EF8A;
	Wed, 19 Mar 2025 05:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anjnhgmp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873824EF85
	for <linux-next@vger.kernel.org>; Wed, 19 Mar 2025 05:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742361057; cv=none; b=g0Sd9URpTCOxXvvS2Fo5k+Bcekfrf3EqPfvzcLhbxAMESm330iHP/LhqturTVf4YKn/cG87VlO7/htFp8c/4RBQqligY5M4BSkmI7ynKr7IiRawS02X5LasojiCZqpy2Aa6iWL+BcmlwdSDszFnpW7nYCaPWh0J/3w33C4hw7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742361057; c=relaxed/simple;
	bh=+RdiNraqzQ5LRn6NoE9WzXl2qsV8/YeCyb1zRG+8xn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8ZcoEJ/qTHu5CwjBHkZJf+997tVuOtkzKqB8hXBP7cXy6TqD3b3raHwxjDKenzwgEULlD0rb0pU3ozPAzwZyB0VRAFfRDCzBfev363gmfdJBKVhPn8gUMcMYg4dl0wkzVFWkxnO2rB1mPjpUFJCWHZGTCrm2u+lb+6z3KGZW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anjnhgmp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so8264393a91.2
        for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 22:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742361055; x=1742965855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMzGfQs6vuXpVCFaTFm1aL0gd7m40j7hpQkBujJ95pQ=;
        b=anjnhgmpOUhWbZSlV/U6RAU1hrpIP0UC6RghQFNHXqpKIDKvrSG2xMAS1b/OEGDTzO
         G1jt+NNhNVLYeoTDihQDR49WoFpsIg6drRELVBrfLX12Y7DCYHZFJ2DbE5X+ePHh5z50
         syxn9X3ZokhyN6Daiim83hA14C9Y51DPQI4az4nMR+Mn7u5bgx4nLcHX/neOwLUTgdB4
         d0JI7HilcjAZKEFZvq30ksIvcWnqPvMe64FEoeBmC15jcYYZOHac9KkI6TVOyBm89s2w
         Ufhv9gK2LJoupQnpvpKewtlNTANPCVqPnauX+GK1GNsPZ/55zQwl4spFrmhDZd10EhQ0
         syxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742361055; x=1742965855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMzGfQs6vuXpVCFaTFm1aL0gd7m40j7hpQkBujJ95pQ=;
        b=PUTuIWylBjB5PtlmQ88khntb6BkNRNw+pIen/15GDqZMyEt5IOeqRf1h4dU5+4vh8H
         zX9usHVjTJU/vj5BZgO8sNrm8tsE0OD1bEkV6eCQVDwKIgILU4JPZIxig8DeTADsNGEV
         hnY3TLQv77zHEDcHsfZIidROi645oni9hJjI/qVDk034EjATGGRfP4DuGMl6NfmVikGE
         s1kr/o5sVqpXBfzMPlFhAqNDHqoxO2AzsU0XOlm6EhgXj9WiYD8nwO1Fo7gjnlq5d8Xy
         PF8CdR7G1qhMw24j26tib8nZXr2dq7BwJX0ZIYT7C2Igrg1ie5VCM4K+xStwm4q0Rnph
         4uoA==
X-Forwarded-Encrypted: i=1; AJvYcCVn53wlpTn3BsYOc0YeJkr8G+G7kg9nigwSh7hYhjvDv9dGZwxHPnp88PFnhmllshkukHnbORSiR91h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7Ynvgmqga51SQ+Gc6zZsxUR0aD/E9zVNYWfC5hjMAKEeG/84
	WF0XmqvO25pgQ/Nir4NlXFQ8YgiDkudhCAiqomwvrO+JHU/JbK+cJxp29j9/yCJTIJ8AYsd1Mq1
	KYfZTQcuQhdpWy5OXWgWXc6sB/5/39LGE4luh
X-Gm-Gg: ASbGncvNNCsaZXE2KMNjawHGXJTS9Wp+gPtMBul3M1+BC5xJnQH3c5hc8SsK493kqIp
	desUsn6HRt2VQP7WCDaMMWPAl4b9+lGkQCcRvKyJKvxAOxeECszUXDy8xL8bRw3hzuspyk8uZe5
	vpp63lA9i/C1hf62AK3r0I6oeDRXOwetTPy2I=
X-Google-Smtp-Source: AGHT+IGC9KiCoo5cdqU/hWW2POhQr9hqyDJZ2CEU177bGBNKSzOv1YHHFPcq1ojEzuO3AlqI6Wf/QjlU9ILJKR6cUx4=
X-Received: by 2002:a17:90b:2541:b0:2f2:ab09:c256 with SMTP id
 98e67ed59e1d1-301be2341edmr2584841a91.33.1742361054821; Tue, 18 Mar 2025
 22:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com>
In-Reply-To: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 18 Mar 2025 22:10:43 -0700
X-Gm-Features: AQ5f1JrGKsBTlQOOVtqaudGfn2jZIztiGHxnCWE4tMmF_rV_zUuBZWrrkUqx7Mk
Message-ID: <CANp29Y6MOsEyXmR8Z_aA+3xQMQQFSWzsGfJUXohdeN6fG6EwRA@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (20)
To: syzbot <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com>, 
	brgerst@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 10:02=E2=80=AFPM syzbot
<syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d4b0fd87ff0d Add linux-next specific files for 20250221
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17a5bae458000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D76d7299d72819=
017
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D06fd1a3613c50d3=
6129e
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
>
> <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'

Manual bisection pointed to the commits from this patch series:

[PATCH v5 00/16] x86-64: Stack protector and percpu improvements
https://lore.kernel.org/lkml/20241105155801.1779119-1-brgerst@gmail.com/

Brian, could you please take a look at this syzbot report?

The latest build log (for next-20250318) is here:
https://syzkaller.appspot.com/text?tag=3DCrashLog&x=3D10a745e4580000

It failed with the following error:

<stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'
EXPORT_SYMBOL(__ref_stack_chk_guard);
              ^
1 error generated.
make[4]: *** [scripts/Makefile.build:335: arch/x86/entry/entry.o] Error 1
make[4]: *** Deleting file 'arch/x86/entry/entry.o'
make[4]: *** Waiting for unfinished jobs....

--=20
Aleksandr


>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/67bab9f0.050a0220.bbfd1.000e.GAE%40google.com.

