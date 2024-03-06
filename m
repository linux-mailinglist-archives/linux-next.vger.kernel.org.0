Return-Path: <linux-next+bounces-1491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B85872CFB
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 03:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8593E1F28887
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 02:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A52ED53C;
	Wed,  6 Mar 2024 02:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XiC+SUB4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF65D51E
	for <linux-next@vger.kernel.org>; Wed,  6 Mar 2024 02:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709693331; cv=none; b=sh64UwUEoDcdCn/kQBDcCOzhYuxjd2HcqqeVPseGVn3MAnW8HSo2g1IRHp/1BMNOXLPWaeUETjJs9FeV0ou9slNBkfJG0zCxahsqU4MtOqEvBaAROtrFVD7qcRrcaXx96kllfKQmWEElcA+s1WLVc2A/bKHhxVRj2gPEvdDNuLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709693331; c=relaxed/simple;
	bh=u7eC58xUF/Q9U1FgZ3onEFjqy4ZYgGtENUDsCVzs/c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8gqQtDMcONQpaGmjSwmVFAQlPhj2Pk+TgNhOi1qEwmtBr3HZzTy0Rd3g+zjefa5uF2pDv4V+e4iWl5jgbOo8ScfRMPvQsb/PwS9xC7QxRD+3wI2EyRgJKpH+PvOpPBt00czfTomc949hl7ntAzFu6P8+HlJWE3QcaM+LLoMKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XiC+SUB4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3122b70439so179865866b.3
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 18:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1709693327; x=1710298127; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+KUQWhEvCJCpfREgFwyV70EN2GKCk/GEezppyY5IN3M=;
        b=XiC+SUB4XoQpA8SyU5v/1EiUUtvrpjYEMbntdX1Wu3yviupI4zShiZ43OFCSGvXjmW
         l0NgmTisVOIs2QnF8IDbUeBuBvO6EWnt0C5aDFJ8WyFCj68BvunKGjnpdZOQKSdcDYts
         pmSEab9PYI2xiFre+pNJmF2KYedzvKT/aR1qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709693327; x=1710298127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KUQWhEvCJCpfREgFwyV70EN2GKCk/GEezppyY5IN3M=;
        b=ZxitjhuXD4yK/+QgbD2GYfc7ItKcEPHrpzvTtOdN9OcnfKaxBePGWMMl1qCvluwPIZ
         6gr1nT+06iYGxwFEDTf7ZWROLP4RwaYG9eq8VS1hA6TWldKiKZincaimA1LmgTLIDp2k
         PKrMvq6ipFU8MO0zHzbJ3KowdbPz4tdRmPpQvtn92pCUuAxPw2blJuUGmMpZZP/pmYQc
         s2dVl/ghj7stGWz2rnBj1SiTjqPIMxwV+93BNHks1GHP945ttSVheyuaBbnf531idTTi
         pXz7hatDdBaRn27eyTuXnrmXdi5BBjzmEUPLRqNfwBtVNPUOj3WNKdHFb4mKi4lTEFem
         45Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXMF/jhLvzEUjHu4iI752CYGX9HJQMDD398Iq54WEx//FocyhHpL5oXT4/VTIVz53M9V49WJmQ6wf6Sj/HmBxrKjgNa1BJXoyQ4bg==
X-Gm-Message-State: AOJu0YzfPheJunx3CEQ2bpnCYsslYo3I1dGw0BIaVw2JId9j7AD6GQtq
	6id8Udvm7S6P/2D9Uikn77VFmVMP9EDQLVdGKE8F8qAfZ9B9cvBjxKkO1iHSFBvdOKBQOIYa0Wa
	MGzJkGw==
X-Google-Smtp-Source: AGHT+IHR2jBvcuWHQiOEKZplrosGY4qfvQZg5KI1XCrGvfpDHbtAwPR8zXWHvPEqGLOIsPqwoiUjtQ==
X-Received: by 2002:a17:906:4081:b0:a44:c7ed:e53c with SMTP id u1-20020a170906408100b00a44c7ede53cmr7948976ejj.68.1709693327260;
        Tue, 05 Mar 2024 18:48:47 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id fi7-20020a170906da0700b00a44a859fd9dsm5284948ejb.174.2024.03.05.18.48.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 18:48:46 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so1812395a12.3
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 18:48:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9C/4J1CnJfrCb37h6QASWEGx0YsyRfGuuTBNdTDPxhtSBAqSCzJqCg8fnZxRfezIFpSJLIItLZ3KI4koNd4C2q1573/lFWK9U1A==
X-Received: by 2002:a17:906:f10d:b0:a45:3792:fac4 with SMTP id
 gv13-20020a170906f10d00b00a453792fac4mr5217404ejb.69.1709693326381; Tue, 05
 Mar 2024 18:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306105150.06a456da@canb.auug.org.au>
In-Reply-To: <20240306105150.06a456da@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 5 Mar 2024 18:48:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=whdTCEDaUPTMHUQXPQHuM8dhBi8yWbNAL11yE_ODqR_uA@mail.gmail.com>
Message-ID: <CAHk-=whdTCEDaUPTMHUQXPQHuM8dhBi8yWbNAL11yE_ODqR_uA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Tong Tiangen <tongtiangen@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 15:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> fs/coredump.c: In function 'dump_user_range':
> fs/coredump.c:923:40: warning: left-hand operand of comma expression has no effect [-Wunused-value]
>   923 | #define dump_page_copy(src, dst) ((dst), (src))
>       |                                        ^
> fs/coredump.c:948:58: note: in expansion of macro 'dump_page_copy'
>   948 |                         int stop = !dump_emit_page(cprm, dump_page_copy(page, dump_page));
>       |                                                          ^~~~~~~~~~~~~~
>
> Introduced by commit
>
>   4630f2caafcd ("coredump: get machine check errors early rather than during iov_iter")

Bah. If comes from that

  #define dump_page_copy(src,dst) ((dst),(src))

and I did it that way because I wanted to avoid *another* warning,
namely the "dst not used" thing.

But it would have probably been better to either make it an inline
function, or maybe an explicit cast, eg

  #define dump_page_copy(src,dst) ((void)(dst),(src))

or whatever.

                   Linus

