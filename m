Return-Path: <linux-next+bounces-7687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7CB0D743
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 12:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E497C164C56
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 10:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31CD2DE1E5;
	Tue, 22 Jul 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tcdjoWrX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D228B400
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2025 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179899; cv=none; b=Gkdj9vH90B0zm435/0Tkaazua51N8jvUObPtxX/Qhtcn5X41r68zRwD6KSyI70vWiHzjY0oVFScsFjlFJtZyZimIXcWkCgBvT3eQfBBIv0/QOaWYMTRW+MFUS3yWudqyA8WY0nqUTHrQ7Op7IXKymJMGcuWbSnHFF+zci1xl2Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179899; c=relaxed/simple;
	bh=x1EmevJHHSzjWxhFuCNXDb9xmI8bRp167e5+cwIXvVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gqn4DSIAK2a2tbGO8LSvgp9UrNBuHMMtbqHqTvbZiX34MO15CFVckVyIHImyOEXsBtmRetBBIQz3xObt+1hBRFLA2qhAwdPp7+VSIVjGYqqf+l/bK8etXSveKaOshrTI4JpxHp3XjAsFTQmUvhSiHH5E6LSwgZ64x6Jkyuk59zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tcdjoWrX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso7242a12.1
        for <linux-next@vger.kernel.org>; Tue, 22 Jul 2025 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753179896; x=1753784696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33XB74HPhFwcjRRLvueU8G9hXMQh0Pw0WGRpEoj9zY4=;
        b=tcdjoWrX7dc/yZCmGx2KrsRJxv3+dpPTFWN0VqNdpG1DaCg+u+raCY/O1BLNyhce1b
         /juPfmTDHglFlv5wXx+yd0i58sKWBk7JUIi816DzhKUqaH2RC6a5etdZKZPeHDkypFSp
         zn+w4cu4tIfJD0qqvNnWJfLCqIu5nSQFqg9ObyX3S438o6KUTN7esFDAD687hzjiawmV
         04Y+v4z8MCXCdZeXH8tawzTRfGX5jiAYB0qpiPdBvwHWo0MMhMPpQpF7zrSb5MyHx9wZ
         UTsjWJhYB2xWapsWPpMnOAUibiRpj39V3PxPM3YI5ASLyOXX6qq4Ko0CK3IrMbv01MJL
         Ja0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753179896; x=1753784696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33XB74HPhFwcjRRLvueU8G9hXMQh0Pw0WGRpEoj9zY4=;
        b=j1JE9Yssf1ev7oXl3I5LcbygUJgdtQryQ3fulr/ICgXiqIgzABKkuS/TdMN3hPhnTN
         VYasdI9nQEd6x7MEs7pUsGfxlzxp16X42CRBiq9LnldgTs5EGPw/O0+aO/4RgDck3BcG
         0/elJnYrOLaaqO7J0GBbcSTMz10G+6yggD6/aoGldZV5uguZZC4ygH+mb2z4+ruFeAA0
         73/5tJKx+6l/oT+3qj3KMmW5hViwI4AHYnRM8n7PgzdlVYh+SAUWWaLsy0D4zNLIWJhx
         4dOB5JEGVtwCSKZcVqKvGq33lxDmlsRDz5CuL4j4M6bO27+72qC+ll/8c/8XDJ3VI87J
         Rxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWk17TmTwhYNlUa46F3f2JKlpILFF9xWYb6MrVJLSBv+/yk3Ece6SKGqNbl5cQExdEKZGOs07xbe7QE@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdRpEseFpV3T6+gb3F9osVi94+qV4cmOjU16rSp4OfV71bsm/
	8gR7k/w3+4CXqwQ9wE9fD0O3wgiV1ZZx0/s2nVfSUhFaTyQ2xprhFmvUMS4XRjUIZlHyU/WPo71
	ujUBMVxy6WbKBJ/E4ordoJssHLvIOCM6qE9sNM/TB
X-Gm-Gg: ASbGncu5Mzf3LmSbV+tw7se1MbsIkYPqd76guVmv3gYuDWewe9H+4WoyYCz41hg9T8t
	/ZGPUSrr7UpW1wk+dVWpzzosvnQnERVD6WDpiC7Hc9+fl1ixJSsEAlwDVme0EmBoxha8oZBFPpG
	UJxV8XOgzpAiYoOOfBdmzM5KplNMbmTxeLJ5m9IMbri+NHr/+4lpPJz6t+7444N29sWQOe4MoOA
	1l1BYLrp2X9fapzDOMjSOJe5au2CkjgI/0K
X-Google-Smtp-Source: AGHT+IG03V+yzghRURs8YdytmvIJHF5yr+WXRATyvIvO3+HoYcZiNehpR1ls15DCd5VKlpOc3HjceWHMlfX18OINB3k=
X-Received: by 2002:a05:6402:5191:b0:611:ff6c:50de with SMTP id
 4fb4d7f45d1cf-61348ee0a07mr102263a12.4.1753179895656; Tue, 22 Jul 2025
 03:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717173655.10ecdce6@canb.auug.org.au>
In-Reply-To: <20250717173655.10ecdce6@canb.auug.org.au>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Jul 2025 12:24:18 +0200
X-Gm-Features: Ac12FXy3Wg8RO93ommd0k5kc23jSfedk795eUdOqzg9aTFqA0BK54fd2Bl0SLJo
Message-ID: <CAG48ez1ZpL0L0-8ZZe+RmL51YShmoHU90PnO2jq_nU=UEYbg-g@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 9:36=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> fs/eventpoll.c:2197: warning: Function parameter or struct member 'ep' no=
t described in 'ep_get_upwards_depth_proc'
> fs/eventpoll.c:2197: warning: Function parameter or struct member 'depth'=
 not described in 'ep_get_upwards_depth_proc'
>
> Introduced by commit
>
>   f2e467a48287 ("eventpoll: Fix semi-unbounded recursion")

Thanks for the heads-up, I've sent
https://lore.kernel.org/all/20250721-epoll-sphinx-fix-v1-1-b695c92bf009@goo=
gle.com/
to address this.

