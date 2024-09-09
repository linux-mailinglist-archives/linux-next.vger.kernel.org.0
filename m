Return-Path: <linux-next+bounces-3671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA118970FDF
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 516BFB2227A
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 07:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C45A1B29BC;
	Mon,  9 Sep 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GM+dVR3s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2621AF4F8
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866983; cv=none; b=Robdlu4ph86yxTlnoFgTDojJvutRJ37HksHrBgcjIaDgkSQkEuDeie5FZPL3dTH7EAJ0QvnrGg8FNe3D3eWJX6gZse/xSJ5yG8mfTvxBXmMuCRkr7zkHzem8uBlSIVjua2icCpucQOMwr6kgLRcB/eqLJy0icbt0ifBWr2GW5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866983; c=relaxed/simple;
	bh=3IWpoxcnfqSBlFjnupGjhTwI4Sw21uExUPcoD5L85ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ilykh0aNOI6aKHmkRqC7oA+KX2hR+hRixp03bK/ryYi1ddEjSN8jDg6N1RgHPj2dltRB1MrQuCp9cxxTYmJeJMyAk3dgM1PMzEvJL3GJCmdbT4tMCFmOoTLvSK1AvMVFA+TNk/G4B1+KFBlXjWlZxROJaDAWmR1JAusaCxiHbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GM+dVR3s; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-49bdc6e2e2cso742749137.0
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725866980; x=1726471780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZ+H62T8fuBJYKcKyPuRwAxH+t73nYkOtugv9ADBizI=;
        b=GM+dVR3stGsbwi4xDFryZVmKKYOEShS+w8LWLMSPb5DAwsXItOwpWzX5jN0VBI2+jJ
         btXnHHuyzj9+38LSGS4GtmMgqFDQVP58059Kf8Zt/GqiUiw8N4yjPjtvtmpxS7+E18Hn
         qyCeCu8aX5sIIotNyxogJ/GZkOBbZV/LriE8N4xEXYQA2TKX2XqKkgWWSKMyrIuJCaHE
         +oRjKV7vThzw0yklJSqE/EtDPmLbDn6TZwhQyPabgwxYhKKEBmlDDwZqtivvwflWgG4p
         d9iUmn1/vtv3PWt3cq7/Yr/3NlNCzM2+xcov4wUkiCxhipiRT5sP0LUH8lcHj8VTivGf
         1I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866980; x=1726471780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZ+H62T8fuBJYKcKyPuRwAxH+t73nYkOtugv9ADBizI=;
        b=Hwba0iE6uD7Xm3MGrn/csYL+7rlWw2XikO843zmU4Dn3RQLbI97k63pCYNfG/jBGud
         FzSWxxqU/8PVvWorVKl71Rjs7hpQm4SLe3qyXdMpLjjcydJTotTiOYAlqDObcnUR7MhR
         Iz2Z6BE1hBkxMb3Kt/NTveMvWLdO+D8OWeTD3R1gRqbjCs7q0Q1KxgM+OIuv+A90i3h9
         HnrNssE5aHmb1f2qVFYGWXxkqdr45ihOqeHTNVIS61h/wVEkWuXKDw9YdSGOiAI2CURK
         vfAHNq9bjV9x8xpoVdp/QMKobZTeq+yBeV1rIKV1iMmTJvSW+NfUPThr0/tWG/hCkux4
         0Etg==
X-Forwarded-Encrypted: i=1; AJvYcCUuSXdn+J1WVMdYHkjhdE9UUPUwg2IHj3dDDTcnORV7PFBJm0VlRuiQoTa1bJbRQy4qN4R7CjrM9HcG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIIDOeAkkWebsA3y/6JyAr79GxoxM/M2jVIqRt7H2G/xbU6Db
	acLPbztYT0f+GrRBb8i5T/NI/5qcBmpKhwdSLMTgFjXxkXjcwW6yVztbtf6VLIuG7/rbYM63i1X
	fT5/AEg8irZHVA1X1qj5uAIlebuiaczDOuh6g
X-Google-Smtp-Source: AGHT+IGLfnWgdtu/sA+7EPQXFED6rm4QPJph/gwyP5vG8KZS6f2dPEFF1AL74zAf6zNvevClBB0TT0YWD/IicMDogFA=
X-Received: by 2002:a05:6102:cc8:b0:49b:d066:3e9e with SMTP id
 ada2fe7eead31-49bedbc1635mr4163093137.10.1725866980019; Mon, 09 Sep 2024
 00:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909171843.78c294da@canb.auug.org.au>
In-Reply-To: <20240909171843.78c294da@canb.auug.org.au>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 9 Sep 2024 01:29:01 -0600
Message-ID: <CAOUHufZXxbv7qaHTWiGa-ov2FSL8d9Rzc=fmg8GjpRYX2+2fzA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the execve tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jeff Xu <jeffxu@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:18=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the execve tree got a conflict in:
>
>   include/linux/mm.h
>
> between commits:
>
>   99ab6f0a6854 ("mm/codetag: fix pgalloc_tag_split()")
>   4d42ecdbd2fb ("mm/codetag: add pgalloc_tag_copy()")
>
> from the mm-unstable branch of the mm tree and commit:
>
>   44f65d900698 ("binfmt_elf: mseal address zero")
>
> from the execve tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the heads-up.

The conflict was trivial and your resolution looks good to me.

