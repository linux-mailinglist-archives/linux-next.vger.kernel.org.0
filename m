Return-Path: <linux-next+bounces-4240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31A999D6A
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 09:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6A528776D
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 07:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4BE209F36;
	Fri, 11 Oct 2024 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ztB8wZB8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B50209F2D
	for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630337; cv=none; b=KJbdf7bVqCNif0XBivd9FrO1jlI8i9KyfOSnzfhVaXFCNt/G5I2G1WtenDeVPMwuXszaCSKw4Q+tZFI7DZYzCjli6Hj5CTyWNDUfZHLMuL9sjQRT7YjNGZKd79e3NJO3BeoTMgoqGfRR2ouKgWh5lOvDlVVCG20I/JILubVa9Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630337; c=relaxed/simple;
	bh=oQVYIhGbEfAnqbdWbSdyP2ZhcG8OZnwQ2cfbNbhQT3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOT4/UvhIa7p2EcMB1r5T8O0xd3FboACwzYYpiS2LNZ8D4hAN3AFJAgGoa0v54CFIJVVjmHlHUSw8l7YzPjLCQvVI3d77aBJIN9Yax9CcYmgl+PKVQfePbmVBfTphs6t6NNF0P7ROuEPF9HKPUhIpLli3pnmZ2xNJamzvadPI5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ztB8wZB8; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a391fdd53fso138925ab.1
        for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728630335; x=1729235135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opgRegBAM5FAXU4C8qQl6ZNe0vpoXti1f24qgQ1xEts=;
        b=ztB8wZB8UecCP1caU8GfVnMr93xdM+IKU6tCAMPlOXnNxv/9JRhUqx1MW5nxEa9NrN
         lnX+XBC0JPxdulkEItvwOxJte1y9RQ7QWRyBNTBlbSS7v9vjerkTKTnOOOP2H2H9S2mY
         lBs1JozJSETBtevIez4BDpReiaWnbmhy5/X4jKkhV1EmIkuQJ34wYuxYhKTpnuMm30QW
         RROM2LlNlMXlU0vyjbht4ZQWl58LtNQKAzo58XR7fpE1Tq/SLolR/BMgerTkDU8VtQ66
         I8HogpPuhJ+iUcJa0MSw1F1kiPgX9znbq+x1k7wtpLoGHSZf3Gc48ueRIkUr+YE6cmzf
         XXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630335; x=1729235135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opgRegBAM5FAXU4C8qQl6ZNe0vpoXti1f24qgQ1xEts=;
        b=rFmK9FaMOr7v3ERiOvILD5ZVCX3MKEXpuC0nWM4dvpNQ/iAZu+HAAnUbkTUN3oiT3L
         lhhIGw0+AF6DVhLuyHJCUUmhQRU8rLCduDmS74XDNx13oiMTTGj9Q0gc6eDDBiMoYJ78
         W7UCpBuUvtNr6vPgzDQOIXYu29BWPzqSBfXbsv7MRCn5UWSbCxumxCeVaqbrJEwRqSgC
         jfeyxABQsXnNXiwizLxcXLYqMWnIjgJ7yOkBGxWqwVozhbLQGAPTCKmuLQSnCK8Yevf7
         /bjyXW9EcfBZYUBzdoTlu63lSxZs1lNuUG/TymsTi1m89NLjaAyO0zZN9z5Mq49D76D8
         v6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEC4QE3Tmr87zI4lAx12Rt/z6bcaE2BAGcxuGax9u0OtpqET4UoHBBMIyQ9zmvFMQDNMi9F6tkpr9q@vger.kernel.org
X-Gm-Message-State: AOJu0YzRf28I0AxQtUwhNQnmE+4SdCcpPz1rwyAzRLKuQJRAQD43boKA
	ivk8nYu0GqxWKKMvqzn/0j6jK4mRcbv739YLj9m/JodSckzKNOarXTYip5EkgaDH6751foT3aP9
	y2o1GTLyxIy7ROInvqWasgvLD+Rt3UrR2gVO5
X-Google-Smtp-Source: AGHT+IH0cRUN2m4kUOQeDT0edggke9x59b9iQG74/GOevsfrpTMX28HFCbrd+U/nm7/WWJ8m/yyh3EXal3MCFR7T4Ic=
X-Received: by 2002:a05:6e02:1566:b0:3a3:a053:c0ad with SMTP id
 e9e14a558f8ab-3a3b6566f17mr1566875ab.25.1728630334825; Fri, 11 Oct 2024
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011102330.02bece12@canb.auug.org.au> <20241010235743.1356168-1-namhyung@kernel.org>
 <20241011114858.61ff252b@canb.auug.org.au> <ZwjG_ZpqV4h3HifQ@google.com>
In-Reply-To: <ZwjG_ZpqV4h3HifQ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 11 Oct 2024 00:05:21 -0700
Message-ID: <CAP-5=fWm86UcwX+B_XjFSLFJF54QP2trYzJgJF0927h-AzSV_Q@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Fix build failures on ppc64le
To: Namhyung Kim <namhyung@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:34=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Fri, Oct 11, 2024 at 11:48:58AM +1100, Stephen Rothwell wrote:
> > Hi Namhyung,
> >
> > On Thu, 10 Oct 2024 16:57:43 -0700 Namhyung Kim <namhyung@kernel.org> w=
rote:
> > >
> > > Hi Stephen, can you please test if this patch fixes it?
> >
> > Sorry, I still get the same errors.
>
> Ok, thanks for the test.  I'll drop the series and rebase the branch.

Is this a define issue? I dislike that PPC has a #define
__SANE_USERSPACE_TYPES__, we might be trying to fix something
inherently insane.

The failure at:
```
    138 |         snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
        |                                               ~~~^
        |                                                  |
        |                                                  long long
unsigned int
        |                                               %lu
    139 |                  attr->type, attr->config, fd);
        |                              ~~~~~~~~~~~~
        |                                  |
        |                                  __u64 {aka long unsigned int}
  util/evsel.c:147:41: error: format '%llu' expects argument of type
'long long unsigned int',
                       but argument 4 has type '__u64' {aka 'long
unsigned int'} [-Werror=3Dformat=3D]
```
is for code moved from here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/tests/attr.c#n77
```
snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
attr->type, attr->config, fd);
```
ie the code is identical, so why does it compile in one file and not in ano=
ther?

Elsewhere for PPC we carry:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/tests/bp_account.c#n3
```
/*
 * Powerpc needs __SANE_USERSPACE_TYPES__ before <linux/types.h> to select
 * 'int-ll64.h' and avoid compile warnings when printing __u64 with %llu.
 */
#define __SANE_USERSPACE_TYPES__
```
Given the comment I suspect we need to do similar to fix this.
Stephen, could you test?

Thanks,
Ian

