Return-Path: <linux-next+bounces-7727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4323B13624
	for <lists+linux-next@lfdr.de>; Mon, 28 Jul 2025 10:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D997118997DB
	for <lists+linux-next@lfdr.de>; Mon, 28 Jul 2025 08:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0465D221F02;
	Mon, 28 Jul 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVOfrBKq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185E223316
	for <linux-next@vger.kernel.org>; Mon, 28 Jul 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753690627; cv=none; b=Msn4kMFc7EAwEUBo5euYraQERvm19CnB/a/Lg863URR7lSB3GfBs7iqjGcih9e5VR6AwTeodgEjaY4CWfcdI6tZkbvVllSTaB5PvexjP1urgl8gjWSFwu9pe5UfuqWiQOVLj/sevR6ZL+ermg13MtiJko5dyuN9pXmi7U4Idi3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753690627; c=relaxed/simple;
	bh=oVOsc6ibl2c4BxKOGSlypnNZvk85m52BrD53itvnuCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5ZlC+J5GNtC+w3vh6GGZX7sqN5Ui4OwtrjLP9vZIPEog5XONw4TEzeKwscEliMONuEUUiHlNP+DpNSegQ3k2bG2B9j0hqtYJb0l4af5pMzoDAKT2D4PKdIDai09B6EWNfLujcoECEncelMfn0hl99FIZxC5QobmzWhceQoLOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vVOfrBKq; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7074bad053bso7136306d6.0
        for <linux-next@vger.kernel.org>; Mon, 28 Jul 2025 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753690625; x=1754295425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVOsc6ibl2c4BxKOGSlypnNZvk85m52BrD53itvnuCs=;
        b=vVOfrBKqXZq82K89blrYjpqba8kIYshhPZ28MnlENhy/eXPoiyesny97PmdYur41io
         4Eif5JXu1QhjSy9ykPYotE4ZMFK5TZyB32gjOf2gt/b4Sp9UJMdi01g1IL1xfrEqA3gs
         PMTo7HlzgZrxp7yO3bMTQRpS9EfQNXKkWkZx605Vso0j0draAqohyCNwmj5AHamASmTq
         kz1Y8cggL19lTavQVjd0XA/li8C4Bv4mHCi8o/QyELbkPp7YEm8Fgo6ZqdeF6N1zeaXm
         mQrakeNMLPc+Yj64I6o7bKXDB+r/LEppFTbJp+ib3Ga1hYfgwlNT+Zen+29n83VxjYSY
         QpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753690625; x=1754295425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVOsc6ibl2c4BxKOGSlypnNZvk85m52BrD53itvnuCs=;
        b=lAULS9sVODPvlDemJzQJ1uaFlyis1KLUM3HdK+CBJwdzyK2rBMfExY3CMDvYZRvo0Y
         6GqnYy72sXoqsAj04wKK21KS5SvATCBI68qzYiKSR4rSwgi7+kEq/IbTgCftrrbLLwaa
         zI638U0p5Yi3aISUK02SsQYjKCrXBSbObCdsDD/JzoNEE44N03hW3hzMnwj7Cj1MYsyD
         kQjE8AWg3NC8X1uu4lZTQh4U91m4G/a2QH8QnRQ9vNc2lAADQzqfYUSNgt3h5QJ34ena
         pd4qKy6TQkf/GTTKv2nnzgyH3FPKaWRiokbRQ17qWgae4CKKgjSy2JDEqxX8xGlCutSQ
         Dcfw==
X-Forwarded-Encrypted: i=1; AJvYcCUq66gmRMDh2EaT3p/bXPdfdR/DAakIu0KchYksWEJ/gr5QWqGuLwgUkrThVdy4oSPAuixDQC0R9l1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yytmln4ElVzmcND4FrkTUWR3mrQ8LBMHPOzjQ35GowrCF4i/OXl
	ywS3V10A1KMAaKfq0MJz+IwSyTykP3lFOxlOoYZbQjXEJMh5yD0McuPqEZuUYAXkjx7E3FSFMXh
	POKeCt8otu2LGLQFXsJix8/EzOj9W+NDvK484XInq
X-Gm-Gg: ASbGncsbym2EoqpRnIGZHiqLDmEsMpl6eN1YJh9Ab9VmANkbBQDr/PJ3lKB7/998O01
	+X/Q0veauyzIbojipf4X/3ZsUvLJVPq3p42XuyDs1utV5kqDxrGlPfHwC6IcnSjgDRQpBRF6L++
	WNztwQy1Ee7yhuDtDis4qm06Y3rqlQYx8gLaZtWx2OB8ect1MbVYPLeajeLJujST0EyF94REeIP
	jbWuOsjyycxfk+Pk8TzU7wLIBwEGJ2WPq6yvQ==
X-Google-Smtp-Source: AGHT+IGJVja+BOlBDSueHM4xwgtmGAcntpknGmQBU6g6I7fWUhaq1g+6fNhuHcvRNLAtk8WzaUNpyzvQMZ0Hf40qYp8=
X-Received: by 2002:a05:6214:5290:b0:704:95c6:f5f1 with SMTP id
 6a1803df08f44-707205c02c1mr132327006d6.34.1753690625039; Mon, 28 Jul 2025
 01:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
In-Reply-To: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 28 Jul 2025 10:16:28 +0200
X-Gm-Features: Ac12FXyuIo8mg0__JhxicCkBMBx-2UyW5BATXdwFGTnJezh5fbSE4P26Te_FKXc
Message-ID: <CAG_fn=WSae7yjaHh=_iUc7eFALHX1vLQFMw8ryfas4-ijgFTiQ@mail.gmail.com>
Subject: Re: [syzbot] [apparmor?] linux-next test error: WARNING in apparmor_unix_stream_connect
To: john.johansen@canonical.com
Cc: apparmor@lists.ubuntu.com, jmorris@namei.org, john@apparmor.net, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 11:35=E2=80=AFAM syzbot
<syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:

John, do you have an idea what's going on?
This is pretty likely to be related to your "apparmor: make sure unix
socket labeling is correctly updated." patch.

