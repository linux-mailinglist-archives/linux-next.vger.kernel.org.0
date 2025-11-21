Return-Path: <linux-next+bounces-9139-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E8C78128
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 10:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ACAA0343328
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 09:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CA4340DBC;
	Fri, 21 Nov 2025 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/mCefx+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6txGwdV"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E433F8D3
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716380; cv=none; b=FFae3BOQkgtA1bYvFET7GaDbGAZVNE9Y9gr1onsjIxUs9gg/pHJbL9FVJ2/xT5vcZw5YvKO+NNfeta4jz4q2pAs8bJw7Buuhoek5ARyDOxmDYU/fyv6N99a3RberI8C3jVeFJwu3RVpsw9P0mj+88ILeArOax6qDTYy1AB887n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716380; c=relaxed/simple;
	bh=rGSPxq3DrRWn0/5xsegD0tE1qbLCrNgosbyUr0L7ubs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mptnv4h1ROqjXju+tX9SRc4Lk9fcaYYQFSzlc0KsLXaSu6DQuUVraX6b3JJcnllZsTkXhNhMUbhjxetWPw5UH27PfEdpLS2a7jiOxYMLWD6qcjT2ppZorR0gAeBGCQtCyfyrdbYrndWv1uzTjGKdsq9Tx6kEOo8hWAvgKRQiYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/mCefx+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h6txGwdV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763716377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzgtvaE+SO5BfvxrNxU1DUGjb9OqbwlHycPyy7M3GBc=;
	b=b/mCefx+k7tf8Tt3zBzfBDN2AbCJJGhNJqA/jQoVjcUAchJgazj2Z5qZPnfJBmHG6m2l+y
	ZeD3+4lQIU+sDolCY0Ggid7l0qIxsysvgvEj6teUyhmRKwGqSicqGnBMriXZbjKdZ+86gz
	ELPQXePUmJfLocHbtMd9Rku4HDchkWw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-VOMJ45koPvuf1YCiF2Bbjw-1; Fri, 21 Nov 2025 04:12:55 -0500
X-MC-Unique: VOMJ45koPvuf1YCiF2Bbjw-1
X-Mimecast-MFC-AGG-ID: VOMJ45koPvuf1YCiF2Bbjw_1763716374
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b76778e621cso21843866b.1
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763716374; x=1764321174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzgtvaE+SO5BfvxrNxU1DUGjb9OqbwlHycPyy7M3GBc=;
        b=h6txGwdVvcOl7CgQhPoinNUfRuSnNfMRCIGiydtsmEHhrzMweVSur/96HSq543o8MQ
         xJJnufGavKmdJo3lGSdirXhDkZX11HGYCQJobD0+KGneXKYdsFXDy5Deo71yozFnVYzz
         YiffNuMMYuOlC/KVRzFcPOfpvlVS+3J6E2YjDSF5NXhqboLa+wrAC28Cm3rfwVTq/AUy
         k7hWRqaP2BXDBNB+QcyvcfLOUeTTaTXqA224qiN9l1Dxc97hnlP6z9iWRX8HZ8oQ3ZVM
         xM5Ul6ySI2NCBd26dN9yWPFGJ1dRcAj//F4OSGMUrSJZ5sz9+2byADYeaUlgULzHjBkS
         JtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716374; x=1764321174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EzgtvaE+SO5BfvxrNxU1DUGjb9OqbwlHycPyy7M3GBc=;
        b=KVSfx2Sa3yzlRZFbC6VJTBWoYhT7Bddnkq/mou7ojt7e/4m0voK8C83LlzOoAOPgLf
         6lo7ozp+txCDmpEP4l2teJsexOlPyNwIez37o/jMdg4AHO+xAUtw1o3m/svz7vbmg/GL
         +MMDrzCIDJf0KRBxlb3recEolg74MmaTD0lthizO3Ifn1JPvkRBMo6RPmp7CG4sCbRYm
         Lz3MYaGImLlii0sOabc9BZmigVvvSO3Wae39MB9EbqZvo1EUqKmj2vdKyCIbKuz8/xJ9
         iuOvXJF1ouSNBB8nQiRKjs5LCn70DXgVITd6w7w2/MVa4G6WoG3SB5mYlU6gOoRjlHM/
         xojQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1PBGqFqnoICkLh+IP2qcYE9+QC76DQEqusiZpZ/OPjho4MdHWRUWRjlGUf0LAaWXgcZuLZ0YziuL@vger.kernel.org
X-Gm-Message-State: AOJu0YyqG4XR+dYqHVBJ3HErJA73EneDg4AFrWjs1qg/RWnH/wls01L6
	Nobf8N1LStnPh9A9C8o4wXVa0DnK/5cyqlTlHKMVdq6hscG3gBQGGLINcxcwEqLVlSC5rPywZtb
	JlEmEwh55X/1KUgX3EOx54U9sVjBLIRf2gUue5gwl/Otbs+64eSO5wc7ru9U/mQ0BsWsx+J1afH
	E7VlhD0dkIRANjewnDhuPf8blK9hD9pxKp9HYTzQ==
X-Gm-Gg: ASbGncutSl5XCM9HzlUG48UVzfLP6YXqM94K/5huOMAOZ2FTHgLnt0oFNDf+qIZwGzD
	MENixNd2dPe1dqFFiQEigpYOQ2vDO0ZU7nHmS9woMMt9T2GuC8LLb6gRyzVGi4A+gUC2kEfdyAf
	tYFX2oBgc5aXFnoeOvRAfl6cTAMPPhCj6Lym9+HHyqLU+Ius0zyAo9WE7vLfkbTCxYcjhxPf4/p
	ezUSvIyF5eCUFEZvfj4CamF
X-Received: by 2002:a17:907:2d29:b0:b07:e258:4629 with SMTP id a640c23a62f3a-b7657285447mr647708066b.16.1763716373648;
        Fri, 21 Nov 2025 01:12:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV7952xCf1inAA7sdtz7W0hNAWcmDEpuF2cK4Z1eRszTmTJwE8XibTN28hk6Tt7czNGoeV4Yg12AC9GPZfKRA=
X-Received: by 2002:a17:907:2d29:b0:b07:e258:4629 with SMTP id
 a640c23a62f3a-b7657285447mr647704666b.16.1763716373205; Fri, 21 Nov 2025
 01:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121105209.656f0e88@canb.auug.org.au>
In-Reply-To: <20251121105209.656f0e88@canb.auug.org.au>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 21 Nov 2025 10:12:42 +0100
X-Gm-Features: AWmQ_bkxwO7E0TjyCGZHAcr44vqjQQUTDeTAlB5gXWZ3_u04-UhgYgdkaSlbj-U
Message-ID: <CAP4=nvT-Jd_X30unpdkS0+C=kYLmFRoWjLjhprFQW2YMiq=2bA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

p=C3=A1 21. 11. 2025 v 1:00 odes=C3=ADlatel Stephen Rothwell
<sfr@canb.auug.org.au> napsal:
>
> Hi all,
>
> In commit
>
>   f45a0cb29720 ("rtla/tests: Fix osnoise test calling timerlat")
>
> Fixes tag
>
>   Fixes: 05b7e10687c ("tools/rtla: Add remaining support for osnoise acti=
ons")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>
>  ...

Oops! Apparently, I forgot to use checkpatch on the patchset:

$ scripts/checkpatch.pl /tmp/test.patch
WARNING: Please use correct Fixes: style 'Fixes: <12+ chars of sha1>
("<title line>")' - ie: 'Fixes: 05b7e10687c6 ("tools/rtla: Add
remaining support for osnoise actions"
)'
#75:
Fixes: 05b7e10687c ("tools/rtla: Add remaining support for osnoise actions"=
)

>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").
>

Ah, good to know! My setup is fine, the issue was that I have not used
git log --oneline, but regular git log, and counted the characters by
myself.

Thank you for catching this.

Tomas


