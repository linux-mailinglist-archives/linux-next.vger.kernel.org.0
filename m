Return-Path: <linux-next+bounces-4714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF09C26E4
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 22:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B811C22C9D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 21:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675BF1D0F6C;
	Fri,  8 Nov 2024 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRKL2K6h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FC233D92;
	Fri,  8 Nov 2024 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731099945; cv=none; b=lI6NoG7u+iXiSn150z8DkV2JoDz5teuvvPmNgaiWpbLe2PE0+BxtB+b3QNPuFsVFNh9T92Tq8Uq8qJ4fMSduzNyWMFU7F5PP/bskP1i3nVf7XnqFKPG8KvC7GWJkFRBnOqOQa0oeQN7pnTa74d0TiCUTmxCG45KLvspnD5DX0/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731099945; c=relaxed/simple;
	bh=/KHRFjkuE/A9C0WJxDMVSW1WywPTRFQXWtQZ2q5dcwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWYtAZM2S22/xc5CIuAO8fbRyGbrKjKjSja4anrw+aZh3YBs7EDBfHQ1O0+GnuSBUq/aZ81UJtWSazyfK7hlU8jepwzsCtsrT1Uf3oESuQzpPrvhvl395KmhiTr6htGIvDbSshQeeeKSjNtyAe9Wgq7c3vemSrMcAqn7bZPQiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRKL2K6h; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ede26dc527so383447a12.3;
        Fri, 08 Nov 2024 13:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731099943; x=1731704743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwfI1+gidb4OWd62usyzOyDsH2cgtSWFP9TdDL/qVTc=;
        b=iRKL2K6hiul9V/SP4omiL34F/v+FM1tSeT5i9hN9u9rx1HfnbSfJ9YzOpRxAMVisCS
         5wqdXIztWPxIF+4k7hTmD55SiguJ7a329NNKFmiNcY+yqnF0fLxq2XafdhWNjnFjHuDL
         JBUXHeuTxVuyIpqUgFKva7si/Ngz2l6k7O5XYSIa5cp0fsW/Ayi0qGZ4GRKxMFIp49eg
         n0huoI/P9gqMY1aDleW6JuRodVgMrev1BjYvhstLnFgryiaHUAlz6Gm6amd0u99Pu3Ez
         vhvtlg5SZ2n+7tjrZ41jwvSD2MLUJQmQWc80KTANyE5tvBUegnoLomeJKcZp9nP2NQIN
         HbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731099943; x=1731704743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwfI1+gidb4OWd62usyzOyDsH2cgtSWFP9TdDL/qVTc=;
        b=P3jjFZQM+v/TGYC4/hSCohQHKL8ngDP0JlUShLzXm0t9hrStQ4zfUD29hltJ4jIYbl
         gBKUsPTFTLi/YzTtMTudem7uV2ccCADrRkBMf4ij0DILguY9YA3kXd0E0JiQ9SAUkOF9
         raDZOlk1eEnM8zFVFkEmfobpPWBsVclQtwgCzAUJDCw5hGRMFLuWXznpe7hdj8NeGKyp
         4VKKEOWiDdIXtuG55fu26dAbNhbACo2no24jkYV4OAOAWzo5TuD2HMLmT1hDzLVPz7xY
         fLs6ZQCIbnHyMl6SzbPYWUF7yDs7R1Tq7lcApNfMRqMr0DKZzWaFo/eF1CpUV0tnASrp
         7wYA==
X-Forwarded-Encrypted: i=1; AJvYcCUE4ZBKNUSZ4Iu9VJN1ojwh0VjiHGixLqAedOjaOc4gZXfhfSamjJrjY2yaGghCSb39qC8nkXSFfXpFQBRWGqE=@vger.kernel.org, AJvYcCUcpseySPrWG2UyOZXLgP8zZHxAtvkGmSC2b5cMLWpY+i0VbJ8s537BfekQNcOzHxBcHN3709aWdmT13g==@vger.kernel.org, AJvYcCVF1nohX2Zx7HRj0HZAnquOsh62CDlXf0kmsM6DC6MhJPFUeUVkaDuILTlcqyA2r32BHRwnuD9nd5rpaLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvmPuqmWeR0hbnmx1CVkBP2K+2UPM+LNlpnUjfIMwUvi6A9Q6z
	ZmZN0vhVvZLU3ozgeEC3TdRKhIccLYIQY2aSsSYrqxEF3jukVB1AiXYxSWLT7yjLi5qWVmlxsk8
	nbo3RjsFdu9JIdJ8bAlCQOhFUKJU=
X-Google-Smtp-Source: AGHT+IHcK4oGgKoSMwwVhFYzHLBNuSvAjv06YVdNylUSXyd7Uk5t9tf8n3kxozjG5BXCxuVtL0/4/c3dmeHM7ZxYVzU=
X-Received: by 2002:a17:90b:4b41:b0:2e7:8a36:a9ad with SMTP id
 98e67ed59e1d1-2e9b1773084mr2542113a91.9.1731099942706; Fri, 08 Nov 2024
 13:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home>
 <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com> <20241108153503.1db26d04@gandalf.local.home>
In-Reply-To: <20241108153503.1db26d04@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Nov 2024 22:05:30 +0100
Message-ID: <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Masami Hiramatsu <mhiramat@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 9:35=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> I can reproduce it with the attached config.

Something like this should work I think:

diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f29280ec4820..37c15f05cb81 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,6 +2,8 @@
 ccflags-y +=3D -I$(src)                          # needed for trace events

 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)              +=3D rust_minimal.o
-obj-$(CONFIG_SAMPLE_RUST_PRINT)                        +=3D
rust_print.o rust_print_events.o
+
+obj-$(CONFIG_SAMPLE_RUST_PRINT) +=3D rust_print_combined.o
+rust_print_combined-y :=3D rust_print.o rust_print_events.o

 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)         +=3D hostprogs

Cheers,
Miguel

