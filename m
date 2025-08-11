Return-Path: <linux-next+bounces-7903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A495B21854
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 00:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294CB1A21CFE
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 22:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA62E11C6;
	Mon, 11 Aug 2025 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THlpRdVH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5761C1AB4;
	Mon, 11 Aug 2025 22:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754951317; cv=none; b=Z8P0SsOJuiw0iLtCZ6wbweWSTVCzP1HPzOyo08RZijR4ggAxympwgvqNGrDphlNIDESTX3QUqlpyc1FS3nRaqQMuJHfz+6ZBpeNme6Vs4sKsScOhSgmYjHVaJW0Ej4mdXaCasTX4wirr1gLC7PK/7agVDWEirXkB+/UU6IAoqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754951317; c=relaxed/simple;
	bh=UeiQYD9FI7T+PS1LEt5GSSf4bzLO6vMlsYIYRRpNBUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+RjKAWRGtqqE1cjs8d4pFYzEKcxL1ZKw4L+y4uZ3BRqbJlHsEWTE+0DKe7s0czWhyE+s3mdepWWFWupz8Gc+4FrvBhGwsAdkPFwpdq/In8SQIQkzkNz+q07Uqbtvxt/d/POdf0VQz15N3typHqUvx+MCgrWwB4zxY5WcNo5w1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THlpRdVH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b0770954faso75858311cf.1;
        Mon, 11 Aug 2025 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754951314; x=1755556114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=353yrZyD50K+fK9xUULowRamM8B2L8p10IHM+Je7DnA=;
        b=THlpRdVHxZdpLNuFlnir/m13OQdqVozx8ZQn/4SWqxo1IK+v2z8+8OQbDxpHBISk15
         vohZ4adn4ircM8iCy+IceduCo0oKUt2hhdtzS2WVRXjhDQesTRMYEmR0VSy43TUYeoxY
         0YyClng5PYMC/EzYLu0JtNRt23hcfkzcp8zQNvBE3v79twj5CMXfLGYhY+mE9pq0YO88
         0qL40111siDlVE3kt0VNscZgLvqvo6YZlV5ZN1zufMz8WFD9HpEUg9SgWW2rtlAu6JTo
         ucFqqlBsPZzWZnTwVUPCQWfwgZXahJZsmZUKwqKALE/e7gNL5cvewG69EerygGmpNEzZ
         jBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754951314; x=1755556114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=353yrZyD50K+fK9xUULowRamM8B2L8p10IHM+Je7DnA=;
        b=cvlDb8+alZQ2/NRNG+bRoDuYlYl0zK/8U/wJA0Dn3/j8hQeGGmswSrW7uIv2eDLSUa
         5PHjM3rVea68bUxnoIFIjsn/pxsjqNXEQtJE+pFG9Izequoxp51FIck8ZbpGklS4CRVd
         5OLvnEXIAVG7N4KjeLKigRWeoZujQ2LJQiaoODO/mHmm5y3Re6p08TE0Ca+ekXo3qzai
         g2p5C0yLslh5x5Ho1OX2IgRbyiv2FRYecasa7WnsHBZqqW205/uCv5iJaFCa1tpkGJEj
         JkaBTY3ovTkQArWAsvvYc1ZGCDHwEj2jk5v8jDpPEuhhPOgaCjjtwd4UJ1Dm/2QCkTfu
         yzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCglXdNB/Lv0gakRm/pM8GHMTuIUtD1ML/Fs/UwNZVFsfn6zzp7s7dPgy+qDTwDLXCiuNpA+8PJuq/ylk=@vger.kernel.org, AJvYcCXvjKF4J7Wutco4JxRTnGXXGZUyayubVH7l1YR1ZlV2qVcRHRYILa7Cdn9mwj8njrVP9zI2F0r7urI4OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt//ji3FqfB8upzqL1/QL6PSbpk/LOrM88/AEFa1NmcZGZpBsh
	G8ZLhNgJZTtu9/C6QMS+sHF+s0Sg852yTgiKtSkyoRiv/huDRE6/hywTJNiJvY3XkMNfYOVRv3G
	O7hYkWA6EfgNPgoi7LbK6NXrxli282a4AxwbQ
X-Gm-Gg: ASbGncud8I2RT2DIcME1Vh2c1PZzbv7117BYX4McqVFbNxNN+x54Jklbn5pfakpo4ro
	MG9A5M5E2hhS6lSymfmU9RLyTpVoIADciWzw65Z1lXNb4JU00dKDbiHmXiCI90HqogLqQtLwNv3
	eS6wKYagXbY98iYJwoZIaXLYq2NXcnbrdcG0V02E8O6ydy15qJvmzbyQ67ocwKTuoh7K7+HqnjV
	P3ntZ2CkOiviNPZVw1D6Jk=
X-Google-Smtp-Source: AGHT+IGVlNCYzlCLF1vxYArLOBIuvrf1Eo6kjHslGp9rOV2jW0bmD4nEBII0QQYF+v3sK1/ECABXK8Gzt0z9ANIDktg=
X-Received: by 2002:a05:622a:2619:b0:4b0:656c:236e with SMTP id
 d75a77b69052e-4b0ecba317fmr17603761cf.6.1754951314545; Mon, 11 Aug 2025
 15:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812080645.4fa3afaf@canb.auug.org.au>
In-Reply-To: <20250812080645.4fa3afaf@canb.auug.org.au>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 11 Aug 2025 15:28:22 -0700
X-Gm-Features: Ac12FXwVXvizQOg_z3hcBA8mjXQ_zlwSB_oU99gohVLJyUsJRN7ocv0jD5pPXVI
Message-ID: <CAJnrk1ZKUW9MpEGiNSxVdO-G+Hjk48cW7oNpcaua5KLxtp3ywQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the vfs-brauner-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 3:07=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> In commit
>
>   542ede096e48 ("fuse: keep inode->i_blkbits constant")
>
> Fixes tag
>
>   Fixes: ef7e7cbb32 ("fuse: use iomap for writeback")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").
>

Ok, sorry about that. The git 12-digit commit id for it is  Fixes:
ef7e7cbb323f ("fuse: use iomap for writeback").

I'll be more careful about that next time.


Thanks,
Joanne
> --
> Cheers,
> Stephen Rothwell

