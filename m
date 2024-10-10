Return-Path: <linux-next+bounces-4199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E2997B21
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 05:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573EC1F252C9
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 03:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631FC18BBA9;
	Thu, 10 Oct 2024 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0iWbq72"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A7418A922;
	Thu, 10 Oct 2024 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728530018; cv=none; b=m880p8Msy9QLlDwfuoZDonm7fpR2tdZj//vysX9fBFtaC95fiFSynNGqnZUFCWw1DdX2ONoRCn7TvQlZ8lZYB3opnh4wUcRKov+JVULh7avVuUMGsmuvu0xnNQEcJg1G6/NN5HURKmj5uPOGLYSwcJ7m8f5ksloOJoEcA6mTTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728530018; c=relaxed/simple;
	bh=yITfe85jaoLxYA3zudaR2qKeCMjLHSbWJ8AfccKSkTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kcey7EMq7DcpYvqaO1ZczeGwJx14x8Tng4TXLh+8Nzr7GAIGJboudBQlf0eQqxwjI7RlcN1jxQeb0GymEuH+BQUf6tDg2WiBKa5S1GCbA99oTS9Be2xHPHXIElszRQk2FK3VfQJYsZiPwHSvWxQrSnO1LZkHsShyQhkWS1ZE6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0iWbq72; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9957588566so53206266b.3;
        Wed, 09 Oct 2024 20:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728530015; x=1729134815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J49sxM6+AA9blNJBGlsPfl45wZPG51/lvoP4Pvlv2mo=;
        b=S0iWbq72hiRtpxt6AG5sUbNJoQxUyGkUPQkWrKj2Y9UIRo6eP3EwjVTznDaTLG9wll
         9r8sQ8nGoKEDpztowtFalkD/bUru4oqIHc62PMSBzWYWTvP7KdB2veY3t9RhlVA67INt
         jJiiw017iPjIWyrGULFwrgTEAW3S7jNFj/PPvU3HIftDXW9O9AX0zIHBe5JdzeTWqZbP
         arf8/39ZuDnxOQh4U7ei1SsFpfG75+G9RSbdaP63k9Bzq70pb+BduJ+5jFVjveNN7LnH
         FKelWb4nQlUHdppzd+bOsXHmuCou/ox+UOqyzDmp8W0MtnECIw5lpwxm0LybI7Hn/UoG
         LUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728530015; x=1729134815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J49sxM6+AA9blNJBGlsPfl45wZPG51/lvoP4Pvlv2mo=;
        b=mNocOmQL7BHR7nrt/OJSEpXsMkru5lI+Yrxbc6nSPxNEw8zn80BfI0OEiA736ToBLh
         4NH790ojzh6Bf1trO9cCblQyW2LdgNVhZlJFo2bmx0gAgfoqpvR5ZMnS8z3fprS6G+wp
         2t1U8XuJpsbZJmFCGs/wcQkZq5tKF9y1HJ3z4tXLANE8+PxMDXty+Ntf3KV3LU3kr7Jf
         vDVvxW5IQ+f9XPyoTELeTeY1Yb0cOcSMfmjiju1ow146444srTd8r4EbLOiy67WdYn8E
         9uUwPmBokeQZdNm/BcSa4Z2hFP8xpCIoOCpJXLccNhqYg4O5XQfsSrymRzitcOwE3eO+
         0eQw==
X-Forwarded-Encrypted: i=1; AJvYcCWocCQBnNVzkFCnItPkj9s2U+To/a22xnfuiHHkfNOo7k6kqy6Lkl57fLBLy2xN9o7OZtoeFtMNRQiRtA4=@vger.kernel.org, AJvYcCXK5P2ZeMQ9csTtexU6C4WmHs+RiNjk2YybH7MmrgO/4zqxQNkdNWU+j0Av/1tbmXBJiakGMi8y8ZvvwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0Gbc4bFYAZc8AV4nDFfdr9fwv7M9uk9pEfYqBeFOrbZaZtEi
	u85zox0hX6DMzSJfEKy1y9osip2lv9kquu9pfhONk1CDZA+LAarp3JVrJ3MfeP79EQ6ppRmQ/1o
	Gk3jxfPxTaNs3qGdKdDmi7iTshDQqHTar3N9svA==
X-Google-Smtp-Source: AGHT+IGVjmxLnlQkMtSaFwnNOIqOy1/H4OrCqDgz63Jm0YHaO4a1CcxlNJD693m83cpf2fhRiwCphXsovlA67CcPGb0=
X-Received: by 2002:a17:907:6e92:b0:a99:529d:81ae with SMTP id
 a640c23a62f3a-a998d348518mr345006566b.55.1728530014735; Wed, 09 Oct 2024
 20:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010134649.43ed357c@canb.auug.org.au>
In-Reply-To: <20241010134649.43ed357c@canb.auug.org.au>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Thu, 10 Oct 2024 11:13:20 +0800
Message-ID: <CAErzpmu9VAWwGu_0W-sM=hf5j1dO+U9qLcRNUhb8m8D7qSUfBg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Zheng Yejian <zhengyejian@huaweicloud.com>, Donglin Peng <pengdonglin@xiaomi.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> kernel/trace/trace_functions_graph.c: In function '__trace_graph_retaddr_=
entry':
> kernel/trace/trace_functions_graph.c:151:14: error: implicit declaration =
of function 'call_filter_check_discard' [-Wimplicit-function-declaration]
>   151 |         if (!call_filter_check_discard(call, entry, buffer, event=
))
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   21e92806d39c ("function_graph: Support recording and printing the funct=
ion return address")
>
> interacting with commit
>
>   49e4154f4b16 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")
>
> I have used the ftrace tree from next-20241009 for today.
>

The function call_filter_check_discard was removed in commit
49e4154f4b16 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic"),
but the function __trace_graph_retaddr_entry still invoke it. I will
submit a patch to address this issue.

> --
> Cheers,
> Stephen Rothwell

