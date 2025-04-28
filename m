Return-Path: <linux-next+bounces-6402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 301DCA9E6D4
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 05:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD0C3BA491
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 03:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7916433A4;
	Mon, 28 Apr 2025 03:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQowgUfu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6A1805E;
	Mon, 28 Apr 2025 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812654; cv=none; b=GxQUpgIxI4DO6ESjpFRH2iFeZtR4xNoZFFWB7Xuh8mWywQ0nh86rez1QZvWu0wf5Mv0aM+7h2zjxelsf0Y+o5Oiql2fhR1a3UA3LNFikpkP1i1IpMMhFAjt+2ktO0ZSAcBk7Kt2XPtQ5wYp83BZnp6/l8DBQELUTzDLixuxZpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812654; c=relaxed/simple;
	bh=nXAfEBjP/ZnLJ8ly4ddWvyvzYHgLUAI5G9y8RP3MVE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH6dens6wJLBri38XNMLVhYmLnm7u+dXa+TguBnBbc6K7LdDaRtdtnqoJHOUZbVkejKc8SnIyW9lQNZj3U1ZRncXkV/D2i2mSGZSzkCc+c60TBRX3g2BLvBsFrXhU1DoKi9p//KmTziI+KezfKrvpjeFLF+ORCYO+Id1QHuj/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQowgUfu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1024312766b.1;
        Sun, 27 Apr 2025 20:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745812651; x=1746417451; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKkD3D5X64hOxLzMuTgRMOH6XEDwFgEjdPhu91sFJHo=;
        b=JQowgUfu6kx+YsT3mMWGYrAFA91X6j71jSP2z//ls+9SaWzE99tKxZ4Ub8CYm25aAS
         Ek0ZKQfMpBShoDVJx1b2GxLjQ7kbTB6y33CtdcIKDXf8GCc5QwQ+ggkC6ARXLcmEYv8R
         qf3/BkJsKa1lWC0z/DE8XAowNxqWioOuSWyifds6G4MzABgKLiZaS5gy1xy9yajzaESQ
         aPulUXjdUWz61sjuqCxOzI28hL0QQrPnq1J7JQ+kvVnoM/MUjR/p4VkMiLrVKzjNdWKO
         RFPzQRmvgNxtUVa/0Oif3lsQ2YxYnQtei1wywPYMLLrh2KTE4joIoPPe/mlrGYuw3bq7
         /siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745812651; x=1746417451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKkD3D5X64hOxLzMuTgRMOH6XEDwFgEjdPhu91sFJHo=;
        b=ubPHVhKljCESu1Hx5KR9W9tmcixMMyJtbS6yiHm+LE+Z+74gtmjddO/E0PBzFn2R+Z
         DExWvPWxr3eJ9Xf/sBYYEXTkcSBDn5UvSfNLavPV70Fm2zSeXdG7sWgGaW17JVCD299l
         FyUdjUwr6ytwtsKaseYKr3ZIHc45SHXFkvqm1HM+nLkfiMTyhIp9YCkFagFQPi7KjlN4
         5kQKyQES3IVgo8ScPZ+vleEmMgFQqAgWPpJKOIMRrXLj6zK+9GogRLGFTYvjHTv45hwT
         v26bWv7Mbjtc1V0bIZSLA1KNiaz7V5Q6AO5jFmCW9QNzP2/f1HWOHqXQnYx4lBztXFAp
         PkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdg8YEK79Rbnr1gZND9g7NmV0QjBjt4nJVRz77wkdRVfr9lNIqR7fQ/Ryoj9V3LHrjgXY7EADhruc+0Q==@vger.kernel.org, AJvYcCWImgD1CwIADnCXxw1EE1VvDH7Vy4RbFBOeJXp1s6GYYdRfItFbcEeyjKOU3WbWLW2Nx7PaVcij2HM7+dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUq0U0Lov8iA58hgfTpS/z1KoDiaD/GsQWRBC+U8oybN39WOOY
	6IYKGGXOZQhwq/f4kpcZ3v3HaPZU0O9aNhKFF0V3Sram0NJh5eH9fkp5s43/VeNcq6SaTuy/Zit
	MGYX4IThv4qal+WpWPuckp0ahxlc=
X-Gm-Gg: ASbGncseOCSlm1e4Q/1EESi1zfSr5TATIm17YZEvaSWa1ik+DXra5CIBCdmarc1oHEc
	Az/GSVUT3YiMfJ6fhMuohriYdt4E95KiQiBYSJC2cAtK/Mu+Oqt6qem1PTZaRfNjyBWoWcT7wWS
	N2+L/gZ6/VyAD7qxa+oywIkHab2c2E/rQ=
X-Google-Smtp-Source: AGHT+IGeCRKuuLFutFpPmOmuktV1/3ZxyYnFaVPtEpnPgQzg0Vb01czkv7Jp/OH3OipZQHIvx9LDfqU3TbW1bw38Dts=
X-Received: by 2002:a17:907:26ce:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-ace7341c252mr905052866b.15.1745812651184; Sun, 27 Apr 2025
 20:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428133013.5ad6b6b7@canb.auug.org.au>
In-Reply-To: <20250428133013.5ad6b6b7@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Apr 2025 13:57:18 +1000
X-Gm-Features: ATxdqUF1pnd1tgsz7ydsGeUkAO0Dc7dpPOkKeJcGLyMbMEHcikT6SBdM-TnbLXw
Message-ID: <CAPM=9tw=fNm8JsaHJNayN_QLiE8sHpgC5VEevhJ-9qnD8hD=LA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from drivers/gpu/drm/xe/xe_bo.c:3118:
> drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
> drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to function 'xe_bo_evict'
>    63 |         ret = xe_bo_evict(bo, true);
>       |               ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_bo.c:2939:5: note: declared here
>  2939 | int xe_bo_evict(struct xe_bo *bo)
>       |     ^~~~~~~~~~~
>
> Caused by commit
>
>   55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
>
> I have used the drm tree from next-20250424 for today.

My bad, dropped a patch on the list, I'll hopefully be fixed up for tomorrow.

Dave.
>
> --
> Cheers,
> Stephen Rothwell

