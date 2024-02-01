Return-Path: <linux-next+bounces-946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 524328452D6
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 09:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E60421F2284C
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 08:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A323B793;
	Thu,  1 Feb 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyiMk19w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F923BC
	for <linux-next@vger.kernel.org>; Thu,  1 Feb 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706776581; cv=none; b=GHImBMY0go5AfPJWLkDP3EwTnXxChasTBGGVuTDlsUIAgT2N3mEcsgEA80TaAIqsPF5ESEUGASr7iW+o6sRX1y+qsqboAvMlc+IltdsfP8bpV7z5URrfAeAjo0mhcOIQqpy91DBYq2h4eaCvaQ5dcpPgMrR5zfR0L9Yo1gfrNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706776581; c=relaxed/simple;
	bh=URAbcGOJJOVtRbliw1Z2VqfxkQeuzBfO9ciuWBnjr64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6PDmqtSWcv+AtLa0dqWvzCkyYeRsLJj8Yjj1cXS3NXci/PCmZ9xkzIqzWdzAniGy7jtL0TG66KF54KJeuRl4oR6bWdKwXohx44FdxBjcQ9sKaFNz4rRAt2v2PMvcLzscA2BwWEJeNkpZDEU6WlWmTOJ3Mntw9t/3ocV9lPRgt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyiMk19w; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4bff041ebb9so276596e0c.3
        for <linux-next@vger.kernel.org>; Thu, 01 Feb 2024 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706776578; x=1707381378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aNWGy3aMj6Es13FsqznlTHFzLMxc1/DDzgiYp75ZJxU=;
        b=tyiMk19w2VrXLIy+JtsvpyNhdAWkuf70KO6Bq2erDXOOuJtWyVoqcu3U92KZ5JXfKW
         fW4LjfGZmNnbs9rLOy15j0sA5FG7+31SebFwufeBt+UYn+nLiEt97B3c7CjmcaXOdYhI
         tu8eSiwgiazFshbnGmsDYpBMuJPhYFIqcRSGDXHpJEUevJxatFzYm72dx1hvlHfM71Lz
         yJfFDBJAanP2KJyeGda5cewqg/6ckpE2n7pIMJs/nKzqNIITfliap9K5G6Q2GhVeb7Bv
         LOKILTXKRyOeFjP/w3dkT0wnf90aUfja6a7JidEfyLffGVxtBzV6g2boGO0Xz5v18v2Z
         THrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706776578; x=1707381378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNWGy3aMj6Es13FsqznlTHFzLMxc1/DDzgiYp75ZJxU=;
        b=mlB1j5Wy7H7gMBV2gNtv+j5Cd1vu5BsNy6EMZbtwVD4duVc0dC8IR+7XzFHYMkn3/v
         oxeVUc8St1o4B/SUC0wnqWeCvb1U4eEfXlcBY2432Dkz3gzonBI0uKLJFssi9Kjg0AHw
         xOcdWyf7fiWE9lteFzF/zyiLQdmIgYsmV2nJEeHvwmDOcM7l5rFnAWDDWKPu0xOWk5mv
         7IDZXNbeatMbdbc4SKri0Fi9KxH5OvWQfh74DOPdwJ8L2MkB0zClVw93931CatJUWW9O
         Dp/VpCrLh5pZmSH4t4tqGt22PQ0rqBTofieo0mZVXkYGDt9bLyMltVhTPoVijJHYp6QT
         Qvxg==
X-Gm-Message-State: AOJu0YwWihKQvuuzNqlJtiYmApn8G32LnwDCEzCBM0Jbjiv2Hftl6evx
	83ul/0JsZoX7m6r9sHc54rjS277ebjLifO7U9qJrrxqz4BMPdiVYAsVaYQfEfpEw18cggh9wsww
	M20pGGgpgu5ubqUkedTU0LsMDGfHoq1+sIy0aKSc3yAXqjAfTG3JR
X-Google-Smtp-Source: AGHT+IFxmaX/PS5XiugiUred/geHgTCYyWuBNSHvpCYMHl7WfgQ9z92CT9vUATBC8i4qxWz02ONq7uV4Qfi0FAqwBHk=
X-Received: by 2002:a05:6122:178d:b0:4bd:4736:5226 with SMTP id
 o13-20020a056122178d00b004bd47365226mr3262306vkf.11.1706776578390; Thu, 01
 Feb 2024 00:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201135747.18eca98e@canb.auug.org.au>
In-Reply-To: <20240201135747.18eca98e@canb.auug.org.au>
From: Marco Elver <elver@google.com>
Date: Thu, 1 Feb 2024 09:35:40 +0100
Message-ID: <CANpmjNPG01_70DMC4mdswN0a7sHCRoUZvsALD9=z_N80oTL3sQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 03:57, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> In file included from arch/x86/include/asm/string.h:3,
>                  from include/linux/string.h:61,
>                  from arch/x86/include/asm/page_32.h:18,
>                  from arch/x86/include/asm/page.h:14,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:60,
>                  from include/linux/spinlock.h:60,
>                  from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/debugfs.h:15,
>                  from lib/stackdepot.c:17:
> In function 'depot_alloc_stack',
>     inlined from 'stack_depot_save_flags' at lib/stackdepot.c:688:4:
> arch/x86/include/asm/string_32.h:150:25: error: '__builtin_memcpy' specified bound 4294967295 exceeds maximum object size 2147483647 [-Werror=stringop-overflow=]
>   150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> lib/stackdepot.c:459:9: note: in expansion of macro 'memcpy'
>   459 |         memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
>       |         ^~~~~~
> cc1: all warnings being treated as errors

This is a false positives due to -next enabling some new warnings by
default: https://lore.kernel.org/all/20240201083259.1734865-1-elver@google.com/T/#u

