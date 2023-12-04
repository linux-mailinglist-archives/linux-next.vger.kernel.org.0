Return-Path: <linux-next+bounces-219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5323803A83
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 17:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45752B20AA9
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 16:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829AB2E630;
	Mon,  4 Dec 2023 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TlT3hWK1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FB1CD
	for <linux-next@vger.kernel.org>; Mon,  4 Dec 2023 08:37:55 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db537948ea0so2867899276.2
        for <linux-next@vger.kernel.org>; Mon, 04 Dec 2023 08:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1701707875; x=1702312675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ytHym4TWHPiac4ZL1jwTfy0WQXCu4D326ivcWRp1+8=;
        b=TlT3hWK1I0DJ9ddzjWuBGIDlZkUzyVkVZW8j0gesiMh9Dez5aGAnIEp82hORnczBHo
         Oc1bOY9leTUFVfmEnAVYEAjQ+BeP3Vs7I69vrCRd3pG8qYxX2MCbgDZrT7+zHS7SrADd
         VjuGUvzYJ7bouC+1YU9wkESP7oW1rBp4u7j2jmGmlDih/V4hqiPRuLXoA/o1la2bxFdY
         RsCphPN36LLvxrtcdHhXIFbCgJCqQYR4cn0qj5PtI1t2O5KXh2qcvi49F1HYP+hzMdJk
         YoDwWwFBOUulJl0WzZpVavUZa9jGXExDv1sUStj0a0xhegEK7i1mdly82CKV5F2zUCAu
         BDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707875; x=1702312675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ytHym4TWHPiac4ZL1jwTfy0WQXCu4D326ivcWRp1+8=;
        b=WpRRK63E39Tfk0A0Fb8Tsd67ujRHo3QpCYRr6V39uAbL0PM/jV15vpiiKk8LqhTsvy
         tVdKSOcbJ/KvoLdebE/qRjHG8zE5VI2FzObshxBlN+K79MaD3Z6V/euZEIctdFe7LrG5
         GolLX9/N71mSYY6fvknjb+MhLGzOW/CuDfhO6dDS9Fj150ntd6m4TM8EY5Tn+Dx0RDPl
         rNzuZ1n2WBpJc+qRYDteSYHlVDgy3MChH3O7uD2fenDDYSezsO0emfAiYT5RIM6wgO+N
         6rf7AbD0fPeZm9R8fYD3fXjy55OgSYiCYybmfDwXNWeecF3T0wbffUTcuGnY84S7Hr+N
         wJSQ==
X-Gm-Message-State: AOJu0Yy2wqRjbClZpRSdO0se+y/DoHu1xiVB0guXrVq2G2OdzHRH4QdG
	X0NRkyiYbT//SW7F7niQRZ69fDskMEgucS55vBss
X-Google-Smtp-Source: AGHT+IGHLVwglvYRPWt67Br5ifnmRNJxcf5z8ii0VblD/ojAEUODm/AY0mFoUTNPTX7Ihy0rdUkxqhhY5aNEp47h25A=
X-Received: by 2002:a25:ab89:0:b0:db7:d0fb:c857 with SMTP id
 v9-20020a25ab89000000b00db7d0fbc857mr2651632ybi.51.1701707874962; Mon, 04 Dec
 2023 08:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204120314.5718b5f6@canb.auug.org.au>
In-Reply-To: <20231204120314.5718b5f6@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Dec 2023 11:37:44 -0500
Message-ID: <CAHC9VhSyv8XULS8UJe3oZsTjLxqdhi84TUMS_8vhJ5TC9uU4bw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Casey Schaufler <casey@schaufler-ca.com>, 
	Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 8:03=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the security tree got conflicts in:
>
>   security/selinux/hooks.c
>   security/smack/smack_lsm.c
>
> between commit:
>
>   bf18dde00aa9 ("io_uring: split out cmd api into a separate header")
>
> from the block tree and commit:
>
>   f3b8788cde61 ("LSM: Identify modules by more than name")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc security/selinux/hooks.c
> index 17ec5e109aec,b340425ccfae..000000000000
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@@ -91,7 -91,8 +91,8 @@@
>   #include <uapi/linux/mount.h>
>   #include <linux/fsnotify.h>
>   #include <linux/fanotify.h>
>  -#include <linux/io_uring.h>
>  +#include <linux/io_uring/cmd.h>
> + #include <uapi/linux/lsm.h>
>
>   #include "avc.h"
>   #include "objsec.h"
> diff --cc security/smack/smack_lsm.c
> index 2cdaa46088a0,53336d7daa93..000000000000
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@@ -42,7 -42,8 +42,8 @@@
>   #include <linux/fs_context.h>
>   #include <linux/fs_parser.h>
>   #include <linux/watch_queue.h>
>  -#include <linux/io_uring.h>
>  +#include <linux/io_uring/cmd.h>
> + #include <uapi/linux/lsm.h>
>   #include "smack.h"
>
>   #define TRANS_TRUE    "TRUE"

Thanks Stephen, the above patch looks fine to me.

--=20
paul-moore.com

