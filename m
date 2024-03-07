Return-Path: <linux-next+bounces-1530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FF87519E
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 15:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53361282DDA
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 14:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC8A12D773;
	Thu,  7 Mar 2024 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nlLClrEx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3E12D775
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820975; cv=none; b=GsQLag5EnYfa24Pqd7yTF2XGqDAWotU9ddxFRQ1motZyb99bJKk7D33zPizh+mJg1dKZBPq9hDMOxwaZPv8OtmQyosFLp0p6ecxzU4ETFkVytLAOvDOvM7IFtCxGki0ahHcyEJgPCE/bQyEELexoFRwuCCB1/sMfR437ndW53gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820975; c=relaxed/simple;
	bh=xlFTWjmKTaG1KhSVa69PfGBOQeXT3C6k9vGtFDLXWqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brCDAAnmlWNWmlEOTNWUL6D7wUHLjeFHC3pqEqrNINXtXFYHzuWjRpwwJmAi+9HjiFO7NWBK8QFQFxl3soq9jpOdmDoenRkkF9ZCfkV9D0wQsFvcK2evl0WyWh1HPVCPfzIDBkq/bGkFoR8YmsFEnIFZ1UuFcaFa2LZTPm09sdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nlLClrEx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5131f3fc695so990103e87.1
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1709820972; x=1710425772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpZfTEQSdYNx5uhaLKw7TjT2VapTSjfAbjuJYLMFCvw=;
        b=nlLClrExaHPI0MNx4kbO6E3POqTG9+K1tNZ7CjQJWRSR+Xy07nJXNyLBJqYuvikH/G
         mhuwCABXdI9pO8iVpgYy+ZRNUXhyPO6M0L7cKcC1cYTQWCwLIFiiXzKBHIiosWhvOFGS
         M3bwEWPWDvUZ0FtKwVb2Nz/i0fSnrWzrByqZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820972; x=1710425772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpZfTEQSdYNx5uhaLKw7TjT2VapTSjfAbjuJYLMFCvw=;
        b=HtXWBz61TPYA8V6GpyWJxG3FK/2S4MIlXQv+sFfyPw2Yo8JqwO5HhFmXUu5VG1CmLf
         F+9nW37hc2f2gLmrHCp5uat8WwG1lbX1itoFGzoXGIzP+aaYnqNRjMDy/rr0oGtY+jgC
         I6/6otDbfb4mdF/VXdBXc8IYxguGuiUnnR6Ggx4F2ddncDY73kB7rARH2XrDnrB67Zol
         lIhSe2vcx61Ke0jM/HKCsP9/Ht6Sr5SY7fq6X3OlDAaZUll+dZhj85V61wLRnftVF7R7
         OpcTaZMlGzWapn+5185VJx+TLEviwYg7Zo7t31CG4+onyGmIel/qzs3ojofAR/nw8AVm
         gjXw==
X-Forwarded-Encrypted: i=1; AJvYcCVbLNcPHVIae8kO4lQyqd/LnfCWZkQdIZudOyXqt9MD5wlcAtZ/z/SKtYotW5rZTK2Kz3K22tyzBfpdyJtBovaOATp1MmGGZd6JQA==
X-Gm-Message-State: AOJu0YxoPDVxWx5O0y1eyUN2HJcTmhMntsY3v8li662KncIt07B3YgQQ
	iFdz9h5oueQP08O326FH8QqHCYJxyL9R9xFzv9lHKqn6p+KnJPCqepQwtecnUjGKWvtuK65U8KH
	AZoMQv1by+qfws3DwKblx4weV2x/qa3rtEs17eg==
X-Google-Smtp-Source: AGHT+IH2cIVIbaKYXKNB2vZEuZPQdGMxbkmqSZeZnvRwgB8uizuvsjvd5fm0tBYz2fKyiQ7jEqAmuqAkCln/OIaGSO4=
X-Received: by 2002:ac2:511b:0:b0:513:116d:4d9b with SMTP id
 q27-20020ac2511b000000b00513116d4d9bmr1474098lfb.60.1709820971654; Thu, 07
 Mar 2024 06:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306103438.2c0a6f44@canb.auug.org.au>
In-Reply-To: <20240306103438.2c0a6f44@canb.auug.org.au>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 7 Mar 2024 15:16:00 +0100
Message-ID: <CAJfpegstDJ6p42itTiL33tMTcbV8tUiMowpk8y9A-52_Oasvnw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the fuse tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Alessio Balsini <balsini@android.com>, 
	Amir Goldstein <amir73il@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 00:34, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> diff --cc fs/fuse/inode.c
> index 516ea2979a90,02869edf72f3..000000000000
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@@ -930,14 -942,6 +942,16 @@@ void fuse_conn_init(struct fuse_conn *f
>   }
>   EXPORT_SYMBOL_GPL(fuse_conn_init);
>
>  +static void delayed_release(struct rcu_head *p)
>  +{
>  +      struct fuse_conn *fc = container_of(p, struct fuse_conn, rcu);
>  +
>  +      put_user_ns(fc->user_ns);
> ++      if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
> ++              fuse_backing_files_free(fc);
>  +      fc->release(fc);
>  +}
>  +

fuse_backing_files_free() doesn't need to be called after an RCU
delay, so it should be resolved like this:

diff --cc fs/fuse/inode.c
index 516ea2979a90,02869edf72f3..000000000000
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@@ -954,7 -959,9 +966,9 @@@ void fuse_conn_put(struct fuse_conn *fc
                        WARN_ON(atomic_read(&bucket->count) != 1);
                        kfree(bucket);
                }
+               if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+                       fuse_backing_files_free(fc);
 -              fc->release(fc);
 +              call_rcu(&fc->rcu, delayed_release);
        }
  }
  EXPORT_SYMBOL_GPL(fuse_conn_put);

Thanks,
Miklos

