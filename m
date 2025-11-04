Return-Path: <linux-next+bounces-8814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840DC3043E
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 10:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A9414FB8BC
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F23029D270;
	Tue,  4 Nov 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tY4Qw5zC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BE34D3AE
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248190; cv=none; b=d2pVRdMq6QgKhptoiY8iC38DEdEWz7aggggwtQDXJGLtypnRxeEhvE1UQOaDo/inIY0IHkeMDlTMMLiLMcZyEDyKZrTl4IVIX5akPVsGTET0rdwX7orBXcAtHm/aPluFk01GZ4QDGBemA7cSlz9i4zajjkOtEALWqzqmQApK3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248190; c=relaxed/simple;
	bh=Kl3ymaOvdEorHq/tMtguwV4BY2XHxKvD+d5JmI4NcA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdA7NYXF/YlL7pR6yyvURFV+CVIFhJD/GruWqPNQPULVIj6XWMnnE5vQQwmc2JKdjPlfej4iWx3WuZhIxc8zl1Qcv5sn2HjKpLmsAMN2WKlDtG3vxS9EvVhcZ9XuHlh5x8rrHbTUTKpQoSRq8gXHlR5TzNiLpY6Qu1Z9ICtYcfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tY4Qw5zC; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6504c33afb1so2920979eaf.1
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762248187; x=1762852987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uEcY1THHyfzqAcDD0/EuOc65ogk6e82VPZCm7JWUeo=;
        b=tY4Qw5zCGke4wX7tr3I0xG2ky1UINjUxh/XFUfqos3pdtBoT1okR7VUUeGhwH/pXe2
         eq3+BJDZqiuZrkjmd/gSHf8yv9BqjSUNg2RY/OYL5eECInufDU4/6/PVKcd/JWysv874
         9IIDbCcZX9978qJIAoG77R1zXqkLRd2ZjN+j7YqV7cV7Zw6YrUicAG3JqJ4eXjZwBaST
         4iz8F7lHSOcEYU9hn3O/m9MVtqtKeePXW40SLVXxs3y04ZN8WZzKQUoTFHZOx14bhZ+q
         RtQJ/HdAl3AgB1lnZcylVNu6BbFYrk2VFHmHJktQDZ15TUDnta4V16C2s1Cya+86ZSwt
         B9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762248187; x=1762852987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uEcY1THHyfzqAcDD0/EuOc65ogk6e82VPZCm7JWUeo=;
        b=p8HdEEo6dex/RIdQZaHHTrYRHchr/lyIpnoqTS8GiERwwWChLweQySWB33pY/6KMM9
         PzA0ea3zb8ok0FPkf5smrhzNvbFZKLjhGwPc+2E3P9ZENC0Lh7KxTnCLOKsl8y1Uub8P
         YxR6eAf8rKEFwye0+X7dngqo8++Ghw1uitHAHfG7x6ren/PpnEWSbnINJc5BsIt+TdXa
         pDqyHhMUuH5dYg8LW3/wIleqRACt/BUd/i96+6c8FudfrfYlMbOZA3zAVcqaDoZXW7/r
         yh5umkn/qbUsCYCdt+bHDhwAmqChnwDE38Hfc06xxv3TWOcdx3PS5hdawQVWfGHst59o
         NzmA==
X-Forwarded-Encrypted: i=1; AJvYcCXvNd8UHkyn6QeKvWnIApd7aGmjFYf3kbb7nXigCIBaOtxFEOmOT0ShzAb24ORDV0w6XROHUhSgi497@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuezqIpNoAGBrY0+FPkLyD0xdiZqGqqod4G7X96u4jOpHBH2n
	QZjf0ihM1kijbPCJSbKDLoUQw8kUxamPJoA5KmZiVg2mSEmr+Ce+9U2RbNMl6PEYSpnr8CksQXk
	3WFnbiW4eH4sq3564H+RUOPrX9I7RldleDJrTbfyX
X-Gm-Gg: ASbGncu3LkiUiIpff0ZCvbp4dH57ieejfuZsuWHMMw237r9qd12QZbm74/NbdOS2hqr
	36e8/UNIa+0lK1yDLLi8flgV2HiD5VpExUve3JIgOgTvKCzFrF7DkzUK1g6qtkJiOKkgq3rapz0
	8eLkfK3xak96jB0z3R3lu0Q+HhN0mwCrpfS0NRVj+eY3+XzYXqhrB/gb7K1+262bg7h6wIozmL5
	XCJhUcH+z4UpDhNJnIEvwXpCuFXvmvurOZK9qc+ISaZGpy+49uuWUDla6co2M0RPfAnAkGgx7xt
	faB++QiwTNueZddCMDc+yZXMAHiyuUfJWpEVXZhYf0MwlhlxsYaZHKH8Dqd4h1Tp2nmH
X-Google-Smtp-Source: AGHT+IEAsy+Ag+yaItapCExK24GtCcf/j8K63MuNbVIu7hQfCrBcuGDModsryJjrA8zmOkQf1hkkbI/HJmgX9pS7YQM=
X-Received: by 2002:a05:6820:4cc9:b0:654:f93d:fded with SMTP id
 006d021491bc7-656afa9f1eamr1006743eaf.2.1762248187177; Tue, 04 Nov 2025
 01:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6909c4a9.050a0220.98a6.00a9.GAE@google.com>
In-Reply-To: <6909c4a9.050a0220.98a6.00a9.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 4 Nov 2025 10:22:55 +0100
X-Gm-Features: AWmQ_bmGQf2nILT2ScyTlAWpbuk9uek2__b997E7Chd9LCNJiYdk3ZcAgWaVrbM
Message-ID: <CANp29Y4L45Z1OK6mS2rGwHmA-0CP2a0qD7G3NCz=CcbqEFNUyQ@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (24)
To: syzbot <syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com>, 
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ rust-for-linux

On Tue, Nov 4, 2025 at 10:17=E2=80=AFAM syzbot
<syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    982312090977 Add linux-next specific files for 20251103
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D110f817c58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1cf6c387ad3e8=
e7a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc78a89917a1b7c0=
fa4c6
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b797=
6-1~exp1~20250708183702.136), Debian LLD 20.1.8
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com
>
> error[E0599]: no method named `data` found for struct `core::pin::Pin<kbo=
x::Box<T, Kmalloc>>` in the current scope
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

