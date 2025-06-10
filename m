Return-Path: <linux-next+bounces-7126-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19BAD32E2
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 11:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259D11897169
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 09:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FCD28B7F0;
	Tue, 10 Jun 2025 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3VtcyUR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58133221D86;
	Tue, 10 Jun 2025 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549404; cv=none; b=de8hRrXKGJCmexxJtnt9QCKrD2epKpo21F5yesCLbkP1ZWdetH02/JQROE9j1FLtQlKmTSDfj5Cav9mcp+BrlQAniV9udIRkqz7BpFfsoNc6P+pQCudwiRgdE4vbg1l4ndsIXB4Zaqy3teSYIf3jMdr7Q9nIyNk2eixJE9Pw3vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549404; c=relaxed/simple;
	bh=Wmm0pbHT4UHoP8qp63Ir9hV/XZ5M4Hv1UaMdcp6adK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3rkhh3CQcQTSmmOLRVgjfALffGiV2RFJmyOV5dF5Sha5BzsOIDpIf39uXqFcl8flgYoAI3UVUoilea57LWkpNy7PgKZ/rtNhYAzpd98uHfDdZycAEw7hhNpP2MtShMWCC5v5zOmR0XyAY5huG1jgKTPCIE0eU4cAOhLLfP606U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3VtcyUR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235248ba788so6440485ad.0;
        Tue, 10 Jun 2025 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749549402; x=1750154202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmm0pbHT4UHoP8qp63Ir9hV/XZ5M4Hv1UaMdcp6adK8=;
        b=F3VtcyUR1MAoERk6zH24yIBXmXbLn4nkc58cFxgvbNxSdCdmzjOwsATRNqdqBSp9VO
         +52Twj7/rT/cgOw1vaZrsDig+R+Ed018lPvKTnKLTAmi41soaHKcoc2/qRvPsedHd3fU
         ifD6v4kSqUzB8fxfZRUEYOaBRBeS1VVxY7NI+mQiSkmwBR/iMWfLVZ7A78UNowDY+SU6
         oB/QgLY7UYHPvHaJIvl3mPaba7LJe6KuTb+ZzbrMda7TuMpDpEuguLbqlk6G/QMLUJN6
         k4jFJldifd3lBgvWXWZt6EV7Ab5kvpJn0lf3s1FyqUFjIoo1E1aAco3RFr5sKuRr4wvc
         ZgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549402; x=1750154202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmm0pbHT4UHoP8qp63Ir9hV/XZ5M4Hv1UaMdcp6adK8=;
        b=wraFVMRuzYfBrYDqAYf6XZPF03x3muSdYJuN9xZyL8vxoNPL5Ocnju+faF4bFSK/2v
         bpfHcE+ZTPIbZcZ4Hi1oynNBuFxnNmAbtJymDzwdW+WzHLsGS8k8M1OPVoqz0t3goU/p
         T20LBReqK2CqYv7ugKG2d5Ko03++txgYJwZ3qsJ5TQ/7HGDlpKWU2I8/n34upSNPseDF
         pjLFh5CxKV7ffV54zTXgUUzh+tjUtuQw0MGAQDyaOlZFfJI13rp+NsY3bXZMikmyS7WM
         5zabboPevcWoRW7JwGhMeY2LTr0tIUEgW1tKH7+l5OpAuZI4XmieQyotAxUi6xi2wDmy
         F1lw==
X-Forwarded-Encrypted: i=1; AJvYcCUqyhuGvNH48bsUfucp6hO4RP4BqNGuPIEN67IRZ+ffGa8aNOpiZV12+QEybBhasxOJy8ZMkbq2MI0e7PU=@vger.kernel.org, AJvYcCWyQGCnSGUbd94MKx+m6sPMuDeHKNYVmPplDzMJVbR38Q7nUUzzwPL/+OKHd21eRhM2tnluOEn4OvmEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7a8cQCDlvmJjhVVOCjF1AMfHg46J7lYP6vshiQ6+PJE1oh4F
	sOWrnZal2fiidrt6MQnfkroxo5qBgTMyz3SewIwv/CeO0eJuCYJ6u26ZAVLfb2HMkDP2LYk9OQu
	GDlhHEt3v8OQsueC0QY91Hu3EtwF/c4GNySa/yCIihA==
X-Gm-Gg: ASbGncs9R6jy8Po7wOx0ft/67ljPRc2b/Az/BuLvVQ8hw7O7eESYMrUnUSxpGyE8VOc
	n03pxGm4nqO55mLRzYBuNxle9HDPG4ObiTAwJkBEkgTliHPZeIiU4anma3TOh5nCtbnSbukpgmK
	ljBeeXqOXxepEsGQHJGrNmdqegvOSjKR3OTYAouZv8AXw=
X-Google-Smtp-Source: AGHT+IFbqEK6hx+pyzahKdgpa87fwhv2RwBW1mGCrvqjnmO/NPe9/M/LfXxipQ7eCjzM2bFKHEZEAmqRTRjUkgjst8o=
X-Received: by 2002:a17:902:f54b:b0:234:11cb:6f95 with SMTP id
 d9443c01a7336-23601d22ac7mr81848765ad.6.1749549402425; Tue, 10 Jun 2025
 02:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610142230.001af1d3@canb.auug.org.au> <DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>
 <DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org>
In-Reply-To: <DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 11:56:30 +0200
X-Gm-Features: AX0GCFtcW4ubBAGrkUsALWs26sB2MQDA3PZ5zNenT3l1emo1HSYJCwuF4WExudo
Message-ID: <CANiq72kowA0oNZQYLnQBZfgm2caS+3Fmq7h0jPT2RF68Fjgiaw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-pin-init tree
To: Benno Lossin <lossin@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:15=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> @Miguel, @Andreas, how should I go about this? Send the commit above
> augmented with the diff, or send a patch with just the diff to the list?
> Or apply the diff directly to the commit in the pin-init-next branch &
> rebasing (potentially adding an Acked-by from Andreas)? Or some other
> way?

If I understand correctly, the commit that introduced the issue
(0bcaea04244b) is in your branch (rust/pin-init-next), thus you should
fix it in your branch.

Personally, I would just rebase, since you just applied them hours ago.

As a maintainer, you are trusted to not introduce a change that others
could disagree with (especially on their files) -- but you already
told Andreas and discussed it here, so you did the right thing :)

You can consider mentioning the change in the [ ... ] part, if you want.

Thanks!

Cheers,
Miguel

