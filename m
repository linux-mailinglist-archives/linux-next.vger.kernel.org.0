Return-Path: <linux-next+bounces-4217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C0F9988CD
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 16:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845D9283EB1
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 14:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829B31CB301;
	Thu, 10 Oct 2024 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAZTAuKE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACE1C9EB4;
	Thu, 10 Oct 2024 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569302; cv=none; b=oYvB/flZmKTe9l/N+Ac2IYjBZRXgxTLRtEMyVAycSSz4Rj3F8Ihm66/5DKPApuvTuZ2oO3GG6MQ9VHajCR1yL98t1Oe3TwwcvaLtQrIHmfOHf5Myj53dfDlr02EPG77hN/NX4v4RHojm43lYtMXb2bdQw5mvO8ySJvhN4nKiREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569302; c=relaxed/simple;
	bh=Alj2myzzRLmVLYNgk7989Z2VC1wMhp+FnH46ywc4XHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZhy3iGA+UmnUJQNZWs+IL/rBMv+xNW732jy9Bc5SSzC1EtCHHcc+yfJy2JReFcoMQhGAeUPSvpeO2bSrWATZEAR8K97aE8hpbsB+T6IzASBWL5CxjMzviJPyQIEv7xCMFgnvPZK7y6qQoo2VK7Wn0nVhBovOh6IHDlzGnIyx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAZTAuKE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9932aa108cso154685166b.2;
        Thu, 10 Oct 2024 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569299; x=1729174099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+VcJ6CzgTxEMlTh+TMTcxR6b4NJDKur46X0AWO3NV4=;
        b=BAZTAuKE5/q+QLuy1lyohNfy/2pxAYDjoPZ/8dxMWHzVvd05JzjIxCDM39nQzymNGa
         xCWR2zytSbAFsJxTnQx4so1/YNstPpISAZsBO98SVT/bqS3kdIt7p4ir8rAi9dbP+PK3
         vXlJiM03gux4Q6cOcCJ6QIrROzRQejEAIb/vRqMKxrUHS+7r2n/hyxRflTHdX/EC0GSY
         OXKtMIc+iAGHIN0lLX6go+VeSPcDwANSiVzjYj/MeWRQR5pF/UfhhCB8aR2vG1Neh5mo
         luKKbOcwfF8csgOxDoPGLFyGNzAvlZfXgkx7FukRs4Mmd5i0PauhXq1fIdSxCMzaWxT2
         l+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569299; x=1729174099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+VcJ6CzgTxEMlTh+TMTcxR6b4NJDKur46X0AWO3NV4=;
        b=eK5ra9XhJk3rxXWppZPTK6BIEXXEg3nvbnS6IYSQbPw6j+816dKW9A3ipMIeBb7+ZI
         kjIHVvALj6pq3HJe+5eJcErFR2RpBLaNnt0RbNPWQ3BlkWyGoibk/4W6PqA8O64s3QCk
         DqJYpMAgGXNO9N4cFv6nHVxqgUULhXEN8iGgPGrcsZ4oaIiks6egrDaalZVSTJnUiFnm
         1GDZI9cozIcqHykdq09nuDyWqZvRM/mFvPBvyIGPCRwNr9AGWjwTSeKioq4VRoVXetgH
         3MeDyLJ5gJDzd3wL3QEskg2kFiiIiyPPN6TchF8KrDdYjd2QfF3363YG7xpDQAQXju+I
         a7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ep3JMFBU13dOKg4s3dDoHZmtDvYrH4S2CxjVZnm6B4S/B0LdAy6tp2xrUgyCqopYfxavcbT74moyCQ==@vger.kernel.org, AJvYcCWd8xiIDOg3w+37IKBOTznCyTM3+1WEs5gc5S8gHi+9xAFEtFbGUKPfdvjW3uDLINc5yjS1hwFqUg6tweM=@vger.kernel.org
X-Gm-Message-State: AOJu0YywjeBsrAgQxuNvP4SpugxKmRTV4+QKs9jsAYteZ+LPbs4bVMSC
	A47n3VnR+QQpCsTW6wzRpt3JtwdB96vL37V86WZ2lZFWl1oUEFL1v5Zf1hYTYXqZyijhdbeAxwO
	fLN4/ETDlWFmg7ihulZvrszqMsZE=
X-Google-Smtp-Source: AGHT+IEMZREQfu1i0+p/mAUdY/wvX6TSA+2PuKi7y9XMQ3QaQDXwRWWFSlMgyzj6QUdRldXk8VEIeHChuWygmoAzC98=
X-Received: by 2002:a17:906:bc1e:b0:a99:4987:8868 with SMTP id
 a640c23a62f3a-a998d2091d1mr546337266b.38.1728569298597; Thu, 10 Oct 2024
 07:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010134649.43ed357c@canb.auug.org.au> <20241010092755.21874a9f@gandalf.local.home>
In-Reply-To: <20241010092755.21874a9f@gandalf.local.home>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Thu, 10 Oct 2024 22:08:04 +0800
Message-ID: <CAErzpmv7qAAXLt+J8Kn0kSkJeu64eE1P8Yv-WgGxuuMMpwGUHQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Zheng Yejian <zhengyejian@huaweicloud.com>, Donglin Peng <pengdonglin@xiaomi.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 9:27=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 10 Oct 2024 13:46:49 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > Hi all,
> >
> > After merging the ftrace tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > kernel/trace/trace_functions_graph.c: In function '__trace_graph_retadd=
r_entry':
> > kernel/trace/trace_functions_graph.c:151:14: error: implicit declaratio=
n of function 'call_filter_check_discard' [-Wimplicit-function-declaration]
> >   151 |         if (!call_filter_check_discard(call, entry, buffer, eve=
nt))
> >       |              ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   21e92806d39c ("function_graph: Support recording and printing the fun=
ction return address")
> >
> > interacting with commit
> >
> >   49e4154f4b16 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")
> >
> > I have used the ftrace tree from next-20241009 for today.
> >
>
> Hmm, strange. This went through my tests that also does an allmodconfig b=
uild.
>
> I'll go investigate. Thanks for the report.

I suspect that the configuration CONFIG_FUNCTION_GRAPH_RETADDR may be
 disabled during testing. If this configuration is indeed disabled,
the function
__trace_graph_retaddr_entry will not invoke call_filter_check_discard.

>
> -- Steve

