Return-Path: <linux-next+bounces-3001-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B4930CD2
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 04:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AC301F21210
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 02:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD416FC2;
	Mon, 15 Jul 2024 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4OQvHbm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBA522A;
	Mon, 15 Jul 2024 02:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721011734; cv=none; b=mGfYCzZzQvmgqOzFTKqKA6yty5ZiPD/UeE7T5uADsq8WaiXuTySrtFvgCiEr3X6luhnF99sO8OZ5WHtSaLZLCnyUM549oMxUOydoVRVYMcyBXJ4FxJZYLTSaDtwhO7Y0OB1b5+lG2cqTM399p8J8Ox54+p4wDMNcaB7gnBawwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721011734; c=relaxed/simple;
	bh=3VMn7KNU9t9U5oHz5NIQ/pNKKbsqsEVKy0kEzoZ2ktY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtrANFOF42OcIDzOticvj3/NAnZJi8LkW0L9K3p4iz9U4soD962n+ntOWn0NMEf2bFXFbS8cD8gWLX1EqpfYQmWTUvlDUgtJGyYcQ2C4EsnwEu9K7zSxUs/nEpyQdrnFN4xQncfs5jH3i6eLZFQ9qB1fufsRmPggK2QgZiu6P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4OQvHbm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee817dac89so41624211fa.1;
        Sun, 14 Jul 2024 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721011731; x=1721616531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXuYBiez26x1ajGukik7Y7EeBlbVWI8dh4JIM/OTmFU=;
        b=h4OQvHbmE7TQEidQmGu8rMMfXwBR1aLyjPfWweoEMcTPH4ftC4U3ETmuTBOgkuOsiQ
         YN5J+zjQULF9FL1uhJbwNGUWBvWDCDGsC9AnNS8YfJjoskpeEB+6ROGQil14wMLKhgBG
         hTGIJ57eWB6HC6PktMYJ5WWVhpqIBkNPky1VE4YJOLlziDunst14PJK2m+Rd4ndmqHG/
         FCFUFzTVI2RxaIHytJnczC0fk9Ub/Xpoc7ALjF/2du2d6JMcUJhBB/rTfKX0rUbj1KEx
         eDGd6KIhrN3E5KT4Qr4iQS0u5e9VE17cH+tcY7tkgj6/N1BuLFXepMcGX7Ab89qGID39
         CbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721011731; x=1721616531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXuYBiez26x1ajGukik7Y7EeBlbVWI8dh4JIM/OTmFU=;
        b=isrkyw2GzK79ylbShX+PJZTPGlTGrsc4I7htsr4n4MTVU/QLo/KqZhC1Ih3OClQh+I
         dsNuu6mAb7vW8J7upKVdPJxZGdSGHqTkqczqyrFfGCSnT78STb4uQmiNmUnWmPeI4ajN
         b24bdVuF6liQ/457pCSUUe8sutXD9XkgXYbv+fWczW3/r5RcU8vYVWpyKMg6RzVKfH/C
         1Gf00NpWR5vPXJVGyLqYOl5KqbiaqqSJ9fpDRkwwsi44rmWOoHhy+nGzFEcOLMOggfwX
         MjKk3Ic4/1fMb767HESmdd6zKZmZ1fpCzjSkl/gwKLKoC9Df3wWzdwUC2FL+qe0NfW6h
         viiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuEWLHkoo6WkBxhENkVdb65b/5sm67OmqGFLNRRhObeuMlG7s9+HNYUbUZgiHKbDH1HlAaCVkYcZQ7nqO/UqnnooHS/dPEpHs8dRAgLM8C382U0N5yZCCWJFtvKsVwacMfHXnNsAGP0g==
X-Gm-Message-State: AOJu0YwrtAMsGNN5j3tP8iqLE+amJwunsG2N7Q66I0SYTqaAh37ci7MM
	pHIiGeYbj26mZNWAZIS+5Y8qkpW6mFgXVd15gCasMAHPZnuUGpUs00ATc7AlmCBajjcBhgUPKZx
	TSj5gTtiHPpRvxm062RqfkVTTrGs=
X-Google-Smtp-Source: AGHT+IH5/srDok0ljnUWVKRsq4N6U5cWzAUt60FZfvQ3GxmUQG75RfKL2U6CqKEBmRndVb46BEz+I14+JeGHVl6Zi30=
X-Received: by 2002:a2e:870e:0:b0:2ee:98c4:c301 with SMTP id
 38308e7fff4ca-2eed576e405mr21873821fa.6.1721011730362; Sun, 14 Jul 2024
 19:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715101551.29fd8268@canb.auug.org.au>
In-Reply-To: <20240715101551.29fd8268@canb.auug.org.au>
From: Steve French <smfrench@gmail.com>
Date: Sun, 14 Jul 2024 21:48:39 -0500
Message-ID: <CAH2r5mvvSQZJssVdXsYwOTCG9g_zVwHAz4fdDLqiMP6Lrn9a9w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ksmbd tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

have now updated ksmbd-for-next with the change to address this

On Sun, Jul 14, 2024 at 7:15=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the ksmbd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> fs/smb/server/vfs_cache.c:39:27: error: 'dh_task' defined but not used [-=
Werror=3Dunused-variable]
>    39 | static struct task_struc *dh_task;
>       |                           ^~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   e70f0abc77e8 ("ksmbd: add durable scavenger timer")
>
> I have applied the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 15 Jul 2024 09:55:23 +1000
> Subject: [PATCH] fixup for "ksmbd: add durable scavenger timer"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/smb/server/vfs_cache.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/server/vfs_cache.c b/fs/smb/server/vfs_cache.c
> index 2b1a5a3ebf42..4d4ee696e37c 100644
> --- a/fs/smb/server/vfs_cache.c
> +++ b/fs/smb/server/vfs_cache.c
> @@ -36,7 +36,6 @@ static struct kmem_cache *filp_cache;
>
>  static bool durable_scavenger_running;
>  static DEFINE_MUTEX(durable_scavenger_lock);
> -static struct task_struc *dh_task;
>  static wait_queue_head_t dh_wq;
>
>  void ksmbd_set_fd_limit(unsigned long limit)
> --
> 2.43.0
>
> --
> Cheers,
> Stephen Rothwell



--=20
Thanks,

Steve

