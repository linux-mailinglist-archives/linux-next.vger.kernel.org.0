Return-Path: <linux-next+bounces-5362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83516A25CC9
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 15:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 129851885364
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2625B20AF9F;
	Mon,  3 Feb 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hujdu8R1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137D20AF98
	for <linux-next@vger.kernel.org>; Mon,  3 Feb 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592970; cv=none; b=Lm+LmEhwouYW77iJieoW/zoO5SQbZE6l8Q1EwfPgsB2JGY4Pvo/F/dkoXuf+DDHoH838/+ziQccPiEJpfKV1LYUmvaoavusm1deLnD4gA7GyYeGCD3nD1aPjCXj5fZgOHQGqkh0spOcu2rPY9czdihyj5XSgK3aqc0ErpDEmRNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592970; c=relaxed/simple;
	bh=9m8yHZ/xq5yo0/XbH7/aqq4u9pNGQdOz65IFgXD4ngc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWS8flCFJ3qpFc0j/cXBJTs3behTy/xXIBNKQqYxPv5RaMN51yXRaeup9tuBfqrF2rGkHetpre09k3TfFTtsIe8xMPRCaohu9mNJ78+Y3msv8Khhya/sDspl4TGXcalx/+DaXosrY+UUThSTsbGhYaPScfqmAzjQu9SBqUzeREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hujdu8R1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso6533777a91.1
        for <linux-next@vger.kernel.org>; Mon, 03 Feb 2025 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738592967; x=1739197767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TXQsubBdw/wAjD+eExfN+6DFOSabStRe5P1g6XNmoc=;
        b=hujdu8R1O9qNpsdzrOwHRxOLXPMH8DJ2d56btPrYgLT4SXT9tq0Hxh+lusm+N3tj+f
         Wk0xieV8S0ZMAVNfq7gBnIP3NiOmJBLPhA8WGS5CG0geKQbgXDqaF/ajB2gqK5Mb6pOp
         +dD9edusYeci/0WMQcGINbocDf+Vih26X/wCS44BVJTGTHR59QxBIWrWmaGEbCSWqZ+1
         TAU80zW/o7Ro9ELvVNKTk1Ft0rfRfi24AA1RFhbYLF9rIEMLo0Q01RLt1djmBgFktunz
         WeChDkNI8pdKNVxUwvojnAPnrzx2wzPOeXE0DeLMUrq1909YDBvvE4DwaRYBk4Bq9nnC
         uhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592967; x=1739197767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TXQsubBdw/wAjD+eExfN+6DFOSabStRe5P1g6XNmoc=;
        b=AgrHC2K8JOHpHIuqJXr42RDuoR+EX2gGgOxoKmkqGjmsNgnLBh0m/1QVoljJEhgZMI
         wXqvBvgLfoB4LqzPE5X6y/BK1iGosDMwW207iayLpzKsiSCp7HW4VkNzrq8R3HMJlKC7
         zhCCqhMnOKE3kOzXTBehBZxOWqkDGo9XA931K+AlsgkQryAviYhNtbDPW3+JIDi+9QjK
         O1CHK0Y4CdqaZefETOUNLfU6bgefW4NPp8+IoL2y4lMAkdbfGuA+92rCLjHlcdH4L2Ss
         bx6VMiVcbnazGqV1g+zfzS1wAi1jRsCgLFggU6hozQBtfqrFtQqpAa96SqQKGLj2AT68
         dA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWSYPJpFKRoHsGmVgJcrm3TazNit9HeNmRey/G1YFIp5AStnoLcwas9Rko4VqV8OByclGZPoodemvz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRsUx5RmyGq2CSkPjVfGZ2uAl20yyIK+G/T6pRjZhG6Uo9q2Oa
	qJXLiE/hyeSNNC8CojjwWf4kvcaCiMEWpRBNujkP2Aiq78iPtzUTOYhwR39CMp1SMTbp2cF0dCh
	R6rzsrDKA3qS3EW1fGge5oDkgbk82TjV1Xvkg
X-Gm-Gg: ASbGncuPpiAqLaHykhOUWwUwV3Z1Mv0vtyFuUj0sb23JlRQu8RkDXuyuLEBi/FnpHZv
	ZWwSjpIJzlwH391ZvU21aqtrcPIyqTVicqB4gDPMZJuit9eq7fJyoyeViAUcOTrFsjdlq2fYiq6
	a+OXR8IB+EjZei1qrD3Qw1zH5U2Qg=
X-Google-Smtp-Source: AGHT+IHTruQTFbormYFeQIcy728mYS1bfRzzv7IZB7Q85ek/7/F4gYieXONEtPMPRoQtGfxVcz+ogIq1MUlcUYn+3Jo=
X-Received: by 2002:a17:90b:2dc9:b0:2ef:2980:4411 with SMTP id
 98e67ed59e1d1-2f994e6d108mr20498323a91.9.1738592967383; Mon, 03 Feb 2025
 06:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <679b7c95.050a0220.d7c5a.0014.GAE@google.com> <CABCJKufpND1qvBhUMwpJ4OE7Umo9EuaNTLOi-GmAXFdXRqhoFQ@mail.gmail.com>
In-Reply-To: <CABCJKufpND1qvBhUMwpJ4OE7Umo9EuaNTLOi-GmAXFdXRqhoFQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 3 Feb 2025 15:29:15 +0100
X-Gm-Features: AWEUYZkbZyGsg2KJCSYTFl4vhroH4GwPRZp3afld8aOLFnVjuqncctYVhB0Hf8s
Message-ID: <CANp29Y4OWo1ebuP=1B6O_Qhhg+YprW899s4PpEs4HVpvKs4+jg@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (19)
To: Sami Tolvanen <samitolvanen@google.com>
Cc: syzbot <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 5:28=E2=80=AFPM 'Sami Tolvanen' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Thu, Jan 30, 2025 at 5:20=E2=80=AFAM syzbot
> <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a13f6e0f405e Add linux-next specific files for 20250130
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D10221ddf980=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3445081dab6=
3716c
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D62ba359e1dfec=
1473c57
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for D=
ebian) 2.40
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com
> >
> > scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No su=
ch file or directory
>
> gendwarfksyms depends on libdw, so on a Debian system, I assume
> libdw-dev would be required to build with CONFIG_GENDWARFKSYMS.

Thanks!
Adding libdw-dev has indeed fixed the build error.

#syz invalid

>
> Sami
>

